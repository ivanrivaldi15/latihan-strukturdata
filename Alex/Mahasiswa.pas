program LinkedList;
uses crt;
type
	RecordMahasiswa = record
		NIM,Nama: string;
	end;
	point = ^node;
	node = record
		info: RecordMahasiswa;
		next: point;
	end;

var
	awal,akhir,baru :point;
	pilihan:integer;
	data:RecordMahasiswa;

procedure create;

begin
	awal:=nil;
	akhir:=nil;
end;

procedure searchNIM;
var	
	posisiNIM:string; //data akan dimasukkan setelah posisiNIM 
	bantu:point;
	i:integer;
begin
	if awal = nil then
        writeln('Maaf, Linked List kosong')
    else	
	begin
    	repeat //Pencarian Posisi
    		write('NIM yang ingin dicari : ');readln(posisiNIM);	
    		bantu:=awal;
    		i:=1;
    		while (bantu^.info.NIM<>posisiNIM) do begin
    			i:=i+1;
    			if bantu^.next <> nil then
    	    		bantu:=bantu^.next
    	    	else
    	    		break;
    	    end;
	
    		if (bantu^.info.NIM<>posisiNIM) then
    			writeln('NIM tidak ditemukan');
    		
	
    	until(bantu^.info.NIM=posisiNIM);
    	writeln('NIM ditemukan di data ke- ' , i);
    end;
end;

procedure addFirst(data:RecordMahasiswa);

begin
	new(baru);
	baru^.info.NIM:= data.NIM;
	baru^.info.Nama:= data.Nama;

	if (awal = nil) then begin	
		baru^.next:= nil;
		akhir:=baru;
	end
	else
		baru^.next:=awal;

	awal:=baru;
end;

procedure addLast(data:RecordMahasiswa);

begin
    new(baru);
    baru^.info.NIM:= data.NIM;
	baru^.info.Nama:= data.Nama;
    baru^.next:=nil;

    if awal=nil then  
        awal:=baru
    else
        akhir^.next:=baru;

    akhir:=baru;
end;

procedure addCostum(data:RecordMahasiswa);
var
   posisiNIM:string; //data akan dimasukkan setelah posisiNIM 
   bantu:point;
begin
    if awal=nil then
       addFirst(data)
    else 
    begin
        	
        repeat //Pencarian Posisi	
        	write('Posisi penyisipan data setelah NIM : ');readln(posisiNIM);    
        	bantu:=awal;

        	while (bantu^.info.NIM<>posisiNIM) do begin
        		if bantu^.next <> nil then
            		bantu:=bantu^.next
            	else
            		break;
            end;

        	if (bantu^.info.NIM<>posisiNIM) then
        		writeln('NIM tidak ditemukan');

       	until(bantu^.info.NIM=posisiNIM);

       	//Proses Pengsisipan
        if bantu^.info.NIM=posisiNIM then
        begin
            if bantu=akhir then
            begin
                addLast(data);
            end
            else
            begin
                new(baru);
                baru^.info.NIM:= data.NIM;
				baru^.info.Nama:= data.Nama;
                baru^.next:=nil;
                baru^.next:=bantu^.next;
                bantu^.next:=baru;
            end;
        end;
    end;
end;

procedure deleteFirst;
var
   bantu:point;
begin
    if awal=nil then
    begin
        writeln('Maaf, Linked List kosong');
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
            dispose(bantu);
        end;
    end;
end;

procedure deleteLast;
var
   bantu:point;
begin
    if awal=nil then
    begin
        writeln('Maaf, Linked List kosong');
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
            while bantu^.next<>akhir do
               bantu:=bantu^.next;
            dispose(akhir);
            akhir:=bantu;
            akhir^.next:=nil;
        end;
    end;
end;

procedure deleteCostum;
var
   posisiNIM:string; //NIM yang akan dihapus
   prevbantu,bantu:point;
begin
    if awal=nil then
        writeln('Maaf, Linked List kosong')
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
			
			repeat //Pencarian Posisi
				write('NIM yang ingin dihapus : ');readln(posisiNIM);
        		bantu:=awal;			
        		while (bantu^.info.NIM<>posisiNIM) do 
        		begin
        		   	prevbantu:=bantu;
        		   	bantu:=bantu^.next;
        		end;        							
       	        		   
        		if (bantu^.info.NIM<>posisiNIM) then
        			writeln('-----NIM tidak ditemukan------');	

			until(bantu^.info.NIM=posisiNIM);

			//Proses Penghapusan
			if bantu^.info.NIM=posisiNIM then
        	begin
        	    if bantu=awal then
        	        deleteFirst
        	    else
        	    if bantu=akhir then
        	    	deleteLast
        	    else
        	    begin
        	    	prevbantu^.next:=bantu^.next;
        			dispose(bantu);
        	    end;
        	end;
        end;
    end;
end;

procedure sort;
var
   i,j,pmaks:point;
   temp,temp2:string;
begin
     if awal=nil then
        writeln('Maaf, Linked List kosong')
     else
     if awal=akhir then
        writeln('Hanya Terdapat 1 Data')
     else
     begin
          i:=awal;
          while i<>akhir do
          begin
               pmaks:=i;
               j:=i^.next;
               while j<>nil do
               begin
                    if j^.info.NIM < pmaks^.info.NIM then
                       pmaks:=j;
                    j:=j^.next;
               end;
               temp:=i^.info.NIM;
               temp2:=i^.info.Nama;
               
               i^.info.NIM:=pmaks^.info.NIM;
               i^.info.Nama:=pmaks^.info.Nama;
               
               pmaks^.info.NIM:=temp;
               pmaks^.info.Nama:=temp2;


               i:=i^.next;
          end;
     end;
end;

procedure traversal;
var
	temp:point;
	i:integer;

begin
	if(awal=nil) then
		writeln('Maaf, Linked List kosong')
	else begin
    	temp:=awal;
    	i:=1;
    	while temp<>nil do begin
    		writeln('------------------',i,'-----------------');i:=i+1;
        	write('NIM  : ');writeln(temp^.info.NIM);
        	write('Nama : ');writeln(temp^.info.Nama);
        	temp:=temp^.next;delay(100);
    	end;
    	writeln;
    end;
end;

procedure termination;
begin
    while awal<>nil do
    	deleteFirst;
end;

//Main Program
begin
	
	create;
	data.NIM:='10116371';
	data.Nama:='abc';
	addLast(data);
	data.NIM:='10116373';
	data.Nama:='def';
	addLast(data);
	data.NIM:='10116372';
	data.Nama:='ghi';
	addLast(data);
	data.NIM:='10116375';
	data.Nama:='jkl';
	addLast(data);
	data.NIM:='10116374';
	data.Nama:='mno';
	addLast(data);


{ 	sort;
	writeln('-------------sort--------------------');
	traversal;
	writeln('-------------sort--------------------'); }


	repeat
        clrscr;

        writeln('Alexander M S');
        writeln('Menu');
        writeln('-----------------------------------');
        writeln('1. Tambah depan ');
        writeln('2. Tambah Belakang');
        writeln('3. Tambah Costum');
        writeln('4. Hapus Depan');
        writeln('5. Hapus Belakang');
        writeln('6. Hapus Costum');
        writeln('7. Pencarian');
        writeln('8. Pengurutan');
        writeln('9. Tampil Data');
        writeln('10. Penghancuran');
        writeln('0. Keluar');
        writeln('-----------------------------------');
        write('Pilihan anda : ');readln(pilihan);
        case pilihan of
        	1:begin
        		clrscr;
        		writeln('-----Data yang akan ditambahkan-----');
        		write('NIM  : ');readln(data.NIM);
        		write('Nama : ');readln(data.Nama);        		
        		addFirst(data);
        		writeln('----Isi Linked List------');
        		traversal;readln;
        	end;
        	2:begin
        		clrscr;
        		writeln('-----Data yang akan ditambahkan-----');
        		write('NIM  : ');readln(data.NIM);
        		write('Nama : ');readln(data.Nama);
        		addLast(data);
        		writeln('----Isi Linked List------');
        		traversal;readln;
        	end;
        	3:begin
        		clrscr;
        		writeln('-----Data yang akan ditambahkan-----');
        		write('NIM  : ');readln(data.NIM);
        		write('Nama : ');readln(data.Nama);
        		writeln;
        		writeln('----Isi Linked List------');
        		traversal;
        		addCostum(data);
        		writeln('----Isi Linked List setelah Penambahan------');
        		traversal;readln;
        		
        	end;
        	4:begin
        		clrscr;
        		writeln('-----Data Awal Telah dihapus-----');
        		deleteFirst;readln;
        		writeln('----Isi Linked List setelah Penghapusan------');
        		traversal;readln;
        	end;
        	5:begin
        		clrscr;
        		writeln('-----Data Akhir Telah dihapus-----');
        		deleteLast;readln;
        		writeln('----Isi Linked List setelah Penghapusan------');
        		traversal;readln;
        	end;
        	6:begin
        		clrscr;
        		writeln('----Isi Linked List------');
        		traversal;
        		deleteCostum;
        		writeln('----Isi Linked List setelah Penghapusan------');
        		traversal;readln;
        	end;
        	7:begin
        		clrscr;
        		writeln('-----Pencarian-----');
        		searchNIM;readln;
        		writeln('----Isi Linked List------');
        		traversal;readln;
        	end;
        	8:begin
        		clrscr;
        		writeln('--------Pengurutan Berdasarkan NIM-------');
        		sort;
        		writeln('----Isi Linked List setelah Pengurutan------');
        		traversal;readln;
        	end;
        	9:begin
        		clrscr;
        		writeln('----Isi Linked List------');
        		traversal;readln;
        	end;
        	10:begin
        		clrscr;
        		writeln('-----------------Penghancuran------------------');
        		termination;readln;
        		writeln('-----Isi Linked List setelah Penghancuran------');
        		traversal;readln;
        	end;
        end;
     until pilihan=0;
     
end.
