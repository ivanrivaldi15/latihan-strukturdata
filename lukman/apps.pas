program SingleLinkedList;
type
    point = ^node;
    node = record
     info:integer;
     next :point;
    end;

var
   awal,akhir,baru : point;
   nilai : integer;

   procedure create();
   begin
        awal := nil;
        akhir:= nil;
   end;

   procedure addFirst(nilai:integer);
   begin
     new(baru);
     baru^.info := nilai;
     if (awal=nil) then
       begin
         baru^.next := nil;
         akhir := baru;
         end else
          baru^.next := awal;

        awal := baru;
   end; //end addFirst

   procedure addLast(nilai:integer);
   begin
     new(baru);
         baru^.info := nilai;
         baru^.next := nil;

         if (awal = nil) then
            awal := baru
             else
              begin
               akhir^.next := baru;
              end;
         akhir := baru;

   end;//end addLast

   procedure addCustom(nilai:integer);
   var
      bantu : point;
      datasisip:integer;
   begin
       new(baru);
       baru^.info := nilai;
       baru^.next := nil;

       if (awal = nil) then
        begin
          awal  := baru;
          akhir := baru;
        end
          else
           begin
            write('Data Lokasi Sisip : ');readln(datasisip);
            bantu := awal;
             while (bantu^.info<>datasisip) AND (bantu<>akhir) do
               bantu := bantu^.next;

               if bantu^.info = datasisip then
                begin
                 baru^.next := bantu^.next;
                 bantu^.next := baru;
                 if bantu=akhir then
                   akhir := baru;
                end
               else
                writeln('Posisi Sisip Tidak Ditemukan');
           end;
   end; //end addCustom

   procedure del_first();
   var
      pHapus : point;
   begin
      if awal = nil then
          write('Data Kosong')
          else
           if awal = akhir then
            begin
             dispose(awal);
             awal := nil;
             akhir := nil;
            end
             else
               begin
                 PHapus := awal;
                 awal := awal^.next;
                 dispose(PHapus);
               end;
   end; //end del_last

   procedure del_last();
   var
      PHapus : point;
   begin
    if awal = nil then
          write('Data Kosong, Penghapusan tidak dilakukan')
         else
           if awal = akhir then
            begin
              dispose(awal);
              awal := nil;
              akhir := nil;
            end
              else
               begin
                PHapus := awal;
                while PHapus^.next <> akhir do
                 begin
                  PHapus := PHapus^.next;
                 end;
                  dispose(akhir);
                  akhir := PHapus;
                  akhir^.next := nil;
               end;
   end;//end del_last

   procedure del_custom();
   var
      PHapus,bantu : point;
      DHapus : integer;
   begin
   if awal=nil then
       write('Data Yang akan dihapus tidak ada')
       else
        if (awal = akhir) then
         begin
           dispose(awal);
           awal := nil;
           akhir := nil;
         end
          else
              PHapus := awal;
              write('Data Yang akan dihapus = ');readln(DHapus);

              if (DHapus = PHapus^.info)
               then
                begin
                 PHapus := awal;
                 awal := awal^.next;
                 dispose(PHapus);
                end
                else
                 begin
                    while (PHapus^.next^.info <> DHapus) AND (PHapus <> akhir) do
                        begin
                        PHapus := Phapus^.next;
                        end;

                        if (PHapus^.next^.info = DHapus) then
                        begin
                             bantu := PHapus^.next;
                             PHapus^.next := bantu^.next;
                             dispose(bantu);
                        end;
                 end;
   end;

   procedure searching();
   var
      bantu : point;
      dCari,pos : integer;
   begin
      pos := 0;
      bantu := awal;
      writeln('Data yang mau dicari'); readln(dCari);

      if (awal = nil) then
       writeln('Linked List Tidak Ditemukan')
       else
        begin
             while(bantu^.info <> dCari) do
              begin
              bantu := bantu^.next;
              pos := pos + 1;
              end;

              if(bantu^.info = dCari) then
              begin
                   writeln('Data ditemukan di posisi = ',pos);
              end;
        end;
   end;



   procedure traversal();
   var
      p : point;
   begin
      p := awal;

     write('ISI LINKED LIST : ');
         if (awal = nil) then
            writeln('ISI LINKED LIST KOSONG')
            else
             begin
               p:= awal;
               while (p<>nil) do
                begin
                     write(p^.info:4);
                     p := p^.next;
                end;
                    writeln;
             end;
   end; //end traversal



begin
    create();                                       
    writeln('------------------------------------');
    writeln('Sisip depan');
    addFirst(7);
    addFirst(6);
    addFirst(1);
    traversal();
    writeln('------------------------------------');
    writeln('Sisip belakang');
    addLast(5);
    addLast(2);
    addLast(3);
    addLast(9);
    traversal();
    writeln('------------------------------------');
    writeln('Sisip Custom');
    write('Data yang mau disisipkan = ');readln(nilai);
    addCustom(nilai);
    traversal();
    writeln('------------------------------------');
    writeln('Hapus Depan');
    del_first();
    traversal();
    writeln('------------------------------------');
    writeln('Hapus Belakang');
    del_last();
    traversal();
    writeln('------------------------------------');
    writeln('Hapus Custom');
    del_custom();
    traversal();
    writeln('------------------------------------');
    writeln('Searching');
    searching();
    traversal();



    readln();
end.
