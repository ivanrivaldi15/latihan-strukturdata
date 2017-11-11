program linkedList;

type
    point = ^node;

    mahasiswa = record
        nim  : string;
        nama : string;
    end;
    node = record
        info : mahasiswa;
        next : point;
    end;

var
    awal, akhir, baru, bantu, phapus : point;
    dataMahasiswa : mahasiswa;

procedure create;
begin
    awal := nil;
    akhir := nil;
end;

procedure traversal;
begin
    if (awal = nil) then
        writeln('Maaf, linked list kosong')
    else
    begin
        bantu := awal;
        while(bantu <> nil) do
        begin
            writeln(bantu^.info.nim);
            writeln(bantu^.info.nama); writeln();
            bantu := bantu^.next;
        end;
    end;
end;

function inputMahasiswa:mahasiswa;
begin
    write('Masukkan NIM  : '); readln(dataMahasiswa.nim);
    write('Masukkan Nama : '); readln(dataMahasiswa.nama);
    inputMahasiswa:=dataMahasiswa;
end;

procedure addFirst(nim, nama: string);
begin
    new(baru);
    baru^.info.nim := nim;
    baru^.info.nama := nama;
    if (awal = nil) then
    begin
        baru^.next := nil;
        akhir := baru;
    end
    else
        baru^.next := awal;
    awal := baru;
end;

procedure addLast(nim, nama: string);
begin
    new(baru);
    baru^.info.nim := nim;
    baru^.info.nama := nama;
    if (awal = nil) then
    begin
        baru^.next := nil;
        awal := baru;
    end
    else
        akhir^.next := baru;
    akhir := baru;
end;

procedure addCustom();
var 
    pos: string;
begin
    writeln('Data Yang Sudah Ada : ');
    writeln('------------------------------');
    traversal; writeln(); writeln();
    
    writeln('Masukkan Data Baru');
    writeln('------------------------------');
    new(baru);
    baru^.info := inputMahasiswa();
    write('Posisi Setelah Nim : '); readln(pos);
    
    if (awal = nil) then
    begin
        baru^.next := nil;
        akhir := baru;
        awal := baru;
    end
    else
    begin
        bantu := awal;
        while(bantu^.info.nim <> pos) do
        begin
            bantu := bantu^.next;
        end;
        baru^.next := bantu^.next;
        bantu^.next := baru;
    end; 
end;

procedure deleteFirst;
begin
    phapus := awal;
    dataMahasiswa := phapus^.info;
    if (awal = akhir) then
    begin
        awal := nil;
        akhir := nil
    end
    else
        awal := awal^.next;
    dec(phapus);
end;

procedure deleteLast;
begin
    phapus := awal;
    if (awal = akhir) then
    begin
        dataMahasiswa := phapus^.info;
        awal := nil;
        akhir := nil
    end
    else
    begin
        dataMahasiswa := akhir^.info;
        while (phapus^.next <> akhir) do
        begin
            phapus := phapus^.next;
        end;
        akhir := phapus;
        phapus := phapus^.next;
        akhir^.next := nil;
    end;
    dec(phapus);
end;

procedure search();
var 
    dapat: boolean;
    data: string;
begin
    write('Masukkan Nim yang ingin dicari : '); readln(data);
    dapat := false;
    if (awal = nil) then
        writeln('Maaf, linked list kosong')
    else
    begin
        bantu := awal;
        while (not dapat) AND (bantu <> nil) do
        begin
            if (bantu^.info.nim = data) then
            begin
                dapat := true;
            end
            else
            begin
                bantu := bantu^.next;
            end;
        end;
        if (dapat = true) then
        begin    
            writeln('Data ditemukan:');
            writeln('NIM: ', bantu^.info.nim);
            writeln('Nama: ', bantu^.info.nama)
        end
        else
            writeln('Data tidak ditemukan');
    end;
end;

procedure termination;
begin
    while (awal <> nil) do
    deleteFirst;
end;

begin
    create;
    addLast('12345', 'Mahasiswa 1');
    addLast('45214', 'Mahasiswa 2');
    addLast('45224', 'Mahasiswa 3');
    addLast('45246', 'Mahasiswa 4');

    deleteFirst;
    deleteLast;

    addCustom;
    traversal;

    search;

    writeln();
    writeln('Setelah Penghancuran Data: ');
    termination;
    traversal;
end.