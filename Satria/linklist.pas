program LatihanLinkList;
uses crt;

type
  RecordMahasiswa = record
    NIM, Nama: string;
  end;
  Point = ^Node;
  Node = record
    Info: RecordMahasiswa;
    Next: Point;
  end;

var
  Awal, Akhir: Point;
  Menu, SubMenu: integer;

function NewMahasiswaRecord: RecordMahasiswa;
var MahasiswaBaru: RecordMahasiswa;
begin
  clrscr;
  writeln('Masukkan data mahasiswa yang baru:');
  write('NIM  : '); readln(MahasiswaBaru.NIM);
  write('Nama : '); readln(MahasiswaBaru.Nama); 
  NewMahasiswaRecord := MahasiswaBaru; 
end;

function NewPos: integer;
begin
  clrscr;
  write('Posisi berapa yang diinginkan: ');readln(NewPos);
end;

procedure ShowError(message: string);
begin
  textcolor(4);
  write(message); readln;
  textcolor(7);
end;

function Empty: boolean;
begin
  Empty := Awal = nil;
end;

procedure Create;
begin
  Awal := nil;
  Akhir := nil;
end;

procedure AddFirst(newRecord: RecordMahasiswa);
var Baru: Point;
begin
  new(Baru);
  Baru^.Info := newRecord;

  if(Empty) then
  begin
    Baru^.Next := nil;
    Akhir := Baru;
  end
  else
    Baru^.Next := Awal;
  
  Awal := Baru;
  write('Data berhasil dimasukkan.');readln;
end;

procedure AddLast(newRecord: RecordMahasiswa);
var Baru: Point;
begin
  new(Baru);
  Baru^.Info := newRecord;
  Baru^.Next := nil;

  if(Empty) then
    Awal := Baru
  else
    Akhir^.Next := Baru;

  Akhir := Baru;
  write('Data berhasil dimasukkan.');readln;
end;

procedure AddAt(pos: integer; newRecord: RecordMahasiswa);
var 
  Baru, Bantu: Point;
  i: integer;
begin
  if(pos = 1) then
    AddFirst(newRecord)
  else 
  begin
    Bantu := Awal;
    i := 1;
    
    while(i < pos) and (Bantu <> nil) do
    begin
      Bantu := Bantu^.Next;
      Inc(i);
    end; 
    
    if(Bantu = nil) then
    begin 
      write('Posisi tidak ditemukan!');readln;
    end
    else 
    begin
      new(Baru);
      Baru^.Info := newRecord;
      Baru^.Next := Bantu^.Next;
      Bantu^.Next := Baru;
      write('Data berhasil dimasukkan.');readln;
    end;
  end;
end;

procedure DeleteFirst;
var Bantu: Point;
begin
  clrscr;
  Bantu := Awal;

  if(Bantu = nil) then
    ShowError('Data kosong!')
  else 
  begin
    if(Awal = Akhir) then
      Create
    else
      Awal := Awal^.Next;

    dispose(Bantu);
    write('Data berhasil dihapus!');readln;
  end;
end;

procedure DeleteLast;
var Bantu, Phapus: Point;
begin
  clrscr;
  Phapus := Akhir;
  
  if(Phapus = nil) then
    ShowError('Data kosong!')
  else 
  begin    
    Bantu := Awal;

    while(Bantu^.Next <> Akhir) do
      Bantu := Bantu^.Next;

    if(Awal = Akhir) then
      Create
    else
    begin
      Akhir := Bantu;
      Akhir^.Next := nil;
    end;         

    dispose(Phapus);
    write('Data berhasil dihapus!');readln;
  end;
end;

procedure DeleteAt(pos: integer);
var 
  i: integer;
  Phapus, Bantu: Point;
begin
  Phapus := Awal;
  i := 1;

  while(Phapus <> nil) and (i < pos) do
  begin
    Inc(i);
    Phapus := Phapus^.Next;
  end;

  if(Phapus = nil) then
  begin
    write('Posisi tidak ditemukan!');readln;
  end
  else 
  begin
    if(Phapus = Awal) then
      DeleteFirst
    else if (Phapus = Akhir) then
      DeleteLast
    else
    begin
      Bantu := Awal;

      while(Bantu^.Next <> Phapus) do
        Bantu := Bantu^.Next;

      Bantu^.Next := Phapus^.Next;
      dispose(Phapus);
      write('Data berhasil dihapus!');readln;
    end;
  end;
end;

procedure SequenceSearch;
var
  Bantu : Point;
  NIM   : string;
  Found : boolean;
begin
    clrscr;
    write('NIM yang ingin dicari : ');readln(NIM);

    Bantu := Awal;
    Found := false;

    while(not Found) and (Bantu <> nil) do
    begin
        if(Bantu^.Info.NIM = NIM) then
            Found := true
        else
            Bantu := Bantu^.Next;
    end;

    if(Found) then
    begin
      clrscr;
      writeln('Mahasiswa dengan NIM ', NIM, ':');
      writeln('Nama : ', Bantu^.Info.Nama);
      readln;
    end
    else
      ShowError('Data dengan NIM ' + NIM + ' tidak ditemukan!');
end;

procedure BubbleSort;
var
  i, j, min: Point;
  temp: RecordMahasiswa;
begin
  if(Awal <> nil) then
  begin
    i := Awal;
    while(i <> Akhir) do
    begin
      min := i;
      j   := i^.Next;
      while(j <> nil) do
      begin
        if(j^.Info.NIM <= min^.Info.NIM) then
          min := j;
        j := j^.Next;
      end;
      temp := i^.Info;
      i^.Info := min^.Info;
      min^.Info := temp;
      i := i^.Next;
    end;
    write('Berhasil melakukan pengurutan!');readln;
  end
  else 
    ShowError('Data kosong!');
end;

procedure ShowData;
var 
  i: integer;
  Bantu: Point;
begin
  clrscr;
  if(Empty) then
    ShowError('Data kosong!')
  else
  begin
    i := 1;
    Bantu := Awal;
    while(Bantu <> nil) do
    begin
      writeln('Mahasiswa ke-', i);
      writeln('===============');
      writeln('NIM  : ', Bantu^.Info.NIM);
      writeln('Nama : ', Bantu^.Info.Nama);
      writeln;
      inc(i);
      Bantu := Bantu^.Next;
    end;
    readln;
  end;
end;

procedure MainMenu;
begin
  clrscr;
  writeln('Pilih menu yang ingin dilakukan');
  writeln('===============================');
  writeln('1. Sisipkan data baru');
  writeln('2. Hapus data yang sudah ada');
  writeln('3. Tampilkan semua data');
  writeln('4. Cari sebuah data menggunakan NIM');
  writeln('5. Urutkan data berdasarkan NIM');
  writeln('0. Exit');
  writeln;
  write('Pilihan: '); readln(Menu);
  if(Menu < 0) or (Menu > 5) then
  begin
    ShowError('Menu tidak ditemukan!');
    MainMenu;
  end;
end;

procedure InsertMenu;
begin
  clrscr;
  writeln('Pilih metode sisip yang diinginkan');
  writeln('==================================');
  writeln('1. Sisip depan');
  writeln('2. Sisip belakang');
  writeln('3. Sisip pada posisi tertentu');
  writeln('0. Kembali');
  writeln;
  write('Pilihan: '); readln(SubMenu);
  if(SubMenu < 0) or (SubMenu > 3) then
  begin
    ShowError('Metode tidak ditemukan!');
    InsertMenu;
  end
  else
  begin
    case SubMenu of
      1: AddFirst(NewMahasiswaRecord);
      2: AddLast(NewMahasiswaRecord);
      3: DeleteAt(NewPos);
    end;
  end;
end;

procedure DeleteMenu;
begin
  clrscr;
  writeln('Pilih metode hapus yang diinginkan');
  writeln('==================================');
  writeln('1. Hapus depan');
  writeln('2. Hapus belakang');
  writeln('3. Hapus pada posisi tertentu');
  writeln('0. Kembali');
  writeln;
  write('Pilihan: '); readln(SubMenu);
  if(SubMenu < 0) or (SubMenu > 3) then
  begin
    ShowError('Metode tidak ditemukan!');
    InsertMenu;
  end
  else
  begin
    case SubMenu of
      1: DeleteFirst;
      2: DeleteLast;
      3: DeleteAt(NewPos);
    end;
  end;
end;

begin
  repeat
    MainMenu;
    case Menu of
      1: InsertMenu;
      2: DeleteMenu;
      3: ShowData;
      4: SequenceSearch;
      5: BubbleSort;
    end;
  until (Menu = 0);
end.
