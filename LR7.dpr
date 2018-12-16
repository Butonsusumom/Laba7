program LR7;
 {$APPTYPE CONSOLE}

uses
  SysUtils;


  const
symbols = ['A'..'z', ' '];
vowel=['a','e','i','o','u','y'];

procedure Correctinput(var S:string; var g,position:integer);
 var i:Integer;
  begin
    Readln(S);

    g:=0;
     for i:=1 to Length(S) do
      begin
       If not(S[i] in symbols) then
       inc(g);
      end;
   position := pos(' ', S);
  end;

 function MyTrim( var S:string):string;
 var  i,g:Integer;
 begin
   i:=length(s);
   if S[i]=' ' then
    begin
     repeat dec(i) until (s[i]<>' ');
     Delete(S,i+1,Length(S)-i);
    end;
  g:=1;
   if (S[g]=' ')  then
    begin
     repeat inc(g) until (s[g]<>' ');
     Delete(S,1,g-1);
    end;
   MyTrim:=S;
 end;

procedure toStandart(var S:string);
  var
  g:Integer;
 begin
   S:=MyTrim(S);
  g:=1;
   while g<=Length(S) do
    begin
     if (S[g]=' ') and (S[g-1]=' ') and (g>1) then
     Delete(S,g,1)
     else
     Inc(g);
    end;
 end;

 function MyUpCase(c:char):char;
begin
if c in ['a'..'z']then result:=chr(ord(c)- 32)
else result:=c;
end;

function MyLowerCase(s: string): string;
var
   i: integer;
begin
  result := s;
  for i := 1 to length(result) do
     if (result[i] in ['A'..'Z'])
       then result[i] := chr(ord(result[i]) + 32);
end;

 function MyAnsiCompareText(S1,S2:string):integer;
  begin
    S1:=MyLowercase(S1);
    S2:=MyLowerCase(S2);
    if S1<S2 then  MyAnsiCompareText:=-1;
    if S1>S2 then  MyAnsiCompareText:=1;
    if S1=S2 then  MyAnsiCompareText:=0;
  end;

 function FindWord (S:string;numb:Integer):string;
   var i,position,beg,en:Integer;
 begin
     for i:=1 to numb-1 do
      begin
        position:=pos(' ',S);
        Delete(S,1,position);
      end;
      beg:=1;
      en:=1;
     while (S[en]<>' ') and (S[en]<>'')  do
      Inc(en);
    FindWord:=Copy(S,beg,en-1)

  end;


 procedure searchLastWord(var str,Lastslovo: string);
var i:integer;
begin
  i:=Length(str);
  while(str[i] <> ' ')  do
    Dec(i);
  Lastslovo:= copy (str,i+1,Length(str));
  Delete(str,i,Length(str));
end;

  procedure CountWords( S:string;var N:integer);
  begin
       N := 1;
    while pos(' ', S) > 0 do
     begin
      delete(S, 1, pos(' ', S));
      inc(N);
     end;
  end;

procedure p1(S:string;LastWord:string;N:integer);
var
     i,j:Integer;
     Temp:string;
     flag:Boolean;
  begin
   for i := 1 to N do
    begin
     Temp:=FindWord(S,i);
     flag := True;
      if MyAnsiCompareText(LastWord,Temp)<>0 then
      begin
       
      for j := 1 to Length(Temp) do
       if pos(MyLowercase(Temp[j]),MyLowerCase(FindWord(S,1)))=0 then
         flag := False;
       if flag Then
        Write(Temp, ' ');
       end;
    end;
     writeln;
  end;



  procedure p2(S:string; N:Integer;LastWord:string);
  var i,j:Integer;
      Temp:string;
begin
 for i:=1 to N do
 begin
     Temp:=FindWord(S,i);
  if (MyAnsiCompareText(LastWord,Temp)<>0)  then
  begin
   if ((length(Temp) mod 2)<>0) then
     begin
      for j := 1 to Length(Temp) do
      if Temp[j] in vowel then Temp[j] := MyUpCase(Temp[j]);
     end;
    write(Temp,' ');
   end;
 end;
 Writeln;
end;


 var S,LastWord:string;
     g,position,N:integer;

BEGIN
  Writeln('Please, write the line');
  Correctinput(S,g,position);
  If (S = '') or (g>0) or (position=0) then
   writeln('You haven''t entered a correct line. Please,restart the program and try again.(>_<)')
  else

  begin
   toStandart(S);
   searchLastWord(S,LastWord);
   CountWords(S,N);
   Writeln;
   Writeln('Words,that satisfy first condition');
   p1(S,LastWord,N);
   Writeln;
   Writeln('Words,that satisfy second condition');
   p2(S,N,lastWord);
  end;

  readln;
END.
