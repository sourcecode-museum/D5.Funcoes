unit Dirscan;

interface

Uses SysUtils;
{ We need a method to get the files we find inside the directoy scan
  to the place where we can evaluate the names etc., typically
  somewhere near the place in our code where FindRecursive is called.

  We use a notification for this. Notifications (aka events) abound
  in Delphi, they are implemented via class methods. FindResource
  takes such a class method as parameter. It has to fit the following
  prototype:
}
Type
  TLogFunct = Function( Const path: String; Const SRec: TSearchRec ): Boolean
                of Object;

{ this is the directory scanner }
Procedure FindRecursive( Const path: String; Const mask: String;
                         LogFunction: TLogFunct );

implementation


{+-------------------------------------------------------------
 | Procedure FindRecursive
 | Parameters:
 |   path:  the directory the scan should start in. If this parameter
 |          is an empty string, the current directory will be used.
 |   mask:  the file mask the files we search for should fit. This
 |          mask will normally contain DOS wildcards, like in '*.pas'
 |          to find all Pascal source files.
 |          If this parameter is an empty string, '*.*' is used.
 |   LogFunction:
 |          This has to be a class method of the prototype TLogFunct.
 | Description:
 | The procedure starts at the directory given in path and searches it
 | for files matching the mask. LogFunction will be called for each file
 | we find with the current directory and the search record filled by
 | FindFirst/Next. The path will always end in a backslash,  so
 | path+SRec.Name yields the full name of the found file.
 | If the function returns False, the recursion will stop and
 | FindRecursive returns immediately.
 | After the directory has been scanned for files it is again scanned
 | for directories and each found directory is in turn scanned in the
 | same manner.
 +-------------------------------------------------------------------}
Procedure FindRecursive( Const path: String; Const mask: String;
                         LogFunction: TLogFunct );
  Var
    fullpath: String;
  { Recurse does the work and is called again for every subdirectory
    we find. }
  Function Recurse( Var path: String; Const mask: String ): Boolean;
    Var
      SRec: TSearchRec;
      retval: Integer;
      oldlen: Integer;
    Begin
      { set default return value: continue scan }
      Recurse := True;

      { remember current length of path so we can chop off added
        subdirectory names again. path is guaranteed to end in a
        backslash here }
      oldlen := Length( path );

      (* phase 1, look for normal files *)
      retval := FindFirst( path+mask, faAnyFile, SRec );
      While retval = 0 Do Begin
        If (SRec.Attr and (faDirectory or faVolumeID)) = 0 Then
          (* we found a file, not a directory or volume label,
             log it. Bail out if the log function returns false. *)
          If not LogFunction( path, SRec ) Then Begin
            Result := False; {causes outer levels of recursion to end, too}
            Break;
          End;
        retval := FindNext( SRec );
      End;
      FindClose( SRec );     { added for Win32 compatibility }
      If not Result Then Exit;

      (* Phase II, look for subdirectories and recurse thru them *)
      retval := FindFirst( path+'*.*', faDirectory, SRec );
      While retval = 0 Do Begin
        If (SRec.Attr and faDirectory) <> 0 Then
          (* we have a directory, but do _not_ recurse thru these
             blasted proxy pseudodirectories standing for the
             current dir and its parent. That would cause an infinit
             recursion loop... *)
          If (SRec.Name <> '.') and (SRec.Name <> '..') Then Begin
            { ok, its a harmless dir, add its name to path and recurse }
            path := path + SRec.Name + '\';
            If not Recurse( path, mask ) Then Begin
              Result := False;
              Break;
            End;
            { remove the added name again so we can stick on the next
              on the next round of the While loop }
            Delete( path, oldlen+1, 255 );
          End;
        retval := FindNext( SRec );
      End;
      FindClose( SRec );
    End; { Recurse }
  Begin
    { check parameters, set defaults if empty }
    If path = '' Then
      GetDir(0, fullpath)
    Else
      fullpath := path;
    If fullpath[Length(fullpath)] <> '\' Then
      fullpath := fullpath + '\';
    If mask = '' Then
      Recurse( fullpath, '*.*' )
    Else
      Recurse( fullpath, mask );
  End; { FindRecursive }

end.
