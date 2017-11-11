program deleteDepan;
uses crt;
type
point = ^node;

mahasiswa = record
nim : string;
nama: string;
end;

node = record
info: mahasiswa;
next: point;
end;

var
maha :mahasiswa;
i, jumlah: integer;
awal, akhir, bantu, baru, pdelete : point;

procedure create;
begin
awal  := nil;
akhir := nil;
end;

function input : mahasiswa;
begin
writeln;
    write('Masukan Nim : ');readln(maha.nim);
    write('Masukan Nama : ');readln(maha.nama);
    writeln('===================================');
    input:=maha;
end;

procedure addLast;
begin
    new(baru);
     baru^.next := nil;
     baru^.info := input();
    if(awal = nil) then
    begin
    awal := baru;
    
    end
    else
    begin       
        akhir^.next := baru;
    end;
    akhir := baru;
end;

procedure deleteFirst;
begin
    if awal=nil then
    begin
        writeln('Maaf, Data Kosong');
    end
    else
    begin
        if awal=akhir then 
        begin
            dispose(awal);
            awal:=nil;
            akhir:=nil;
        end
        else
        begin
            bantu:=awal;
            awal:=awal^.next;
            dec(bantu);
        end;
    end;
end;

procedure travelsal;
begin

   
    bantu:= awal;
    while(bantu <> nil) do
    begin
        writeln;
        writeln(bantu^.info.nim);
        writeln(bantu^.info.nama);
        writeln('===========================');
        
        bantu := bantu^.next;
    end;

   

    readln;
end;

begin

write('Masukan Jumlah : ');readln(jumlah);
for i:= 1 to jumlah do
begin
addLast;
end;

deleteFirst;
travelsal;

readln;
end.