program linklist;
uses crt;
type
    point = ^node;
    node  = record
          info : integer;
          bantu,next,prev : point;
end;
var
     awal,akhir,bantu,baru: point;
     i : integer;
     data,nilai:  integer;
procedure create;
begin
          awal := nil;
          akhir :=  awal;
end;

procedure addFirst(nilai : integer);
   begin
        new(baru);
        baru^.info := nilai;
        if (awal = nil) then
       begin

               baru^.next := nil;
               awal := baru;
               akhir := baru;

               end
               else
                baru^.next := awal;

        awal := baru;
   end;


procedure addLast(nilai:integer);
var
   baru:point;
begin
     new(baru);
     baru^.info:=nilai;
     baru^.next:=nil;
     baru^.prev:=nil;
     if awal=nil then
     begin
          awal:=baru;
          akhir:=baru;
     end
    else
     begin
          baru^.prev:=akhir;
          akhir^.next:=baru;
          akhir:=baru;
     end;
end;

procedure traversal();
   begin
   bantu := awal;
        if(awal=nil) then
           writeln('List kosong')
           else
           begin
                bantu := awal;
                while(bantu<>nil) do
                begin
                     write(bantu^.info,' ');
                     bantu := bantu^.next;
                end;
           end;
   end;

 //hapus deapan
procedure hapusDepan(var awal,akhir:point);
var
   hapus:point;
begin
     if awal=nil then
        writeln('Data kosong!')
     else
     if awal=akhir then
     begin
          dispose(awal);
          awal:=nil;
          akhir:=nil;
     end
     else
     begin
          hapus:=awal;
          awal:=awal^.next;
          awal^.prev:=nil;
          dispose(hapus);
     end;
end;


//procedure hapus belakang

procedure hapusBelakang(var awal,akhir:point);
var
   hapus:point;
begin
     if awal=nil then
        writeln('Data Kosong tidak bisa menghapus')
     else
     if awal=akhir then
     begin
          dispose(awal);
          awal:=nil;
          akhir:=nil;
     end
     else
     begin
          hapus:=akhir;
          akhir:=akhir^.prev;
          akhir^.next:=nil;
          dispose(hapus);
     end;
end;

//proccedure pengurutan

procedure pengurutan(awal,akhir:point);
var
   i,j:point;
   temp:integer;
begin
     if awal=nil then
        writeln('Tidak bisa melakukan pengurutan data Kosong')
     else
     begin
          i:=awal;
          while i<>akhir do
          begin
               j:=i^.next;
               while j<>nil do
               begin
                    if i^.info>j^.info then
                    begin
                         temp:=i^.info;
                         i^.info:=j^.info;
                         j^.info:=temp;
                    end;
                    j:=j^.next;
               end;
               i:=i^.next;
          end;
     end;
end;

//prosedur pencarian

procedure searching(awal,akhir:point);
var
   i:point;
   dicari:integer;
   posisi:integer;
begin
     if awal=nil then
        writeln( 'Maaf data kosong!!')
     else
     begin
          write('Data yang dicari : ');readln(dicari);
          posisi:=1;
          i:=awal;
          while (i^.info<>dicari)and(i<>akhir) do
          begin
                i:=i^.next;
                posisi:=posisi+1;
          end;
          if i^.info=dicari then
             writeln('Ditemukan posisi ke-',posisi)
          else
              writeln('Tidak ditemukan');
     end;
end;

begin
     create;
     writeln('===================================');
     writeln('Tambah depan');
     addFirst(2);
     addFirst(1);
     addFirst(7);
     addFirst(9);
     traversal();
     writeln();
     writeln('===================================');



     writeln();
     writeln('===================================');
     writeln('Tambah belakang');
     addLast(5);
     addLast(7);
     addLast(8);
     traversal();


     writeln();
     writeln();
     writeln('===================================');
     writeln('Sesudah di hapus');
     hapusDepan(awal,akhir);
     traversal();

     writeln();
     writeln('===================================');
     writeln('Hapus belakang');
     hapusBelakang(awal,akhir);
     traversal();


     writeln();
     writeln();
     writeln('Telah di urutkan');
     writeln('----------------------------------');
     pengurutan(awal,akhir);
     traversal();


     writeln();
     searching(awal,akhir);
     traversal();

     readln;

end.
