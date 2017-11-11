program linkedList;

uses crt;
type
    point = ^node;

    mahasiswa = record
        nim : string;
        nama : string;
    end;

    node = record
        info : mahasiswa;
        next : point;
    end;

var
    bantu,awal,akhir,baru,pDelete: point;
    dataMHS : mahasiswa; 
    pilihan : string;

    function dataMahasiswa():mahasiswa;
    begin
        writeln('Masukkan NIM  : '); readln(dataMHS.nim);
        writeln('Masukkan NAMA : '); readln(dataMHS.nama);
        dataMahasiswa := dataMHS; 
    end;

    procedure create;
    begin
        awal := nil;
        akhir := awal;
    end;

    procedure addFirst;
    begin
        new(baru);
        baru^.info := dataMahasiswa();

        if (awal = nil) then
        begin
            baru^.next := nil;
            akhir := baru;
        end
        else
        begin
            baru^.next:=awal;        
        end;
        awal := baru;    
            
    end;

    procedure addLast;
    begin
        new(baru);
        baru^.info := dataMahasiswa();
        baru^.next := nil;

        if(awal = nil)then
        begin
           awal := baru; 
        end
        else
        begin
            akhir^.next := baru;
        end;
        akhir := baru; 
    end;

procedure addCustom;
    var
        bantu2 : point;
        udahdicek,pos : integer;
    begin
        new(baru);
        bantu := awal;
        bantu2 := awal;
        writeln();
        writeln('Masukkan Posisi yang diinginkan : '); readln(pos);
        if(pos = 1)then
        begin
            addFirst;
        end
        else if(awal = nil)then
            begin
                baru^.info := dataMahasiswa();            
                baru^.next := nil;
                awal := baru;
                akhir := baru;
            end
            else
            begin
            baru^.info := dataMahasiswa();
            udahdicek := 1;
            while(udahdicek <> pos)do
                begin
                bantu := bantu^.next;
                udahdicek := udahdicek + 1;
                end;
                while(bantu2^.next <> bantu)do
                begin
                    bantu2 := bantu2^.next;
                end;

            bantu2^.next := baru;
            baru^.next := bantu;    
            end;
    end;

    procedure traversal;
    begin
        if (awal = nil) then
        begin
            writeln('data kosong');
        end
        else
        begin
            bantu := awal;
            while(bantu <> nil) do
            begin
                writeln('NIM  : ',bantu^.info.nim);
                writeln('NAMA : ',bantu^.info.nama);

                writeln();
                bantu:=bantu^.next;
            end;
        end;       
    end;
    
    procedure deleteFirst;
    begin
        pDelete := awal;
        dataMHS := pDelete^.info;
        if(awal = akhir)then
        begin
            awal := nil;
            akhir := nil;
        end
        else if(awal <> akhir)then
        begin
            awal := awal^.next;
        end;
        
        dec(pDelete);        
    end;

    procedure deleteLast;
    begin
        if(awal = akhir)then
        begin
            pDelete := awal;
            dataMHS := pDelete^.info;
            awal := nil;
            akhir := nil;
        end
        else
        begin
            pDelete := awal;
            dataMHS := akhir^.info;
            while(pDelete^.next <> akhir)do
                pDelete := pDelete^.next;

            akhir :=  pDelete;
            pDelete := pDelete^.next;
            akhir^.next := nil;
            dec(pDelete);    
        end;
    end;

    procedure Search;
    var
        NIM   : string;
        Ketemu : boolean;
    begin
    
    write('NIM yang ingin dicari : '); readln(NIM);
 
    bantu := awal;
    Ketemu := false;
 
    while(not Ketemu) and (bantu <> nil) do
    begin
        if(bantu^.info.nim = NIM) then
            Ketemu := true
        else
            bantu := bantu^.next;
    end;
 
    if(ketemu) then
    begin
       clrscr;
       writeln('NIM  : ', NIM);
       writeln('Nama : ', bantu^.info.nama);
       readln;
    end
    else
      write('NIM ' + NIM + ' tidak ditemukan!');
    end;

    procedure terminate;
    begin
        while(awal <> nil)do
        begin
            deleteFirst;
        end;       
    end;

begin
    create;
    writeln('Add First');
    addFirst;
    addFirst;
    deleteFirst;
    writeln();
    writeln('++++++++++++++');
    writeln('Add Custom');
    addCustom;
    // deleteCustom;
    writeln();
    writeln('+++++++++++++++');
    writeln('Add Last');
    addLast;
    addLast;
    deleteLast;
    writeln();
    writeln('+++++++++++++++');
    traversal;

    Search;
    clrscr;
    traversal;
    write('Apakah anda ingin menghapus semua data ? [Y/T] :'); readln(pilihan);
    if(pilihan = 'Y')then
    begin
        terminate;
        write('data berhasil terhapus');
        readln;
    end
    else
    begin
        traversal;
        write('data masih ada');
        readln;
    end;    
    readln; 
end.
