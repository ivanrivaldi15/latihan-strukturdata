program tugasCl;
uses crt;

type
    point = ^node;
    
    mahasiswa = record
        nim,nama : string;
        posisi   : integer;
    end;

    node = record
        info : mahasiswa;
        next : point;
    end;

var 
    awal,akhir,baru,bantu,arah : point;
    menu : integer;

procedure create;
begin
    awal  := nil;
    akhir := nil;
end;


procedure addFirst(var awal,akhir:point);
{i.s: User memasukan data buku perpus}
{f.s: Menghasilkan data buku yang dimasukan}

var 
    i,n: integer;

begin
    gotoxy(43,2); write('Jumlah data yang disisipkan Didepan: '); readln(n);
    gotoxy(33,4); writeln('--------------------------');
    gotoxy(33,5); writeln('        Sisip Depan       ');
    gotoxy(33,6); writeln('--------------------------');
    gotoxy(33,7); writeln('|    Nim    |    Nama    |');
    gotoxy(33,8); writeln('--------------------------');
    for i := 1 to n do
    begin
        new(baru);
        gotoxy(33,8+i); write('|           |            |');
        gotoxy(35,8+i); readln(baru^.info.nim);
        gotoxy(49,8+i); readln(baru^.info.nama);
        if(awal = nil)then
        begin    
            baru^.next := nil;
            akhir := baru;
        end
        else
            baru^.next := awal;

    awal := baru;
       
    end; //endfor
    gotoxy(33,9+i); writeln('--------------------------');
    readln;
end; //endprocedure 


procedure addMiddle(var awal,akhir:point);
var
    i,list : integer;


begin
    gotoxy(43,2); write('Posisi Ke Berapa yang akan dimasukan : '); readln(list);
    gotoxy(33,4); writeln('--------------------------');
    gotoxy(33,5); writeln('        Sisip Depan       ');
    gotoxy(33,6); writeln('--------------------------');
    gotoxy(33,7); writeln('|    Nim    |    Nama    |');
    gotoxy(33,8); writeln('--------------------------');
    new(baru);
    gotoxy(33,9); write('|           |            |');
    gotoxy(35,9); readln(baru^.info.nim);
    gotoxy(49,9); readln(baru^.info.nama);

    if(awal = nil) then
    begin
        baru^.next := nil;
        awal := baru;
        akhir := baru;
    end
    else
    begin         
        bantu := awal;
        arah := awal;
        i := 1;
        while(arah <> akhir)do
        begin
            arah^.info.posisi := i;
            if(arah^.info.posisi <> list)then
            begin
                arah:= arah^.next;
                arah^.info.posisi := 1+i; 
            end
            else
            begin 
                while(bantu^.next <> arah)do
                begin   
                    bantu := bantu^.next;
                end;
                baru^.next := bantu^.next;
                bantu^.next := baru;
            end;    
        end; //endwhile
    end; //endif   
end;


procedure addLast(var awal,akhir:point);
{i.s: User memasukan data buku perpus}
{f.s: Menghasilkan data buku yang dimasukan}

var 
    i,n: integer;

begin
    gotoxy(43,2); write('Jumlah data yang disisipkan Didepan: '); readln(n);
    gotoxy(33,4); writeln('--------------------------');
    gotoxy(33,5); writeln('      Sisip belakang      ');
    gotoxy(33,6); writeln('--------------------------');
    gotoxy(33,7); writeln('|    Nim    |    Nama    |');
    gotoxy(33,8); writeln('--------------------------');
    for i := 1 to n do
    begin
        new(baru);
        gotoxy(33,8+i); write('|           |            |');
        gotoxy(35,8+i); readln(baru^.info.nim);
        gotoxy(49,8+i); readln(baru^.info.nama);
        if(awal = nil)then
        begin    
            baru^.next := nil;
            awal := baru;
            
        end
        else
        begin
            baru^.next := nil;
            akhir^.next := baru;
        end;
    akhir := baru;
    
       
    end; //endfor
    gotoxy(33,9+i); writeln('--------------------------');
    readln;
end; //endprocedure 


procedure delFirst(var awal,akhir:point);
{i.s: Data sudah terdefinisi}
{f.s: menghapus data yang awal / depan}

var
    phapus: point;
    
begin
    phapus:= awal;
    if(awal=akhir) then
    begin
        akhir := nil;
        awal  := nil;
        dispose(phapus);
    end
    else
    begin
        awal := awal^.next;
        dispose(phapus);   
    end; //endif
    gotoxy(40,7); writeln('-------------------------');
    gotoxy(40,8); writeln('Data Depan Sudah Di hapus');
    gotoxy(40,9); writeln('-------------------------');
    readln;
end; //endprocedure


// procedure delMiddle(var awal,akhir:point);
// {i.s: Data sudah terdefinisi}
// {f.s: menghapus data yang awal / depan}

// var
//     phapus: point;
//     list,i : integer;
    
// begin
//     gotoxy(47,2); write('list keberapa yang akan dihapus :'); readln(list);   
//     phapus:= awal;
//     if(awal=akhir) then
//     begin
//         akhir := nil;
//         awal  := nil;
//         dispose(phapus);
//     end
//     else
//     begin
//         bantu := awal;
//         i := 1;
//         while(phapus <> akhir)do
//         begin
//             phapus^.info.posisi := i;
//             if(phapus^.info.posisi <> list) then
//             begin
//                 phapus:= phapus^.next;
//                 phapus^.info.posisi := i+1;
//                 i:= i+1;
//                 while(bantu^.next = phapus)do

//             end
//             else
//             begin
//                 bantu^.next := phapus^.next;
//                 dispose(phapus);
//             end; //endif
//             bantu := bantu^.next;
//         end; //endwhile
//     end; //endif
//     gotoxy(40,7); writeln('-------------------------');
//     gotoxy(40,8); writeln('Data Depan Sudah Di hapus');
//     gotoxy(40,9); writeln('-------------------------');
//     readln;
// end; //endprocedure


// procedure delMiddle(var awal,akhir:point);
// {i.s: Data sudah terdefinisi}
// {f.s: menghapus data yang awal / depan}

// var
//     phapus: point;
//     kode_hapus : string;
//     i : integer;
//     ketemu : boolean;

// begin
//     gotoxy(43,8); write('Nim Yang akan di hapus : '); readln(kode_hapus);
//     phapus := awal;
//     ketemu := false;
//     while(not ketemu) and (phapus <> nil)do
//     begin
//         if(phapus^.info.nim = kode_hapus) then
//             ketemu := true
//         else
//             phapus := phapus^.next;
//     end; //endwhile
//     if(ketemu) then
//     begin
//         if(phapus = awal) then
//         begin
//             awal := awal^.next;
//             dispose(phapus);
//         end
//         else
//         begin
//         while(phapus^.next <> akhir)do
//         begin
//             phapus := phapus^.next;
//         end;
//         akhir := phapus;
//         phapus := phapus^.next;
//         akhir^.next := nil;   
//     end; //endif
//         gotoxy(43,8); writeln('Data Dengan Kode Buku ',kode_hapus,' Sudah dihapus');
//     end
//     else
//         gotoxy(46,9); writeln('Nim ' ,kode_hapus,' Tidak ditemukan');
//     readln;
// end; //endprocedure


procedure delLast(var awal,akhir:point);
{i.s: Data sudah terdefinisi}
{f.s: menghapus data yang awal / depan}

var
    phapus: point;
    
begin
    phapus:= awal;
    if(awal=akhir) then
    begin
        akhir := nil;
        awal  := nil;
    end
    else
    begin
        while(phapus^.next <> akhir)do
        begin
            phapus := phapus^.next;
        end;
        akhir := phapus;
        phapus := phapus^.next;
        akhir^.next := nil;   
    end; //endif
    dispose(phapus);
    gotoxy(40,7); writeln('-------------------------');
    gotoxy(40,8); writeln('Data Depan Sudah Di hapus');
    gotoxy(40,9); writeln('-------------------------');
    readln;
end; //endprocedure



procedure tranversal(var awal:point);
{i.s: harga sudah terdefinisi}
{f.s: menampilkan data yang telah disisipkan}

var 
    bantu: point;
    i: integer;

begin
    bantu := awal;
    i := 1;
    while(bantu <> nil) do
    begin
        gotoxy(33,4); writeln('--------------------------');
        gotoxy(33,5); writeln('        Tampil Data       ');
        gotoxy(33,6); writeln('--------------------------');
        gotoxy(33,7); writeln('|    Nim    |    Nama    |');
        gotoxy(33,8); writeln('--------------------------');
        gotoxy(33,8+i); writeln('|           |            |');
        gotoxy(35,8+i); writeln(bantu^.info.nim);
        gotoxy(47,8+i); writeln(bantu^.info.nama);
        bantu := bantu^.next;
        i := i+1
    end; //endwhile
    gotoxy(33,8+i); writeln('--------------------------');
    readln;
end; //endprocedure


procedure cari_nim(awal : point);
{i.s: user memasukan kode buku yang akan dicari}
{f.s: menampilkan data buku yang dicari}

var
    kodecari: string;
    ketemu : boolean;
    bantu  : point;

begin
    if(awal = nil) then
    begin
        gotoxy(33,3); writeln('Data masih Kosong');
    end
    else
    begin
        gotoxy(33,3); write('Nim yang dicari : '); readln(kodecari);
        bantu  := awal;
        ketemu := false;
        while(not ketemu) and (bantu <> nil) do
        begin
            if(bantu^.info.nim = kodecari) then
                ketemu := true
            else
                bantu := bantu^.next;
        end; //endwhile
        if(ketemu) then
        begin
            gotoxy(33,4); writeln('--------------------------');
            gotoxy(33,5); writeln('        Tampil Data       ');
            gotoxy(33,6); writeln('--------------------------');
            gotoxy(33,7); writeln('|    Nim    |    Nama    |');
            gotoxy(33,8); writeln('--------------------------');
            gotoxy(33,9); writeln('|           |            |');
            gotoxy(35,9); writeln(bantu^.info.nim);
            gotoxy(47,9); writeln(bantu^.info.nama);
            gotoxy(33,10); writeln('-------------------------');  
        end
        else
        begin
            gotoxy(52,3); writeln('Kode Buku ',kodecari,' tidak di temukan');
        end;
    end;
    readln;
end; //endprocedure



procedure cari_nama(awal : point);
{i.s: user memasukan kode buku yang akan dicari}
{f.s: menampilkan data buku yang dicari}

var
    kodecari: string;
    ketemu : boolean;
    bantu  : point;

begin
    if(awal = nil) then
    begin
        gotoxy(33,3); writeln('Data masih Kosong');
    end
    else
    begin
        gotoxy(33,3); write('Nama yang dicari : '); readln(kodecari);
        bantu  := awal;
        ketemu := false;
        while(not ketemu) and (bantu <> nil) do
        begin
            if(bantu^.info.nama = kodecari) then
                ketemu := true
            else
                bantu := bantu^.next;
        end; //endwhile
        if(ketemu) then
        begin
            gotoxy(33,4); writeln('--------------------------');
            gotoxy(33,5); writeln('        Tampil Data       ');
            gotoxy(33,6); writeln('--------------------------');
            gotoxy(33,7); writeln('|    Nim    |    Nama    |');
            gotoxy(33,8); writeln('--------------------------');
            gotoxy(33,9); writeln('|           |            |');
            gotoxy(35,9); writeln(bantu^.info.nim);
            gotoxy(47,9); writeln(bantu^.info.nama);
            gotoxy(33,10); writeln('-------------------------');  
        end
        else
        begin
            gotoxy(52,3); writeln('Kode Buku ',kodecari,' tidak di temukan');
        end;
    end;
    readln;
end; //endprocedure


procedure menu_utama(var menu:integer);
{i.s: user memasukan pilihan menu}
{f.s: memberikan pilihan yang akan dibuka}

//kamus tidak ada

begin
    gotoxy(38,3);  writeln('============================================');
    gotoxy(38,4);  writeln('|              Selamat Datang              |');
    gotoxy(38,5);  writeln('--------------------------------------------');
    gotoxy(38,6);  writeln('|               Perpustakaan               |');
    gotoxy(38,7);  writeln('--------------------------------------------');
    gotoxy(38,8);  writeln('|****         1. Sisip Depan           ****|');
    gotoxy(38,9);  writeln('|**           2. Sisip Tertentu          **|');
    gotoxy(38,10); writeln('|*            3. Sisip Belakang           *|');
    gotoxy(38,11); writeln('|*            4. Hapus Depan              *|');
    gotoxy(38,12); writeln('|*            5. Hapus Tertentu           *|');
    gotoxy(38,13); writeln('|*            6. Hapus Belakang           *|');
    gotoxy(38,14); writeln('|*            7. Cari Nim                 *|');    
    gotoxy(38,15); writeln('|*            8. Cari Nama                *|');    
    gotoxy(38,16); writeln('|**           9. Tampil Data             **|');
    gotoxy(38,17); writeln('|****         10. Keluar                ****|');
    gotoxy(38,18); writeln('--------------------------------------------');
    gotoxy(38,19); write('Daftar Pilihan : '); readln(menu);
    {validasi}
    while(menu < 0) or (menu > 10)do
    begin
        gotoxy(38,19); writeln('Pilihan anda tidak ada di daftar'); readln;
        gotoxy(38,19); clreol;
        gotoxy(55,18); clreol;
        readln(menu);
    end; //endwhile
end; //endprocedure

begin
    
    repeat
    clrscr;
    menu_utama(menu);
    clrscr;
    case(menu)of
        1: begin
                addFirst(awal,akhir);   
            end;
        2: begin
                addMiddle(awal,akhir);   
            end;
        3: begin
                addLast(awal,akhir);   
            end;
        4: begin
                delFirst(awal,akhir);
            end;
        5: begin
                // delMiddle(awal,akhir);   
            end;
        6: begin
                delLast(awal,akhir);   
            end;
        7: begin
                cari_nim(awal);   
            end;
        8: begin
                cari_nama(awal);
            end;    
        9: begin
                tranversal(awal);   
            end;
    end; //endcase
    until(menu=10);
end.