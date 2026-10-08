 
                       ORG $838000
 
                       db $0E,$06,$03,$01,$01,$03,$06,$0C   ;838000|        |      ;
                       db $06,$03,$01,$01,$03,$06,$0C       ;838008|        |      ;
 
         DATA8_83800F:
                       db $06,$05,$04,$03,$02,$01,$00,$01   ;83800F|        |      ;
                       db $02,$03,$04,$05,$06,$07,$0E,$07   ;838017|        |      ;
                       db $03,$01,$01,$04,$07,$10,$05,$02   ;83801F|        |      ;
                       db $01,$01,$03,$06,$07               ;838027|        |      ;
 
         DATA8_83802C:
                       db $06,$05,$04,$03,$02,$01,$00,$01   ;83802C|        |      ;
                       db $02,$03,$04,$05,$06,$07           ;838034|        |      ;
 
         DATA8_83803A:
                       db $00                               ;83803A|        |      ;
 
         DATA8_83803B:
                       db $00                               ;83803B|        |      ;
 
         DATA8_83803C:
                       db $04                               ;83803C|        |      ;
 
         DATA8_83803D:
                       db $04,$00,$B0,$00,$04,$70,$00,$06   ;83803D|        |      ;
                       db $00,$10,$00,$01,$00               ;838045|        |      ;
 
       CODE_FL_83804A:
                       PHP                                  ;83804A|08      |      ;
                       SEP #$20                             ;83804B|E220    |      ;
                       LDA.W $021E                          ;83804D|AD1E02  |83021E;
                       BNE +                                ;838050|D002    |838054;
                       PLP                                  ;838052|28      |      ;
                       RTL                                  ;838053|6B      |      ;
 
                     + LDX.W #$0000                         ;838054|A20000  |      ;
 
                     - LDA.L $7E982F,X                      ;838057|BF2F987E|7E982F;
                       STA.L $7E96FF,X                      ;83805B|9FFF967E|7E96FF;
                       BEQ +                                ;83805F|F015    |838076;
                       INX                                  ;838061|E8      |      ;
                       LDA.L $7E982F,X                      ;838062|BF2F987E|7E982F;
                       STA.L $7E96FF,X                      ;838066|9FFF967E|7E96FF;
                       INX                                  ;83806A|E8      |      ;
                       LDA.L $7E982F,X                      ;83806B|BF2F987E|7E982F;
                       STA.L $7E96FF,X                      ;83806F|9FFF967E|7E96FF;
                       INX                                  ;838073|E8      |      ;
                       BRA -                                ;838074|80E1    |838057;
 
                     + LDX.W #$0000                         ;838076|A20000  |      ;
 
                     - LDA.L $7E984F,X                      ;838079|BF4F987E|7E984F;
                       STA.L $7E971F,X                      ;83807D|9F1F977E|7E971F;
                       BEQ +                                ;838081|F015    |838098;
                       INX                                  ;838083|E8      |      ;
                       LDA.L $7E984F,X                      ;838084|BF4F987E|7E984F;
                       STA.L $7E971F,X                      ;838088|9F1F977E|7E971F;
                       INX                                  ;83808C|E8      |      ;
                       LDA.L $7E984F,X                      ;83808D|BF4F987E|7E984F;
                       STA.L $7E971F,X                      ;838091|9F1F977E|7E971F;
                       INX                                  ;838095|E8      |      ;
                       BRA -                                ;838096|80E1    |838079;
 
                     + LDX.W #$0000                         ;838098|A20000  |      ;
 
                     - LDA.L $7E993F,X                      ;83809B|BF3F997E|7E993F;
                       STA.L $7E980F,X                      ;83809F|9F0F987E|7E980F;
                       BEQ +                                ;8380A3|F00C    |8380B1;
                       INX                                  ;8380A5|E8      |      ;
                       LDA.L $7E993F,X                      ;8380A6|BF3F997E|7E993F;
                       STA.L $7E980F,X                      ;8380AA|9F0F987E|7E980F;
                       INX                                  ;8380AE|E8      |      ;
                       BRA -                                ;8380AF|80EA    |83809B;
 
                     + PLP                                  ;8380B1|28      |      ;
                       RTL                                  ;8380B2|6B      |      ;
 
       CODE_FL_8380B3:
                       PHP                                  ;8380B3|08      |      ;
                       REP #$20                             ;8380B4|C220    |      ;
                       LDX.W #$003E                         ;8380B6|A23E00  |      ;
                       LDA.W #$0000                         ;8380B9|A90000  |      ;
 
                     - STA.L $7E982F,X                      ;8380BC|9F2F987E|7E982F;
                       DEX                                  ;8380C0|CA      |      ;
                       DEX                                  ;8380C1|CA      |      ;
                       BPL -                                ;8380C2|10F8    |8380BC;
                       LDX.W #$001E                         ;8380C4|A21E00  |      ;
                       LDA.W #$0000                         ;8380C7|A90000  |      ;
 
                     - STA.L $7E993F,X                      ;8380CA|9F3F997E|7E993F;
                       DEX                                  ;8380CE|CA      |      ;
                       DEX                                  ;8380CF|CA      |      ;
                       BPL -                                ;8380D0|10F8    |8380CA;
                       PLP                                  ;8380D2|28      |      ;
                       RTL                                  ;8380D3|6B      |      ;
                       db $BE,$00,$00,$B9,$02               ;8380D4|        |000000;
                       db $00,$85                           ;8380D9|        |      ;
                       db $00,$08,$8B,$F4,$00,$7E,$AB,$AB   ;8380DB|        |      ;
                       db $C2,$30,$A9,$00,$00,$BF,$2F,$98   ;8380E3|        |      ;
                       db $7E,$9F,$FF,$96,$7E,$9E,$2F,$98   ;8380EB|        |00FF9F;
                       db $E8,$E8,$E4,$00,$D0,$EF,$AB,$28   ;8380F3|        |      ;
                       db $6B                               ;8380FB|        |      ;
 
       CODE_FN_8380FC:
                       PHP                                  ;8380FC|08      |      ;
                       SEP #$20                             ;8380FD|E220    |      ;
                       LDA.W $021E                          ;8380FF|AD1E02  |83021E;
                       ORA.B #$20                           ;838102|0920    |      ;
                       STA.W $021E                          ;838104|8D1E02  |83021E;
                       REP #$20                             ;838107|C220    |      ;
                       SEP #$20                             ;838109|E220    |      ;
                       LDA.B #$00                           ;83810B|A900    |      ;
                       STA.W DMA5PARAM                      ;83810D|8D5043  |834350;
                       LDA.B #$2C                           ;838110|A92C    |      ;
                       STA.W DMA5REG                        ;838112|8D5143  |834351;
                       LDA.B #$0F                           ;838115|A90F    |      ;
                       STA.W DMA5ADDRL                      ;838117|8D5243  |834352;
                       LDA.B #$98                           ;83811A|A998    |      ;
                       STA.W DMA5ADDRM                      ;83811C|8D5343  |834353;
                       LDA.B #$7E                           ;83811F|A97E    |      ;
                       STA.W DMA5ADDRH                      ;838121|8D5443  |834354;
                       REP #$20                             ;838124|C220    |      ;
                       PHB                                  ;838126|8B      |      ;
                       PEA.W $7E00                          ;838127|F4007E  |837E00;
                       PLB                                  ;83812A|AB      |      ;
                       PLB                                  ;83812B|AB      |      ;
                       SEP #$20                             ;83812C|E220    |      ;
                       LDA.W $9997                          ;83812E|AD9799  |7E9997;
                       DEC A                                ;838131|3A      |      ;
                       CMP.B #$80                           ;838132|C980    |      ;
                       BCC +                                ;838134|9010    |838146;
                       LDA.B #$7F                           ;838136|A97F    |      ;
                       STA.W $993F                          ;838138|8D3F99  |7E993F;
                       LDA.W $9997                          ;83813B|AD9799  |7E9997;
                       SEC                                  ;83813E|38      |      ;
                       SBC.B #$80                           ;83813F|E980    |      ;
                       STA.W $9941                          ;838141|8D4199  |7E9941;
                       BRA ++                               ;838144|8009    |83814F;
 
                     + DEC A                                ;838146|3A      |      ;
                       STA.W $993F                          ;838147|8D3F99  |7E993F;
                       LDA.B #$01                           ;83814A|A901    |      ;
                       STA.W $9941                          ;83814C|8D4199  |7E9941;
 
                    ++ LDA.W $01E2                          ;83814F|ADE201  |7E01E2;
                       STA.W $9940                          ;838152|8D4099  |7E9940;
                       STA.W $9942                          ;838155|8D4299  |7E9942;
                       STA.W $9948                          ;838158|8D4899  |7E9948;
                       LDA.B #$DF                           ;83815B|A9DF    |      ;
                       SEC                                  ;83815D|38      |      ;
                       SBC.L $7E9997                        ;83815E|EF97997E|7E9997;
                       CMP.B #$80                           ;838162|C980    |      ;
                       BCS +                                ;838164|B00B    |838171;
                       DEC A                                ;838166|3A      |      ;
                       STA.W $9943                          ;838167|8D4399  |7E9943;
                       LDA.B #$01                           ;83816A|A901    |      ;
                       STA.W $9945                          ;83816C|8D4599  |7E9945;
                       BRA ++                               ;83816F|800F    |838180;
 
                     + LDA.B #$7F                           ;838171|A97F    |      ;
                       STA.W $9943                          ;838173|8D4399  |7E9943;
                       LDA.B #$60                           ;838176|A960    |      ;
                       SEC                                  ;838178|38      |      ;
                       SBC.L $7E9997                        ;838179|EF97997E|7E9997;
                       STA.W $9945                          ;83817D|8D4599  |7E9945;
 
                    ++ LDA.W $01E2                          ;838180|ADE201  |7E01E2;
                       AND.B #$EF                           ;838183|29EF    |      ;
                       STA.W $9944                          ;838185|8D4499  |7E9944;
                       STA.W $9946                          ;838188|8D4699  |7E9946;
                       LDA.B #$01                           ;83818B|A901    |      ;
                       STA.W $9947                          ;83818D|8D4799  |7E9947;
                       PLB                                  ;838190|AB      |      ;
                       PLP                                  ;838191|28      |      ;
                       RTS                                  ;838192|60      |      ;
 
       CODE_FN_838193:
                       SEP #$20                             ;838193|E220    |      ;
                       LDA.W $021E                          ;838195|AD1E02  |83021E;
                       AND.B #$DF                           ;838198|29DF    |      ;
                       STA.W $021E                          ;83819A|8D1E02  |83021E;
                       REP #$20                             ;83819D|C220    |      ;
                       RTS                                  ;83819F|60      |      ;
 
       CODE_FN_8381A0:
                       SEP #$20                             ;8381A0|E220    |      ;
                       LDA.B #$5F                           ;8381A2|A95F    |      ;
                       STA.L $7E982F                        ;8381A4|8F2F987E|7E982F;
                       REP #$20                             ;8381A8|C220    |      ;
                       LDA.W #$FFE0                         ;8381AA|A9E0FF  |      ;
                       SEC                                  ;8381AD|38      |      ;
                       SBC.L $7E96E5                        ;8381AE|EFE5967E|7E96E5;
                       STA.L $7E9830                        ;8381B2|8F30987E|7E9830;
                       SEP #$20                             ;8381B6|E220    |      ;
                       LDA.B #$71                           ;8381B8|A971    |      ;
                       STA.L $7E9832                        ;8381BA|8F32987E|7E9832;
                       LDA.B #$20                           ;8381BE|A920    |      ;
                       CLC                                  ;8381C0|18      |      ;
                       ADC.L $7E96E5                        ;8381C1|6FE5967E|7E96E5;
                       STA.L $7E9833                        ;8381C5|8F33987E|7E9833;
                       STA.L $7E9836                        ;8381C9|8F36987E|7E9836;
                       LDA.B #$10                           ;8381CD|A910    |      ;
                       STA.L $7E9835                        ;8381CF|8F35987E|7E9835;
                       LDA.B #$01                           ;8381D3|A901    |      ;
                       STA.L $7E9838                        ;8381D5|8F38987E|7E9838;
                       REP #$20                             ;8381D9|C220    |      ;
                       RTS                                  ;8381DB|60      |      ;
 
       CODE_FN_8381DC:
                       SEP #$20                             ;8381DC|E220    |      ;
                       LDA.B #$3F                           ;8381DE|A93F    |      ;
                       STA.L $7E982F                        ;8381E0|8F2F987E|7E982F;
                       LDA.B #$40                           ;8381E4|A940    |      ;
                       STA.L $7E9832                        ;8381E6|8F32987E|7E9832;
                       REP #$20                             ;8381EA|C220    |      ;
                       LDA.W #$0100                         ;8381EC|A90001  |      ;
                       CLC                                  ;8381EF|18      |      ;
                       ADC.L $7E96E3                        ;8381F0|6FE3967E|7E96E3;
                       STA.L $7E9833                        ;8381F4|8F33987E|7E9833;
                       SEP #$20                             ;8381F8|E220    |      ;
                       LDA.B #$60                           ;8381FA|A960    |      ;
                       STA.L $7E9835                        ;8381FC|8F35987E|7E9835;
                       LDA.B #$01                           ;838200|A901    |      ;
                       STA.L $7E9838                        ;838202|8F38987E|7E9838;
                       REP #$20                             ;838206|C220    |      ;
                       RTS                                  ;838208|60      |      ;
 
       CODE_FN_838209:
                       SEP #$20                             ;838209|E220    |      ;
                       LDA.B #$57                           ;83820B|A957    |      ;
                       STA.L $7E982F                        ;83820D|8F2F987E|7E982F;
                       LDA.B #$40                           ;838211|A940    |      ;
                       STA.L $7E9832                        ;838213|8F32987E|7E9832;
                       LDA.B #$01                           ;838217|A901    |      ;
                       STA.L $7E9835                        ;838219|8F35987E|7E9835;
                       REP #$20                             ;83821D|C220    |      ;
                       LDA.L $7E96E3                        ;83821F|AFE3967E|7E96E3;
                       AND.W #$01FF                         ;838223|29FF01  |      ;
                       STA.L $7E9833                        ;838226|8F33987E|7E9833;
                       SEP #$20                             ;83822A|E220    |      ;
                       LDA.B #$02                           ;83822C|A902    |      ;
                       STA.W DMA6PARAM                      ;83822E|8D6043  |834360;
                       LDA.B #$0D                           ;838231|A90D    |      ;
                       STA.W DMA6REG                        ;838233|8D6143  |834361;
                       LDA.B #$FF                           ;838236|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;838238|8D6243  |834362;
                       LDA.B #$96                           ;83823B|A996    |      ;
                       STA.W DMA6ADDRM                      ;83823D|8D6343  |834363;
                       LDA.B #$7E                           ;838240|A97E    |      ;
                       STA.W DMA6ADDRH                      ;838242|8D6443  |834364;
                       REP #$20                             ;838245|C220    |      ;
                       SEP #$20                             ;838247|E220    |      ;
                       LDA.B #$02                           ;838249|A902    |      ;
                       STA.W DMA7PARAM                      ;83824B|8D7043  |834370;
                       LDA.B #$11                           ;83824E|A911    |      ;
                       STA.W DMA7REG                        ;838250|8D7143  |834371;
                       LDA.B #$FF                           ;838253|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;838255|8D7243  |834372;
                       LDA.B #$96                           ;838258|A996    |      ;
                       STA.W DMA7ADDRM                      ;83825A|8D7343  |834373;
                       LDA.B #$7E                           ;83825D|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83825F|8D7443  |834374;
                       REP #$20                             ;838262|C220    |      ;
                       SEP #$20                             ;838264|E220    |      ;
                       LDA.W $021E                          ;838266|AD1E02  |83021E;
                       ORA.B #$C0                           ;838269|09C0    |      ;
                       STA.W $021E                          ;83826B|8D1E02  |83021E;
                       REP #$20                             ;83826E|C220    |      ;
                       RTS                                  ;838270|60      |      ;
 
  Menu_MoveBackground:
                       LDA.W $01CF                          ;838271|ADCF01  |8301CF;
                       STA.W BG2HOFS                        ;838274|8D0F21  |83210F;
                       LDA.W $01D0                          ;838277|ADD001  |8301D0;
                       STA.W BG2HOFS                        ;83827A|8D0F21  |83210F;
                       LDA.W $01D1                          ;83827D|ADD101  |8301D1;
                       STA.W BG2VOFS                        ;838280|8D1021  |832110;
                       LDA.W $01D2                          ;838283|ADD201  |8301D2;
                       STA.W BG2VOFS                        ;838286|8D1021  |832110;
                       LDA.W $01CB                          ;838289|ADCB01  |8301CB;
                       STA.W BG1HOFS                        ;83828C|8D0D21  |83210D;
                       LDA.W $01CC                          ;83828F|ADCC01  |8301CC;
                       STA.W BG1HOFS                        ;838292|8D0D21  |83210D;
                       LDA.W $01CD                          ;838295|ADCD01  |8301CD;
                       STA.W _BG1VOFS                       ;838298|8D0E21  |83210E;
                       LDA.W $01CE                          ;83829B|ADCE01  |8301CE;
                       STA.W _BG1VOFS                       ;83829E|8D0E21  |83210E;
                       LDA.W $01D3                          ;8382A1|ADD301  |8301D3;
                       STA.W BG3HOFS                        ;8382A4|8D1121  |832111;
                       LDA.W $01D4                          ;8382A7|ADD401  |8301D4;
                       STA.W BG3HOFS                        ;8382AA|8D1121  |832111;
                       LDA.W $01D5                          ;8382AD|ADD501  |8301D5;
                       STA.W BG3VOFS                        ;8382B0|8D1221  |832112;
                       LDA.W $01D6                          ;8382B3|ADD601  |8301D6;
                       STA.W BG3VOFS                        ;8382B6|8D1221  |832112;
                       RTS                                  ;8382B9|60      |      ;
 
       CODE_FL_8382BA:
                       JSR.W CODE_FN_8382C5                 ;8382BA|20C582  |8382C5;
                       JSL.L CODE_FL_8382E3                 ;8382BD|22E38283|8382E3;
                       JSR.W CODE_FN_8382F9                 ;8382C1|20F982  |8382F9;
                       RTL                                  ;8382C4|6B      |      ;
 
       CODE_FN_8382C5:
                       LDA.W $0348                          ;8382C5|AD4803  |870348;
                       STA.L $7E94D8                        ;8382C8|8FD8947E|7E94D8;
                       LDA.W Puzzle_LevelHi                 ;8382CC|AD4E03  |87034E;
                       STA.L $7E94DA                        ;8382CF|8FDA947E|7E94DA;
                       LDA.W Puzzle_LevelLo                 ;8382D3|AD4C03  |87034C;
                       STA.L $7E94DC                        ;8382D6|8FDC947E|7E94DC;
                       LDA.L $7E943C                        ;8382DA|AF3C947E|7E943C;
                       STA.L $7E94DE                        ;8382DE|8FDE947E|7E94DE;
                       RTS                                  ;8382E2|60      |      ;
 
       CODE_FL_8382E3:
                       LDA.W Timer_Hours                    ;8382E3|AD3203  |870332;
                       STA.L $7E94E0                        ;8382E6|8FE0947E|7E94E0;
                       LDA.W Timer_Minutes                  ;8382EA|AD3403  |870334;
                       STA.L $7E94E2                        ;8382ED|8FE2947E|7E94E2;
                       LDA.W Timer_Seconds                  ;8382F1|AD3603  |870336;
                       STA.L $7E94E4                        ;8382F4|8FE4947E|7E94E4;
                       RTL                                  ;8382F8|6B      |      ;
 
       CODE_FN_8382F9:
                       LDA.L $7E943E                        ;8382F9|AF3E947E|7E943E;
                       STA.L $7E950E                        ;8382FD|8F0E957E|7E950E;
                       LDA.L $7E9440                        ;838301|AF40947E|7E9440;
                       STA.L $7E9510                        ;838305|8F10957E|7E9510;
                       LDA.L $7E9442                        ;838309|AF42947E|7E9442;
                       STA.L $7E9512                        ;83830D|8F12957E|7E9512;
                       RTS                                  ;838311|60      |      ;
 
       CODE_FL_838312:
                       LDA.L $7E943E                        ;838312|AF3E947E|7E943E;
                       STA.L $7E951A                        ;838316|8F1A957E|7E951A;
                       LDA.L $7E9440                        ;83831A|AF40947E|7E9440;
                       STA.L $7E951C                        ;83831E|8F1C957E|7E951C;
                       LDA.L $7E9442                        ;838322|AF42947E|7E9442;
                       STA.L $7E951E                        ;838326|8F1E957E|7E951E;
                       RTL                                  ;83832A|6B      |      ;
 
       CODE_FN_83832B:
                       JSR.W CODE_FN_838335                 ;83832B|203583  |838335;
                       JSR.W CODE_FN_838353                 ;83832E|205383  |838353;
                       JSR.W CODE_FN_838369                 ;838331|206983  |838369;
                       RTS                                  ;838334|60      |      ;
 
       CODE_FN_838335:
                       LDA.L $7E94D8                        ;838335|AFD8947E|7E94D8;
                       STA.W $0348                          ;838339|8D4803  |830348;
                       LDA.L $7E94DA                        ;83833C|AFDA947E|7E94DA;
                       STA.W Puzzle_LevelHi                 ;838340|8D4E03  |83034E;
                       LDA.L $7E94DC                        ;838343|AFDC947E|7E94DC;
                       STA.W Puzzle_LevelLo                 ;838347|8D4C03  |83034C;
                       LDA.L $7E94DE                        ;83834A|AFDE947E|7E94DE;
                       STA.L $7E943C                        ;83834E|8F3C947E|7E943C;
                       RTS                                  ;838352|60      |      ;
 
       CODE_FN_838353:
                       LDA.L $7E94E0                        ;838353|AFE0947E|7E94E0;
                       STA.W Timer_Hours                    ;838357|8D3203  |830332;
                       LDA.L $7E94E2                        ;83835A|AFE2947E|7E94E2;
                       STA.W Timer_Minutes                  ;83835E|8D3403  |830334;
                       LDA.L $7E94E4                        ;838361|AFE4947E|7E94E4;
                       STA.W Timer_Seconds                  ;838365|8D3603  |830336;
                       RTS                                  ;838368|60      |      ;
 
       CODE_FN_838369:
                       LDA.L $7E950E                        ;838369|AF0E957E|7E950E;
                       STA.L $7E943E                        ;83836D|8F3E947E|7E943E;
                       LDA.L $7E9510                        ;838371|AF10957E|7E9510;
                       STA.L $7E9440                        ;838375|8F40947E|7E9440;
                       LDA.L $7E9512                        ;838379|AF12957E|7E9512;
                       STA.L $7E9442                        ;83837D|8F42947E|7E9442;
                       RTS                                  ;838381|60      |      ;
 
       CODE_FL_838382:
                       LDA.L $7E951A                        ;838382|AF1A957E|7E951A;
                       STA.L $7E943E                        ;838386|8F3E947E|7E943E;
                       LDA.L $7E951C                        ;83838A|AF1C957E|7E951C;
                       STA.L $7E9440                        ;83838E|8F40947E|7E9440;
                       LDA.L $7E951E                        ;838392|AF1E957E|7E951E;
                       STA.L $7E9442                        ;838396|8F42947E|7E9442;
                       RTL                                  ;83839A|6B      |      ;
 
       CODE_FL_83839B:
                       JSR.W CODE_FN_8383EE                 ;83839B|20EE83  |8383EE;
                       JSR.W CODE_FN_8383C2                 ;83839E|20C283  |8383C2;
                       JSL.L CODE_FL_838403                 ;8383A1|22038483|838403;
                       JSR.W CODE_FN_8383A9                 ;8383A5|20A983  |8383A9;
                       RTL                                  ;8383A8|6B      |      ;
 
       CODE_FN_8383A9:
                       LDA.L $7E943E                        ;8383A9|AF3E947E|7E943E;
                       STA.L $7E9502                        ;8383AD|8F02957E|7E9502;
                       LDA.L $7E9440                        ;8383B1|AF40947E|7E9440;
                       STA.L $7E9504                        ;8383B5|8F04957E|7E9504;
                       LDA.L $7E9442                        ;8383B9|AF42947E|7E9442;
                       STA.L $7E9506                        ;8383BD|8F06957E|7E9506;
                       RTS                                  ;8383C1|60      |      ;
 
       CODE_FN_8383C2:
                       LDA.W $0342                          ;8383C2|AD4203  |830342;
                       STA.L $7E94EC                        ;8383C5|8FEC947E|7E94EC;
                       LDA.W StageClear_LevelHi             ;8383C9|AD3E03  |83033E;
                       STA.L $7E94EE                        ;8383CC|8FEE947E|7E94EE;
                       LDA.W StageClear_LevelLo             ;8383D0|AD3C03  |83033C;
                       STA.L $7E94F0                        ;8383D3|8FF0947E|7E94F0;
                       LDA.L $7E943A                        ;8383D7|AF3A947E|7E943A;
                       STA.L $7E94F2                        ;8383DB|8FF2947E|7E94F2;
                       LDA.W $0346                          ;8383DF|AD4603  |830346;
                       STA.L $7E94F4                        ;8383E2|8FF4947E|7E94F4;
                       LDA.W $0340                          ;8383E6|AD4003  |830340;
                       STA.L $7E94F6                        ;8383E9|8FF6947E|7E94F6;
                       RTS                                  ;8383ED|60      |      ;
 
       CODE_FN_8383EE:
                       LDA.W Score                          ;8383EE|ADC202  |8302C2;
                       STA.L $7E94FE                        ;8383F1|8FFE947E|7E94FE;
                       STA.W $02C6                          ;8383F5|8DC602  |8302C6;
                       LDA.W Score_HiByte                   ;8383F8|ADC402  |8302C4;
                       STA.L $7E9500                        ;8383FB|8F00957E|7E9500;
                       STA.W $02C8                          ;8383FF|8DC802  |8302C8;
                       RTS                                  ;838402|60      |      ;
 
       CODE_FL_838403:
                       LDA.W Timer_Hours                    ;838403|AD3203  |830332;
                       STA.L $7E94F8                        ;838406|8FF8947E|7E94F8;
                       LDA.W Timer_Minutes                  ;83840A|AD3403  |830334;
                       STA.L $7E94FA                        ;83840D|8FFA947E|7E94FA;
                       LDA.W Timer_Seconds                  ;838411|AD3603  |830336;
                       STA.L $7E94FC                        ;838414|8FFC947E|7E94FC;
                       RTL                                  ;838418|6B      |      ;
 
       CODE_FN_838419:
                       JSR.W CODE_FN_83843F                 ;838419|203F84  |83843F;
                       JSR.W CODE_FN_83846B                 ;83841C|206B84  |83846B;
                       JSR.W CODE_FN_838481                 ;83841F|208184  |838481;
                       JSR.W CODE_FN_838426                 ;838422|202684  |838426;
                       RTS                                  ;838425|60      |      ;
 
       CODE_FN_838426:
                       LDA.L $7E9502                        ;838426|AF02957E|7E9502;
                       STA.L $7E943E                        ;83842A|8F3E947E|7E943E;
                       LDA.L $7E9504                        ;83842E|AF04957E|7E9504;
                       STA.L $7E9440                        ;838432|8F40947E|7E9440;
                       LDA.L $7E9506                        ;838436|AF06957E|7E9506;
                       STA.L $7E9442                        ;83843A|8F42947E|7E9442;
                       RTS                                  ;83843E|60      |      ;
 
       CODE_FN_83843F:
                       LDA.L $7E94EC                        ;83843F|AFEC947E|7E94EC;
                       STA.W $0342                          ;838443|8D4203  |830342;
                       LDA.L $7E94EE                        ;838446|AFEE947E|7E94EE;
                       STA.W StageClear_LevelHi             ;83844A|8D3E03  |83033E;
                       LDA.L $7E94F0                        ;83844D|AFF0947E|7E94F0;
                       STA.W StageClear_LevelLo             ;838451|8D3C03  |83033C;
                       LDA.L $7E94F2                        ;838454|AFF2947E|7E94F2;
                       STA.L $7E943A                        ;838458|8F3A947E|7E943A;
                       LDA.L $7E94F4                        ;83845C|AFF4947E|7E94F4;
                       STA.W $0346                          ;838460|8D4603  |830346;
                       LDA.L $7E94F6                        ;838463|AFF6947E|7E94F6;
                       STA.W $0340                          ;838467|8D4003  |830340;
                       RTS                                  ;83846A|60      |      ;
 
       CODE_FN_83846B:
                       LDA.L $7E94F8                        ;83846B|AFF8947E|7E94F8;
                       STA.W Timer_Hours                    ;83846F|8D3203  |830332;
                       LDA.L $7E94FA                        ;838472|AFFA947E|7E94FA;
                       STA.W Timer_Minutes                  ;838476|8D3403  |830334;
                       LDA.L $7E94FC                        ;838479|AFFC947E|7E94FC;
                       STA.W Timer_Seconds                  ;83847D|8D3603  |830336;
                       RTS                                  ;838480|60      |      ;
 
       CODE_FN_838481:
                       LDA.L $7E94FE                        ;838481|AFFE947E|7E94FE;
                       STA.W Score                          ;838485|8DC202  |8302C2;
                       LDA.L $7E9500                        ;838488|AF00957E|7E9500;
                       STA.W Score_HiByte                   ;83848C|8DC402  |8302C4;
                       RTS                                  ;83848F|60      |      ;
 
       CODE_FN_838490:
                       LDA.W #$0002                         ;838490|A90200  |      ;
                       STA.W $199C                          ;838493|8D9C19  |83199C;
                       LDA.W #$00D1                         ;838496|A9D100  |      ;
                       STA.W $1986                          ;838499|8D8619  |831986;
                       RTS                                  ;83849C|60      |      ;
 
       CODE_FN_83849D:
                       LDA.W #$00E1                         ;83849D|A9E100  |      ;
                       STA.W $1986                          ;8384A0|8D8619  |831986;
                       RTS                                  ;8384A3|60      |      ;
 
       CODE_FN_8384A4:
                       LDA.W #$00C0                         ;8384A4|A9C000  |      ;
                       STA.W $1986                          ;8384A7|8D8619  |831986;
                       RTS                                  ;8384AA|60      |      ;
 
       CODE_FN_8384AB:
                       LDA.W #$0001                         ;8384AB|A90100  |      ;
                       STA.W $1988                          ;8384AE|8D8819  |831988;
                       RTS                                  ;8384B1|60      |      ;
 
       CODE_FN_8384B2:
                       LDA.W #$0003                         ;8384B2|A90300  |      ;
                       STA.W $1988                          ;8384B5|8D8819  |831988;
                       RTS                                  ;8384B8|60      |      ;
 
       CODE_FN_8384B9:
                       LDA.W #$0002                         ;8384B9|A90200  |      ;
                       STA.W $1988                          ;8384BC|8D8819  |831988;
                       RTS                                  ;8384BF|60      |      ;
 
       CODE_FN_8384C0:
                       CPX.W #$0000                         ;8384C0|E00000  |      ;
                       BNE +                                ;8384C3|D004    |8384C9;
                       JSR.W CODE_FN_8384B2                 ;8384C5|20B284  |8384B2;
                       RTS                                  ;8384C8|60      |      ;
 
                     + JSR.W CODE_FN_8384B9                 ;8384C9|20B984  |8384B9;
                       RTS                                  ;8384CC|60      |      ;
 
       CODE_FN_8384CD:
                       LDA.W #$0005                         ;8384CD|A90500  |      ;
                       STA.W $1988                          ;8384D0|8D8819  |831988;
                       RTS                                  ;8384D3|60      |      ;
 
       CODE_FN_8384D4:
                       LDA.W #$0004                         ;8384D4|A90400  |      ;
                       STA.W $1988                          ;8384D7|8D8819  |831988;
                       RTS                                  ;8384DA|60      |      ;
 
       CODE_FN_8384DB:
                       LDA.W #$0000                         ;8384DB|A90000  |      ;
                       STA.L $7E9965                        ;8384DE|8F65997E|7E9965;
                       STA.L $7E9979                        ;8384E2|8F79997E|7E9979;
                       RTS                                  ;8384E6|60      |      ;
 
       CODE_FN_8384E7:
                       LDA.W #$0000                         ;8384E7|A90000  |      ;
                       STA.L $7E9967                        ;8384EA|8F67997E|7E9967;
                       STA.L $7E997B                        ;8384EE|8F7B997E|7E997B;
                       RTS                                  ;8384F2|60      |      ;
 
       CODE_FN_8384F3:
                       LDA.W #$0000                         ;8384F3|A90000  |      ;
                       STA.L $7E9969                        ;8384F6|8F69997E|7E9969;
                       STA.L $7E997D                        ;8384FA|8F7D997E|7E997D;
                       RTS                                  ;8384FE|60      |      ;
 
       CODE_FN_8384FF:
                       LDA.W #$0000                         ;8384FF|A90000  |      ;
                       STA.L $7E996B                        ;838502|8F6B997E|7E996B;
                       STA.L $7E997F                        ;838506|8F7F997E|7E997F;
                       RTS                                  ;83850A|60      |      ;
 
       CODE_FN_83850B:
                       LDA.W #$0000                         ;83850B|A90000  |      ;
                       STA.L $7E996D                        ;83850E|8F6D997E|7E996D;
                       STA.L $7E9981                        ;838512|8F81997E|7E9981;
                       RTS                                  ;838516|60      |      ;
 
       CODE_FN_838517:
                       LDA.W #$0000                         ;838517|A90000  |      ;
                       STA.L $7E996F                        ;83851A|8F6F997E|7E996F;
                       STA.L $7E9983                        ;83851E|8F83997E|7E9983;
                       RTS                                  ;838522|60      |      ;
 
       CODE_FN_838523:
                       LDA.W #$0000                         ;838523|A90000  |      ;
                       STA.L $7E9971                        ;838526|8F71997E|7E9971;
                       STA.L $7E9985                        ;83852A|8F85997E|7E9985;
                       RTS                                  ;83852E|60      |      ;
 
       CODE_FN_83852F:
                       LDA.W #$0000                         ;83852F|A90000  |      ;
                       STA.L $7E9973                        ;838532|8F73997E|7E9973;
                       STA.L $7E9987                        ;838536|8F87997E|7E9987;
                       RTS                                  ;83853A|60      |      ;
 
       CODE_FN_83853B:
                       LDA.W #$0000                         ;83853B|A90000  |      ;
                       STA.L $7E9969,X                      ;83853E|9F69997E|7E9969;
                       STA.L $7E997D,X                      ;838542|9F7D997E|7E997D;
                       RTS                                  ;838546|60      |      ;
 
       CODE_FN_838547:
                       LDA.W #$0000                         ;838547|A90000  |      ;
                       STA.L $7E9965,X                      ;83854A|9F65997E|7E9965;
                       STA.L $7E9979,X                      ;83854E|9F79997E|7E9979;
                       RTS                                  ;838552|60      |      ;
                       db $A2,$1E,$00,$A9,$00,$00,$9F,$65   ;838553|        |      ;
                       db $99,$7E,$CA,$CA,$10,$F8,$6B       ;83855B|        |00CA7E;
 
       CODE_FN_838562:
                       STA.W WRDIVL                         ;838562|8D0442  |834204;
                       SEP #$30                             ;838565|E230    |      ;
                       STX.W WRDIVB                         ;838567|8E0642  |834206;
                       NOP                                  ;83856A|EA      |      ;
                       NOP                                  ;83856B|EA      |      ;
                       NOP                                  ;83856C|EA      |      ;
                       NOP                                  ;83856D|EA      |      ;
                       NOP                                  ;83856E|EA      |      ;
                       NOP                                  ;83856F|EA      |      ;
                       NOP                                  ;838570|EA      |      ;
                       NOP                                  ;838571|EA      |      ;
                       REP #$30                             ;838572|C230    |      ;
                       LDA.W RDDIVL                         ;838574|AD1442  |834214;
                       STA.B $00                            ;838577|8500    |000000;
                       TAX                                  ;838579|AA      |      ;
                       LDA.W RDMPYL                         ;83857A|AD1642  |834216;
                       RTS                                  ;83857D|60      |      ;
                       db $8B,$F4,$00,$00,$AB,$AB,$C9,$00   ;83857E|        |      ;
                       db $00,$30,$1F,$E0,$00,$00,$30,$06   ;838586|        |      ;
                       db $20,$62,$85,$8A,$AB,$6B,$48,$8A   ;83858E|        |838562;
                       db $49,$FF,$FF,$1A,$AA,$68,$A5,$00   ;838596|        |      ;
                       db $20,$62,$85,$8A,$49,$FF,$FF,$1A   ;83859E|        |838562;
                       db $AB,$6B,$E0,$00,$00,$30,$0E,$49   ;8385A6|        |      ;
                       db $FF,$FF,$1A,$20,$62,$85,$8A,$49   ;8385AE|        |201AFF;
                       db $FF,$FF,$1A,$AB,$6B,$49,$FF,$FF   ;8385B6|        |AB1AFF;
                       db $1A,$48,$8A,$49,$FF,$FF,$1A,$AA   ;8385BE|        |      ;
                       db $68,$20,$62,$85,$8A,$AB,$6B       ;8385C6|        |      ;
 
       CODE_FN_8385CD:
                       SEP #$30                             ;8385CD|E230    |      ;
                       STA.W WRMPYA                         ;8385CF|8D0242  |834202;
                       STX.W WRMPYB                         ;8385D2|8E0342  |834203;
                       NOP                                  ;8385D5|EA      |      ;
                       NOP                                  ;8385D6|EA      |      ;
                       NOP                                  ;8385D7|EA      |      ;
                       REP #$30                             ;8385D8|C230    |      ;
                       LDA.W RDMPYL                         ;8385DA|AD1642  |834216;
                       RTS                                  ;8385DD|60      |      ;
                       db $E2,$30,$8D,$1B,$21,$EB,$8D,$1B   ;8385DE|        |      ;
                       db $21,$8E,$1C,$21,$C2,$30,$AD,$34   ;8385E6|        |00008E;
                       db $21,$60                           ;8385EE|        |000060;
 
       CODE_FN_8385F0:
                       PHX                                  ;8385F0|DA      |      ;
                       PHY                                  ;8385F1|5A      |      ;
                       LDA.L $7E9961                        ;8385F2|AF61997E|7E9961;
                       ASL A                                ;8385F6|0A      |      ;
                       TAX                                  ;8385F7|AA      |      ;
                       LDA.B ($00)                          ;8385F8|B200    |000000;
                       AND.W #$00FF                         ;8385FA|29FF00  |      ;
                       DEC A                                ;8385FD|3A      |      ;
                       CMP.L $7E9965,X                      ;8385FE|DF65997E|7E9965;
                       BPL +                                ;838602|100B    |83860F;
                       LDA.W #$0000                         ;838604|A90000  |      ;
                       STA.L $7E9965,X                      ;838607|9F65997E|7E9965;
                       STA.L $7E9979,X                      ;83860B|9F79997E|7E9979;
 
                     + LDA.L $7E9965,X                      ;83860F|BF65997E|7E9965;
                       INC A                                ;838613|1A      |      ;
                       TAY                                  ;838614|A8      |      ;
                       LDA.L $7E9979,X                      ;838615|BF79997E|7E9979;
                       INC A                                ;838619|1A      |      ;
                       STA.L $7E9979,X                      ;83861A|9F79997E|7E9979;
                       LDA.B ($00),Y                        ;83861E|B100    |000000;
                       AND.W #$00FF                         ;838620|29FF00  |      ;
                       DEC A                                ;838623|3A      |      ;
                       CMP.L $7E9979,X                      ;838624|DF79997E|7E9979;
                       BPL +                                ;838628|1023    |83864D;
                       LDA.W #$0000                         ;83862A|A90000  |      ;
                       STA.L $7E9979,X                      ;83862D|9F79997E|7E9979;
                       LDA.L $7E9965,X                      ;838631|BF65997E|7E9965;
                       INC A                                ;838635|1A      |      ;
                       STA.L $7E9965,X                      ;838636|9F65997E|7E9965;
                       LDA.B ($00)                          ;83863A|B200    |000000;
                       AND.W #$00FF                         ;83863C|29FF00  |      ;
                       DEC A                                ;83863F|3A      |      ;
                       CMP.L $7E9965,X                      ;838640|DF65997E|7E9965;
                       BPL +                                ;838644|1007    |83864D;
                       LDA.W #$0000                         ;838646|A90000  |      ;
                       STA.L $7E9965,X                      ;838649|9F65997E|7E9965;
 
                     + LDA.L $7E9965,X                      ;83864D|BF65997E|7E9965;
                       PLY                                  ;838651|7A      |      ;
                       PLX                                  ;838652|FA      |      ;
                       RTS                                  ;838653|60      |      ;
                       db $20,$F0,$85,$6B                   ;838654|        |8385F0;
                       INC.W $1A6E                          ;838658|EE6E1A  |831A6E;
                       RTS                                  ;83865B|60      |      ;
 
       CODE_FN_83865C:
                       LDA.W #$000A                         ;83865C|A90A00  |      ;
                       STA.B $AF                            ;83865F|85AF    |0000AF;
                       LDA.W #$0003                         ;838661|A90300  |      ;
                       STA.B $B1                            ;838664|85B1    |0000B1;
                       RTS                                  ;838666|60      |      ;
 
       CODE_FN_838667:
                       JSR.W CODE_FN_83865C                 ;838667|205C86  |83865C;
                       LDA.B $BB                            ;83866A|A5BB    |0000BB;
                       ORA.B $BD                            ;83866C|05BD    |0000BD;
                       STA.L $7E95D2                        ;83866E|8FD2957E|7E95D2;
                       LDA.B $B7                            ;838672|A5B7    |0000B7;
                       ORA.B $B9                            ;838674|05B9    |0000B9;
                       STA.L $7E95D4                        ;838676|8FD4957E|7E95D4;
                       LDA.B $B3                            ;83867A|A5B3    |0000B3;
                       ORA.B $B5                            ;83867C|05B5    |0000B5;
                       STA.L $7E95D6                        ;83867E|8FD6957E|7E95D6;
                       LDA.L $7E95EC                        ;838682|AFEC957E|7E95EC;
                       STA.L $7E95EE                        ;838686|8FEE957E|7E95EE;
                       RTS                                  ;83868A|60      |      ;
 
       CODE_FN_83868B:
                       SEP #$20                             ;83868B|E220    |      ;
                       LDA.B #$02                           ;83868D|A902    |      ;
                       STA.W CGSWSEL                        ;83868F|8D3021  |832130;
                       STA.W $01E6                          ;838692|8DE601  |8301E6;
                       LDA.B #$93                           ;838695|A993    |      ;
                       STA.W CGADSUB                        ;838697|8D3121  |832131;
                       STA.W $01E7                          ;83869A|8DE701  |8301E7;
                       LDA.B #$E0                           ;83869D|A9E0    |      ;
                       STA.W COLDATA                        ;83869F|8D3221  |832132;
                       STA.W $01EA                          ;8386A2|8DEA01  |8301EA;
                       REP #$20                             ;8386A5|C220    |      ;
                       RTS                                  ;8386A7|60      |      ;
 
       CODE_FN_8386A8:
                       SEP #$20                             ;8386A8|E220    |      ;
                       LDA.B #$02                           ;8386AA|A902    |      ;
                       STA.W CGSWSEL                        ;8386AC|8D3021  |832130;
                       STA.W $01E6                          ;8386AF|8DE601  |8301E6;
                       LDA.B #$82                           ;8386B2|A982    |      ;
                       STA.W CGADSUB                        ;8386B4|8D3121  |832131;
                       STA.W $01E7                          ;8386B7|8DE701  |8301E7;
                       LDA.B #$E0                           ;8386BA|A9E0    |      ;
                       STA.W COLDATA                        ;8386BC|8D3221  |832132;
                       STA.W $01EA                          ;8386BF|8DEA01  |8301EA;
                       REP #$20                             ;8386C2|C220    |      ;
                       RTS                                  ;8386C4|60      |      ;
 
       CODE_FN_8386C5:
                       SEP #$20                             ;8386C5|E220    |      ;
                       LDA.B #$69                           ;8386C7|A969    |      ;
                       STA.W $01BC                          ;8386C9|8DBC01  |8301BC;
                       LDA.B #$79                           ;8386CC|A979    |      ;
                       STA.W $01BE                          ;8386CE|8DBE01  |8301BE;
                       REP #$20                             ;8386D1|C220    |      ;
                       RTS                                  ;8386D3|60      |      ;
 
       CODE_FN_8386D4:
                       SEP #$20                             ;8386D4|E220    |      ;
                       LDA.B #$6A                           ;8386D6|A96A    |      ;
                       STA.W $01BC                          ;8386D8|8DBC01  |8301BC;
                       LDA.B #$7A                           ;8386DB|A97A    |      ;
                       STA.W $01BE                          ;8386DD|8DBE01  |8301BE;
                       REP #$20                             ;8386E0|C220    |      ;
                       RTS                                  ;8386E2|60      |      ;
 
       CODE_FN_8386E3:
                       SEP #$20                             ;8386E3|E220    |      ;
                       LDA.B #$00                           ;8386E5|A900    |      ;
                       STA.W _BG1VOFS                       ;8386E7|8D0E21  |83210E;
                       STA.W _BG1VOFS                       ;8386EA|8D0E21  |83210E;
                       STA.W BG3VOFS                        ;8386ED|8D1221  |832112;
                       STA.W BG3VOFS                        ;8386F0|8D1221  |832112;
                       REP #$20                             ;8386F3|C220    |      ;
                       RTS                                  ;8386F5|60      |      ;
 
       CODE_FN_8386F6:
                       LDA.W $0005,Y                        ;8386F6|B90500  |830005;
                       AND.W #$00FF                         ;8386F9|29FF00  |      ;
                       STA.B $00                            ;8386FC|8500    |000000;
                       LDA.W $0004,Y                        ;8386FE|B90400  |830004;
                       AND.W #$00FF                         ;838701|29FF00  |      ;
                       STA.B $02                            ;838704|8502    |000002;
                       LDA.W #$0040                         ;838706|A94000  |      ;
                       SEC                                  ;838709|38      |      ;
                       SBC.B $02                            ;83870A|E502    |000002;
                       SEC                                  ;83870C|38      |      ;
                       SBC.B $02                            ;83870D|E502    |000002;
                       STA.B $04                            ;83870F|8504    |000004;
                       LDX.W $0000,Y                        ;838711|BE0000  |830000;
                       LDA.W $0002,Y                        ;838714|B90200  |830002;
                       TAY                                  ;838717|A8      |      ;
 
       CODE_FN_838718:
                       PHB                                  ;838718|8B      |      ;
                       PEA.W $7E00                          ;838719|F4007E  |837E00;
                       PLB                                  ;83871C|AB      |      ;
                       PLB                                  ;83871D|AB      |      ;
                       LDA.B $00                            ;83871E|A500    |000000;
                       STA.B $06                            ;838720|8506    |000006;
 
                     - LDA.B $02                            ;838722|A502    |000002;
                       STA.B $08                            ;838724|8508    |000008;
 
                    -- LDA.L $7F0000,X                      ;838726|BF00007F|7F0000;
                       STA.W $0000,Y                        ;83872A|990000  |7E0000;
                       INX                                  ;83872D|E8      |      ;
                       INX                                  ;83872E|E8      |      ;
                       INY                                  ;83872F|C8      |      ;
                       INY                                  ;838730|C8      |      ;
                       DEC.B $08                            ;838731|C608    |000008;
                       BNE --                               ;838733|D0F1    |838726;
                       TXA                                  ;838735|8A      |      ;
                       CLC                                  ;838736|18      |      ;
                       ADC.B $04                            ;838737|6504    |000004;
                       TAX                                  ;838739|AA      |      ;
                       TYA                                  ;83873A|98      |      ;
                       CLC                                  ;83873B|18      |      ;
                       ADC.B $04                            ;83873C|6504    |000004;
                       TAY                                  ;83873E|A8      |      ;
                       DEC.B $06                            ;83873F|C606    |000006;
                       BNE -                                ;838741|D0DF    |838722;
                       PLB                                  ;838743|AB      |      ;
                       RTS                                  ;838744|60      |      ;
                       db $8B,$F4,$00,$7E,$AB,$AB,$A5,$00   ;838745|        |      ;
                       db $85,$04,$A5,$02,$85,$06,$A9,$00   ;83874D|        |000004;
                       db $00,$99,$00,$00,$E8,$E8,$C8,$C8   ;838755|        |      ;
                       db $C6,$06,$D0,$F5,$C6,$04,$D0,$EA   ;83875D|        |000006;
                       db $AB,$60                           ;838765|        |      ;
 
       CODE_FL_838767:
                       PHB                                  ;838767|8B      |      ;
                       PEA.W $7E00                          ;838768|F4007E  |837E00;
                       PLB                                  ;83876B|AB      |      ;
                       PLB                                  ;83876C|AB      |      ;
                       LDX.W #$95D2                         ;83876D|A2D295  |      ;
                       LDA.W #$0000                         ;838770|A90000  |      ;
 
                     - STA.W $0000,X                        ;838773|9D0000  |7E0000;
                       INX                                  ;838776|E8      |      ;
                       CPX.W #$A5D2                         ;838777|E0D2A5  |      ;
                       BNE -                                ;83877A|D0F7    |838773;
                       STZ.W $1A6E                          ;83877C|9C6E1A  |7E1A6E;
                       STZ.W $1A70                          ;83877F|9C701A  |7E1A70;
                       STZ.W $1A72                          ;838782|9C721A  |7E1A72;
                       PLB                                  ;838785|AB      |      ;
                       RTL                                  ;838786|6B      |      ;
 
       CODE_FN_838787:
                       PHP                                  ;838787|08      |      ;
                       LDA.L $7E96DF                        ;838788|AFDF967E|7E96DF;
                       CLC                                  ;83878C|18      |      ;
                       ADC.W #$0080                         ;83878D|698000  |      ;
                       STA.L $7E96DF                        ;838790|8FDF967E|7E96DF;
                       SEC                                  ;838794|38      |      ;
                       SBC.W #$0100                         ;838795|E90001  |      ;
                       BMI +                                ;838798|300D    |8387A7;
                       STA.L $7E96DF                        ;83879A|8FDF967E|7E96DF;
                       LDA.W #$FF00                         ;83879E|A900FF  |      ;
                       INC.W $01CF                          ;8387A1|EECF01  |8301CF;
                       TRB.W $01CF                          ;8387A4|1CCF01  |8301CF;
 
                     + LDA.L $7E96E1                        ;8387A7|AFE1967E|7E96E1;
                       CLC                                  ;8387AB|18      |      ;
                       ADC.W #$0080                         ;8387AC|698000  |      ;
                       STA.L $7E96E1                        ;8387AF|8FE1967E|7E96E1;
                       SEC                                  ;8387B3|38      |      ;
                       SBC.W #$0100                         ;8387B4|E90001  |      ;
                       BMI +                                ;8387B7|300D    |8387C6;
                       STA.L $7E96E1                        ;8387B9|8FE1967E|7E96E1;
                       LDA.W #$FF00                         ;8387BD|A900FF  |      ;
                       DEC.W $01D1                          ;8387C0|CED101  |8301D1;
                       TRB.W $01D1                          ;8387C3|1CD101  |8301D1;
 
                     + PLP                                  ;8387C6|28      |      ;
                       RTS                                  ;8387C7|60      |      ;
 
       CODE_FN_8387C8:
                       LDX.W #$0007                         ;8387C8|A20700  |      ;
                       LDA.W #$011F                         ;8387CB|A91F01  |      ;
                       STA.B $02                            ;8387CE|8502    |000002;
 
                     - PHX                                  ;8387D0|DA      |      ;
                       LDA.L Password_Input,X               ;8387D1|BF00967E|7E9600;
                       DEC A                                ;8387D5|3A      |      ;
                       AND.W #$00FF                         ;8387D6|29FF00  |      ;
                       CLC                                  ;8387D9|18      |      ;
                       ADC.B $02                            ;8387DA|6502    |000002;
                       STA.B $00                            ;8387DC|8500    |000000;
                       TAX                                  ;8387DE|AA      |      ;
                       SEP #$20                             ;8387DF|E220    |      ;
                       LDA.L DATA8_89D884,X                 ;8387E1|BF84D889|89D884;
                       PLX                                  ;8387E5|FA      |      ;
                       STA.L $7E95F4,X                      ;8387E6|9FF4957E|7E95F4;
                       REP #$20                             ;8387EA|C220    |      ;
                       LDA.B $02                            ;8387EC|A502    |000002;
                       SEC                                  ;8387EE|38      |      ;
                       SBC.W #$0029                         ;8387EF|E92900  |      ;
                       STA.B $02                            ;8387F2|8502    |000002;
                       DEX                                  ;8387F4|CA      |      ;
                       BPL -                                ;8387F5|10D9    |8387D0;
                       RTS                                  ;8387F7|60      |      ;
 
       CODE_FN_8387F8:
                       STA.B $00                            ;8387F8|8500    |000000;
                       PHA                                  ;8387FA|48      |      ;
                       LDA.W $0000,Y                        ;8387FB|B90000  |830000;
                       AND.W #$00FF                         ;8387FE|29FF00  |      ;
                       STA.B $02                            ;838801|8502    |000002;
                       LDA.W $0001,Y                        ;838803|B90100  |830001;
                       STA.B $04                            ;838806|8504    |000004;
                       LDA.L $7E95D2                        ;838808|AFD2957E|7E95D2;
                       BIT.W #$0800                         ;83880C|890008  |      ;
                       BEQ +                                ;83880F|F017    |838828;
                       LDA.B $00                            ;838811|A500    |000000;
                       BEQ ++                               ;838813|F006    |83881B;
                       DEC A                                ;838815|3A      |      ;
                       STA.B $00                            ;838816|8500    |000000;
                       JMP.W CODE_JP_83888F                 ;838818|4C8F88  |83888F;
 
                    ++ LDA.L $7E95EC                        ;83881B|AFEC957E|7E95EC;
                       BEQ ++                               ;83881F|F004    |838825;
                       LDA.B $02                            ;838821|A502    |000002;
                       STA.B $00                            ;838823|8500    |000000;
 
                    ++ JMP.W CODE_JP_83888F                 ;838825|4C8F88  |83888F;
 
                     + BIT.W #$2400                         ;838828|890024  |      ;
                       BEQ +                                ;83882B|F01A    |838847;
                       LDA.B $00                            ;83882D|A500    |000000;
                       CMP.B $02                            ;83882F|C502    |000002;
                       BEQ ++                               ;838831|F006    |838839;
                       INC A                                ;838833|1A      |      ;
                       STA.B $00                            ;838834|8500    |000000;
                       JMP.W CODE_JP_83888F                 ;838836|4C8F88  |83888F;
 
                    ++ LDA.L $7E95EC                        ;838839|AFEC957E|7E95EC;
                       BEQ ++                               ;83883D|F005    |838844;
                       LDA.W #$0000                         ;83883F|A90000  |      ;
                       STA.B $00                            ;838842|8500    |000000;
 
                    ++ JMP.W CODE_JP_83888F                 ;838844|4C8F88  |83888F;
 
                     + LDA.L $7E95D4                        ;838847|AFD4957E|7E95D4;
                       BIT.W #$1080                         ;83884B|898010  |      ;
                       BNE +                                ;83884E|D003    |838853;
                       JMP.W CODE_JP_838878                 ;838850|4C7888  |838878;
 
                     + LDA.W Game_State_State               ;838853|ADA202  |8302A2;
                       CMP.W #$0003                         ;838856|C90300  |      ;
                       BNE +                                ;838859|D013    |83886E;
                       LDA.B $00                            ;83885B|A500    |000000;
                       BNE +                                ;83885D|D00F    |83886E;
                       LDA.B $B7                            ;83885F|A5B7    |0000B7;
                       BIT.W #$1080                         ;838861|898010  |      ;
                       BNE +                                ;838864|D008    |83886E;
                       db $20,$D4,$84,$EE,$6E,$1A,$80,$0A   ;838866|        |8384D4;
 
                     + JSR.W CODE_FN_8384CD                 ;83886E|20CD84  |8384CD;
                       JSR.W CODE_FN_8384DB                 ;838871|20DB84  |8384DB;
                       LDA.B $00                            ;838874|A500    |000000;
                       BRA +                                ;838876|800E    |838886;
 
       CODE_JP_838878:
                       BIT.W #$8000                         ;838878|890080  |      ;
                       BEQ CODE_JP_83888F                   ;83887B|F012    |83888F;
                       JSR.W CODE_FN_8384D4                 ;83887D|20D484  |8384D4;
                       JSR.W CODE_FN_8384DB                 ;838880|20DB84  |8384DB;
                       LDA.B $02                            ;838883|A502    |000002;
                       INC A                                ;838885|1A      |      ;
 
                     + TAY                                  ;838886|A8      |      ;
                       LDA.B ($04),Y                        ;838887|B104    |000004;
                       AND.W #$00FF                         ;838889|29FF00  |      ;
                       STA.W Game_State_State               ;83888C|8DA202  |8302A2;
 
       CODE_JP_83888F:
                       PLA                                  ;83888F|68      |      ;
                       CMP.B $00                            ;838890|C500    |000000;
                       BEQ +                                ;838892|F012    |8388A6;
                       JSR.W CODE_FN_8384DB                 ;838894|20DB84  |8384DB;
                       JSR.W CODE_FN_8384AB                 ;838897|20AB84  |8384AB;
                       LDA.W #$0000                         ;83889A|A90000  |      ;
                       STA.L $7E99D1                        ;83889D|8FD1997E|7E99D1;
                       LDA.W #$0001                         ;8388A1|A90100  |      ;
                       BRA ++                               ;8388A4|8003    |8388A9;
 
                     + LDA.W #$0000                         ;8388A6|A90000  |      ;
 
                    ++ STA.L $7E96FD                        ;8388A9|8FFD967E|7E96FD;
                       RTS                                  ;8388AD|60      |      ;
 
       CODE_FN_8388AE:
                       LDA.W $0000,Y                        ;8388AE|B90000  |830000;
                       STA.L $7E9993                        ;8388B1|8F93997E|7E9993;
                       STA.L $7E9997                        ;8388B5|8F97997E|7E9997;
                       LDA.W $0002,Y                        ;8388B9|B90200  |830002;
                       STA.L $7E999B                        ;8388BC|8F9B997E|7E999B;
                       LDA.W $0004,Y                        ;8388C0|B90400  |830004;
                       STA.L $7E9995                        ;8388C3|8F95997E|7E9995;
                       STA.L $7E9999                        ;8388C7|8F99997E|7E9999;
                       LDA.W $0002,Y                        ;8388CB|B90200  |830002;
                       SEC                                  ;8388CE|38      |      ;
                       SBC.W $0000,Y                        ;8388CF|F90000  |830000;
                       SEC                                  ;8388D2|38      |      ;
                       SBC.W #$0004                         ;8388D3|E90400  |      ;
                       STA.L $7E99B7                        ;8388D6|8FB7997E|7E99B7;
                       LDA.W $0004,Y                        ;8388DA|B90400  |830004;
                       SEC                                  ;8388DD|38      |      ;
                       SBC.W $0002,Y                        ;8388DE|F90200  |830002;
                       SEC                                  ;8388E1|38      |      ;
                       SBC.W #$000C                         ;8388E2|E90C00  |      ;
                       STA.L $7E99BB                        ;8388E5|8FBB997E|7E99BB;
                       LDA.W $0006,Y                        ;8388E9|B90600  |830006;
                       STA.L $7E99B1                        ;8388EC|8FB1997E|7E99B1;
                       LDA.W $0008,Y                        ;8388F0|B90800  |830008;
                       STA.L $7E99B3                        ;8388F3|8FB3997E|7E99B3;
                       LDA.W #$0001                         ;8388F7|A90100  |      ;
                       STA.L $7E998D                        ;8388FA|8F8D997E|7E998D;
                       RTS                                  ;8388FE|60      |      ;
 
       CODE_FN_8388FF:
                       PHB                                  ;8388FF|8B      |      ;
                       PEA.W $7E00                          ;838900|F4007E  |837E00;
                       PLB                                  ;838903|AB      |      ;
                       PLB                                  ;838904|AB      |      ;
                       LDA.W $998D                          ;838905|AD8D99  |7E998D;
                       BEQ +                                ;838908|F019    |838923;
                       LDA.W $99B7                          ;83890A|ADB799  |7E99B7;
                       BPL ++                               ;83890D|1016    |838925;
                       LDA.W $99BB                          ;83890F|ADBB99  |7E99BB;
                       BPL ++                               ;838912|1011    |838925;
                       STZ.W $998D                          ;838914|9C8D99  |7E998D;
                       SEP #$20                             ;838917|E220    |      ;
                       LDA.W $021E                          ;838919|AD1E02  |7E021E;
                       AND.B #$3F                           ;83891C|293F    |      ;
                       STA.W $021E                          ;83891E|8D1E02  |7E021E;
                       REP #$20                             ;838921|C220    |      ;
 
                     + PLB                                  ;838923|AB      |      ;
                       RTS                                  ;838924|60      |      ;
 
                    ++ JSR.W CODE_FN_8389BE                 ;838925|20BE89  |8389BE;
                       LDA.W $99B7                          ;838928|ADB799  |7E99B7;
                       BMI +                                ;83892B|3018    |838945;
                       SEC                                  ;83892D|38      |      ;
                       SBC.L $7E99B1                        ;83892E|EFB1997E|7E99B1;
                       STA.W $99B7                          ;838932|8DB799  |7E99B7;
                       LDA.W $9997                          ;838935|AD9799  |7E9997;
                       CLC                                  ;838938|18      |      ;
                       ADC.L $7E99B1                        ;838939|6FB1997E|7E99B1;
                       STA.W $9997                          ;83893D|8D9799  |7E9997;
                       LDA.W $99B7                          ;838940|ADB799  |7E99B7;
                       BPL ++                               ;838943|100A    |83894F;
 
                     + LDA.W $999B                          ;838945|AD9B99  |7E999B;
                       SEC                                  ;838948|38      |      ;
                       SBC.W #$0003                         ;838949|E90300  |      ;
                       STA.W $9997                          ;83894C|8D9799  |7E9997;
 
                    ++ LDA.W $99BB                          ;83894F|ADBB99  |7E99BB;
                       BMI +                                ;838952|3018    |83896C;
                       SEC                                  ;838954|38      |      ;
                       SBC.L $7E99B3                        ;838955|EFB3997E|7E99B3;
                       STA.W $99BB                          ;838959|8DBB99  |7E99BB;
                       LDA.W $9999                          ;83895C|AD9999  |7E9999;
                       SEC                                  ;83895F|38      |      ;
                       SBC.L $7E99B3                        ;838960|EFB3997E|7E99B3;
                       STA.W $9999                          ;838964|8D9999  |7E9999;
                       LDA.W $99BB                          ;838967|ADBB99  |7E99BB;
                       BPL ++                               ;83896A|100A    |838976;
 
                     + LDA.W $999B                          ;83896C|AD9B99  |7E999B;
                       CLC                                  ;83896F|18      |      ;
                       ADC.W #$000B                         ;838970|690B00  |      ;
                       STA.W $9999                          ;838973|8D9999  |7E9999;
 
                    ++ PLB                                  ;838976|AB      |      ;
                       SEP #$20                             ;838977|E220    |      ;
                       LDA.B #$02                           ;838979|A902    |      ;
                       STA.W DMA6PARAM                      ;83897B|8D6043  |834360;
                       LDA.B #$0E                           ;83897E|A90E    |      ;
                       STA.W DMA6REG                        ;838980|8D6143  |834361;
                       LDA.B #$FF                           ;838983|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;838985|8D6243  |834362;
                       LDA.B #$96                           ;838988|A996    |      ;
                       STA.W DMA6ADDRM                      ;83898A|8D6343  |834363;
                       LDA.B #$7E                           ;83898D|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83898F|8D6443  |834364;
                       REP #$20                             ;838992|C220    |      ;
                       SEP #$20                             ;838994|E220    |      ;
                       LDA.B #$02                           ;838996|A902    |      ;
                       STA.W DMA7PARAM                      ;838998|8D7043  |834370;
                       LDA.B #$12                           ;83899B|A912    |      ;
                       STA.W DMA7REG                        ;83899D|8D7143  |834371;
                       LDA.B #$1F                           ;8389A0|A91F    |      ;
                       STA.W DMA7ADDRL                      ;8389A2|8D7243  |834372;
                       LDA.B #$97                           ;8389A5|A997    |      ;
                       STA.W DMA7ADDRM                      ;8389A7|8D7343  |834373;
                       LDA.B #$7E                           ;8389AA|A97E    |      ;
                       STA.W DMA7ADDRH                      ;8389AC|8D7443  |834374;
                       REP #$20                             ;8389AF|C220    |      ;
                       SEP #$20                             ;8389B1|E220    |      ;
                       LDA.W $021E                          ;8389B3|AD1E02  |83021E;
                       ORA.B #$C0                           ;8389B6|09C0    |      ;
                       STA.W $021E                          ;8389B8|8D1E02  |83021E;
                       REP #$20                             ;8389BB|C220    |      ;
                       RTS                                  ;8389BD|60      |      ;
 
       CODE_FN_8389BE:
                       SEP #$20                             ;8389BE|E220    |      ;
                       LDA.W $9993                          ;8389C0|AD9399  |7E9993;
                       SEC                                  ;8389C3|38      |      ;
                       SBC.B #$06                           ;8389C4|E906    |      ;
                       STA.W $982F                          ;8389C6|8D2F98  |7E982F;
                       CLC                                  ;8389C9|18      |      ;
                       ADC.B #$03                           ;8389CA|6903    |      ;
                       STA.W $984F                          ;8389CC|8D4F98  |7E984F;
                       LDA.W $9997                          ;8389CF|AD9799  |7E9997;
                       SEC                                  ;8389D2|38      |      ;
                       SBC.L $7E9993                        ;8389D3|EF93997E|7E9993;
                       BPL +                                ;8389D7|1003    |8389DC;
                       db $4C,$58,$8A                       ;8389D9|        |838A58;
 
                     + BNE +                                ;8389DC|D01C    |8389FA;
                       LDA.L $7E982F                        ;8389DE|AF2F987E|7E982F;
                       DEC A                                ;8389E2|3A      |      ;
                       STA.L $7E982F                        ;8389E3|8F2F987E|7E982F;
                       LDA.L $7E984F                        ;8389E7|AF4F987E|7E984F;
                       DEC A                                ;8389EB|3A      |      ;
                       STA.L $7E984F                        ;8389EC|8F4F987E|7E984F;
                       LDA.B #$01                           ;8389F0|A901    |      ;
                       STA.W $9832                          ;8389F2|8D3298  |7E9832;
                       STA.W $9852                          ;8389F5|8D5298  |7E9852;
                       BRA ++                               ;8389F8|800E    |838A08;
 
                     + STA.W $9832                          ;8389FA|8D3298  |7E9832;
                       STA.W $9852                          ;8389FD|8D5298  |7E9852;
                       LDA.B #$FF                           ;838A00|A9FF    |      ;
                       STA.W $9833                          ;838A02|8D3398  |7E9833;
                       STA.W $9853                          ;838A05|8D5398  |7E9853;
 
                    ++ LDA.B #$05                           ;838A08|A905    |      ;
                       STA.W $9835                          ;838A0A|8D3598  |7E9835;
                       STA.W $9855                          ;838A0D|8D5598  |7E9855;
                       REP #$20                             ;838A10|C220    |      ;
                       LDA.W $9993                          ;838A12|AD9399  |7E9993;
                       SEC                                  ;838A15|38      |      ;
                       SBC.L $7E9997                        ;838A16|EF97997E|7E9997;
                       STA.W $9836                          ;838A1A|8D3698  |7E9836;
                       STA.W $9856                          ;838A1D|8D5698  |7E9856;
                       SEP #$20                             ;838A20|E220    |      ;
                       LDA.W $9999                          ;838A22|AD9999  |7E9999;
                       SEC                                  ;838A25|38      |      ;
                       SBC.L $7E9997                        ;838A26|EF97997E|7E9997;
                       STA.W $9838                          ;838A2A|8D3898  |7E9838;
                       SEC                                  ;838A2D|38      |      ;
                       SBC.B #$03                           ;838A2E|E903    |      ;
                       STA.W $9858                          ;838A30|8D5898  |7E9858;
                       LDA.W $9995                          ;838A33|AD9599  |7E9995;
                       SEC                                  ;838A36|38      |      ;
                       SBC.L $7E9999                        ;838A37|EF99997E|7E9999;
                       CLC                                  ;838A3B|18      |      ;
                       ADC.B #$08                           ;838A3C|6908    |      ;
                       STA.W $983B                          ;838A3E|8D3B98  |7E983B;
                       STA.W $985B                          ;838A41|8D5B98  |7E985B;
                       SEC                                  ;838A44|38      |      ;
                       SBC.B #$08                           ;838A45|E908    |      ;
                       STA.W $983C                          ;838A47|8D3C98  |7E983C;
                       STA.W $985C                          ;838A4A|8D5C98  |7E985C;
                       LDA.B #$01                           ;838A4D|A901    |      ;
                       STA.W $983E                          ;838A4F|8D3E98  |7E983E;
                       STA.W $985E                          ;838A52|8D5E98  |7E985E;
                       REP #$20                             ;838A55|C220    |      ;
                       RTS                                  ;838A57|60      |      ;
                       db $AD,$99,$99,$38,$E9,$20,$8D,$2F   ;838A58|        |009999;
                       db $98,$8D,$4F,$98,$A9,$1F,$8D,$32   ;838A60|        |      ;
                       db $98,$8D,$52,$98,$AD,$95,$99,$38   ;838A68|        |      ;
                       db $EF,$99,$99,$7E,$18,$69,$08,$8D   ;838A70|        |7E9999;
                       db $35,$98,$8D,$55,$98,$38,$E9,$08   ;838A78|        |000098;
                       db $8D,$36,$98,$8D,$56,$98,$C2,$20   ;838A80|        |009836;
                       db $AB,$60                           ;838A88|        |      ;
 
       CODE_FN_838A8A:
                       LDA.W $0001,Y                        ;838A8A|B90100  |830001;
                       AND.W #$00FF                         ;838A8D|29FF00  |      ;
                       STA.L $7E9995                        ;838A90|8F95997E|7E9995;
                       LDA.W $0000,Y                        ;838A94|B90000  |830000;
                       AND.W #$00FF                         ;838A97|29FF00  |      ;
                       STA.L $7E9997                        ;838A9A|8F97997E|7E9997;
                       LDA.L $7E9995                        ;838A9E|AF95997E|7E9995;
                       SEC                                  ;838AA2|38      |      ;
                       SBC.L $7E9997                        ;838AA3|EF97997E|7E9997;
                       STA.L $7E99B7                        ;838AA7|8FB7997E|7E99B7;
                       LDA.W $0002,Y                        ;838AAB|B90200  |830002;
                       AND.W #$00FF                         ;838AAE|29FF00  |      ;
                       STA.L $7E99B1                        ;838AB1|8FB1997E|7E99B1;
                       LDA.W #$0001                         ;838AB5|A90100  |      ;
                       STA.L $7E998D                        ;838AB8|8F8D997E|7E998D;
                       RTS                                  ;838ABC|60      |      ;
 
 
       CODE_FN_838ABD:
                       PHP                                  ;838ABD|08      |      ;
                       PHB                                  ;838ABE|8B      |      ;
                       REP #$30                             ;838ABF|C230    |      ;
                       PEA.W $7E00                          ;838AC1|F4007E  |837E00;
                       PLB                                  ;838AC4|AB      |      ;
                       PLB                                  ;838AC5|AB      |      ;
                       LDA.W $998D                          ;838AC6|AD8D99  |7E998D;
                       BEQ +                                ;838AC9|F019    |838AE4;
                       LDA.W $99B1                          ;838ACB|ADB199  |7E99B1;
                       STA.B $00                            ;838ACE|8500    |000000;
                       LDA.W $99B7                          ;838AD0|ADB799  |7E99B7;
                       BPL ++                               ;838AD3|1012    |838AE7;
                       STZ.W $998D                          ;838AD5|9C8D99  |7E998D;
                       SEP #$20                             ;838AD8|E220    |      ;
                       LDA.W $021E                          ;838ADA|AD1E02  |7E021E;
                       AND.B #$3F                           ;838ADD|293F    |      ;
                       STA.W $021E                          ;838ADF|8D1E02  |7E021E;
                       REP #$20                             ;838AE2|C220    |      ;
 
                     + PLB                                  ;838AE4|AB      |      ;
                       PLP                                  ;838AE5|28      |      ;
                       RTS                                  ;838AE6|60      |      ;
 
                    ++ JSR.W CODE_FN_838B45                 ;838AE7|20458B  |838B45;
                       LDA.W $9997                          ;838AEA|AD9799  |7E9997;
                       CLC                                  ;838AED|18      |      ;
                       ADC.B $00                            ;838AEE|6500    |000000;
                       STA.W $9997                          ;838AF0|8D9799  |7E9997;
                       LDA.W $99B7                          ;838AF3|ADB799  |7E99B7;
                       SEC                                  ;838AF6|38      |      ;
                       SBC.B $00                            ;838AF7|E500    |000000;
                       STA.W $99B7                          ;838AF9|8DB799  |7E99B7;
                       PLB                                  ;838AFC|AB      |      ;
                       PLP                                  ;838AFD|28      |      ;
                       SEP #$20                             ;838AFE|E220    |      ;
                       LDA.B #$02                           ;838B00|A902    |      ;
                       STA.W DMA6PARAM                      ;838B02|8D6043  |834360;
                       LDA.B #$0E                           ;838B05|A90E    |      ;
                       STA.W DMA6REG                        ;838B07|8D6143  |834361;
                       LDA.B #$FF                           ;838B0A|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;838B0C|8D6243  |834362;
                       LDA.B #$96                           ;838B0F|A996    |      ;
                       STA.W DMA6ADDRM                      ;838B11|8D6343  |834363;
                       LDA.B #$7E                           ;838B14|A97E    |      ;
                       STA.W DMA6ADDRH                      ;838B16|8D6443  |834364;
                       REP #$20                             ;838B19|C220    |      ;
                       SEP #$20                             ;838B1B|E220    |      ;
                       LDA.B #$02                           ;838B1D|A902    |      ;
                       STA.W DMA7PARAM                      ;838B1F|8D7043  |834370;
                       LDA.B #$12                           ;838B22|A912    |      ;
                       STA.W DMA7REG                        ;838B24|8D7143  |834371;
                       LDA.B #$FF                           ;838B27|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;838B29|8D7243  |834372;
                       LDA.B #$96                           ;838B2C|A996    |      ;
                       STA.W DMA7ADDRM                      ;838B2E|8D7343  |834373;
                       LDA.B #$7E                           ;838B31|A97E    |      ;
                       STA.W DMA7ADDRH                      ;838B33|8D7443  |834374;
                       REP #$20                             ;838B36|C220    |      ;
                       SEP #$20                             ;838B38|E220    |      ;
                       LDA.W $021E                          ;838B3A|AD1E02  |83021E;
                       ORA.B #$C0                           ;838B3D|09C0    |      ;
                       STA.W $021E                          ;838B3F|8D1E02  |83021E;
                       REP #$20                             ;838B42|C220    |      ;
                       RTS                                  ;838B44|60      |      ;
 
       CODE_FN_838B45:
                       SEP #$20                             ;838B45|E220    |      ;
                       LDA.W $9997                          ;838B47|AD9799  |7E9997;
                       DEC A                                ;838B4A|3A      |      ;
                       CMP.B #$80                           ;838B4B|C980    |      ;
                       BCC +                                ;838B4D|9010    |838B5F;
                       LDA.B #$7F                           ;838B4F|A97F    |      ;
                       STA.W $982F                          ;838B51|8D2F98  |7E982F;
                       LDA.W $9997                          ;838B54|AD9799  |7E9997;
                       SEC                                  ;838B57|38      |      ;
                       SBC.B #$80                           ;838B58|E980    |      ;
                       STA.W $9832                          ;838B5A|8D3298  |7E9832;
                       BRA ++                               ;838B5D|8009    |838B68;
 
                     + DEC A                                ;838B5F|3A      |      ;
                       STA.W $982F                          ;838B60|8D2F98  |7E982F;
                       LDA.B #$01                           ;838B63|A901    |      ;
                       STA.W $9832                          ;838B65|8D3298  |7E9832;
 
                    ++ LDA.W $9995                          ;838B68|AD9599  |7E9995;
                       CMP.B #$D7                           ;838B6B|C9D7    |      ;
                       BPL +                                ;838B6D|1031    |838BA0;
                       SEC                                  ;838B6F|38      |      ;
                       SBC.L $7E9997                        ;838B70|EF97997E|7E9997;
                       CMP.B #$77                           ;838B74|C977    |      ;
                       BCC ++                               ;838B76|9018    |838B90;
                       db $8D,$36,$98,$8D,$39,$98,$18,$69   ;838B78|        |009836;
                       db $8A,$8D,$35,$98,$A9,$7F,$8D,$38   ;838B80|        |      ;
                       db $98,$A9,$01,$8D,$3B,$98,$80,$27   ;838B88|        |      ;
 
                    ++ STA.W $9836                          ;838B90|8D3698  |7E9836;
                       CLC                                  ;838B93|18      |      ;
                       ADC.B #$09                           ;838B94|6909    |      ;
                       STA.W $9835                          ;838B96|8D3598  |7E9835;
                       LDA.B #$01                           ;838B99|A901    |      ;
                       STA.W $9838                          ;838B9B|8D3898  |7E9838;
                       BRA ++                               ;838B9E|8017    |838BB7;
 
                     + SEC                                  ;838BA0|38      |      ;
                       SBC.L $7E9997                        ;838BA1|EF97997E|7E9997;
                       STA.W $9836                          ;838BA5|8D3698  |7E9836;
                       LDA.B #$E0                           ;838BA8|A9E0    |      ;
                       SEC                                  ;838BAA|38      |      ;
                       SBC.L $7E9997                        ;838BAB|EF97997E|7E9997;
                       STA.W $9835                          ;838BAF|8D3598  |7E9835;
                       LDA.B #$01                           ;838BB2|A901    |      ;
                       STA.W $9838                          ;838BB4|8D3898  |7E9838;
 
                    ++ REP #$20                             ;838BB7|C220    |      ;
                       RTS                                  ;838BB9|60      |      ;
 
       CODE_FN_838BBA:
                       LDA.W $0000,Y                        ;838BBA|B90000  |830000;
                       AND.W #$00FF                         ;838BBD|29FF00  |      ;
                       STA.L $7E9993                        ;838BC0|8F93997E|7E9993;
                       LDA.W $0001,Y                        ;838BC4|B90100  |830001;
                       AND.W #$00FF                         ;838BC7|29FF00  |      ;
                       STA.L $7E9995                        ;838BCA|8F95997E|7E9995;
                       STA.L $7E9997                        ;838BCE|8F97997E|7E9997;
                       LDA.L $7E9995                        ;838BD2|AF95997E|7E9995;
                       SEC                                  ;838BD6|38      |      ;
                       SBC.L $7E9993                        ;838BD7|EF93997E|7E9993;
                       STA.L $7E99B7                        ;838BDB|8FB7997E|7E99B7;
                       LDA.W $0002,Y                        ;838BDF|B90200  |830002;
                       AND.W #$00FF                         ;838BE2|29FF00  |      ;
                       STA.L $7E99B1                        ;838BE5|8FB1997E|7E99B1;
                       LDA.W #$0001                         ;838BE9|A90100  |      ;
                       STA.L $7E998D                        ;838BEC|8F8D997E|7E998D;
                       RTS                                  ;838BF0|60      |      ;
 
       CODE_FN_838BF1:
                       PHP                                  ;838BF1|08      |      ;
                       PHB                                  ;838BF2|8B      |      ;
                       REP #$30                             ;838BF3|C230    |      ;
                       PEA.W $7E00                          ;838BF5|F4007E  |837E00;
                       PLB                                  ;838BF8|AB      |      ;
                       PLB                                  ;838BF9|AB      |      ;
                       LDA.W $998D                          ;838BFA|AD8D99  |7E998D;
                       BEQ +                                ;838BFD|F019    |838C18;
                       LDA.W $99B1                          ;838BFF|ADB199  |7E99B1;
                       STA.B $00                            ;838C02|8500    |000000;
                       LDA.W $99B7                          ;838C04|ADB799  |7E99B7;
                       BPL ++                               ;838C07|1012    |838C1B;
                       STZ.W $998D                          ;838C09|9C8D99  |7E998D;
                       SEP #$20                             ;838C0C|E220    |      ;
                       LDA.W $021E                          ;838C0E|AD1E02  |7E021E;
                       AND.B #$3F                           ;838C11|293F    |      ;
                       STA.W $021E                          ;838C13|8D1E02  |7E021E;
                       REP #$20                             ;838C16|C220    |      ;
 
                     + PLB                                  ;838C18|AB      |      ;
                       PLP                                  ;838C19|28      |      ;
                       RTS                                  ;838C1A|60      |      ;
 
                    ++ JSR.W CODE_FN_838B45                 ;838C1B|20458B  |838B45;
                       LDA.W $9997                          ;838C1E|AD9799  |7E9997;
                       SEC                                  ;838C21|38      |      ;
                       SBC.L $7E99B1                        ;838C22|EFB1997E|7E99B1;
                       STA.W $9997                          ;838C26|8D9799  |7E9997;
                       LDA.W $99B7                          ;838C29|ADB799  |7E99B7;
                       SEC                                  ;838C2C|38      |      ;
                       SBC.L $7E99B1                        ;838C2D|EFB1997E|7E99B1;
                       STA.W $99B7                          ;838C31|8DB799  |7E99B7;
                       PLB                                  ;838C34|AB      |      ;
                       PLP                                  ;838C35|28      |      ;
                       SEP #$20                             ;838C36|E220    |      ;
                       LDA.B #$02                           ;838C38|A902    |      ;
                       STA.W DMA6PARAM                      ;838C3A|8D6043  |834360;
                       LDA.B #$0E                           ;838C3D|A90E    |      ;
                       STA.W DMA6REG                        ;838C3F|8D6143  |834361;
                       LDA.B #$FF                           ;838C42|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;838C44|8D6243  |834362;
                       LDA.B #$96                           ;838C47|A996    |      ;
                       STA.W DMA6ADDRM                      ;838C49|8D6343  |834363;
                       LDA.B #$7E                           ;838C4C|A97E    |      ;
                       STA.W DMA6ADDRH                      ;838C4E|8D6443  |834364;
                       REP #$20                             ;838C51|C220    |      ;
                       SEP #$20                             ;838C53|E220    |      ;
                       LDA.B #$02                           ;838C55|A902    |      ;
                       STA.W DMA7PARAM                      ;838C57|8D7043  |834370;
                       LDA.B #$12                           ;838C5A|A912    |      ;
                       STA.W DMA7REG                        ;838C5C|8D7143  |834371;
                       LDA.B #$FF                           ;838C5F|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;838C61|8D7243  |834372;
                       LDA.B #$96                           ;838C64|A996    |      ;
                       STA.W DMA7ADDRM                      ;838C66|8D7343  |834373;
                       LDA.B #$7E                           ;838C69|A97E    |      ;
                       STA.W DMA7ADDRH                      ;838C6B|8D7443  |834374;
                       REP #$20                             ;838C6E|C220    |      ;
                       SEP #$20                             ;838C70|E220    |      ;
                       LDA.W $021E                          ;838C72|AD1E02  |83021E;
                       ORA.B #$C0                           ;838C75|09C0    |      ;
                       STA.W $021E                          ;838C77|8D1E02  |83021E;
                       REP #$20                             ;838C7A|C220    |      ;
                       RTS                                  ;838C7C|60      |      ;
 
       CODE_FN_838C7D:
                       LDA.W $0000,Y                        ;838C7D|B90000  |830000;
                       AND.W #$00FF                         ;838C80|29FF00  |      ;
                       STA.L $7E9993                        ;838C83|8F93997E|7E9993;
                       LDA.W $0001,Y                        ;838C87|B90100  |830001;
                       AND.W #$00FF                         ;838C8A|29FF00  |      ;
                       STA.L $7E9995                        ;838C8D|8F95997E|7E9995;
                       STA.L $7E9997                        ;838C91|8F97997E|7E9997;
                       LDA.L $7E9995                        ;838C95|AF95997E|7E9995;
                       SEC                                  ;838C99|38      |      ;
                       SBC.L $7E9993                        ;838C9A|EF93997E|7E9993;
                       DEC A                                ;838C9E|3A      |      ;
                       STA.L $7E99B7                        ;838C9F|8FB7997E|7E99B7;
                       LDA.W $0002,Y                        ;838CA3|B90200  |830002;
                       AND.W #$00FF                         ;838CA6|29FF00  |      ;
                       STA.L $7E99B1                        ;838CA9|8FB1997E|7E99B1;
                       LDA.W #$0001                         ;838CAD|A90100  |      ;
                       STA.L $7E998D                        ;838CB0|8F8D997E|7E998D;
                       RTS                                  ;838CB4|60      |      ;
 
       CODE_FN_838CB5:
                       PHB                                  ;838CB5|8B      |      ;
                       PEA.W $7E00                          ;838CB6|F4007E  |837E00;
                       PLB                                  ;838CB9|AB      |      ;
                       PLB                                  ;838CBA|AB      |      ;
                       LDA.W $998D                          ;838CBB|AD8D99  |7E998D;
                       BEQ +                                ;838CBE|F017    |838CD7;
                       LDA.W $99B7                          ;838CC0|ADB799  |7E99B7;
                       BPL ++                               ;838CC3|1014    |838CD9;
                       LDA.W #$0000                         ;838CC5|A90000  |      ;
                       STA.W $998D                          ;838CC8|8D8D99  |7E998D;
                       SEP #$20                             ;838CCB|E220    |      ;
                       LDA.W $021E                          ;838CCD|AD1E02  |7E021E;
                       AND.B #$3F                           ;838CD0|293F    |      ;
                       STA.W $021E                          ;838CD2|8D1E02  |7E021E;
                       REP #$20                             ;838CD5|C220    |      ;
 
                     + PLB                                  ;838CD7|AB      |      ;
                       RTS                                  ;838CD8|60      |      ;
 
                    ++ JSR.W CODE_FN_838D3A                 ;838CD9|203A8D  |838D3A;
                       LDA.W $9997                          ;838CDC|AD9799  |7E9997;
                       SEC                                  ;838CDF|38      |      ;
                       SBC.L $7E99B1                        ;838CE0|EFB1997E|7E99B1;
                       STA.W $9997                          ;838CE4|8D9799  |7E9997;
                       LDA.W $99B7                          ;838CE7|ADB799  |7E99B7;
                       SEC                                  ;838CEA|38      |      ;
                       SBC.L $7E99B1                        ;838CEB|EFB1997E|7E99B1;
                       STA.W $99B7                          ;838CEF|8DB799  |7E99B7;
                       PLB                                  ;838CF2|AB      |      ;
                       SEP #$20                             ;838CF3|E220    |      ;
                       LDA.B #$02                           ;838CF5|A902    |      ;
                       STA.W DMA6PARAM                      ;838CF7|8D6043  |834360;
                       LDA.B #$0E                           ;838CFA|A90E    |      ;
                       STA.W DMA6REG                        ;838CFC|8D6143  |834361;
                       LDA.B #$FF                           ;838CFF|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;838D01|8D6243  |834362;
                       LDA.B #$96                           ;838D04|A996    |      ;
                       STA.W DMA6ADDRM                      ;838D06|8D6343  |834363;
                       LDA.B #$7E                           ;838D09|A97E    |      ;
                       STA.W DMA6ADDRH                      ;838D0B|8D6443  |834364;
                       REP #$20                             ;838D0E|C220    |      ;
                       SEP #$20                             ;838D10|E220    |      ;
                       LDA.B #$02                           ;838D12|A902    |      ;
                       STA.W DMA7PARAM                      ;838D14|8D7043  |834370;
                       LDA.B #$12                           ;838D17|A912    |      ;
                       STA.W DMA7REG                        ;838D19|8D7143  |834371;
                       LDA.B #$1F                           ;838D1C|A91F    |      ;
                       STA.W DMA7ADDRL                      ;838D1E|8D7243  |834372;
                       LDA.B #$97                           ;838D21|A997    |      ;
                       STA.W DMA7ADDRM                      ;838D23|8D7343  |834373;
                       LDA.B #$7E                           ;838D26|A97E    |      ;
                       STA.W DMA7ADDRH                      ;838D28|8D7443  |834374;
                       REP #$20                             ;838D2B|C220    |      ;
                       SEP #$20                             ;838D2D|E220    |      ;
                       LDA.W $021E                          ;838D2F|AD1E02  |83021E;
                       ORA.B #$C0                           ;838D32|09C0    |      ;
                       STA.W $021E                          ;838D34|8D1E02  |83021E;
                       REP #$20                             ;838D37|C220    |      ;
                       RTS                                  ;838D39|60      |      ;
 
       CODE_FN_838D3A:
                       SEP #$20                             ;838D3A|E220    |      ;
                       LDA.W $9993                          ;838D3C|AD9399  |7E9993;
                       DEC A                                ;838D3F|3A      |      ;
                       STA.W $982F                          ;838D40|8D2F98  |7E982F;
                       CLC                                  ;838D43|18      |      ;
                       ADC.B #$03                           ;838D44|6903    |      ;
                       STA.W $984F                          ;838D46|8D4F98  |7E984F;
                       LDA.W $9997                          ;838D49|AD9799  |7E9997;
                       SEC                                  ;838D4C|38      |      ;
                       SBC.L $7E9993                        ;838D4D|EF93997E|7E9993;
                       STA.W $9832                          ;838D51|8D3298  |7E9832;
                       STA.W $9852                          ;838D54|8D5298  |7E9852;
                       LDA.B #$FF                           ;838D57|A9FF    |      ;
                       STA.W $9833                          ;838D59|8D3398  |7E9833;
                       STA.W $9853                          ;838D5C|8D5398  |7E9853;
                       LDA.W $9995                          ;838D5F|AD9599  |7E9995;
                       SEC                                  ;838D62|38      |      ;
                       SBC.L $7E9997                        ;838D63|EF97997E|7E9997;
                       CLC                                  ;838D67|18      |      ;
                       ADC.B #$1B                           ;838D68|691B    |      ;
                       STA.W $9835                          ;838D6A|8D3598  |7E9835;
                       STA.W $9855                          ;838D6D|8D5598  |7E9855;
                       REP #$20                             ;838D70|C220    |      ;
                       LDA.W $9993                          ;838D72|AD9399  |7E9993;
                       SEC                                  ;838D75|38      |      ;
                       SBC.L $7E9997                        ;838D76|EF97997E|7E9997;
                       STA.W $9836                          ;838D7A|8D3698  |7E9836;
                       STA.W $9856                          ;838D7D|8D5698  |7E9856;
                       SEP #$20                             ;838D80|E220    |      ;
                       LDA.B #$01                           ;838D82|A901    |      ;
                       STA.W $9838                          ;838D84|8D3898  |7E9838;
                       STA.W $9858                          ;838D87|8D5898  |7E9858;
                       REP #$20                             ;838D8A|C220    |      ;
                       RTS                                  ;838D8C|60      |      ;
 
       CODE_FN_838D8D:
                       PHA                                  ;838D8D|48      |      ;
                       LDA.W $0000,Y                        ;838D8E|B90000  |830000;
                       AND.W #$00FF                         ;838D91|29FF00  |      ;
                       STA.B $02                            ;838D94|8502    |000002;
                       LDA.W #$0040                         ;838D96|A94000  |      ;
                       SEC                                  ;838D99|38      |      ;
                       SBC.B $02                            ;838D9A|E502    |000002;
                       SEC                                  ;838D9C|38      |      ;
                       SBC.B $02                            ;838D9D|E502    |000002;
                       STA.B $00                            ;838D9F|8500    |000000;
                       LDA.W $0001,Y                        ;838DA1|B90100  |830001;
                       AND.W #$00FF                         ;838DA4|29FF00  |      ;
                       STA.B $04                            ;838DA7|8504    |000004;
                       PLY                                  ;838DA9|7A      |      ;
                       PHB                                  ;838DAA|8B      |      ;
                       PEA.W $7E00                          ;838DAB|F4007E  |837E00;
                       PLB                                  ;838DAE|AB      |      ;
                       PLB                                  ;838DAF|AB      |      ;
 
                     - LDA.B $02                            ;838DB0|A502    |000002;
                       STA.B $06                            ;838DB2|8506    |000006;
 
                    -- LDA.L $7F5D00,X                      ;838DB4|BF005D7F|7F5D00;
                       STA.W $A5D2,Y                        ;838DB8|99D2A5  |7EA5D2;
                       INX                                  ;838DBB|E8      |      ;
                       INX                                  ;838DBC|E8      |      ;
                       INY                                  ;838DBD|C8      |      ;
                       INY                                  ;838DBE|C8      |      ;
                       DEC.B $06                            ;838DBF|C606    |000006;
                       BNE --                               ;838DC1|D0F1    |838DB4;
                       TXA                                  ;838DC3|8A      |      ;
                       CLC                                  ;838DC4|18      |      ;
                       ADC.B $00                            ;838DC5|6500    |000000;
                       TAX                                  ;838DC7|AA      |      ;
                       DEC.B $04                            ;838DC8|C604    |000004;
                       BNE -                                ;838DCA|D0E4    |838DB0;
                       PLB                                  ;838DCC|AB      |      ;
                       RTS                                  ;838DCD|60      |      ;
 
       CODE_FN_838DCE:
                       JSL.L CODE_FL_80BB2D                 ;838DCE|222DBB80|80BB2D;
                       db $22,$B1,$91,$00,$5D,$7F           ;838DD2|        |      ;
                       LDX.W #$0000                         ;838DD8|A20000  |      ;
                       LDA.W #$0000                         ;838DDB|A90000  |      ;
                       LDY.W #$8DE6                         ;838DDE|A0E68D  |      ;
                       JSR.W CODE_FN_838D8D                 ;838DE1|208D8D  |838D8D;
                       BRA +                                ;838DE4|8002    |838DE8;
                       db $0D,$19                           ;838DE6|        |      ;
 
                     + LDX.W #$001A                         ;838DE8|A21A00  |      ;
                       TYA                                  ;838DEB|98      |      ;
                       LDY.W #$8DF4                         ;838DEC|A0F48D  |      ;
                       JSR.W CODE_FN_838D8D                 ;838DEF|208D8D  |838D8D;
                       BRA +                                ;838DF2|8002    |838DF6;
                       db $0E,$10                           ;838DF4|        |      ;
 
                     + LDX.W #$041A                         ;838DF6|A21A04  |      ;
                       TYA                                  ;838DF9|98      |      ;
                       LDY.W #$8E02                         ;838DFA|A0028E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838DFD|208D8D  |838D8D;
                       BRA +                                ;838E00|8002    |838E04;
                       db $0D,$07                           ;838E02|        |      ;
 
                     + PHY                                  ;838E04|5A      |      ;
                       JSL.L CODE_FL_80BB2D                 ;838E05|222DBB80|80BB2D;
                       db $21,$B3,$91,$00,$5D,$7F           ;838E09|        |      ;
                       PLY                                  ;838E0F|7A      |      ;
                       LDX.W #$001A                         ;838E10|A21A00  |      ;
                       TYA                                  ;838E13|98      |      ;
                       LDY.W #$8E1C                         ;838E14|A01C8E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838E17|208D8D  |838D8D;
                       BRA +                                ;838E1A|8002    |838E1E;
                       db $0C,$03                           ;838E1C|        |      ;
 
                     + LDX.W #$00C0                         ;838E1E|A2C000  |      ;
                       TYA                                  ;838E21|98      |      ;
                       LDY.W #$8E2A                         ;838E22|A02A8E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838E25|208D8D  |838D8D;
                       BRA +                                ;838E28|8002    |838E2C;
                       db $12,$09                           ;838E2A|        |      ;
 
                     + LDX.W #$03C0                         ;838E2C|A2C003  |      ;
                       TYA                                  ;838E2F|98      |      ;
                       LDY.W #$8E38                         ;838E30|A0388E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838E33|208D8D  |838D8D;
                       BRA +                                ;838E36|8002    |838E3A;
                       db $12,$05                           ;838E38|        |      ;
 
                     + LDX.W #$00E4                         ;838E3A|A2E400  |      ;
                       TYA                                  ;838E3D|98      |      ;
                       LDY.W #$8E46                         ;838E3E|A0468E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838E41|208D8D  |838D8D;
                       BRA +                                ;838E44|8002    |838E48;
                       db $0E,$07                           ;838E46|        |      ;
 
                     + PHY                                  ;838E48|5A      |      ;
                       JSL.L CODE_FL_80BB2D                 ;838E49|222DBB80|80BB2D;
                       db $0F,$CA,$93,$00,$5D,$7F           ;838E4D|        |      ;
                       PLY                                  ;838E53|7A      |      ;
                       LDX.W #$0000                         ;838E54|A20000  |      ;
                       TYA                                  ;838E57|98      |      ;
                       LDY.W #$8E60                         ;838E58|A0608E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838E5B|208D8D  |838D8D;
                       BRA +                                ;838E5E|8002    |838E62;
                       db $15,$18                           ;838E60|        |      ;
 
                     + PHY                                  ;838E62|5A      |      ;
                       JSL.L CODE_FL_80BB2D                 ;838E63|222DBB80|80BB2D;
                       db $69,$CB,$93,$00,$5D,$7F           ;838E67|        |      ;
                       PLY                                  ;838E6D|7A      |      ;
                       LDX.W #$0000                         ;838E6E|A20000  |      ;
                       TYA                                  ;838E71|98      |      ;
                       LDY.W #$8E7A                         ;838E72|A07A8E  |      ;
                       JSR.W CODE_FN_838D8D                 ;838E75|208D8D  |838D8D;
                       BRA +                                ;838E78|8002    |838E7C;
                       db $15,$0D                           ;838E7A|        |      ;
 
                     + RTS                                  ;838E7C|60      |      ;
 
       CODE_FN_838E7D:
                       LDA.W #$0000                         ;838E7D|A90000  |      ;
                       STA.L $7E95EA                        ;838E80|8FEA957E|7E95EA;
                       LDA.L $7E96E7,X                      ;838E84|BFE7967E|7E96E7;
                       PHA                                  ;838E88|48      |      ;
                       LDA.L $7E96F5,X                      ;838E89|BFF5967E|7E96F5;
                       PHA                                  ;838E8D|48      |      ;
                       PHX                                  ;838E8E|DA      |      ;
                       LDX.W #$000A                         ;838E8F|A20A00  |      ;
 
                     - LDA.L $7E95D8,X                      ;838E92|BFD8957E|7E95D8;
                       AND.W #$00FF                         ;838E96|29FF00  |      ;
                       STA.B $00,X                          ;838E99|9500    |000000;
                       DEX                                  ;838E9B|CA      |      ;
                       DEX                                  ;838E9C|CA      |      ;
                       BPL -                                ;838E9D|10F3    |838E92;
                       PLX                                  ;838E9F|FA      |      ;
                       LDA.L $7E96F5,X                      ;838EA0|BFF5967E|7E96F5;
                       ASL A                                ;838EA4|0A      |      ;
                       TAY                                  ;838EA5|A8      |      ;
                       LDA.B $BB,X                          ;838EA6|B5BB    |0000BB;
                       BIT.W #$0800                         ;838EA8|890008  |      ;
                       BEQ +                                ;838EAB|F028    |838ED5;
                       LDA.L $7E96F5,X                      ;838EAD|BFF5967E|7E96F5;
                       BEQ ++                               ;838EB1|F00A    |838EBD;
                       DEC A                                ;838EB3|3A      |      ;
                       STA.L $7E96F5,X                      ;838EB4|9FF5967E|7E96F5;
                       JSR.W CODE_FN_838F80                 ;838EB8|20808F  |838F80;
                       BRA +++                              ;838EBB|8048    |838F05;
 
                    ++ LDA.L $7E95EE                        ;838EBD|AFEE957E|7E95EE;
                       BEQ ++                               ;838EC1|F010    |838ED3;
                       CMP.W #$0003                         ;838EC3|C90300  |      ;
                       BEQ ++                               ;838EC6|F00B    |838ED3;
                       LDA.L $7E95E8                        ;838EC8|AFE8957E|7E95E8;
                       STA.L $7E96F5,X                      ;838ECC|9FF5967E|7E96F5;
                       JSR.W CODE_FN_838F80                 ;838ED0|20808F  |838F80;
 
                    ++ BRA +++                              ;838ED3|8030    |838F05;
 
                     + BIT.W #$0400                         ;838ED5|890004  |      ;
                       BEQ +++                              ;838ED8|F02B    |838F05;
                       LDA.L $7E96F5,X                      ;838EDA|BFF5967E|7E96F5;
                       CMP.L $7E95E8                        ;838EDE|CFE8957E|7E95E8;
                       BPL +                                ;838EE2|100A    |838EEE;
                       INC A                                ;838EE4|1A      |      ;
                       STA.L $7E96F5,X                      ;838EE5|9FF5967E|7E96F5;
                       JSR.W CODE_FN_838F80                 ;838EE9|20808F  |838F80;
                       BRA +++                              ;838EEC|8017    |838F05;
 
                     + LDA.L $7E95EE                        ;838EEE|AFEE957E|7E95EE;
                       BEQ +                                ;838EF2|F00F    |838F03;
                       CMP.W #$0003                         ;838EF4|C90300  |      ;
                       BEQ +                                ;838EF7|F00A    |838F03;
                       LDA.W #$0000                         ;838EF9|A90000  |      ;
                       STA.L $7E96F5,X                      ;838EFC|9FF5967E|7E96F5;
                       JSR.W CODE_FN_838F80                 ;838F00|20808F  |838F80;
 
                     + BRA +++                              ;838F03|8000    |838F05;
 
                   +++ LDA.B $BB,X                          ;838F05|B5BB    |0000BB;
                       BIT.W #$0200                         ;838F07|890002  |      ;
                       BEQ +                                ;838F0A|F029    |838F35;
                       LDA.L $7E96E7,X                      ;838F0C|BFE7967E|7E96E7;
                       BEQ ++                               ;838F10|F00B    |838F1D;
                       DEC A                                ;838F12|3A      |      ;
                       STA.L $7E96E7,X                      ;838F13|9FE7967E|7E96E7;
                       STA.L $7E96EB,X                      ;838F17|9FEB967E|7E96EB;
                       BRA +++                              ;838F1B|8047    |838F64;
 
                    ++ LDA.L $7E95EE                        ;838F1D|AFEE957E|7E95EE;
                       BEQ ++                               ;838F21|F010    |838F33;
                       CMP.W #$0002                         ;838F23|C90200  |      ;
                       BEQ ++                               ;838F26|F00B    |838F33;
                       LDA.W $0000,Y                        ;838F28|B90000  |830000;
                       STA.L $7E96E7,X                      ;838F2B|9FE7967E|7E96E7;
                       STA.L $7E96EB,X                      ;838F2F|9FEB967E|7E96EB;
 
                    ++ BRA +++                              ;838F33|802F    |838F64;
 
                     + BIT.W #$0100                         ;838F35|890001  |      ;
                       BEQ +++                              ;838F38|F02A    |838F64;
                       LDA.L $7E96E7,X                      ;838F3A|BFE7967E|7E96E7;
                       CMP.W $0000,Y                        ;838F3E|D90000  |830000;
                       BEQ +                                ;838F41|F00B    |838F4E;
                       INC A                                ;838F43|1A      |      ;
                       STA.L $7E96E7,X                      ;838F44|9FE7967E|7E96E7;
                       STA.L $7E96EB,X                      ;838F48|9FEB967E|7E96EB;
                       BRA +++                              ;838F4C|8016    |838F64;
 
                     + LDA.L $7E95EE                        ;838F4E|AFEE957E|7E95EE;
                       BEQ +++                              ;838F52|F010    |838F64;
                       CMP.W #$0002                         ;838F54|C90200  |      ;
                       BEQ +++                              ;838F57|F00B    |838F64;
                       LDA.W #$0000                         ;838F59|A90000  |      ;
                       STA.L $7E96E7,X                      ;838F5C|9FE7967E|7E96E7;
                       STA.L $7E96EB,X                      ;838F60|9FEB967E|7E96EB;
 
                   +++ PLA                                  ;838F64|68      |      ;
                       CMP.L $7E96F5,X                      ;838F65|DFF5967E|7E96F5;
                       BNE +                                ;838F69|D009    |838F74;
                       PLA                                  ;838F6B|68      |      ;
                       CMP.L $7E96E7,X                      ;838F6C|DFE7967E|7E96E7;
                       BEQ ++                               ;838F70|F00D    |838F7F;
                       BRA +++                              ;838F72|8001    |838F75;
 
                     + PLA                                  ;838F74|68      |      ;
 
                   +++ JSR.W CODE_FN_8384C0                 ;838F75|20C084  |8384C0;
                       LDA.W #$0001                         ;838F78|A90100  |      ;
                       STA.L $7E95EA                        ;838F7B|8FEA957E|7E95EA;
 
                    ++ RTS                                  ;838F7F|60      |      ;
 
       CODE_FN_838F80:
                       ASL A                                ;838F80|0A      |      ;
                       TAY                                  ;838F81|A8      |      ;
                       LDA.L $7E96EB,X                      ;838F82|BFEB967E|7E96EB;
                       STA.L $7E96E7,X                      ;838F86|9FE7967E|7E96E7;
                       LDA.W $0000,Y                        ;838F8A|B90000  |830000;
                       CMP.L $7E96E7,X                      ;838F8D|DFE7967E|7E96E7;
                       BPL +                                ;838F91|1004    |838F97;
                       STA.L $7E96E7,X                      ;838F93|9FE7967E|7E96E7;
 
                     + RTS                                  ;838F97|60      |      ;
 
       CODE_FN_838F98:
                       PHA                                  ;838F98|48      |      ;
                       STA.B $00                            ;838F99|8500    |000000;
                       LDA.W #$0001                         ;838F9B|A90100  |      ;
                       STA.B $06                            ;838F9E|8506    |000006;
                       BRA +                                ;838FA0|801A    |838FBC;
 
       CODE_FN_838FA2:
                       PHA                                  ;838FA2|48      |      ;
                       STA.B $00                            ;838FA3|8500    |000000;
                       LDA.W $0003,Y                        ;838FA5|B90300  |830003;
                       AND.W #$00FF                         ;838FA8|29FF00  |      ;
                       STA.B $06                            ;838FAB|8506    |000006;
                       LDA.B $BB,X                          ;838FAD|B5BB    |0000BB;
                       BIT.W #$0030                         ;838FAF|893000  |      ;
                       BEQ +                                ;838FB2|F008    |838FBC;
                       db $B9,$04,$00,$29,$FF,$00,$85,$06   ;838FB4|        |000004;
 
                     + LDA.W $0000,Y                        ;838FBC|B90000  |830000;
                       AND.W #$00FF                         ;838FBF|29FF00  |      ;
                       STA.B $02                            ;838FC2|8502    |000002;
                       LDA.W $0001,Y                        ;838FC4|B90100  |830001;
                       STA.B $04                            ;838FC7|8504    |000004;
                       LDA.B $BB,X                          ;838FC9|B5BB    |0000BB;
                       BIT.W #$0220                         ;838FCB|892002  |      ;
                       BEQ +                                ;838FCE|F020    |838FF0;
                       LDA.B $00                            ;838FD0|A500    |000000;
                       SEC                                  ;838FD2|38      |      ;
                       SBC.B $06                            ;838FD3|E506    |000006;
                       STA.B $00                            ;838FD5|8500    |000000;
                       CMP.B $02                            ;838FD7|C502    |000002;
                       BMI ++                               ;838FD9|3002    |838FDD;
                       BRA +++                              ;838FDB|8038    |839015;
 
                    ++ LDA.L $7E95EE                        ;838FDD|AFEE957E|7E95EE;
                       BEQ ++                               ;838FE1|F007    |838FEA;
                       LDA.B $04                            ;838FE3|A504    |000004;
                       DEC A                                ;838FE5|3A      |      ;
                       STA.B $00                            ;838FE6|8500    |000000;
                       BRA +++                              ;838FE8|802B    |839015;
 
                    ++ LDA.B $02                            ;838FEA|A502    |000002;
                       STA.B $00                            ;838FEC|8500    |000000;
                       BRA +++                              ;838FEE|8025    |839015;
 
                     + BIT.W #$0110                         ;838FF0|891001  |      ;
                       BEQ +++                              ;838FF3|F020    |839015;
                       LDA.B $00                            ;838FF5|A500    |000000;
                       CLC                                  ;838FF7|18      |      ;
                       ADC.B $06                            ;838FF8|6506    |000006;
                       STA.B $00                            ;838FFA|8500    |000000;
                       CMP.B $04                            ;838FFC|C504    |000004;
                       BPL +                                ;838FFE|1002    |839002;
                       BRA +++                              ;839000|8013    |839015;
 
                     + LDA.L $7E95EE                        ;839002|AFEE957E|7E95EE;
                       BEQ +                                ;839006|F006    |83900E;
                       LDA.B $02                            ;839008|A502    |000002;
                       STA.B $00                            ;83900A|8500    |000000;
                       BRA +++                              ;83900C|8007    |839015;
 
                     + LDA.B $04                            ;83900E|A504    |000004;
                       DEC A                                ;839010|3A      |      ;
                       STA.B $00                            ;839011|8500    |000000;
                       BRA +++                              ;839013|8000    |839015;
 
                   +++ PLA                                  ;839015|68      |      ;
                       CMP.B $00                            ;839016|C500    |000000;
                       BEQ +                                ;839018|F003    |83901D;
                       JSR.W CODE_FN_8384C0                 ;83901A|20C084  |8384C0;
 
                     + LDA.B $00                            ;83901D|A500    |000000;
                       RTS                                  ;83901F|60      |      ;
 
       CODE_FN_839020:
                       LDA.W $0001,Y                        ;839020|B90100  |830001;
                       AND.W #$00FF                         ;839023|29FF00  |      ;
                       XBA                                  ;839026|EB      |      ;
                       LSR A                                ;839027|4A      |      ;
                       LSR A                                ;839028|4A      |      ;
                       STA.B $00                            ;839029|8500    |000000;
                       LDA.W $0002,Y                        ;83902B|B90200  |830002;
                       AND.W #$00FF                         ;83902E|29FF00  |      ;
                       ASL A                                ;839031|0A      |      ;
                       CLC                                  ;839032|18      |      ;
                       ADC.B $00                            ;839033|6500    |000000;
                       TAX                                  ;839035|AA      |      ;
                       LDA.W $0001,Y                        ;839036|B90100  |830001;
                       AND.W #$00FF                         ;839039|29FF00  |      ;
                       STA.B $00                            ;83903C|8500    |000000;
                       LDA.W $0003,Y                        ;83903E|B90300  |830003;
                       AND.W #$00FF                         ;839041|29FF00  |      ;
                       SEC                                  ;839044|38      |      ;
                       SBC.B $00                            ;839045|E500    |000000;
                       DEC A                                ;839047|3A      |      ;
                       STA.B $00                            ;839048|8500    |000000;
                       LDA.W #$000D                         ;83904A|A90D00  |      ;
                       STA.L $7E3000,X                      ;83904D|9F00307E|7E3000;
 
                     - LDA.W #$001D                         ;839051|A91D00  |      ;
                       STA.L $7E3040,X                      ;839054|9F40307E|7E3040;
                       TXA                                  ;839058|8A      |      ;
                       CLC                                  ;839059|18      |      ;
                       ADC.W #$0040                         ;83905A|694000  |      ;
                       TAX                                  ;83905D|AA      |      ;
                       DEC.B $00                            ;83905E|C600    |000000;
                       BNE -                                ;839060|D0EF    |839051;
                       LDA.W $0003,Y                        ;839062|B90300  |830003;
                       AND.W #$00FF                         ;839065|29FF00  |      ;
                       XBA                                  ;839068|EB      |      ;
                       LSR A                                ;839069|4A      |      ;
                       LSR A                                ;83906A|4A      |      ;
                       STA.B $00                            ;83906B|8500    |000000;
                       LDA.W $0000,Y                        ;83906D|B90000  |830000;
                       AND.W #$00FF                         ;839070|29FF00  |      ;
                       ASL A                                ;839073|0A      |      ;
                       CLC                                  ;839074|18      |      ;
                       ADC.B $00                            ;839075|6500    |000000;
                       TAX                                  ;839077|AA      |      ;
                       LDA.W $0000,Y                        ;839078|B90000  |830000;
                       AND.W #$00FF                         ;83907B|29FF00  |      ;
                       STA.B $00                            ;83907E|8500    |000000;
                       LDA.W $0002,Y                        ;839080|B90200  |830002;
                       AND.W #$00FF                         ;839083|29FF00  |      ;
                       SEC                                  ;839086|38      |      ;
                       SBC.B $00                            ;839087|E500    |000000;
                       DEC A                                ;839089|3A      |      ;
                       STA.B $00                            ;83908A|8500    |000000;
                       LDA.W #$002D                         ;83908C|A92D00  |      ;
                       STA.L $7E3000,X                      ;83908F|9F00307E|7E3000;
 
                     - LDA.W #$002E                         ;839093|A92E00  |      ;
                       STA.L $7E3002,X                      ;839096|9F02307E|7E3002;
                       INX                                  ;83909A|E8      |      ;
                       INX                                  ;83909B|E8      |      ;
                       DEC.B $00                            ;83909C|C600    |000000;
                       BNE -                                ;83909E|D0F3    |839093;
                       LDA.W #$002F                         ;8390A0|A92F00  |      ;
                       STA.L $7E3002,X                      ;8390A3|9F02307E|7E3002;
                       RTS                                  ;8390A7|60      |      ;
 
       CODE_FN_8390A8:
                       LDA.W $0001,Y                        ;8390A8|B90100  |830001;
                       AND.W #$00FF                         ;8390AB|29FF00  |      ;
                       XBA                                  ;8390AE|EB      |      ;
                       LSR A                                ;8390AF|4A      |      ;
                       LSR A                                ;8390B0|4A      |      ;
                       STA.B $00                            ;8390B1|8500    |000000;
                       LDA.W $0002,Y                        ;8390B3|B90200  |830002;
                       AND.W #$00FF                         ;8390B6|29FF00  |      ;
                       ASL A                                ;8390B9|0A      |      ;
                       CLC                                  ;8390BA|18      |      ;
                       ADC.B $00                            ;8390BB|6500    |000000;
                       TAX                                  ;8390BD|AA      |      ;
                       LDA.W $0001,Y                        ;8390BE|B90100  |830001;
                       AND.W #$00FF                         ;8390C1|29FF00  |      ;
                       STA.B $00                            ;8390C4|8500    |000000;
                       LDA.W $0003,Y                        ;8390C6|B90300  |830003;
                       AND.W #$00FF                         ;8390C9|29FF00  |      ;
                       SEC                                  ;8390CC|38      |      ;
                       SBC.B $00                            ;8390CD|E500    |000000;
                       DEC A                                ;8390CF|3A      |      ;
                       STA.B $00                            ;8390D0|8500    |000000;
                       LDA.W #$000D                         ;8390D2|A90D00  |      ;
                       STA.L $7E3000,X                      ;8390D5|9F00307E|7E3000;
 
                     - LDA.W #$001D                         ;8390D9|A91D00  |      ;
                       STA.L $7E3040,X                      ;8390DC|9F40307E|7E3040;
                       TXA                                  ;8390E0|8A      |      ;
                       CLC                                  ;8390E1|18      |      ;
                       ADC.W #$0040                         ;8390E2|694000  |      ;
                       TAX                                  ;8390E5|AA      |      ;
                       DEC.B $00                            ;8390E6|C600    |000000;
                       BNE -                                ;8390E8|D0EF    |8390D9;
                       LDA.W $0003,Y                        ;8390EA|B90300  |830003;
                       AND.W #$00FF                         ;8390ED|29FF00  |      ;
                       XBA                                  ;8390F0|EB      |      ;
                       LSR A                                ;8390F1|4A      |      ;
                       LSR A                                ;8390F2|4A      |      ;
                       STA.B $00                            ;8390F3|8500    |000000;
                       LDA.W $0000,Y                        ;8390F5|B90000  |830000;
                       AND.W #$00FF                         ;8390F8|29FF00  |      ;
                       ASL A                                ;8390FB|0A      |      ;
                       CLC                                  ;8390FC|18      |      ;
                       ADC.B $00                            ;8390FD|6500    |000000;
                       TAX                                  ;8390FF|AA      |      ;
                       LDA.W $0000,Y                        ;839100|B90000  |830000;
                       AND.W #$00FF                         ;839103|29FF00  |      ;
                       STA.B $00                            ;839106|8500    |000000;
                       LDA.W $0002,Y                        ;839108|B90200  |830002;
                       AND.W #$00FF                         ;83910B|29FF00  |      ;
                       SEC                                  ;83910E|38      |      ;
                       SBC.B $00                            ;83910F|E500    |000000;
                       DEC A                                ;839111|3A      |      ;
                       STA.B $00                            ;839112|8500    |000000;
                       LDA.W #$0060                         ;839114|A96000  |      ;
                       STA.L $7E3000,X                      ;839117|9F00307E|7E3000;
 
                     - LDA.W #$0061                         ;83911B|A96100  |      ;
                       STA.L $7E3002,X                      ;83911E|9F02307E|7E3002;
                       INX                                  ;839122|E8      |      ;
                       INX                                  ;839123|E8      |      ;
                       DEC.B $00                            ;839124|C600    |000000;
                       BNE -                                ;839126|D0F3    |83911B;
                       LDA.W #$0062                         ;839128|A96200  |      ;
                       STA.L $7E3002,X                      ;83912B|9F02307E|7E3002;
                       LDA.W #$0052                         ;83912F|A95200  |      ;
                       STA.L $7E2FC2,X                      ;839132|9FC22F7E|7E2FC2;
                       RTS                                  ;839136|60      |      ;
 
       CODE_FN_839137:
                       LDA.W #$0045                         ;839137|A94500  |      ;
                       STA.L $7E30C2,X                      ;83913A|9FC2307E|7E30C2;
                       LDA.W #$0046                         ;83913E|A94600  |      ;
 
                     - STA.L $7E30C4,X                      ;839141|9FC4307E|7E30C4;
                       INX                                  ;839145|E8      |      ;
                       INX                                  ;839146|E8      |      ;
                       DEY                                  ;839147|88      |      ;
                       BNE -                                ;839148|D0F7    |839141;
                       LDA.W #$0047                         ;83914A|A94700  |      ;
                       STA.L $7E30C4,X                      ;83914D|9FC4307E|7E30C4;
                       LDA.W #$0048                         ;839151|A94800  |      ;
                       STA.L $7E30C6,X                      ;839154|9FC6307E|7E30C6;
                       LDA.W #$0028                         ;839158|A92800  |      ;
                       STA.L $7E3046,X                      ;83915B|9F46307E|7E3046;
                       LDA.W #$0037                         ;83915F|A93700  |      ;
                       STA.L $7E3084,X                      ;839162|9F84307E|7E3084;
                       LDA.W #$0038                         ;839166|A93800  |      ;
                       STA.L $7E3086,X                      ;839169|9F86307E|7E3086;
                       RTS                                  ;83916D|60      |      ;
 
       CODE_FN_83916E:
                       LDA.W #$0024                         ;83916E|A92400  |      ;
                       STA.L $7E3058,X                      ;839171|9F58307E|7E3058;
                       LDA.W #$0030                         ;839175|A93000  |      ;
                       STA.L $7E3080,X                      ;839178|9F80307E|7E3080;
                       LDA.W #$0040                         ;83917C|A94000  |      ;
                       STA.L $7E30C0,X                      ;83917F|9FC0307E|7E30C0;
                       LDA.W #$0031                         ;839183|A93100  |      ;
                       STA.L $7E3082,X                      ;839186|9F82307E|7E3082;
                       LDA.W #$0041                         ;83918A|A94100  |      ;
                       STA.L $7E30C2,X                      ;83918D|9FC2307E|7E30C2;
                       LDY.W #$0009                         ;839191|A00900  |      ;
 
                     - LDA.W #$0032                         ;839194|A93200  |      ;
                       STA.L $7E3084,X                      ;839197|9F84307E|7E3084;
                       LDA.W #$0042                         ;83919B|A94200  |      ;
                       STA.L $7E30C4,X                      ;83919E|9FC4307E|7E30C4;
                       INX                                  ;8391A2|E8      |      ;
                       INX                                  ;8391A3|E8      |      ;
                       DEY                                  ;8391A4|88      |      ;
                       BNE -                                ;8391A5|D0ED    |839194;
                       LDA.W #$0033                         ;8391A7|A93300  |      ;
                       STA.L $7E3084,X                      ;8391AA|9F84307E|7E3084;
                       LDA.W #$0043                         ;8391AE|A94300  |      ;
                       STA.L $7E30C4,X                      ;8391B1|9FC4307E|7E30C4;
                       LDA.W #$0034                         ;8391B5|A93400  |      ;
                       STA.L $7E3086,X                      ;8391B8|9F86307E|7E3086;
                       LDA.W #$0044                         ;8391BC|A94400  |      ;
                       STA.L $7E30C6,X                      ;8391BF|9FC6307E|7E30C6;
                       RTS                                  ;8391C3|60      |      ;
 
       CODE_FN_8391C4:
                       LDA.W $0001,Y                        ;8391C4|B90100  |830001;
                       AND.W #$00FF                         ;8391C7|29FF00  |      ;
                       XBA                                  ;8391CA|EB      |      ;
                       LSR A                                ;8391CB|4A      |      ;
                       LSR A                                ;8391CC|4A      |      ;
                       STA.B $00                            ;8391CD|8500    |000000;
                       LDA.W $0002,Y                        ;8391CF|B90200  |830002;
                       AND.W #$00FF                         ;8391D2|29FF00  |      ;
                       ASL A                                ;8391D5|0A      |      ;
                       CLC                                  ;8391D6|18      |      ;
                       ADC.B $00                            ;8391D7|6500    |000000;
                       TAX                                  ;8391D9|AA      |      ;
                       LDA.W $0001,Y                        ;8391DA|B90100  |830001;
                       AND.W #$00FF                         ;8391DD|29FF00  |      ;
                       STA.B $00                            ;8391E0|8500    |000000;
                       LDA.W $0003,Y                        ;8391E2|B90300  |830003;
                       AND.W #$00FF                         ;8391E5|29FF00  |      ;
                       SEC                                  ;8391E8|38      |      ;
                       SBC.B $00                            ;8391E9|E500    |000000;
                       DEC A                                ;8391EB|3A      |      ;
                       DEC A                                ;8391EC|3A      |      ;
                       STA.B $00                            ;8391ED|8500    |000000;
                       LDA.W #$000F                         ;8391EF|A90F00  |      ;
                       STA.L $7E3000,X                      ;8391F2|9F00307E|7E3000;
                       LDA.W #$001F                         ;8391F6|A91F00  |      ;
                       STA.L $7E3040,X                      ;8391F9|9F40307E|7E3040;
 
                     - LDA.W #$001D                         ;8391FD|A91D00  |      ;
                       STA.L $7E3080,X                      ;839200|9F80307E|7E3080;
                       TXA                                  ;839204|8A      |      ;
                       CLC                                  ;839205|18      |      ;
                       ADC.W #$0040                         ;839206|694000  |      ;
                       TAX                                  ;839209|AA      |      ;
                       DEC.B $00                            ;83920A|C600    |000000;
                       BNE -                                ;83920C|D0EF    |8391FD;
                       LDA.W $0003,Y                        ;83920E|B90300  |830003;
                       AND.W #$00FF                         ;839211|29FF00  |      ;
                       XBA                                  ;839214|EB      |      ;
                       LSR A                                ;839215|4A      |      ;
                       LSR A                                ;839216|4A      |      ;
                       STA.B $00                            ;839217|8500    |000000;
                       LDA.W $0000,Y                        ;839219|B90000  |830000;
                       AND.W #$00FF                         ;83921C|29FF00  |      ;
                       ASL A                                ;83921F|0A      |      ;
                       CLC                                  ;839220|18      |      ;
                       ADC.B $00                            ;839221|6500    |000000;
                       TAX                                  ;839223|AA      |      ;
                       LDA.W $0000,Y                        ;839224|B90000  |830000;
                       AND.W #$00FF                         ;839227|29FF00  |      ;
                       STA.B $00                            ;83922A|8500    |000000;
                       LDA.W $0002,Y                        ;83922C|B90200  |830002;
                       AND.W #$00FF                         ;83922F|29FF00  |      ;
                       SEC                                  ;839232|38      |      ;
                       SBC.B $00                            ;839233|E500    |000000;
                       DEC A                                ;839235|3A      |      ;
                       STA.B $00                            ;839236|8500    |000000;
                       LDA.W #$002D                         ;839238|A92D00  |      ;
                       STA.L $7E3000,X                      ;83923B|9F00307E|7E3000;
 
                     - LDA.W #$002E                         ;83923F|A92E00  |      ;
                       STA.L $7E3002,X                      ;839242|9F02307E|7E3002;
                       INX                                  ;839246|E8      |      ;
                       INX                                  ;839247|E8      |      ;
                       DEC.B $00                            ;839248|C600    |000000;
                       BNE -                                ;83924A|D0F3    |83923F;
                       LDA.W #$002F                         ;83924C|A92F00  |      ;
                       STA.L $7E3002,X                      ;83924F|9F02307E|7E3002;
                       RTS                                  ;839253|60      |      ;
 
       CODE_FN_839254:
                       PHX                                  ;839254|DA      |      ;
                       LDA.W #$0005                         ;839255|A90500  |      ;
                       STA.L $7E3000,X                      ;839258|9F00307E|7E3000;
                       LDA.W #$001C                         ;83925C|A91C00  |      ;
                       STA.B $00                            ;83925F|8500    |000000;
                       LDA.W #$0006                         ;839261|A90600  |      ;
 
                     - STA.L $7E3002,X                      ;839264|9F02307E|7E3002;
                       INX                                  ;839268|E8      |      ;
                       INX                                  ;839269|E8      |      ;
                       DEC.B $00                            ;83926A|C600    |000000;
                       BNE -                                ;83926C|D0F6    |839264;
                       LDA.W #$4005                         ;83926E|A90540  |      ;
                       STA.L $7E3002,X                      ;839271|9F02307E|7E3002;
                       TXA                                  ;839275|8A      |      ;
                       CLC                                  ;839276|18      |      ;
                       ADC.W #$0008                         ;839277|690800  |      ;
                       TAX                                  ;83927A|AA      |      ;
 
                     - LDA.W #$0015                         ;83927B|A91500  |      ;
                       STA.L $7E3000,X                      ;83927E|9F00307E|7E3000;
                       LDA.W #$001C                         ;839282|A91C00  |      ;
                       STA.B $00                            ;839285|8500    |000000;
                       LDA.W #$0016                         ;839287|A91600  |      ;
 
                    -- STA.L $7E3002,X                      ;83928A|9F02307E|7E3002;
                       INX                                  ;83928E|E8      |      ;
                       INX                                  ;83928F|E8      |      ;
                       DEC.B $00                            ;839290|C600    |000000;
                       BNE --                               ;839292|D0F6    |83928A;
                       LDA.W #$0019                         ;839294|A91900  |      ;
                       STA.L $7E3002,X                      ;839297|9F02307E|7E3002;
                       TXA                                  ;83929B|8A      |      ;
                       CLC                                  ;83929C|18      |      ;
                       ADC.W #$0008                         ;83929D|690800  |      ;
                       TAX                                  ;8392A0|AA      |      ;
                       DEY                                  ;8392A1|88      |      ;
                       BNE -                                ;8392A2|D0D7    |83927B;
                       LDA.W #$8005                         ;8392A4|A90580  |      ;
                       STA.L $7E3000,X                      ;8392A7|9F00307E|7E3000;
                       LDA.W #$0029                         ;8392AB|A92900  |      ;
                       STA.L $7E3002,X                      ;8392AE|9F02307E|7E3002;
                       LDA.W #$001B                         ;8392B2|A91B00  |      ;
                       STA.B $00                            ;8392B5|8500    |000000;
                       LDA.W #$002A                         ;8392B7|A92A00  |      ;
 
                     - STA.L $7E3004,X                      ;8392BA|9F04307E|7E3004;
                       INX                                  ;8392BE|E8      |      ;
                       INX                                  ;8392BF|E8      |      ;
                       DEC.B $00                            ;8392C0|C600    |000000;
                       BNE -                                ;8392C2|D0F6    |8392BA;
                       LDA.W #$002B                         ;8392C4|A92B00  |      ;
                       STA.L $7E3004,X                      ;8392C7|9F04307E|7E3004;
                       PLX                                  ;8392CB|FA      |      ;
                       LDA.W #$0009                         ;8392CC|A90900  |      ;
                       STA.L $7E307A,X                      ;8392CF|9F7A307E|7E307A;
                       RTS                                  ;8392D3|60      |      ;
 
       CODE_FN_8392D4:
                       LDY.W #$0009                         ;8392D4|A00900  |      ;
                       JSR.W CODE_FN_839254                 ;8392D7|205492  |839254;
                       LDA.W #$0017                         ;8392DA|A91700  |      ;
                       STA.L $7E3280,X                      ;8392DD|9F80327E|7E3280;
                       LDA.W #$001C                         ;8392E1|A91C00  |      ;
                       STA.B $00                            ;8392E4|8500    |000000;
                       LDA.W #$0016                         ;8392E6|A91600  |      ;
 
                     - STA.L $7E3282,X                      ;8392E9|9F82327E|7E3282;
                       INX                                  ;8392ED|E8      |      ;
                       INX                                  ;8392EE|E8      |      ;
                       DEC.B $00                            ;8392EF|C600    |000000;
                       BNE -                                ;8392F1|D0F6    |8392E9;
                       LDA.W #$0055                         ;8392F3|A95500  |      ;
                       STA.L $7E3282,X                      ;8392F6|9F82327E|7E3282;
                       RTS                                  ;8392FA|60      |      ;
                       db $02,$08,$10,$02,$10,$08,$02       ;8392FB|        |      ;
                       db $08,$04                           ;839302|        |      ;
                       db $02,$10,$10,$02                   ;839304|        |      ;
                       db $08,$08,$AF,$61,$99,$7E,$0A,$AA   ;839308|        |      ;
                       db $A9,$00,$00,$9F,$65,$99,$7E,$9F   ;839310|        |      ;
                       db $79,$99,$7E,$60                   ;839318|        |007E99;
 
       CODE_FN_83931C:
                       PHY                                  ;83931C|5A      |      ;
                       TAY                                  ;83931D|A8      |      ;
                       LDA.W DATA8_83932D,Y                 ;83931E|B92D93  |83932D;
                       AND.W #$00FF                         ;839321|29FF00  |      ;
                       PLY                                  ;839324|7A      |      ;
                       CLC                                  ;839325|18      |      ;
                       ADC.W #$0304                         ;839326|690403  |      ;
                       JSR.W CODE_FN_839B35                 ;839329|20359B  |839B35;
                       RTS                                  ;83932C|60      |      ;
 
         DATA8_83932D:
                       db $00,$05,$0A,$0E,$13,$17           ;83932D|        |      ;
 
       CODE_FN_839333:
                       PHP                                  ;839333|08      |      ;
                       PHX                                  ;839334|DA      |      ;
                       PHY                                  ;839335|5A      |      ;
                       ASL A                                ;839336|0A      |      ;
                       ASL A                                ;839337|0A      |      ;
                       PHA                                  ;839338|48      |      ;
                       ASL A                                ;839339|0A      |      ;
                       CLC                                  ;83933A|18      |      ;
                       ADC.W #$9379                         ;83933B|697993  |      ;
                       STA.B $00                            ;83933E|8500    |000000;
                       JSR.W CODE_FN_8385F0                 ;839340|20F085  |8385F0;
                       LDA.L $7E9961                        ;839343|AF61997E|7E9961;
                       ASL A                                ;839347|0A      |      ;
                       TAX                                  ;839348|AA      |      ;
                       PLA                                  ;839349|68      |      ;
                       CLC                                  ;83934A|18      |      ;
                       ADC.L $7E9965,X                      ;83934B|7F65997E|7E9965;
                       TAY                                  ;83934F|A8      |      ;
                       LDA.W DATA8_839361,Y                 ;839350|B96193  |839361;
                       AND.W #$00FF                         ;839353|29FF00  |      ;
                       CLC                                  ;839356|18      |      ;
                       ADC.W #$0304                         ;839357|690403  |      ;
                       PLY                                  ;83935A|7A      |      ;
                       PLX                                  ;83935B|FA      |      ;
                       JSR.W CODE_FN_839B35                 ;83935C|20359B  |839B35;
                       PLP                                  ;83935F|28      |      ;
                       RTS                                  ;839360|60      |      ;
 
         DATA8_839361:
                       db $00,$01                           ;839361|        |      ;
                       db $00,$01                           ;839363|        |      ;
                       db $05,$06,$05,$06,$0A,$0B,$0A,$0B   ;839365|        |      ;
                       db $0E,$0F                           ;83936D|        |      ;
                       db $10,$0E                           ;83936F|        |83937F;
                       db $13,$14,$15,$14,$17,$18,$19,$1A   ;839371|        |      ;
                       db $04,$3C,$02                       ;839379|        |      ;
                       db $06,$02,$00,$00,$00               ;83937C|        |000002;
                       db $04,$3C,$02,$06,$02,$00           ;839381|        |      ;
                       db $00,$00                           ;839387|        |      ;
                       db $04,$3C,$02,$07,$02,$00           ;839389|        |      ;
                       db $00,$00                           ;83938F|        |      ;
                       db $04,$32,$03                       ;839391|        |      ;
                       db $08,$03,$00,$00,$00               ;839394|        |      ;
                       db $04,$3C,$03,$08,$03,$00           ;839399|        |      ;
                       db $00,$00                           ;83939F|        |      ;
                       db $04,$46,$01,$04,$01,$00           ;8393A1|        |      ;
                       db $00,$00                           ;8393A7|        |      ;
 
       CODE_FN_8393A9:
                       PHX                                  ;8393A9|DA      |      ;
                       PHA                                  ;8393AA|48      |      ;
                       ASL A                                ;8393AB|0A      |      ;
                       ASL A                                ;8393AC|0A      |      ;
                       PHA                                  ;8393AD|48      |      ;
                       ASL A                                ;8393AE|0A      |      ;
                       CLC                                  ;8393AF|18      |      ;
                       ADC.W #$93EF                         ;8393B0|69EF93  |      ;
                       STA.B $00                            ;8393B3|8500    |000000;
                       JSR.W CODE_FN_8385F0                 ;8393B5|20F085  |8385F0;
                       LDA.L $7E9961                        ;8393B8|AF61997E|7E9961;
                       ASL A                                ;8393BC|0A      |      ;
                       TAX                                  ;8393BD|AA      |      ;
                       PLA                                  ;8393BE|68      |      ;
                       CLC                                  ;8393BF|18      |      ;
                       ADC.L $7E9965,X                      ;8393C0|7F65997E|7E9965;
                       TAY                                  ;8393C4|A8      |      ;
                       LDA.W DATA8_8393D3,Y                 ;8393C5|B9D393  |8393D3;
                       AND.W #$00FF                         ;8393C8|29FF00  |      ;
                       TAY                                  ;8393CB|A8      |      ;
                       PLA                                  ;8393CC|68      |      ;
                       PLX                                  ;8393CD|FA      |      ;
                       JSL.L CODE_FL_86D5FB                 ;8393CE|22FBD586|86D5FB;
                       RTS                                  ;8393D2|60      |      ;
 
         DATA8_8393D3:
                       db $02,$03,$04,$03,$02,$03,$02,$03   ;8393D3|        |      ;
                       db $01,$02,$01,$02,$02,$03,$04,$03   ;8393DB|        |      ;
                       db $01,$02,$01,$02,$01,$02,$03,$01   ;8393E3|        |      ;
                       db $00,$01,$00,$01,$04,$3C,$02,$06   ;8393EB|        |      ;
                       db $02,$00                           ;8393F3|        |      ;
                       db $00,$00                           ;8393F5|        |      ;
                       db $04,$3C,$02,$08,$02,$00           ;8393F7|        |      ;
                       db $00,$00                           ;8393FD|        |      ;
                       db $04,$3C,$03,$08,$03,$00           ;8393FF|        |      ;
                       db $00,$00                           ;839405|        |      ;
                       db $04,$32,$03,$08,$03,$00           ;839407|        |      ;
                       db $00,$00                           ;83940D|        |      ;
                       db $04,$3C,$03,$08,$03,$00           ;83940F|        |      ;
                       db $00,$00                           ;839415|        |      ;
                       db $04,$3C,$03,$08,$03,$00           ;839417|        |      ;
                       db $00,$00                           ;83941D|        |      ;
                       db $04,$46,$02,$07,$02               ;83941F|        |      ;
                       db $00,$00,$00                       ;839424|        |      ;
 
       CODE_FN_839427:
                       LDA.W $0000,Y                        ;839427|B90000  |830000;
                       AND.W #$00FF                         ;83942A|29FF00  |      ;
                       STA.B $00                            ;83942D|8500    |000000;
                       LDA.W $0001,Y                        ;83942F|B90100  |830001;
                       AND.W #$00FF                         ;839432|29FF00  |      ;
                       STA.B $02                            ;839435|8502    |000002;
                       LDX.W $0002,Y                        ;839437|BE0200  |830002;
                       LDA.L $7E9989                        ;83943A|AF89997E|7E9989;
                       BNE +                                ;83943E|D024    |839464;
                       LDY.B $00                            ;839440|A400    |000000;
                       CPY.W Character_1P                   ;839442|CCBA02  |8302BA;
                       BEQ ++                               ;839445|F00A    |839451;
                       CPY.W $02BC                          ;839447|CCBC02  |8302BC;
                       BNE +                                ;83944A|D018    |839464;
                       LDA.W #$0003                         ;83944C|A90300  |      ;
                       BRA +++                              ;83944F|8003    |839454;
 
                    ++ LDA.W #$0002                         ;839451|A90200  |      ;
 
                   +++ STA.L $7E9961                        ;839454|8F61997E|7E9961;
                       LDA.L $7E998B                        ;839458|AF8B997E|7E998B;
                       BNE ++                               ;83945C|D00F    |83946D;
                       LDA.B $02                            ;83945E|A502    |000002;
                       JSR.W CODE_FN_8393A9                 ;839460|20A993  |8393A9;
                       RTS                                  ;839463|60      |      ;
 
                     + LDA.B $02                            ;839464|A502    |000002;
                       LDY.W #$0000                         ;839466|A00000  |      ;
                       JSL.L CODE_FL_86D5FB                 ;839469|22FBD586|86D5FB;
 
                    ++ RTS                                  ;83946D|60      |      ;
 
       CODE_FN_83946E:
                       LDA.W $0000,Y                        ;83946E|B90000  |830000;
                       AND.W #$00FF                         ;839471|29FF00  |      ;
                       STA.B $00                            ;839474|8500    |000000;
                       LDA.W $0001,Y                        ;839476|B90100  |830001;
                       AND.W #$00FF                         ;839479|29FF00  |      ;
                       STA.B $02                            ;83947C|8502    |000002;
                       LDA.W $0002,Y                        ;83947E|B90200  |830002;
                       AND.W #$00FF                         ;839481|29FF00  |      ;
                       TAX                                  ;839484|AA      |      ;
                       LDA.W $0003,Y                        ;839485|B90300  |830003;
                       AND.W #$00FF                         ;839488|29FF00  |      ;
                       TAY                                  ;83948B|A8      |      ;
                       LDA.L $7E995F                        ;83948C|AF5F997E|7E995F;
                       BNE +                                ;839490|D01E    |8394B0;
                       LDA.B $00                            ;839492|A500    |000000;
                       CMP.W Character_1P                   ;839494|CDBA02  |8302BA;
                       BEQ ++                               ;839497|F00A    |8394A3;
                       CMP.W $02BC                          ;839499|CDBC02  |8302BC;
                       BNE +                                ;83949C|D012    |8394B0;
                       LDA.W #$0003                         ;83949E|A90300  |      ;
                       BRA +++                              ;8394A1|8003    |8394A6;
 
                    ++ LDA.W #$0002                         ;8394A3|A90200  |      ;
 
                   +++ STA.L $7E9961                        ;8394A6|8F61997E|7E9961;
                       LDA.B $02                            ;8394AA|A502    |000002;
                       JSR.W CODE_FN_839333                 ;8394AC|203393  |839333;
                       RTS                                  ;8394AF|60      |      ;
 
                     + LDA.B $02                            ;8394B0|A502    |000002;
                       JSR.W CODE_FN_83931C                 ;8394B2|201C93  |83931C;
                       RTS                                  ;8394B5|60      |      ;
 
       CODE_FN_8394B6:
                       LDA.W #$FFFF                         ;8394B6|A9FFFF  |      ;
                       STA.W $02BC                          ;8394B9|8DBC02  |8302BC;
                       LDY.W #$94C9                         ;8394BC|A0C994  |      ;
                       JSR.W CODE_FN_83946E                 ;8394BF|206E94  |83946E;
                       LDY.W #$94CD                         ;8394C2|A0CD94  |      ;
                       JSR.W CODE_FN_83946E                 ;8394C5|206E94  |83946E;
                       RTS                                  ;8394C8|60      |      ;
                       db $03,$01,$40,$6F,$05,$02,$90,$6F   ;8394C9|        |      ;
 
       CODE_FN_8394D1:
                       LDA.W #$FFFF                         ;8394D1|A9FFFF  |      ;
                       STA.W $02BC                          ;8394D4|8DBC02  |8302BC;
                       LDA.W #$0003                         ;8394D7|A90300  |      ;
                       STA.B $0E                            ;8394DA|850E    |00000E;
 
                     - LDA.B $0E                            ;8394DC|A50E    |00000E;
                       ASL A                                ;8394DE|0A      |      ;
                       ASL A                                ;8394DF|0A      |      ;
                       CLC                                  ;8394E0|18      |      ;
                       ADC.W #$94ED                         ;8394E1|69ED94  |      ;
                       TAY                                  ;8394E4|A8      |      ;
                       JSR.W CODE_FN_839427                 ;8394E5|202794  |839427;
                       DEC.B $0E                            ;8394E8|C60E    |00000E;
                       BPL -                                ;8394EA|10F0    |8394DC;
                       RTS                                  ;8394EC|60      |      ;
                       db $00,$00,$10,$02,$01,$01,$1A,$02   ;8394ED|        |      ;
                       db $02,$02,$24,$02,$04,$03,$9A,$03   ;8394F5|        |      ;
 
       CODE_FN_8394FD:
                       LDA.W #$006F                         ;8394FD|A96F00  |      ;
                       SEC                                  ;839500|38      |      ;
                       SBC.L $7E96E5                        ;839501|EFE5967E|7E96E5;
                       TAY                                  ;839505|A8      |      ;
                       LDA.L $7E995F                        ;839506|AF5F997E|7E995F;
                       BNE +                                ;83950A|D012    |83951E;
                       LDA.W Character_1P                   ;83950C|ADBA02  |8302BA;
                       CMP.W #$0003                         ;83950F|C90300  |      ;
                       BNE +                                ;839512|D00A    |83951E;
                       LDX.W #$0090                         ;839514|A29000  |      ;
                       LDA.W #$0001                         ;839517|A90100  |      ;
                       JSR.W CODE_FN_839333                 ;83951A|203393  |839333;
                       RTS                                  ;83951D|60      |      ;
 
                     + LDX.W #$0090                         ;83951E|A29000  |      ;
                       LDA.W #$0800                         ;839521|A90008  |      ;
                       STA.B $02                            ;839524|8502    |000002;
                       LDA.W #$0005                         ;839526|A90500  |      ;
                       CLC                                  ;839529|18      |      ;
                       ADC.W #$0304                         ;83952A|690403  |      ;
                       JSR.W CODE_FN_839B35                 ;83952D|20359B  |839B35;
                       RTS                                  ;839530|60      |      ;
 
       CODE_FN_839531:
                       LDA.W #$00AF                         ;839531|A9AF00  |      ;
                       SEC                                  ;839534|38      |      ;
                       SBC.L $7E96E5                        ;839535|EFE5967E|7E96E5;
                       TAY                                  ;839539|A8      |      ;
                       LDA.L $7E995F                        ;83953A|AF5F997E|7E995F;
                       BNE +                                ;83953E|D012    |839552;
                       LDA.W Character_1P                   ;839540|ADBA02  |8302BA;
                       CMP.W #$0005                         ;839543|C90500  |      ;
                       BNE +                                ;839546|D00A    |839552;
                       LDX.W #$0090                         ;839548|A29000  |      ;
                       LDA.W #$0002                         ;83954B|A90200  |      ;
                       JSR.W CODE_FN_839333                 ;83954E|203393  |839333;
                       RTS                                  ;839551|60      |      ;
 
                     + LDX.W #$0090                         ;839552|A29000  |      ;
                       LDA.W #$0A00                         ;839555|A9000A  |      ;
                       STA.B $02                            ;839558|8502    |000002;
                       LDA.W #$000A                         ;83955A|A90A00  |      ;
                       CLC                                  ;83955D|18      |      ;
                       ADC.W #$0304                         ;83955E|690403  |      ;
                       JSR.W CODE_FN_839B35                 ;839561|20359B  |839B35;
                       RTS                                  ;839564|60      |      ;
 
       CODE_FN_839565:
                       LDA.W #$0002                         ;839565|A90200  |      ;
                       STA.L $7E9961                        ;839568|8F61997E|7E9961;
                       JSR.W CODE_FN_8394FD                 ;83956C|20FD94  |8394FD;
                       JSR.W CODE_FN_839531                 ;83956F|203195  |839531;
                       RTS                                  ;839572|60      |      ;
 
       CODE_FN_839573:
                       LDA.W #$0058                         ;839573|A95800  |      ;
                       SEC                                  ;839576|38      |      ;
                       SBC.L $7E96E3                        ;839577|EFE3967E|7E96E3;
                       TAX                                  ;83957B|AA      |      ;
                       LDA.W #$0002                         ;83957C|A90200  |      ;
                       STA.L $7E9961                        ;83957F|8F61997E|7E9961;
                       LDY.W #$004F                         ;839583|A04F00  |      ;
                       LDA.W #$0004                         ;839586|A90400  |      ;
                       JSR.W CODE_FN_839333                 ;839589|203393  |839333;
                       RTS                                  ;83958C|60      |      ;
 
       CODE_FN_83958D:
                       LDA.W #$00FF                         ;83958D|A9FF00  |      ;
                       SEC                                  ;839590|38      |      ;
                       SBC.L $7E96E5                        ;839591|EFE5967E|7E96E5;
                       CMP.W #$00E0                         ;839595|C9E000  |      ;
                       BPL +                                ;839598|101F    |8395B9;
                       TAY                                  ;83959A|A8      |      ;
                       LDA.L $7E995F                        ;83959B|AF5F997E|7E995F;
                       BNE ++                               ;83959F|D019    |8395BA;
                       LDA.W Character_1P                   ;8395A1|ADBA02  |0002BA;
                       CMP.W #$0006                         ;8395A4|C90600  |      ;
                       BNE ++                               ;8395A7|D011    |8395BA;
                       LDA.W #$0002                         ;8395A9|A90200  |      ;
                       STA.L $7E9961                        ;8395AC|8F61997E|7E9961;
                       LDX.W #$0058                         ;8395B0|A25800  |      ;
                       LDA.W #$0004                         ;8395B3|A90400  |      ;
                       JSR.W CODE_FN_839333                 ;8395B6|203393  |839333;
 
                     + RTS                                  ;8395B9|60      |      ;
 
                    ++ LDX.W #$0058                         ;8395BA|A25800  |      ;
                       LDA.W #$0A00                         ;8395BD|A9000A  |      ;
                       STA.B $02                            ;8395C0|8502    |000002;
                       LDA.W #$0013                         ;8395C2|A91300  |      ;
                       CLC                                  ;8395C5|18      |      ;
                       ADC.W #$0304                         ;8395C6|690403  |      ;
                       JSR.W CODE_FN_839B35                 ;8395C9|20359B  |839B35;
                       RTS                                  ;8395CC|60      |      ;
 
       CODE_FN_8395CD:
                       LDA.W #$FFFF                         ;8395CD|A9FFFF  |      ;
                       STA.W $02BC                          ;8395D0|8DBC02  |8302BC;
                       LDA.W #$0003                         ;8395D3|A90300  |      ;
                       STA.B $0E                            ;8395D6|850E    |00000E;
 
                     - LDA.B $0E                            ;8395D8|A50E    |00000E;
                       ASL A                                ;8395DA|0A      |      ;
                       ASL A                                ;8395DB|0A      |      ;
                       CLC                                  ;8395DC|18      |      ;
                       ADC.W #$95E9                         ;8395DD|69E995  |      ;
                       TAY                                  ;8395E0|A8      |      ;
                       JSR.W CODE_FN_839427                 ;8395E1|202794  |839427;
                       DEC.B $0E                            ;8395E4|C60E    |00000E;
                       BPL -                                ;8395E6|10F0    |8395D8;
                       RTS                                  ;8395E8|60      |      ;
                       db $00,$00,$86,$01,$01,$01,$A4,$01   ;8395E9|        |      ;
                       db $02,$02,$86,$03,$04,$03,$86,$05   ;8395F1|        |      ;
 
       CODE_FN_8395F9:
                       LDA.W #$02A8                         ;8395F9|A9A802  |      ;
                       SEC                                  ;8395FC|38      |      ;
                       SBC.L $7E96E3                        ;8395FD|EFE3967E|7E96E3;
                       CMP.W #$0100                         ;839601|C90001  |      ;
                       BPL +                                ;839604|1043    |839649;
                       CMP.W #$FF01                         ;839606|C901FF  |      ;
                       BMI +                                ;839609|303E    |839649;
                       TAX                                  ;83960B|AA      |      ;
                       LDA.W Character_1P                   ;83960C|ADBA02  |0002BA;
                       CMP.W #$0003                         ;83960F|C90300  |      ;
                       BNE ++                               ;839612|D023    |839637;
                       LDA.L $7E961C                        ;839614|AF1C967E|7E961C;
                       BNE +                                ;839618|D02F    |839649;
                       LDA.L $7E995F                        ;83961A|AF5F997E|7E995F;
                       BNE ++                               ;83961E|D017    |839637;
                       LDA.L $7E9973                        ;839620|AF73997E|7E9973;
                       BNE ++                               ;839624|D011    |839637;
                       LDA.W #$0002                         ;839626|A90200  |      ;
                       STA.L $7E9961                        ;839629|8F61997E|7E9961;
                       LDY.W #$0067                         ;83962D|A06700  |      ;
                       LDA.W #$0001                         ;839630|A90100  |      ;
                       JSR.W CODE_FN_839333                 ;839633|203393  |839333;
                       RTS                                  ;839636|60      |      ;
 
                    ++ LDY.W #$0067                         ;839637|A06700  |      ;
                       LDA.W #$0800                         ;83963A|A90008  |      ;
                       STA.B $02                            ;83963D|8502    |000002;
                       LDA.W #$0005                         ;83963F|A90500  |      ;
                       CLC                                  ;839642|18      |      ;
                       ADC.W #$0304                         ;839643|690403  |      ;
                       JSR.W CODE_FN_839B35                 ;839646|20359B  |839B35;
 
                     + RTS                                  ;839649|60      |      ;
 
       CODE_FN_83964A:
                       LDA.W #$03B8                         ;83964A|A9B803  |      ;
                       SEC                                  ;83964D|38      |      ;
                       SBC.L $7E96E3                        ;83964E|EFE3967E|7E96E3;
                       CMP.W #$0100                         ;839652|C90001  |      ;
                       BPL +                                ;839655|1043    |83969A;
                       CMP.W #$FF01                         ;839657|C901FF  |      ;
                       BMI +                                ;83965A|303E    |83969A;
                       TAX                                  ;83965C|AA      |      ;
                       LDA.W Character_1P                   ;83965D|ADBA02  |0002BA;
                       CMP.W #$0005                         ;839660|C90500  |      ;
                       BNE ++                               ;839663|D023    |839688;
                       LDA.L $7E961C                        ;839665|AF1C967E|7E961C;
                       BNE +                                ;839669|D02F    |83969A;
                       LDA.L $7E995F                        ;83966B|AF5F997E|7E995F;
                       BNE ++                               ;83966F|D017    |839688;
                       LDA.L $7E9973                        ;839671|AF73997E|7E9973;
                       BNE ++                               ;839675|D011    |839688;
                       LDA.W #$0002                         ;839677|A90200  |      ;
                       STA.L $7E9961                        ;83967A|8F61997E|7E9961;
                       LDY.W #$0067                         ;83967E|A06700  |      ;
                       LDA.W #$0002                         ;839681|A90200  |      ;
                       JSR.W CODE_FN_839333                 ;839684|203393  |839333;
                       RTS                                  ;839687|60      |      ;
 
                    ++ LDY.W #$0067                         ;839688|A06700  |      ;
                       LDA.W #$0A00                         ;83968B|A9000A  |      ;
                       STA.B $02                            ;83968E|8502    |000002;
                       LDA.W #$000A                         ;839690|A90A00  |      ;
                       CLC                                  ;839693|18      |      ;
                       ADC.W #$0304                         ;839694|690403  |      ;
                       JSR.W CODE_FN_839B35                 ;839697|20359B  |839B35;
 
                     + RTS                                  ;83969A|60      |      ;
 
       CODE_FN_83969B:
                       JSR.W CODE_FN_8395F9                 ;83969B|20F995  |8395F9;
                       JSR.W CODE_FN_83964A                 ;83969E|204A96  |83964A;
                       RTS                                  ;8396A1|60      |      ;
 
       CODE_FN_8396A2:
                       LDA.W #$FFFF                         ;8396A2|A9FFFF  |      ;
                       STA.W $02BC                          ;8396A5|8DBC02  |8302BC;
                       LDA.W #$0000                         ;8396A8|A90000  |      ;
                       STA.L $7E998B                        ;8396AB|8F8B997E|7E998B;
                       LDA.L $7E961C                        ;8396AF|AF1C967E|7E961C;
                       BEQ +                                ;8396B3|F007    |8396BC;
                       LDA.W #$0001                         ;8396B5|A90100  |      ;
                       STA.L $7E998B                        ;8396B8|8F8B997E|7E998B;
 
                     + LDA.W #$0000                         ;8396BC|A90000  |      ;
                       STA.L $7E9989                        ;8396BF|8F89997E|7E9989;
                       LDA.L $7E9973                        ;8396C3|AF73997E|7E9973;
                       BEQ +                                ;8396C7|F007    |8396D0;
                       LDA.W #$0001                         ;8396C9|A90100  |      ;
                       STA.L $7E9989                        ;8396CC|8F89997E|7E9989;
 
                     + LDA.W #$0003                         ;8396D0|A90300  |      ;
                       STA.B $76                            ;8396D3|8576    |000076;
 
                     - LDA.B $76                            ;8396D5|A576    |000076;
                       ASL A                                ;8396D7|0A      |      ;
                       ASL A                                ;8396D8|0A      |      ;
                       TAX                                  ;8396D9|AA      |      ;
                       LDA.L $7E96E3                        ;8396DA|AFE3967E|7E96E3;
                       CMP.W DATA8_8396F6,X                 ;8396DE|DDF696  |8396F6;
                       BMI +                                ;8396E1|300E    |8396F1;
                       CMP.W DATA8_8396F8,X                 ;8396E3|DDF896  |8396F8;
                       BPL +                                ;8396E6|1009    |8396F1;
                       TXA                                  ;8396E8|8A      |      ;
                       CLC                                  ;8396E9|18      |      ;
                       ADC.W #$9706                         ;8396EA|690697  |      ;
                       TAY                                  ;8396ED|A8      |      ;
                       JSR.W CODE_FN_839427                 ;8396EE|202794  |839427;
 
                     + DEC.B $76                            ;8396F1|C676    |000076;
                       BPL -                                ;8396F3|10E0    |8396D5;
                       RTS                                  ;8396F5|60      |      ;
 
         DATA8_8396F6:
                       db $00,$00                           ;8396F6|        |      ;
 
         DATA8_8396F8:
                       db $00,$02,$00,$00,$00,$02,$00,$01   ;8396F8|        |      ;
                       db $00,$03,$10,$02,$10,$03,$00,$00   ;839700|        |      ;
                       db $84,$04,$01,$01,$A6,$04,$02,$02   ;839708|        |      ;
                       db $88,$02,$04,$03,$8C,$04           ;839710|        |      ;
 
       CODE_FN_839716:
                       JSR.W CODE_FN_8396A2                 ;839716|20A296  |8396A2;
                       JSR.W CODE_FN_83969B                 ;839719|209B96  |83969B;
                       RTS                                  ;83971C|60      |      ;
 
       CODE_FN_83971D:
                       LDA.W #$0002                         ;83971D|A90200  |      ;
                       STA.B $0E                            ;839720|850E    |00000E;
 
                     - LDA.B $0E                            ;839722|A50E    |00000E;
                       ASL A                                ;839724|0A      |      ;
                       ASL A                                ;839725|0A      |      ;
                       CLC                                  ;839726|18      |      ;
                       ADC.W #$974B                         ;839727|694B97  |      ;
                       TAY                                  ;83972A|A8      |      ;
                       JSR.W CODE_FN_83946E                 ;83972B|206E94  |83946E;
                       DEC.B $0E                            ;83972E|C60E    |00000E;
                       BPL -                                ;839730|10F0    |839722;
                       LDA.L BossChars_Available            ;839732|AFD2947E|7E94D2;
                       BEQ +                                ;839736|F012    |83974A;
                       LDY.W #$9757                         ;839738|A05797  |      ;
                       JSR.W CODE_FN_83946E                 ;83973B|206E94  |83946E;
                       LDY.W #$975B                         ;83973E|A05B97  |      ;
                       JSR.W CODE_FN_83946E                 ;839741|206E94  |83946E;
                       LDY.W #$975F                         ;839744|A05F97  |      ;
                       JSR.W CODE_FN_83946E                 ;839747|206E94  |83946E;
 
                     + RTS                                  ;83974A|60      |      ;
                       db $01,$00,$48,$17,$04,$01,$20,$47   ;83974B|        |      ;
                       db $07,$02,$98,$47,$08,$03,$20,$A7   ;839753|        |      ;
                       db $0B,$04,$98,$A7,$0A,$05,$70,$A7   ;83975B|        |      ;
 
       CODE_FN_839763:
                       LDA.W #$0005                         ;839763|A90500  |      ;
                       STA.B $0E                            ;839766|850E    |00000E;
 
                     - LDA.B $0E                            ;839768|A50E    |00000E;
                       ASL A                                ;83976A|0A      |      ;
                       ASL A                                ;83976B|0A      |      ;
                       CLC                                  ;83976C|18      |      ;
                       ADC.W #$9785                         ;83976D|698597  |      ;
                       TAY                                  ;839770|A8      |      ;
                       JSR.W CODE_FN_839427                 ;839771|202794  |839427;
                       DEC.B $0E                            ;839774|C60E    |00000E;
                       BPL -                                ;839776|10F0    |839768;
                       LDA.L BossChars_Available            ;839778|AFD2947E|7E94D2;
                       BEQ +                                ;83977C|F006    |839784;
                       LDY.W #$979D                         ;83977E|A09D97  |      ;
                       JSR.W CODE_FN_839427                 ;839781|202794  |839427;
 
                     + RTS                                  ;839784|60      |      ;
                       db $0C,$00,$70,$02,$00,$01,$C8,$00   ;839785|        |      ;
                       db $02,$02,$DC,$00,$05,$03,$52,$02   ;83978D|        |      ;
                       db $03,$04,$E6,$00,$06,$05,$5C,$02   ;839795|        |      ;
                       db $09,$06,$52,$05                   ;83979D|        |      ;
 
       CODE_FN_8397A1:
                       ASL A                                ;8397A1|0A      |      ;
                       ASL A                                ;8397A2|0A      |      ;
                       ASL A                                ;8397A3|0A      |      ;
                       ASL A                                ;8397A4|0A      |      ;
                       STA.B $00                            ;8397A5|8500    |000000;
                       TYA                                  ;8397A7|98      |      ;
                       CLC                                  ;8397A8|18      |      ;
                       ADC.B $00                            ;8397A9|6500    |000000;
                       TAY                                  ;8397AB|A8      |      ;
                       LDA.W #$0000                         ;8397AC|A90000  |      ;
                       STA.L $7E9961                        ;8397AF|8F61997E|7E9961;
                       LDA.W #$0327                         ;8397B3|A92703  |      ;
                       JSR.W CODE_FN_839ABD                 ;8397B6|20BD9A  |839ABD;
                       RTS                                  ;8397B9|60      |      ;
 
       CODE_FN_8397BA:
                       LDA.W #$0000                         ;8397BA|A90000  |      ;
                       STA.L $7E9961                        ;8397BD|8F61997E|7E9961;
                       LDA.L $7E96F5                        ;8397C1|AFF5967E|7E96F5;
                       TAY                                  ;8397C5|A8      |      ;
                       LDA.W DATA8_839812,Y                 ;8397C6|B91298  |839812;
                       AND.W #$00FF                         ;8397C9|29FF00  |      ;
                       TAY                                  ;8397CC|A8      |      ;
                       LDA.L $7E96F5                        ;8397CD|AFF5967E|7E96F5;
                       CMP.W #$0003                         ;8397D1|C90300  |      ;
                       BEQ +                                ;8397D4|F00F    |8397E5;
                       LDA.L $7E96E7                        ;8397D6|AFE7967E|7E96E7;
                       TAX                                  ;8397DA|AA      |      ;
                       LDA.W DATA8_839804,X                 ;8397DB|BD0498  |839804;
                       AND.W #$00FF                         ;8397DE|29FF00  |      ;
                       TAX                                  ;8397E1|AA      |      ;
                       INC A                                ;8397E2|1A      |      ;
                       BRA ++                               ;8397E3|8015    |8397FA;
 
                     + LDA.L $7E96E7                        ;8397E5|AFE7967E|7E96E7;
                       TAX                                  ;8397E9|AA      |      ;
                       LDA.W DATA8_8397FE,X                 ;8397EA|BDFE97  |8397FE;
                       AND.W #$00FF                         ;8397ED|29FF00  |      ;
                       STA.B $02                            ;8397F0|8502    |000002;
                       LDA.W DATA8_839801,X                 ;8397F2|BD0198  |839801;
                       AND.W #$00FF                         ;8397F5|29FF00  |      ;
                       LDX.B $02                            ;8397F8|A602    |000002;
 
                    ++ JSR.W CODE_FN_839A81                 ;8397FA|20819A  |839A81;
                       RTS                                  ;8397FD|60      |      ;
 
         DATA8_8397FE:
                       db $64,$A7,$BB                       ;8397FE|        |      ;
 
         DATA8_839801:
                       db $7B,$A8,$C4                       ;839801|        |      ;
 
         DATA8_839804:
                       db $5F,$67,$6F,$77,$7F,$87,$8F,$97   ;839804|        |      ;
                       db $9F,$A7,$AF,$B7,$BF,$C7           ;83980C|        |      ;
 
         DATA8_839812:
                       db $97,$A7,$B7,$C7                   ;839812|        |      ;
 
Menu_DrawPasswordUnderscore:
                       LDA.L Password_Input_Length          ;839816|AF0C967E|7E960C;
                       CMP.W #$0008                         ;83981A|C90800  |      ; is password fully filled out?
                       BEQ +                                ;83981D|F027    |839846; branch if yes
                       INC A                                ;83981F|1A      |      ;
                       ASL A                                ;839820|0A      |      ;
                       ASL A                                ;839821|0A      |      ;
                       ASL A                                ;839822|0A      |      ;
                       CLC                                  ;839823|18      |      ;
                       ADC.W #$0058                         ;839824|695800  |      ;
                       TAX                                  ;839827|AA      |      ;
                       LDY.W #$0086                         ;839828|A08600  |      ;
                       LDA.W #$92FB                         ;83982B|A9FB92  |      ;
                       STA.B $00                            ;83982E|8500    |000000;
                       LDA.W #$0001                         ;839830|A90100  |      ;
                       STA.L $7E9961                        ;839833|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;839837|20F085  |8385F0;
                       LDA.L $7E9967                        ;83983A|AF67997E|7E9967;
                       BNE +                                ;83983E|D006    |839846;
                       LDA.W #$0016                         ;839840|A91600  |      ;
                       JSR.W CODE_FN_839B68                 ;839843|20689B  |839B68;
 
                     + RTS                                  ;839846|60      |      ;
 
       CODE_FN_839847:
                       LDA.W #$0000                         ;839847|A90000  |      ;
                       STA.L $7E9961                        ;83984A|8F61997E|7E9961;
                       LDA.L $7E9973                        ;83984E|AF73997E|7E9973;
                       CLC                                  ;839852|18      |      ;
                       ADC.W #$004B                         ;839853|694B00  |      ;
                       TAX                                  ;839856|AA      |      ;
                       LDY.W #$0060                         ;839857|A06000  |      ;
                       LDA.W #$02F5                         ;83985A|A9F502  |      ;
                       JSR.W CODE_FN_839ABD                 ;83985D|20BD9A  |839ABD;
                       RTS                                  ;839860|60      |      ;
 
       CODE_FN_839861:
                       LDA.L $7E9965                        ;839861|AF65997E|7E9965;
                       BEQ +                                ;839865|F012    |839879;
 
       CODE_FN_839867:
                       LDA.L $7E9973                        ;839867|AF73997E|7E9973;
                       CLC                                  ;83986B|18      |      ;
                       ADC.W #$0048                         ;83986C|694800  |      ;
                       TAX                                  ;83986F|AA      |      ;
                       LDY.W #$0056                         ;839870|A05600  |      ;
                       LDA.W #$0303                         ;839873|A90303  |      ;
                       JSR.W CODE_FN_839B35                 ;839876|20359B  |839B35;
 
                     + RTS                                  ;839879|60      |      ;
 
       CODE_FN_83987A:
                       LDA.W #$0000                         ;83987A|A90000  |      ;
                       STA.L $7E9961                        ;83987D|8F61997E|7E9961;
                       LDX.W Difficulty                     ;839881|AEAA02  |8302AA;
                       LDA.W DATA8_83989A,X                 ;839884|BD9A98  |83989A;
                       AND.W #$00FF                         ;839887|29FF00  |      ;
                       TAX                                  ;83988A|AA      |      ;
                       LDY.W #$0091                         ;83988B|A09100  |      ;
                       LDA.W #$0001                         ;83988E|A90100  |      ;
                       STA.B $02                            ;839891|8502    |000002;
                       LDA.W #$0328                         ;839893|A92803  |      ;
                       JSR.W CODE_FN_839A02                 ;839896|20029A  |839A02;
                       RTS                                  ;839899|60      |      ;
 
         DATA8_83989A:
                       db $48,$80,$B8                       ;83989A|        |      ;
 
       CODE_FN_83989D:
                       LDA.W #$0000                         ;83989D|A90000  |      ;
                       STA.L $7E9961                        ;8398A0|8F61997E|7E9961;
                       LDA.L $7E96F5                        ;8398A4|AFF5967E|7E96F5;
                       TAY                                  ;8398A8|A8      |      ;
                       LDA.W DATA8_8398D5,Y                 ;8398A9|B9D598  |8398D5;
                       AND.W #$00FF                         ;8398AC|29FF00  |      ;
                       STA.B $00                            ;8398AF|8500    |000000;
                       LDA.L $7E96E7                        ;8398B1|AFE7967E|7E96E7;
                       TAY                                  ;8398B5|A8      |      ;
                       LDA.W DATA8_8398D2,Y                 ;8398B6|B9D298  |8398D2;
                       AND.W #$00FF                         ;8398B9|29FF00  |      ;
                       STA.B $02                            ;8398BC|8502    |000002;
                       LDY.B $00                            ;8398BE|A400    |000000;
                       LDA.L $7E9610                        ;8398C0|AF10967E|7E9610;
                       BNE +                                ;8398C4|D006    |8398CC;
                       LDX.B $02                            ;8398C6|A602    |000002;
                       JSR.W CODE_FN_839A25                 ;8398C8|20259A  |839A25;
                       RTS                                  ;8398CB|60      |      ;
 
                     + LDX.B $02                            ;8398CC|A602    |000002;
                       JSR.W CODE_FN_839A4E                 ;8398CE|204E9A  |839A4E;
                       RTS                                  ;8398D1|60      |      ;
 
         DATA8_8398D2:
                       db $4F,$77,$9F                       ;8398D2|        |      ;
 
         DATA8_8398D5:
                       db $4E,$7E                           ;8398D5|        |      ;
 
       CODE_FN_8398D7:
                       LDA.W Character_1P                   ;8398D7|ADBA02  |8302BA;
                       CMP.W #$0006                         ;8398DA|C90600  |      ;
                       BEQ +                                ;8398DD|F02F    |83990E;
                       LDA.W #$0000                         ;8398DF|A90000  |      ;
                       STA.L $7E9961                        ;8398E2|8F61997E|7E9961;
                       LDA.L $7E96E7                        ;8398E6|AFE7967E|7E96E7;
                       TAX                                  ;8398EA|AA      |      ;
                       LDA.L $7E96F5                        ;8398EB|AFF5967E|7E96F5;
                       CMP.W #$0003                         ;8398EF|C90300  |      ;
                       BEQ +                                ;8398F2|F01A    |83990E;
                       TAY                                  ;8398F4|A8      |      ;
                       LDA.W DATA8_83990F,X                 ;8398F5|BD0F99  |83990F;
                       AND.W #$00FF                         ;8398F8|29FF00  |      ;
                       TAX                                  ;8398FB|AA      |      ;
                       LDA.W DATA8_839911,Y                 ;8398FC|B91199  |839911;
                       AND.W #$00FF                         ;8398FF|29FF00  |      ;
                       TAY                                  ;839902|A8      |      ;
                       LDA.W #$0002                         ;839903|A90200  |      ;
                       STA.B $02                            ;839906|8502    |000002;
                       LDA.W #$0014                         ;839908|A91400  |      ;
                       JSR.W CODE_FN_839A02                 ;83990B|20029A  |839A02;
 
                     + RTS                                  ;83990E|60      |      ;
 
         DATA8_83990F:
                       db $43,$BB                           ;83990F|        |      ;
 
         DATA8_839911:
                       db $40,$80,$C0                       ;839911|        |      ;
 
       CODE_FN_839914:
                       LDA.L $7E9973                        ;839914|AF73997E|7E9973;
                       BEQ +                                ;839918|F001    |83991B;
 
                     - RTS                                  ;83991A|60      |      ;
 
                     + LDA.W $0342                          ;83991B|AD4203  |830342;
                       CMP.W #$0006                         ;83991E|C90600  |      ;
                       BNE -                                ;839921|D0F7    |83991A;
 
       CODE_FN_839923:
                       LDA.W #$0001                         ;839923|A90100  |      ;
                       STA.L $7E9961                        ;839926|8F61997E|7E9961;
                       LDX.W #$007F                         ;83992A|A27F00  |      ;
                       LDY.W #$00C8                         ;83992D|A0C800  |      ;
                       LDA.W #$0017                         ;839930|A91700  |      ;
                       JSR.W CODE_FN_839ADF                 ;839933|20DF9A  |839ADF;
                       RTS                                  ;839936|60      |      ;
 
       CODE_FN_839937:
                       LDA.W Character_1P                   ;839937|ADBA02  |8302BA;
                       CMP.W #$0006                         ;83993A|C90600  |      ;
                       BNE +                                ;83993D|D018    |839957;
                       db $A9,$00,$00,$8F,$61,$99,$7E,$A9   ;83993F|        |      ;
                       db $02,$00,$85,$02,$A2,$7F,$00,$A0   ;839947|        |      ;
                       db $93,$00,$A9,$17,$00,$20,$02,$9A   ;83994F|        |000000;
 
                     + RTS                                  ;839957|60      |      ;
 
       CODE_FN_839958:
                       LDA.W #$0000                         ;839958|A90000  |      ;
                       STA.L $7E9961                        ;83995B|8F61997E|7E9961;
                       JSR.W CODE_FN_83996F                 ;83995F|206F99  |83996F;
                       LDA.L $7E961C                        ;839962|AF1C967E|7E961C;
                       BNE +                                ;839966|D006    |83996E;
                       LDA.W #$02F5                         ;839968|A9F502  |      ;
                       JSR.W CODE_FN_839B35                 ;83996B|20359B  |839B35;
 
                     + RTS                                  ;83996E|60      |      ;
 
       CODE_FN_83996F:
                       LDA.L $7E96F5                        ;83996F|AFF5967E|7E96F5;
                       TAX                                  ;839973|AA      |      ;
                       LDA.W DATA8_83998D,X                 ;839974|BD8D99  |83998D;
                       AND.W #$00FF                         ;839977|29FF00  |      ;
                       TAY                                  ;83997A|A8      |      ;
                       LDA.L $7E96E7                        ;83997B|AFE7967E|7E96E7;
                       TAX                                  ;83997F|AA      |      ;
                       LDA.W DATA8_839988,X                 ;839980|BD8899  |839988;
                       AND.W #$00FF                         ;839983|29FF00  |      ;
                       TAX                                  ;839986|AA      |      ;
                       RTS                                  ;839987|60      |      ;
 
         DATA8_839988:
                       db $88,$90,$98                       ;839988|        |      ;
                       db $A0                               ;83998B|        |      ;
                       db $A8                               ;83998C|        |      ;
 
         DATA8_83998D:
                       db $7A,$8A                           ;83998D|        |      ;
 
       CODE_FN_83998F:
                       PHX                                  ;83998F|DA      |      ;
                       LDY.W DATA8_8399B5,X                 ;839990|BCB599  |8399B5;
                       BRA +                                ;839993|8004    |839999;
 
       CODE_FN_839995:
                       PHX                                  ;839995|DA      |      ;
                       LDY.W DATA8_8399B9,X                 ;839996|BCB999  |8399B9;
 
                     + TXA                                  ;839999|8A      |      ;
                       LSR A                                ;83999A|4A      |      ;
                       STA.L $7E9961                        ;83999B|8F61997E|7E9961;
                       LDA.W Difficulty_1P,X                ;83999F|BDAC02  |8302AC;
                       LDX.W #$0005                         ;8399A2|A20500  |      ;
                       JSR.W CODE_FN_8385CD                 ;8399A5|20CD85  |8385CD;
                       CLC                                  ;8399A8|18      |      ;
                       ADC.W #$0089                         ;8399A9|698900  |      ;
                       TAX                                  ;8399AC|AA      |      ;
                       LDA.W #$02F5                         ;8399AD|A9F502  |      ;
                       JSR.W CODE_FN_839ABD                 ;8399B0|20BD9A  |839ABD;
                       PLX                                  ;8399B3|FA      |      ;
                       RTS                                  ;8399B4|60      |      ;
 
         DATA8_8399B5:
                       db $50,$00,$A8,$00                   ;8399B5|        |      ;
 
         DATA8_8399B9:
                       db $58,$00,$98,$00                   ;8399B9|        |      ;
 
       CODE_FN_8399BD:
                       LDA.W #$0000                         ;8399BD|A90000  |      ;
                       CPX.W #$0000                         ;8399C0|E00000  |      ;
                       BEQ +                                ;8399C3|F003    |8399C8;
                       LDA.W #$0001                         ;8399C5|A90100  |      ;
 
                     + STA.L $7E9961                        ;8399C8|8F61997E|7E9961;
                       LDA.L $7E96F5,X                      ;8399CC|BFF5967E|7E96F5;
                       TAY                                  ;8399D0|A8      |      ;
                       LDA.W DATA8_8399FF,Y                 ;8399D1|B9FF99  |8399FF;
                       AND.W #$00FF                         ;8399D4|29FF00  |      ;
                       STA.B $00                            ;8399D7|8500    |000000;
                       LDA.L $7E96E7,X                      ;8399D9|BFE7967E|7E96E7;
                       TAY                                  ;8399DD|A8      |      ;
                       LDA.W DATA8_8399FA,Y                 ;8399DE|B9FA99  |8399FA;
                       AND.W #$00FF                         ;8399E1|29FF00  |      ;
                       STA.B $02                            ;8399E4|8502    |000002;
                       LDY.B $00                            ;8399E6|A400    |000000;
                       LDA.L $7E9610,X                      ;8399E8|BF10967E|7E9610;
                       BNE +                                ;8399EC|D006    |8399F4;
                       LDX.B $02                            ;8399EE|A602    |000002;
                       JSR.W CODE_FN_839A25                 ;8399F0|20259A  |839A25;
                       RTS                                  ;8399F3|60      |      ;
 
                     + LDX.B $02                            ;8399F4|A602    |000002;
                       JSR.W CODE_FN_839A4E                 ;8399F6|204E9A  |839A4E;
                       RTS                                  ;8399F9|60      |      ;
 
         DATA8_8399FA:
                       db $2F,$57,$7F,$A7,$CF               ;8399FA|        |      ;
 
         DATA8_8399FF:
                       db $26,$56,$B6                       ;8399FF|        |      ;
 
       CODE_FN_839A02:
                       STA.B $0E                            ;839A02|850E    |00000E;
                       PHX                                  ;839A04|DA      |      ;
                       PHY                                  ;839A05|5A      |      ;
                       LDA.B $A9                            ;839A06|A5A9    |0000A9;
                       LSR A                                ;839A08|4A      |      ;
                       LSR A                                ;839A09|4A      |      ;
                       LSR A                                ;839A0A|4A      |      ;
                       AND.W #$0001                         ;839A0B|290100  |      ;
                       CLC                                  ;839A0E|18      |      ;
                       ADC.B $0E                            ;839A0F|650E    |00000E;
                       PLY                                  ;839A11|7A      |      ;
                       PLX                                  ;839A12|FA      |      ;
                       PHA                                  ;839A13|48      |      ;
                       LDA.B $02                            ;839A14|A502    |000002;
                       CMP.W #$0001                         ;839A16|C90100  |      ;
                       BNE +                                ;839A19|D005    |839A20;
                       PLA                                  ;839A1B|68      |      ;
                       JSR.W CODE_FN_839B35                 ;839A1C|20359B  |839B35;
                       RTS                                  ;839A1F|60      |      ;
 
                     + PLA                                  ;839A20|68      |      ;
                       JSR.W CODE_FN_839B68                 ;839A21|20689B  |839B68;
                       RTS                                  ;839A24|60      |      ;
 
       CODE_FN_839A25:
                       PHX                                  ;839A25|DA      |      ;
                       PHY                                  ;839A26|5A      |      ;
                       LDA.B $A9                            ;839A27|A5A9    |0000A9;
                       LSR A                                ;839A29|4A      |      ;
                       LSR A                                ;839A2A|4A      |      ;
                       LSR A                                ;839A2B|4A      |      ;
                       AND.W #$0001                         ;839A2C|290100  |      ;
                       STA.B $02                            ;839A2F|8502    |000002;
                       LDA.L $7E9961                        ;839A31|AF61997E|7E9961;
                       ASL A                                ;839A35|0A      |      ;
                       CLC                                  ;839A36|18      |      ;
                       ADC.B $02                            ;839A37|6502    |000002;
                       TAY                                  ;839A39|A8      |      ;
                       LDA.W DATA8_839A4A,Y                 ;839A3A|B94A9A  |839A4A;
                       AND.W #$00FF                         ;839A3D|29FF00  |      ;
                       CLC                                  ;839A40|18      |      ;
                       ADC.W #$02E9                         ;839A41|69E902  |      ;
                       PLY                                  ;839A44|7A      |      ;
                       PLX                                  ;839A45|FA      |      ;
                       JSR.W CODE_FN_839B35                 ;839A46|20359B  |839B35;
                       RTS                                  ;839A49|60      |      ;
 
         DATA8_839A4A:
                       db $00,$01,$03,$02                   ;839A4A|        |      ;
 
       CODE_FN_839A4E:
                       PHX                                  ;839A4E|DA      |      ;
                       PHY                                  ;839A4F|5A      |      ;
                       LDA.L $7E9961                        ;839A50|AF61997E|7E9961;
                       TAY                                  ;839A54|A8      |      ;
                       ASL A                                ;839A55|0A      |      ;
                       TAX                                  ;839A56|AA      |      ;
                       LDA.L $7E9610,X                      ;839A57|BF10967E|7E9610;
                       DEC A                                ;839A5B|3A      |      ;
                       BEQ +                                ;839A5C|F007    |839A65;
                       STA.L $7E9610,X                      ;839A5E|9F10967E|7E9610;
                       PLY                                  ;839A62|7A      |      ;
                       PLX                                  ;839A63|FA      |      ;
                       RTS                                  ;839A64|60      |      ;
 
                     + LDA.B $A9                            ;839A65|A5A9    |0000A9;
                       LSR A                                ;839A67|4A      |      ;
                       LSR A                                ;839A68|4A      |      ;
                       LSR A                                ;839A69|4A      |      ;
                       BCC +                                ;839A6A|9010    |839A7C;
                       LDA.W DATA8_839A7F,Y                 ;839A6C|B97F9A  |839A7F;
                       AND.W #$00FF                         ;839A6F|29FF00  |      ;
                       CLC                                  ;839A72|18      |      ;
                       ADC.W #$02E9                         ;839A73|69E902  |      ;
                       PLY                                  ;839A76|7A      |      ;
                       PLX                                  ;839A77|FA      |      ;
                       JSR.W CODE_FN_839B35                 ;839A78|20359B  |839B35;
                       RTS                                  ;839A7B|60      |      ;
 
                     + PLY                                  ;839A7C|7A      |      ;
                       PLX                                  ;839A7D|FA      |      ;
                       RTS                                  ;839A7E|60      |      ;
 
         DATA8_839A7F:
                       db $01,$03                           ;839A7F|        |      ;
 
       CODE_FN_839A81:
                       STA.B $0C                            ;839A81|850C    |00000C;
                       PHX                                  ;839A83|DA      |      ;
                       PHY                                  ;839A84|5A      |      ;
                       LDA.W #$92FB                         ;839A85|A9FB92  |      ;
                       STA.B $00                            ;839A88|8500    |000000;
                       JSR.W CODE_FN_8385F0                 ;839A8A|20F085  |8385F0;
                       LDA.L $7E9961                        ;839A8D|AF61997E|7E9961;
                       ASL A                                ;839A91|0A      |      ;
                       TAX                                  ;839A92|AA      |      ;
                       ASL A                                ;839A93|0A      |      ;
                       CLC                                  ;839A94|18      |      ;
                       ADC.L $7E9965,X                      ;839A95|7F65997E|7E9965;
                       CLC                                  ;839A99|18      |      ;
                       ADC.L $7E9965,X                      ;839A9A|7F65997E|7E9965;
                       TAY                                  ;839A9E|A8      |      ;
                       LDA.W DATA8_839AB9,Y                 ;839A9F|B9B99A  |839AB9;
                       CLC                                  ;839AA2|18      |      ;
                       ADC.W #$0323                         ;839AA3|692303  |      ;
                       STA.B $0E                            ;839AA6|850E    |00000E;
                       PLY                                  ;839AA8|7A      |      ;
                       PLX                                  ;839AA9|FA      |      ;
                       PHY                                  ;839AAA|5A      |      ;
                       JSR.W CODE_FN_839B35                 ;839AAB|20359B  |839B35;
                       PLY                                  ;839AAE|7A      |      ;
                       LDA.B $0C                            ;839AAF|A50C    |00000C;
                       TAX                                  ;839AB1|AA      |      ;
                       LDA.B $0E                            ;839AB2|A50E    |00000E;
                       INC A                                ;839AB4|1A      |      ;
                       JSR.W CODE_FN_839B35                 ;839AB5|20359B  |839B35;
                       RTS                                  ;839AB8|60      |      ;
 
         DATA8_839AB9:
                       db $00,$00,$02,$00                   ;839AB9|        |      ;
 
       CODE_FN_839ABD:
                       PHA                                  ;839ABD|48      |      ;
                       PHX                                  ;839ABE|DA      |      ;
                       PHY                                  ;839ABF|5A      |      ;
                       LDA.W #$92FE                         ;839AC0|A9FE92  |      ;
                       STA.B $00                            ;839AC3|8500    |000000;
                       JSR.W CODE_FN_8385F0                 ;839AC5|20F085  |8385F0;
                       LDA.L $7E9961                        ;839AC8|AF61997E|7E9961;
                       ASL A                                ;839ACC|0A      |      ;
                       TAX                                  ;839ACD|AA      |      ;
                       LDA.L $7E9965,X                      ;839ACE|BF65997E|7E9965;
                       BNE +                                ;839AD2|D007    |839ADB;
                       PLY                                  ;839AD4|7A      |      ;
                       PLX                                  ;839AD5|FA      |      ;
                       PLA                                  ;839AD6|68      |      ;
                       JSR.W CODE_FN_839B35                 ;839AD7|20359B  |839B35;
                       RTS                                  ;839ADA|60      |      ;
 
                     + PLY                                  ;839ADB|7A      |      ;
                       PLX                                  ;839ADC|FA      |      ;
                       PLA                                  ;839ADD|68      |      ;
                       RTS                                  ;839ADE|60      |      ;
 
       CODE_FN_839ADF:
                       PHA                                  ;839ADF|48      |      ;
                       PHX                                  ;839AE0|DA      |      ;
                       PHY                                  ;839AE1|5A      |      ;
                       LDA.W #$9B22                         ;839AE2|A9229B  |      ;
                       STA.B $00                            ;839AE5|8500    |000000;
                       JSR.W CODE_FN_8385F0                 ;839AE7|20F085  |8385F0;
                       LDA.L $7E9961                        ;839AEA|AF61997E|7E9961;
                       ASL A                                ;839AEE|0A      |      ;
                       TAX                                  ;839AEF|AA      |      ;
                       LDA.L $7E9965,X                      ;839AF0|BF65997E|7E9965;
                       BEQ +                                ;839AF4|F010    |839B06;
                       LDX.W #$0006                         ;839AF6|A20600  |      ;
 
                     - LDA.W CODE_009B25,X                  ;839AF9|BD259B  |009B25;
                       STA.L $7E8802,X                      ;839AFC|9F02887E|7E8802;
                       DEX                                  ;839B00|CA      |      ;
                       DEX                                  ;839B01|CA      |      ;
                       BPL -                                ;839B02|10F5    |839AF9;
                       BRA ++                               ;839B04|800E    |839B14;
 
                     + LDX.W #$0006                         ;839B06|A20600  |      ;
 
                     - LDA.W LOOSE_OP_009B2D,X              ;839B09|BD2D9B  |009B2D;
                       STA.L $7E8802,X                      ;839B0C|9F02887E|7E8802;
                       DEX                                  ;839B10|CA      |      ;
                       DEX                                  ;839B11|CA      |      ;
                       BPL -                                ;839B12|10F5    |839B09;
 
                    ++ PLY                                  ;839B14|7A      |      ;
                       PLX                                  ;839B15|FA      |      ;
                       PLA                                  ;839B16|68      |      ;
                       CLC                                  ;839B17|18      |      ;
                       ADC.W #$02E9                         ;839B18|69E902  |      ;
                       JSR.W CODE_FN_839B35                 ;839B1B|20359B  |839B35;
                       JSR.W CODE_FN_83A10E                 ;839B1E|200EA1  |83A10E;
                       RTS                                  ;839B21|60      |      ;
                       db $02,$13,$13,$FF,$7F,$CD,$72,$63   ;839B22|        |      ;
                       db $61,$00,$59,$7B,$6F,$49,$62,$E0   ;839B2A|        |      ;
                       db $50,$A0,$48                       ;839B32|        |      ;
 
       CODE_FN_839B35:
                       STA.B $D3                            ;839B35|85D3    |0000D3;
                       LDA.W #$8100                         ;839B37|A90081  |      ;
                       STA.B $D6                            ;839B3A|85D6    |0000D6;
                       LDA.W #$8000                         ;839B3C|A90080  |      ;
                       STA.B $D5                            ;839B3F|85D5    |0000D5;
                       STX.B $CF                            ;839B41|86CF    |0000CF;
                       STY.B $D1                            ;839B43|84D1    |0000D1;
                       JSL.L CODE_FL_80BBAF                 ;839B45|22AFBB80|80BBAF;
                       RTS                                  ;839B49|60      |      ;
                       db $85,$D3,$A9,$00,$81,$85,$D6,$A9   ;839B4A|        |0000D3;
                       db $00,$80,$85,$D5,$86,$CF,$84,$D1   ;839B52|        |      ;
                       db $A9,$FF,$F1,$85,$D8,$A5,$00,$85   ;839B5A|        |      ;
                       db $DA,$22,$55,$BC,$80,$60           ;839B62|        |      ;
 
       CODE_FN_839B68:
                       STA.B $D3                            ;839B68|85D3    |0000D3;
                       LDA.W #$8600                         ;839B6A|A90086  |      ;
                       STA.B $D6                            ;839B6D|85D6    |0000D6;
                       LDA.W #$E18D                         ;839B6F|A98DE1  |      ;
                       STA.B $D5                            ;839B72|85D5    |0000D5;
                       STX.B $CF                            ;839B74|86CF    |0000CF;
                       STY.B $D1                            ;839B76|84D1    |0000D1;
                       JSL.L CODE_FL_80BBAF                 ;839B78|22AFBB80|80BBAF;
                       RTS                                  ;839B7C|60      |      ;
                       db $20,$68,$9B,$6B,$85,$D3,$A9,$00   ;839B7D|        |839B68;
                       db $86,$85,$D6,$A9,$8D,$E1,$85,$D5   ;839B85|        |000085;
                       db $86,$CF,$84,$D1,$A9,$FF,$F1,$85   ;839B8D|        |0000CF;
                       db $D8,$A5,$00,$85,$DA,$22,$55,$BC   ;839B95|        |      ;
                       db $80,$60                           ;839B9D|        |839BFF;
 
       CODE_FN_839B9F:
                       LDA.W #$9304                         ;839B9F|A90493  |      ;
                       STA.B $00                            ;839BA2|8500    |000000;
                       LDA.W #$0000                         ;839BA4|A90000  |      ;
                       STA.L $7E9961                        ;839BA7|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;839BAB|20F085  |8385F0;
                       LDA.L $7E9965                        ;839BAE|AF65997E|7E9965;
                       TAX                                  ;839BB2|AA      |      ;
                       LDA.W DATA8_839C0F,X                 ;839BB3|BD0F9C  |839C0F;
                       AND.W #$00FF                         ;839BB6|29FF00  |      ;
                       CLC                                  ;839BB9|18      |      ;
                       ADC.W #$0000                         ;839BBA|690000  |      ;
                       LDX.W #$0030                         ;839BBD|A23000  |      ;
                       LDY.W #$0047                         ;839BC0|A04700  |      ;
                       JSR.W CODE_FN_839B68                 ;839BC3|20689B  |839B68;
                       LDA.L $7E9965                        ;839BC6|AF65997E|7E9965;
                       TAX                                  ;839BCA|AA      |      ;
                       LDA.W DATA8_839C11,X                 ;839BCB|BD119C  |839C11;
                       AND.W #$00FF                         ;839BCE|29FF00  |      ;
                       CLC                                  ;839BD1|18      |      ;
                       ADC.W #$0000                         ;839BD2|690000  |      ;
                       LDX.W #$0030                         ;839BD5|A23000  |      ;
                       LDY.W #$0097                         ;839BD8|A09700  |      ;
                       JSR.W CODE_FN_839B68                 ;839BDB|20689B  |839B68;
                       LDA.L $7E9965                        ;839BDE|AF65997E|7E9965;
                       TAX                                  ;839BE2|AA      |      ;
                       LDA.W DATA8_839C13,X                 ;839BE3|BD139C  |839C13;
                       AND.W #$00FF                         ;839BE6|29FF00  |      ;
                       CLC                                  ;839BE9|18      |      ;
                       ADC.W #$0000                         ;839BEA|690000  |      ;
                       LDX.W #$0090                         ;839BED|A29000  |      ;
                       LDY.W #$0097                         ;839BF0|A09700  |      ;
                       JSR.W CODE_FN_839B68                 ;839BF3|20689B  |839B68;
                       LDA.L $7E9965                        ;839BF6|AF65997E|7E9965;
                       TAX                                  ;839BFA|AA      |      ;
                       LDA.W DATA8_839C15,X                 ;839BFB|BD159C  |839C15;
                       AND.W #$00FF                         ;839BFE|29FF00  |      ;
                       CLC                                  ;839C01|18      |      ;
                       ADC.W #$0000                         ;839C02|690000  |      ;
                       LDX.W #$0088                         ;839C05|A28800  |      ;
                       LDY.W #$003F                         ;839C08|A03F00  |      ;
                       JSR.W CODE_FN_839B68                 ;839C0B|20689B  |839B68;
                       RTS                                  ;839C0E|60      |      ;
 
         DATA8_839C0F:
                       db $03,$04                           ;839C0F|        |      ;
 
         DATA8_839C11:
                       db $05,$06                           ;839C11|        |      ;
 
         DATA8_839C13:
                       db $07,$08                           ;839C13|        |      ;
 
         DATA8_839C15:
                       db $0E,$0F                           ;839C15|        |      ;
 
       CODE_FN_839C17:
                       LDA.W #$9C45                         ;839C17|A9459C  |      ;
                       STA.B $00                            ;839C1A|8500    |000000;
                       LDA.W #$0004                         ;839C1C|A90400  |      ;
                       STA.L $7E9961                        ;839C1F|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;839C23|20F085  |8385F0;
                       LDA.W #$0200                         ;839C26|A90002  |      ;
                       STA.B $00                            ;839C29|8500    |000000;
                       LDA.L $7E996D                        ;839C2B|AF6D997E|7E996D;
                       TAX                                  ;839C2F|AA      |      ;
                       LDA.W DATA8_839C52,X                 ;839C30|BD529C  |839C52;
                       AND.W #$00FF                         ;839C33|29FF00  |      ;
                       CLC                                  ;839C36|18      |      ;
                       ADC.W #$00C0                         ;839C37|69C000  |      ;
                       TAY                                  ;839C3A|A8      |      ;
                       LDX.W #$005F                         ;839C3B|A25F00  |      ;
                       LDA.W #$000B                         ;839C3E|A90B00  |      ;
                       JSR.W CODE_FN_839B68                 ;839C41|20689B  |839B68;
                       RTS                                  ;839C44|60      |      ;
                       db $0C,$10,$07,$03,$01,$03,$07,$10   ;839C45|        |      ;
                       db $07,$03,$01,$03,$07               ;839C4D|        |      ;
 
         DATA8_839C52:
                       db $06,$05,$04,$03,$02,$01,$00,$01   ;839C52|        |      ;
                       db $02,$03,$04,$05                   ;839C5A|        |      ;
 
       CODE_FN_839C5E:
                       LDA.L $7E962C                        ;839C5E|AF2C967E|7E962C;
                       BNE +                                ;839C62|D024    |839C88;
                       LDA.W #$8000                         ;839C64|A90080  |      ;
                       STA.B $00                            ;839C67|8500    |000000;
                       LDA.W #$0005                         ;839C69|A90500  |      ;
                       STA.L $7E9961                        ;839C6C|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;839C70|20F085  |8385F0;
                       LDA.L $7E996F                        ;839C73|AF6F997E|7E996F;
                       ORA.L $7E9983                        ;839C77|0F83997E|7E9983;
                       BNE +                                ;839C7B|D00B    |839C88;
                       LDA.W #$0000                         ;839C7D|A90000  |      ;
                       STA.L $7E9973                        ;839C80|8F73997E|7E9973;
                       STA.L $7E9987                        ;839C84|8F87997E|7E9987;
 
                     + LDA.L $7E995F                        ;839C88|AF5F997E|7E995F;
                       BNE UNREACH_839C9F                   ;839C8C|D011    |839C9F;
                       LDA.W #$9D53                         ;839C8E|A9539D  |      ;
                       STA.B $00                            ;839C91|8500    |000000;
                       LDA.W #$0006                         ;839C93|A90600  |      ;
                       STA.L $7E9961                        ;839C96|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;839C9A|20F085  |8385F0;
                       BRA +                                ;839C9D|8003    |839CA2;
 
       UNREACH_839C9F:
                       db $20,$23,$85                       ;839C9F|        |838523;
 
                     + LDA.L $7E996F                        ;839CA2|AF6F997E|7E996F;
                       TAX                                  ;839CA6|AA      |      ;
                       LDA.W DATA8_83800F,X                 ;839CA7|BD0F80  |83800F;
                       AND.W #$00FF                         ;839CAA|29FF00  |      ;
                       CLC                                  ;839CAD|18      |      ;
                       ADC.W #$00C0                         ;839CAE|69C000  |      ;
                       CLC                                  ;839CB1|18      |      ;
                       ADC.L $7E9622                        ;839CB2|6F22967E|7E9622;
                       TAY                                  ;839CB6|A8      |      ;
                       LDA.W #$00D0                         ;839CB7|A9D000  |      ;
                       CLC                                  ;839CBA|18      |      ;
                       ADC.L $7E9620                        ;839CBB|6F20967E|7E9620;
                       TAX                                  ;839CBF|AA      |      ;
                       PHX                                  ;839CC0|DA      |      ;
                       PHY                                  ;839CC1|5A      |      ;
                       LDA.L $7E9971                        ;839CC2|AF71997E|7E9971;
                       BEQ +                                ;839CC6|F011    |839CD9;
                       DEC A                                ;839CC8|3A      |      ;
                       TAY                                  ;839CC9|A8      |      ;
                       LDA.W DATA8_839D58,Y                 ;839CCA|B9589D  |839D58;
                       AND.W #$00FF                         ;839CCD|29FF00  |      ;
                       CLC                                  ;839CD0|18      |      ;
                       ADC.W #$0000                         ;839CD1|690000  |      ;
                       PLY                                  ;839CD4|7A      |      ;
                       PHY                                  ;839CD5|5A      |      ;
                       JSR.W CODE_FN_839B68                 ;839CD6|20689B  |839B68;
 
                     + LDA.L $7E9975                        ;839CD9|AF75997E|7E9975;
                       BEQ +                                ;839CDD|F007    |839CE6;
                       DEC A                                ;839CDF|3A      |      ;
                       STA.L $7E9975                        ;839CE0|8F75997E|7E9975;
                       BRA ++                               ;839CE4|8034    |839D1A;
 
                     + LDA.L $7E9977                        ;839CE6|AF77997E|7E9977;
                       TAY                                  ;839CEA|A8      |      ;
                       LDA.W DATA8_839D5B,Y                 ;839CEB|B95B9D  |839D5B;
                       AND.W #$00FF                         ;839CEE|29FF00  |      ;
                       CLC                                  ;839CF1|18      |      ;
                       ADC.W #$0000                         ;839CF2|690000  |      ;
                       PLY                                  ;839CF5|7A      |      ;
                       PLX                                  ;839CF6|FA      |      ;
                       PHX                                  ;839CF7|DA      |      ;
                       PHY                                  ;839CF8|5A      |      ;
                       JSR.W CODE_FN_839B68                 ;839CF9|20689B  |839B68;
                       LDA.L $7E9977                        ;839CFC|AF77997E|7E9977;
                       INC A                                ;839D00|1A      |      ;
                       STA.L $7E9977                        ;839D01|8F77997E|7E9977;
                       CMP.W #$0008                         ;839D05|C90800  |      ;
                       BNE +                                ;839D08|D01C    |839D26;
                       LDA.W #$0060                         ;839D0A|A96000  |      ;
                       STA.L $7E9975                        ;839D0D|8F75997E|7E9975;
                       LDA.W #$0000                         ;839D11|A90000  |      ;
                       STA.L $7E9977                        ;839D14|8F77997E|7E9977;
                       BRA +                                ;839D18|800C    |839D26;
 
                    ++ REP #$20                             ;839D1A|C220    |      ;
                       PLY                                  ;839D1C|7A      |      ;
                       PLX                                  ;839D1D|FA      |      ;
                       PHX                                  ;839D1E|DA      |      ;
                       PHY                                  ;839D1F|5A      |      ;
                       LDA.W #$0010                         ;839D20|A91000  |      ;
                       JSR.W CODE_FN_839B68                 ;839D23|20689B  |839B68;
 
                     + PLY                                  ;839D26|7A      |      ;
                       PLX                                  ;839D27|FA      |      ;
                       LDA.W #$0000                         ;839D28|A90000  |      ;
                       JSR.W CODE_FN_839B68                 ;839D2B|20689B  |839B68;
                       LDA.L $7E996F                        ;839D2E|AF6F997E|7E996F;
                       TAX                                  ;839D32|AA      |      ;
                       LDA.W DATA8_83800F,X                 ;839D33|BD0F80  |83800F;
                       AND.W #$00FF                         ;839D36|29FF00  |      ;
                       CLC                                  ;839D39|18      |      ;
                       ADC.W #$00C0                         ;839D3A|69C000  |      ;
                       CLC                                  ;839D3D|18      |      ;
                       ADC.L $7E9622                        ;839D3E|6F22967E|7E9622;
                       TAY                                  ;839D42|A8      |      ;
                       LDA.W #$00D0                         ;839D43|A9D000  |      ;
                       CLC                                  ;839D46|18      |      ;
                       ADC.L $7E9620                        ;839D47|6F20967E|7E9620;
                       TAX                                  ;839D4B|AA      |      ;
                       LDA.W #$0001                         ;839D4C|A90100  |      ;
                       JSR.W CODE_FN_839B68                 ;839D4F|20689B  |839B68;
                       RTS                                  ;839D52|60      |      ;
                       db $04,$70,$02,$08,$02               ;839D53|        |      ;
 
         DATA8_839D58:
                       db $0C,$0D,$0C                       ;839D58|        |      ;
 
         DATA8_839D5B:
                       db $11,$12,$12,$12,$11,$11,$11,$11   ;839D5B|        |      ;
 
       CODE_FN_839D63:
                       LDA.L $7E996F                        ;839D63|AF6F997E|7E996F;
                       TAX                                  ;839D67|AA      |      ;
                       LDA.W DATA8_839D8A,X                 ;839D68|BD8A9D  |839D8A;
                       AND.W #$00FF                         ;839D6B|29FF00  |      ;
                       CLC                                  ;839D6E|18      |      ;
                       ADC.W #$0000                         ;839D6F|690000  |      ;
                       PHA                                  ;839D72|48      |      ;
                       LDA.W #$00D0                         ;839D73|A9D000  |      ;
                       CLC                                  ;839D76|18      |      ;
                       ADC.L $7E9620                        ;839D77|6F20967E|7E9620;
                       TAX                                  ;839D7B|AA      |      ;
                       LDA.W #$00D8                         ;839D7C|A9D800  |      ;
                       CLC                                  ;839D7F|18      |      ;
                       ADC.L $7E9622                        ;839D80|6F22967E|7E9622;
                       TAY                                  ;839D84|A8      |      ;
                       PLA                                  ;839D85|68      |      ;
                       JSR.W CODE_FN_839B68                 ;839D86|20689B  |839B68;
                       RTS                                  ;839D89|60      |      ;
 
         DATA8_839D8A:
                       db $09,$09,$09,$09,$0A,$0A,$0A,$0A   ;839D8A|        |      ;
                       db $0A,$0A,$0A,$09,$09,$09           ;839D92|        |      ;
 
       CODE_FN_839D98:
                       LDA.W #$801D                         ;839D98|A91D80  |      ;
                       STA.B $00                            ;839D9B|8500    |000000;
                       LDA.W #$0007                         ;839D9D|A90700  |      ;
                       STA.L $7E9961                        ;839DA0|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;839DA4|20F085  |8385F0;
                       LDA.L $7E96DB                        ;839DA7|AFDB967E|7E96DB;
                       BEQ +                                ;839DAB|F029    |839DD6;
                       LDA.L $7E9620                        ;839DAD|AF20967E|7E9620;
                       ORA.L $7E9622                        ;839DB1|0F22967E|7E9622;
                       BNE +                                ;839DB5|D01F    |839DD6;
                       LDA.L $7E9973                        ;839DB7|AF73997E|7E9973;
                       TAX                                  ;839DBB|AA      |      ;
                       LDA.W DATA8_83802C,X                 ;839DBC|BD2C80  |83802C;
                       AND.W #$00FF                         ;839DBF|29FF00  |      ;
                       CLC                                  ;839DC2|18      |      ;
                       ADC.W #$002B                         ;839DC3|692B00  |      ;
                       TAY                                  ;839DC6|A8      |      ;
                       LDA.W #$00A1                         ;839DC7|A9A100  |      ;
                       CLC                                  ;839DCA|18      |      ;
                       ADC.L $7E9620                        ;839DCB|6F20967E|7E9620;
                       TAX                                  ;839DCF|AA      |      ;
                       LDA.W #$001B                         ;839DD0|A91B00  |      ;
                       JSR.W CODE_FN_839B68                 ;839DD3|20689B  |839B68;
 
                     + RTS                                  ;839DD6|60      |      ;
 
       CODE_FN_839DD7:
                       STA.L $7E96D9                        ;839DD7|8FD9967E|7E96D9;
                       PHB                                  ;839DDB|8B      |      ;
                       PEA.W $7E00                          ;839DDC|F4007E  |837E00;
                       PLB                                  ;839DDF|AB      |      ;
                       PLB                                  ;839DE0|AB      |      ;
                       LDY.W #$9630                         ;839DE1|A03096  |      ;
                       LDA.L $001A70                        ;839DE4|AF701A00|001A70;
                       ASL A                                ;839DE8|0A      |      ;
                       TAX                                  ;839DE9|AA      |      ;
                       JSR.W (DATA8_839DEF,X)               ;839DEA|FCEF9D  |839DEF;
                       PLB                                  ;839DED|AB      |      ;
                       RTS                                  ;839DEE|60      |      ;
 
         DATA8_839DEF:
                       db $F5,$9D,$28,$9E,$2F,$9E           ;839DEF|        |      ;
                       SEP #$20                             ;839DF5|E220    |      ;
                       LDA.W $96A2                          ;839DF7|ADA296  |7E96A2;
                       BEQ +                                ;839DFA|F003    |839DFF;
                       JMP.W CODE_JP_839E28                 ;839DFC|4C289E  |839E28;
 
                     + REP #$20                             ;839DFF|C220    |      ;
                       LDA.L $7E95D6                        ;839E01|AFD6957E|7E95D6;
                       BIT.W #$0C00                         ;839E05|89000C  |      ;
                       BNE +                                ;839E08|D01D    |839E27;
                       JSL.L CODE_FL_84AD73                 ;839E0A|2273AD84|84AD73;
                       JSL.L CODE_FL_84ADF2                 ;839E0E|22F2AD84|84ADF2;
                       db $88,$F3,$86                       ;839E12|        |      ;
                       JSL.L CODE_FL_8493FF                 ;839E15|22FF9384|8493FF;
                       LDA.L $7E96D9                        ;839E19|AFD9967E|7E96D9;
                       JSL.L CODE_FL_84AE27                 ;839E1D|2227AE84|84AE27;
                       db $34,$9E,$83                       ;839E21|        |      ;
                       INC.W $1A70                          ;839E24|EE701A  |7E1A70;
 
                     + RTS                                  ;839E27|60      |      ;
 
       CODE_JP_839E28:
                       REP #$20                             ;839E28|C220    |      ;
                       JSL.L CODE_FL_849406                 ;839E2A|22069484|849406;
                       RTS                                  ;839E2E|60      |      ;
                       JSL.L CODE_FL_8499C4                 ;839E2F|22C49984|8499C4;
                       RTS                                  ;839E33|60      |      ;
                       db $40,$F4,$86                       ;839E34|        |      ;
                       db $A7,$F3,$86,$B0,$F3,$86,$B9,$F3   ;839E37|        |      ;
                       db $86,$C2,$F3,$86,$CB,$F3,$86,$D4   ;839E3F|        |      ;
                       db $F3,$86,$DD,$F3,$86,$E6,$F3,$86   ;839E47|        |      ;
                       db $EF,$F3,$86,$F8,$F3,$86,$01,$F4   ;839E4F|        |      ;
                       db $86,$0A,$F4,$86,$13,$F4,$86,$1C   ;839E57|        |      ;
                       db $F4,$86,$25,$F4,$86,$2E,$F4,$86   ;839E5F|        |      ;
                       db $37,$F4,$86                       ;839E67|        |      ;
 
       CODE_FN_839E6A:
                       JSR.W CODE_FN_839C5E                 ;839E6A|205E9C  |839C5E;
                       JSR.W CODE_FN_839D63                 ;839E6D|20639D  |839D63;
                       RTS                                  ;839E70|60      |      ;
 
       CODE_FN_839E71:
                       LDA.W #$0000                         ;839E71|A90000  |      ;
                       STA.L $7E962C                        ;839E74|8F2C967E|7E962C;
                       JSR.W CODE_FN_839E6A                 ;839E78|206A9E  |839E6A;
                       LDA.L $7E962A                        ;839E7B|AF2A967E|7E962A;
                       STA.B $00                            ;839E7F|8500    |000000;
                       LDA.L $7E9628                        ;839E81|AF28967E|7E9628;
                       STA.B $02                            ;839E85|8502    |000002;
                       LDA.L $7E9622                        ;839E87|AF22967E|7E9622;
                       SEC                                  ;839E8B|38      |      ;
                       SBC.L $7E9626                        ;839E8C|EF26967E|7E9626;
                       BEQ +                                ;839E90|F01C    |839EAE;
                       BPL ++                               ;839E92|100A    |839E9E;
                       EOR.W #$FFFF                         ;839E94|49FFFF  |      ;
                       INC A                                ;839E97|1A      |      ;
                       CMP.B $00                            ;839E98|C500    |000000;
                       BPL +++                              ;839E9A|101C    |839EB8;
                       db $80,$10                           ;839E9C|        |839EAE;
 
                    ++ PHA                                  ;839E9E|48      |      ;
                       LDA.B $00                            ;839E9F|A500    |000000;
                       STA.B $04                            ;839EA1|8504    |000004;
                       EOR.W #$FFFF                         ;839EA3|49FFFF  |      ;
                       INC A                                ;839EA6|1A      |      ;
                       STA.B $00                            ;839EA7|8500    |000000;
                       PLA                                  ;839EA9|68      |      ;
                       CMP.B $04                            ;839EAA|C504    |000004;
                       BPL +++                              ;839EAC|100A    |839EB8;
 
                     + LDA.L $7E9626                        ;839EAE|AF26967E|7E9626;
                       STA.L $7E9622                        ;839EB2|8F22967E|7E9622;
                       BRA +                                ;839EB6|8012    |839ECA;
 
                   +++ LDA.L $7E9622                        ;839EB8|AF22967E|7E9622;
                       CLC                                  ;839EBC|18      |      ;
                       ADC.B $00                            ;839EBD|6500    |000000;
                       STA.L $7E9622                        ;839EBF|8F22967E|7E9622;
                       LDA.W #$0001                         ;839EC3|A90100  |      ;
                       STA.L $7E962C                        ;839EC6|8F2C967E|7E962C;
 
                     + LDA.L $7E9620                        ;839ECA|AF20967E|7E9620;
                       SEC                                  ;839ECE|38      |      ;
                       SBC.L $7E9624                        ;839ECF|EF24967E|7E9624;
                       BEQ +                                ;839ED3|F01C    |839EF1;
                       BPL ++                               ;839ED5|100A    |839EE1;
                       EOR.W #$FFFF                         ;839ED7|49FFFF  |      ;
                       INC A                                ;839EDA|1A      |      ;
                       CMP.B $02                            ;839EDB|C502    |000002;
                       BPL +++                              ;839EDD|101B    |839EFA;
                       BRA +                                ;839EDF|8010    |839EF1;
 
                    ++ PHA                                  ;839EE1|48      |      ;
                       LDA.B $02                            ;839EE2|A502    |000002;
                       STA.B $06                            ;839EE4|8506    |000006;
                       EOR.W #$FFFF                         ;839EE6|49FFFF  |      ;
                       INC A                                ;839EE9|1A      |      ;
                       STA.B $02                            ;839EEA|8502    |000002;
                       PLA                                  ;839EEC|68      |      ;
                       CMP.B $06                            ;839EED|C506    |000006;
                       BPL +++                              ;839EEF|1009    |839EFA;
 
                     + LDA.L $7E9624                        ;839EF1|AF24967E|7E9624;
                       STA.L $7E9620                        ;839EF5|8F20967E|7E9620;
                       RTS                                  ;839EF9|60      |      ;
 
                   +++ LDA.L $7E9620                        ;839EFA|AF20967E|7E9620;
                       CLC                                  ;839EFE|18      |      ;
                       ADC.B $02                            ;839EFF|6502    |000002;
                       STA.L $7E9620                        ;839F01|8F20967E|7E9620;
                       LDA.W #$0001                         ;839F05|A90100  |      ;
                       STA.L $7E962C                        ;839F08|8F2C967E|7E962C;
                       RTS                                  ;839F0C|60      |      ;
 
    Move_MenuLipYoshi:
                       ASL A                                ;839F0D|0A      |      ;
                       ASL A                                ;839F0E|0A      |      ;
                       TAX                                  ;839F0F|AA      |      ;
                       LDA.W DATA8_83803A,X                 ;839F10|BD3A80  |83803A;
                       AND.W #$00FF                         ;839F13|29FF00  |      ;
                       BIT.W #$0080                         ;839F16|898000  |      ;
                       BEQ +                                ;839F19|F003    |839F1E;
                       db $09,$00,$FF                       ;839F1B|        |      ;
 
                     + STA.L $7E9624                        ;839F1E|8F24967E|7E9624;
                       LDA.W DATA8_83803B,X                 ;839F22|BD3B80  |83803B;
                       AND.W #$00FF                         ;839F25|29FF00  |      ;
                       BIT.W #$0080                         ;839F28|898000  |      ;
                       BEQ +                                ;839F2B|F003    |839F30;
                       ORA.W #$FF00                         ;839F2D|0900FF  |      ;
 
                     + STA.L $7E9626                        ;839F30|8F26967E|7E9626;
                       LDA.W DATA8_83803C,X                 ;839F34|BD3C80  |83803C;
                       AND.W #$00FF                         ;839F37|29FF00  |      ;
                       STA.L $7E9628                        ;839F3A|8F28967E|7E9628;
                       LDA.W DATA8_83803D,X                 ;839F3E|BD3D80  |83803D;
                       AND.W #$00FF                         ;839F41|29FF00  |      ;
                       STA.L $7E962A                        ;839F44|8F2A967E|7E962A;
                       RTS                                  ;839F48|60      |      ;
 
       CODE_FN_839F49:
                       LDA.W $0003,Y                        ;839F49|B90300  |830003;
 
       CODE_FN_839F4C:
                       STA.B $04                            ;839F4C|8504    |000004;
                       LDA.W $0001,Y                        ;839F4E|B90100  |830001;
                       AND.W #$00FF                         ;839F51|29FF00  |      ;
                       STA.B $00                            ;839F54|8500    |000000;
                       LDA.W $0002,Y                        ;839F56|B90200  |830002;
                       AND.W #$00FF                         ;839F59|29FF00  |      ;
                       STA.B $02                            ;839F5C|8502    |000002;
                       LDA.W $0000,Y                        ;839F5E|B90000  |830000;
                       AND.W #$00FF                         ;839F61|29FF00  |      ;
                       STA.B $06                            ;839F64|8506    |000006;
 
                     - LDY.B $06                            ;839F66|A406    |000006;
                       LDA.B $04                            ;839F68|A504    |000004;
 
                    -- STA.L $7E0000,X                      ;839F6A|9F00007E|7E0000;
                       INX                                  ;839F6E|E8      |      ;
                       INX                                  ;839F6F|E8      |      ;
                       DEY                                  ;839F70|88      |      ;
                       BNE --                               ;839F71|D0F7    |839F6A;
                       TXA                                  ;839F73|8A      |      ;
                       CLC                                  ;839F74|18      |      ;
                       ADC.B $02                            ;839F75|6502    |000002;
                       TAX                                  ;839F77|AA      |      ;
                       DEC.B $00                            ;839F78|C600    |000000;
                       LDA.B $00                            ;839F7A|A500    |000000;
                       BNE -                                ;839F7C|D0E8    |839F66;
                       RTS                                  ;839F7E|60      |      ;
 
       CODE_FN_839F7F:
                       LDA.W $0001,Y                        ;839F7F|B90100  |830001;
                       STA.B $00                            ;839F82|8500    |000000;
                       LDA.W $0000,Y                        ;839F84|B90000  |830000;
                       AND.W #$00FF                         ;839F87|29FF00  |      ;
                       TAY                                  ;839F8A|A8      |      ;
                       LDA.B $00                            ;839F8B|A500    |000000;
 
                     - STA.L $7E0000,X                      ;839F8D|9F00007E|7E0000;
                       INX                                  ;839F91|E8      |      ;
                       INX                                  ;839F92|E8      |      ;
                       DEY                                  ;839F93|88      |      ;
                       BNE -                                ;839F94|D0F7    |839F8D;
                       RTS                                  ;839F96|60      |      ;
 
       CODE_FN_839F97:
                       LDX.W $0000,Y                        ;839F97|BE0000  |000000;
                       LDA.W $0003,Y                        ;839F9A|B90300  |000003;
                       STA.B $00                            ;839F9D|8500    |000000;
                       LDA.W $0002,Y                        ;839F9F|B90200  |000002;
                       AND.W #$00FF                         ;839FA2|29FF00  |      ;
                       TAY                                  ;839FA5|A8      |      ;
 
                     - LDA.B $00                            ;839FA6|A500    |000000;
                       STA.L $7E3000,X                      ;839FA8|9F00307E|7E3000;
                       TXA                                  ;839FAC|8A      |      ;
                       CLC                                  ;839FAD|18      |      ;
                       ADC.W #$0040                         ;839FAE|694000  |      ;
                       TAX                                  ;839FB1|AA      |      ;
                       DEY                                  ;839FB2|88      |      ;
                       BNE -                                ;839FB3|D0F1    |839FA6;
                       RTS                                  ;839FB5|60      |      ;
 
       CODE_FN_839FB6:
                       LDA.W #$0000                         ;839FB6|A90000  |      ;
                       JSL.L CODE_FL_80A1CF                 ;839FB9|22CFA180|80A1CF;
                       JSL.L CODE_FL_80A1F1                 ;839FBD|22F1A180|80A1F1;
                       RTS                                  ;839FC1|60      |      ;
 
       CODE_FN_839FC2:
                       LDX.W $0000,Y                        ;839FC2|BE0000  |830000;
                       LDA.W $0002,Y                        ;839FC5|B90200  |830002;
                       STA.B $00                            ;839FC8|8500    |000000;
                       LDA.W #$0000                         ;839FCA|A90000  |      ;
 
                     - STA.L $7E2000,X                      ;839FCD|9F00207E|7E2000;
                       INX                                  ;839FD1|E8      |      ;
                       INX                                  ;839FD2|E8      |      ;
                       CPX.B $00                            ;839FD3|E400    |000000;
                       BNE -                                ;839FD5|D0F6    |839FCD;
                       RTS                                  ;839FD7|60      |      ;
 
       CODE_FN_839FD8:
                       LDX.W $0000,Y                        ;839FD8|BE0000  |830000;
                       LDA.W $0002,Y                        ;839FDB|B90200  |830002;
                       STA.B $00                            ;839FDE|8500    |000000;
                       LDA.W #$0000                         ;839FE0|A90000  |      ;
 
                     - STA.L $7E3000,X                      ;839FE3|9F00307E|7E3000;
                       INX                                  ;839FE7|E8      |      ;
                       INX                                  ;839FE8|E8      |      ;
                       CPX.B $00                            ;839FE9|E400    |000000;
                       BNE -                                ;839FEB|D0F6    |839FE3;
                       RTS                                  ;839FED|60      |      ;
 
       CODE_FN_839FEE:
                       LDA.W #$0000                         ;839FEE|A90000  |      ;
 
                     - STA.L $7E2000,X                      ;839FF1|9F00207E|7E2000;
                       STA.L $7E3000,X                      ;839FF5|9F00307E|7E3000;
                       INX                                  ;839FF9|E8      |      ;
                       INX                                  ;839FFA|E8      |      ;
                       CPX.W #$0800                         ;839FFB|E00008  |      ;
                       BNE -                                ;839FFE|D0F1    |839FF1;
                       RTS                                  ;83A000|60      |      ;
 
       CODE_FN_83A001:
                       PHB                                  ;83A001|8B      |      ;
                       PHK                                  ;83A002|4B      |      ;
                       PLB                                  ;83A003|AB      |      ;
                       LDY.W #$A00E                         ;83A004|A00EA0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A007|22CAA080|80A0CA;
                       PLB                                  ;83A00B|AB      |      ;
                       BRA +                                ;83A00C|8008    |83A016;
                       db $00,$20,$7E,$80,$01,$80,$00,$68   ;83A00E|        |      ;
 
                     + PHB                                  ;83A016|8B      |      ;
                       PHK                                  ;83A017|4B      |      ;
                       PLB                                  ;83A018|AB      |      ;
                       LDY.W #$A023                         ;83A019|A023A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A01C|22CAA080|80A0CA;
                       PLB                                  ;83A020|AB      |      ;
                       BRA +                                ;83A021|8008    |83A02B;
                       db $00,$30,$7E,$80,$01,$80,$00,$78   ;83A023|        |      ;
 
                     + RTS                                  ;83A02B|60      |      ;
 
       CODE_FN_83A02C:
                       PHB                                  ;83A02C|8B      |      ;
                       PHK                                  ;83A02D|4B      |      ;
                       PLB                                  ;83A02E|AB      |      ;
                       LDY.W #$A039                         ;83A02F|A039A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A032|22CAA080|80A0CA;
                       PLB                                  ;83A036|AB      |      ;
                       BRA +                                ;83A037|8008    |83A041;
                       db $00,$20,$7E,$00,$08,$80,$00,$68   ;83A039|        |      ;
 
                     + RTS                                  ;83A041|60      |      ;
 
       CODE_FN_83A042:
                       PHB                                  ;83A042|8B      |      ;
                       PHK                                  ;83A043|4B      |      ;
                       PLB                                  ;83A044|AB      |      ;
                       LDY.W #$A04F                         ;83A045|A04FA0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A048|22CAA080|80A0CA;
                       PLB                                  ;83A04C|AB      |      ;
                       BRA +                                ;83A04D|8008    |83A057;
                       db $00,$30,$7E,$00,$08,$80,$00,$78   ;83A04F|        |      ;
 
                     + RTS                                  ;83A057|60      |      ;
 
       CODE_FN_83A058:
                       PHB                                  ;83A058|8B      |      ;
                       PHK                                  ;83A059|4B      |      ;
                       PLB                                  ;83A05A|AB      |      ;
                       LDY.W #$A065                         ;83A05B|A065A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A05E|22CAA080|80A0CA;
                       PLB                                  ;83A062|AB      |      ;
                       BRA +                                ;83A063|8008    |83A06D;
                       db $00,$20,$7E,$00,$08,$80,$00,$68   ;83A065|        |      ;
 
                     + PHB                                  ;83A06D|8B      |      ;
                       PHK                                  ;83A06E|4B      |      ;
                       PLB                                  ;83A06F|AB      |      ;
                       LDY.W #$A07A                         ;83A070|A07AA0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A073|22CAA080|80A0CA;
                       PLB                                  ;83A077|AB      |      ;
                       BRA +                                ;83A078|8008    |83A082;
                       db $00,$30,$7E,$00,$08,$80,$00,$78   ;83A07A|        |      ;
 
                     + RTS                                  ;83A082|60      |      ;
 
       CODE_FN_83A083:
                       PHB                                  ;83A083|8B      |      ;
                       PHK                                  ;83A084|4B      |      ;
                       PLB                                  ;83A085|AB      |      ;
                       LDY.W #$A090                         ;83A086|A090A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A089|22CAA080|80A0CA;
                       PLB                                  ;83A08D|AB      |      ;
                       BRA +                                ;83A08E|8008    |83A098;
                       db $00,$20,$7E,$00,$08,$80,$00,$6C   ;83A090|        |      ;
 
                     + PHB                                  ;83A098|8B      |      ;
                       PHK                                  ;83A099|4B      |      ;
                       PLB                                  ;83A09A|AB      |      ;
                       LDY.W #$A0A5                         ;83A09B|A0A5A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A09E|22CAA080|80A0CA;
                       PLB                                  ;83A0A2|AB      |      ;
                       BRA +                                ;83A0A3|8008    |83A0AD;
                       db $00,$30,$7E,$00,$08,$80,$00,$7C   ;83A0A5|        |      ;
 
                     + RTS                                  ;83A0AD|60      |      ;
                       db $20,$B6,$9F,$20,$58,$A0,$20,$83   ;83A0AE|        |839FB6;
                       db $A0,$60                           ;83A0B6|        |      ;
 
       CODE_FN_83A0B8:
                       PHB                                  ;83A0B8|8B      |      ;
                       PHK                                  ;83A0B9|4B      |      ;
                       PLB                                  ;83A0BA|AB      |      ;
                       LDY.W #$A0C5                         ;83A0BB|A0C5A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A0BE|22CAA080|80A0CA;
                       PLB                                  ;83A0C2|AB      |      ;
                       BRA +                                ;83A0C3|8008    |83A0CD;
                       db $40,$20,$7E,$C0,$06,$80,$20,$68   ;83A0C5|        |      ;
 
                     + PHB                                  ;83A0CD|8B      |      ;
                       PHK                                  ;83A0CE|4B      |      ;
                       PLB                                  ;83A0CF|AB      |      ;
                       LDY.W #$A0DA                         ;83A0D0|A0DAA0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A0D3|22CAA080|80A0CA;
                       PLB                                  ;83A0D7|AB      |      ;
                       BRA +                                ;83A0D8|8008    |83A0E2;
                       db $40,$30,$7E,$C0,$06,$80,$20,$78   ;83A0DA|        |      ;
 
                     + RTS                                  ;83A0E2|60      |      ;
 
       CODE_FN_83A0E3:
                       PHB                                  ;83A0E3|8B      |      ;
                       PHK                                  ;83A0E4|4B      |      ;
                       PLB                                  ;83A0E5|AB      |      ;
                       LDY.W #$A0F0                         ;83A0E6|A0F0A0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A0E9|22CAA080|80A0CA;
                       PLB                                  ;83A0ED|AB      |      ;
                       BRA +                                ;83A0EE|8008    |83A0F8;
                       db $00,$20,$7E,$00,$07,$80,$00,$68   ;83A0F0|        |      ;
 
                     + PHB                                  ;83A0F8|8B      |      ;
                       PHK                                  ;83A0F9|4B      |      ;
                       PLB                                  ;83A0FA|AB      |      ;
                       LDY.W #$A105                         ;83A0FB|A005A1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83A0FE|22CAA080|80A0CA;
                       PLB                                  ;83A102|AB      |      ;
                       BRA +                                ;83A103|8008    |83A10D;
                       db $00,$30,$7E,$00,$07,$80,$00,$78   ;83A105|        |      ;
 
                     + RTS                                  ;83A10D|60      |      ;
 
       CODE_FN_83A10E:
                       PHB                                  ;83A10E|8B      |      ;
                       PHK                                  ;83A10F|4B      |      ;
                       PLB                                  ;83A110|AB      |      ;
                       LDY.W #$A11B                         ;83A111|A01BA1  |      ;
                       JSL.L CODE_FL_80A07F                 ;83A114|227FA080|80A07F;
                       PLB                                  ;83A118|AB      |      ;
                       BRA +                                ;83A119|8006    |83A121;
                       db $F6,$86,$7E,$00,$02,$00           ;83A11B|        |      ;
 
                     + RTS                                  ;83A121|60      |      ;
 
       CODE_FN_83A122:
                       PHB                                  ;83A122|8B      |      ;
                       PHK                                  ;83A123|4B      |      ;
                       PLB                                  ;83A124|AB      |      ;
                       LDY.W #$A12F                         ;83A125|A02FA1  |      ;
                       JSL.L CODE_FL_80A07F                 ;83A128|227FA080|80A07F;
                       PLB                                  ;83A12C|AB      |      ;
                       BRA +                                ;83A12D|8006    |83A135;
                       db $F6,$86,$7E,$00,$01,$00           ;83A12F|        |      ;
 
                     + RTS                                  ;83A135|60      |      ;
 
       CODE_FN_83A136:
                       PHB                                  ;83A136|8B      |      ;
                       PHK                                  ;83A137|4B      |      ;
                       PLB                                  ;83A138|AB      |      ;
                       LDY.W #$A143                         ;83A139|A043A1  |      ;
                       JSL.L CODE_FL_80A07F                 ;83A13C|227FA080|80A07F;
                       PLB                                  ;83A140|AB      |      ;
                       BRA +                                ;83A141|8006    |83A149;
                       db $F6,$86,$7E,$E0,$00,$00           ;83A143|        |      ;
 
                     + RTS                                  ;83A149|60      |      ;
 
       CODE_FN_83A14A:
                       LDA.W $0007,X                        ;83A14A|BD0700  |830007;
                       AND.W #$00FF                         ;83A14D|29FF00  |      ;
                       XBA                                  ;83A150|EB      |      ;
                       STA.B $08                            ;83A151|8508    |000008;
                       BRA +                                ;83A153|8005    |83A15A;
 
       CODE_FN_83A155:
                       LDA.W #$0000                         ;83A155|A90000  |      ;
                       STA.B $08                            ;83A158|8508    |000008;
 
                     + LDA.W $0004,X                        ;83A15A|BD0400  |830004;
                       AND.W #$00FF                         ;83A15D|29FF00  |      ;
                       STA.B $00                            ;83A160|8500    |000000;
                       LDA.W $0005,X                        ;83A162|BD0500  |830005;
                       AND.W #$00FF                         ;83A165|29FF00  |      ;
                       STA.B $02                            ;83A168|8502    |000002;
                       LDA.W $0006,X                        ;83A16A|BD0600  |830006;
                       AND.W #$00FF                         ;83A16D|29FF00  |      ;
                       STA.B $04                            ;83A170|8504    |000004;
                       LDY.W $0002,X                        ;83A172|BC0200  |830002;
                       LDA.W $0000,X                        ;83A175|BD0000  |830000;
                       TAX                                  ;83A178|AA      |      ;
                       PHB                                  ;83A179|8B      |      ;
                       PEA.W $7E00                          ;83A17A|F4007E  |837E00;
                       PLB                                  ;83A17D|AB      |      ;
                       PLB                                  ;83A17E|AB      |      ;
 
                     - LDA.B $02                            ;83A17F|A502    |000002;
                       STA.B $06                            ;83A181|8506    |000006;
 
                    -- LDA.B $08                            ;83A183|A508    |000008;
                       BNE +                                ;83A185|D009    |83A190;
                       LDA.W $0000,Y                        ;83A187|B90000  |830000;
                       STA.L $7E2000,X                      ;83A18A|9F00207E|7E2000;
                       BRA ++                               ;83A18E|800C    |83A19C;
 
 
                     + LDA.W $0000,Y                        ;83A190|B90000  |7E0000;
                       AND.W #$E3FF                         ;83A193|29FFE3  |      ;
                       ORA.B $08                            ;83A196|0508    |000008;
                       STA.L $7E2000,X                      ;83A198|9F00207E|7E2000;
 
                    ++ INX                                  ;83A19C|E8      |      ;
                       INX                                  ;83A19D|E8      |      ;
                       INY                                  ;83A19E|C8      |      ;
                       INY                                  ;83A19F|C8      |      ;
                       DEC.B $06                            ;83A1A0|C606    |000006;
                       BNE --                               ;83A1A2|D0DF    |83A183;
                       TXA                                  ;83A1A4|8A      |      ;
                       CLC                                  ;83A1A5|18      |      ;
                       ADC.B $00                            ;83A1A6|6500    |000000;
                       TAX                                  ;83A1A8|AA      |      ;
                       DEC.B $04                            ;83A1A9|C604    |000004;
                       BNE -                                ;83A1AB|D0D2    |83A17F;
                       PLB                                  ;83A1AD|AB      |      ;
                       RTS                                  ;83A1AE|60      |      ;
 
 
       CODE_FN_83A1AF:
                       LDA.W $0000,Y                        ;83A1AF|B90000  |830000;
                       STA.B $00                            ;83A1B2|8500    |000000;
                       LDA.W $0002,Y                        ;83A1B4|B90200  |830002;
                       AND.W #$00FF                         ;83A1B7|29FF00  |      ;
                       STA.B $02                            ;83A1BA|8502    |000002;
                       LDA.W $0003,Y                        ;83A1BC|B90300  |830003;
                       AND.W #$00FF                         ;83A1BF|29FF00  |      ;
                       STA.B $04                            ;83A1C2|8504    |000004;
                       LDA.W $0004,Y                        ;83A1C4|B90400  |830004;
                       TAX                                  ;83A1C7|AA      |      ;
                       PHB                                  ;83A1C8|8B      |      ;
                       PEA.W $7E00                          ;83A1C9|F4007E  |837E00;
                       PLB                                  ;83A1CC|AB      |      ;
                       PLB                                  ;83A1CD|AB      |      ;
                       LDA.W #$403C                         ;83A1CE|A93C40  |      ;
                       STA.L $7E3000,X                      ;83A1D1|9F00307E|7E3000;
                       LDY.B $04                            ;83A1D5|A404    |000004;
 
                     - TXA                                  ;83A1D7|8A      |      ;
                       CLC                                  ;83A1D8|18      |      ;
                       ADC.W #$0040                         ;83A1D9|694000  |      ;
                       TAX                                  ;83A1DC|AA      |      ;
                       LDA.W #$003B                         ;83A1DD|A93B00  |      ;
                       STA.L $7E3000,X                      ;83A1E0|9F00307E|7E3000;
                       DEY                                  ;83A1E4|88      |      ;
                       BNE -                                ;83A1E5|D0F0    |83A1D7;
                       TXA                                  ;83A1E7|8A      |      ;
                       CLC                                  ;83A1E8|18      |      ;
                       ADC.W #$003E                         ;83A1E9|693E00  |      ;
                       TAX                                  ;83A1EC|AA      |      ;
                       LDA.W #$003C                         ;83A1ED|A93C00  |      ;
                       STA.L $7E3000,X                      ;83A1F0|9F00307E|7E3000;
                       INX                                  ;83A1F4|E8      |      ;
                       INX                                  ;83A1F5|E8      |      ;
                       LDA.W #$003B                         ;83A1F6|A93B00  |      ;
                       STA.L $7E3000,X                      ;83A1F9|9F00307E|7E3000;
                       TXA                                  ;83A1FD|8A      |      ;
                       CLC                                  ;83A1FE|18      |      ;
                       ADC.B $00                            ;83A1FF|6500    |000000;
                       TAX                                  ;83A201|AA      |      ;
                       LDA.W #$803C                         ;83A202|A93C80  |      ;
                       STA.L $7E3000,X                      ;83A205|9F00307E|7E3000;
                       LDY.B $02                            ;83A209|A402    |000002;
 
                     - INX                                  ;83A20B|E8      |      ;
                       INX                                  ;83A20C|E8      |      ;
                       LDA.W #$0039                         ;83A20D|A93900  |      ;
                       STA.L $7E3000,X                      ;83A210|9F00307E|7E3000;
                       DEY                                  ;83A214|88      |      ;
                       BNE -                                ;83A215|D0F4    |83A20B;
                       INX                                  ;83A217|E8      |      ;
                       INX                                  ;83A218|E8      |      ;
                       LDA.W #$C03C                         ;83A219|A93CC0  |      ;
                       STA.L $7E3000,X                      ;83A21C|9F00307E|7E3000;
                       PLB                                  ;83A220|AB      |      ;
                       RTS                                  ;83A221|60      |      ;
 
 
       CODE_FN_83A222:
                       LDY.W #$A22A                         ;83A222|A02AA2  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A225|20AFA1  |83A1AF;
                       BRA +                                ;83A228|8006    |83A230;
                       db $26,$00,$0C,$01,$9E,$00           ;83A22A|        |      ;
 
                     + RTS                                  ;83A230|60      |      ;
 
       CODE_FN_83A231:
                       LDY.W #$A239                         ;83A231|A039A2  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A234|20AFA1  |83A1AF;
                       BRA +                                ;83A237|8006    |83A23F;
                       db $26,$00,$0C,$01,$A2,$01           ;83A239|        |      ;
 
                     + RTS                                  ;83A23F|60      |      ;
 
       CODE_FN_83A240:
                       LDY.W #$A248                         ;83A240|A048A2  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A243|20AFA1  |83A1AF;
                       BRA +                                ;83A246|8006    |83A24E;
                       db $24,$00,$0D,$01,$68,$02           ;83A248|        |      ;
 
                     + RTS                                  ;83A24E|60      |      ;
 
       CODE_FN_83A24F:
                       LDX.W #$A257                         ;83A24F|A257A2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A252|2055A1  |83A155;
                       BRA +                                ;83A255|8007    |83A25E;
                       db $84,$00,$D2,$A5,$26,$0D,$03       ;83A257|        |      ;
 
                     + JSR.W CODE_FN_83A222                 ;83A25E|2022A2  |83A222;
                       RTS                                  ;83A261|60      |      ;
 
       CODE_FN_83A262:
                       JSR.W CODE_FN_83A278                 ;83A262|2078A2  |83A278;
                       LDX.W #$A26D                         ;83A265|A26DA2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A268|2055A1  |83A155;
                       BRA +                                ;83A26B|8007    |83A274;
                       db $C8,$01,$3A,$A6,$26,$0D,$01       ;83A26D|        |      ;
 
                     + JSR.W CODE_FN_83A231                 ;83A274|2031A2  |83A231;
                       RTS                                  ;83A277|60      |      ;
 
       CODE_FN_83A278:
                       LDX.W #$A280                         ;83A278|A280A2  |      ;
                       JSR.W CODE_FN_83A14A                 ;83A27B|204AA1  |83A14A;
                       BRA +                                ;83A27E|8008    |83A288;
                       db $88,$01,$D2,$A5,$26,$0D,$03,$04   ;83A280|        |      ;
 
                     + RTS                                  ;83A288|60      |      ;
 
       CODE_FN_83A289:
                       JSR.W CODE_FN_83A278                 ;83A289|2078A2  |83A278;
                       LDX.W #$A294                         ;83A28C|A294A2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A28F|2055A1  |83A155;
                       BRA +                                ;83A292|8007    |83A29B;
                       db $C8,$01,$6E,$A6,$26,$0D,$01       ;83A294|        |      ;
 
                     + JSR.W CODE_FN_83A231                 ;83A29B|2031A2  |83A231;
                       RTS                                  ;83A29E|60      |      ;
 
       CODE_FN_83A29F:
                       JSR.W CODE_FN_83A278                 ;83A29F|2078A2  |83A278;
                       LDX.W #$A2AA                         ;83A2A2|A2AAA2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A2A5|2055A1  |83A155;
                       BRA +                                ;83A2A8|8007    |83A2B1;
                       db $C8,$01,$A2,$A6,$26,$0D,$01       ;83A2AA|        |      ;
 
                     + JSR.W CODE_FN_83A231                 ;83A2B1|2031A2  |83A231;
                       RTS                                  ;83A2B4|60      |      ;
 
       CODE_FN_83A2B5:
                       JSR.W CODE_FN_83A278                 ;83A2B5|2078A2  |83A278;
                       LDX.W #$A2C0                         ;83A2B8|A2C0A2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A2BB|2055A1  |83A155;
                       BRA +                                ;83A2BE|8007    |83A2C7;
                       db $C8,$01,$D6,$A6,$26,$0D,$01       ;83A2C0|        |      ;
 
                     + JSR.W CODE_FN_83A231                 ;83A2C7|2031A2  |83A231;
                       RTS                                  ;83A2CA|60      |      ;
 
       CODE_FN_83A2CB:
                       JSR.W CODE_FN_83A278                 ;83A2CB|2078A2  |83A278;
                       LDX.W #$A2D6                         ;83A2CE|A2D6A2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A2D1|2055A1  |83A155;
                       BRA +                                ;83A2D4|8007    |83A2DD;
                       db $C8,$01,$0A,$A7,$26,$0D,$01       ;83A2D6|        |      ;
 
                     + JSR.W CODE_FN_83A231                 ;83A2DD|2031A2  |83A231;
                       RTS                                  ;83A2E0|60      |      ;
 
       CODE_FN_83A2E1:
                       JSR.W CODE_FN_83A2F7                 ;83A2E1|20F7A2  |83A2F7;
                       LDX.W #$A2EC                         ;83A2E4|A2ECA2  |      ;
                       JSR.W CODE_FN_83A155                 ;83A2E7|2055A1  |83A155;
                       BRA +                                ;83A2EA|8007    |83A2F3;
                       db $8C,$02,$E8,$A8,$24,$0E,$01       ;83A2EC|        |      ;
 
                     + JSR.W CODE_FN_83A240                 ;83A2F3|2040A2  |83A240;
                       RTS                                  ;83A2F6|60      |      ;
 
       CODE_FN_83A2F7:
                       LDX.W #$A2FF                         ;83A2F7|A2FFA2  |      ;
                       JSR.W CODE_FN_83A14A                 ;83A2FA|204AA1  |83A14A;
                       BRA +                                ;83A2FD|8008    |83A307;
                       db $4C,$02,$5C,$A8,$24,$0E,$01,$04   ;83A2FF|        |      ;
 
                     + LDX.W #$A30F                         ;83A307|A20FA3  |      ;
                       JSR.W CODE_FN_83A14A                 ;83A30A|204AA1  |83A14A;
                       BRA +                                ;83A30D|8008    |83A317;
                       db $CC,$02,$74,$A9,$24,$0E,$01,$04   ;83A30F|        |      ;
 
                     + RTS                                  ;83A317|60      |      ;
 
       CODE_FN_83A318:
                       JSR.W CODE_FN_83A2F7                 ;83A318|20F7A2  |83A2F7;
                       LDX.W #$A323                         ;83A31B|A223A3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A31E|2055A1  |83A155;
                       BRA +                                ;83A321|8007    |83A32A;
                       db $8C,$02,$20,$A9,$24,$0E,$01       ;83A323|        |      ;
 
                     + JSR.W CODE_FN_83A240                 ;83A32A|2040A2  |83A240;
                       RTS                                  ;83A32D|60      |      ;
 
       CODE_FN_83A32E:
                       JSR.W CODE_FN_83A2F7                 ;83A32E|20F7A2  |83A2F7;
                       LDX.W #$A339                         ;83A331|A239A3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A334|2055A1  |83A155;
                       BRA +                                ;83A337|8007    |83A340;
                       db $8C,$02,$58,$A9,$24,$0E,$01       ;83A339|        |      ;
 
                     + JSR.W CODE_FN_83A240                 ;83A340|2040A2  |83A240;
                       RTS                                  ;83A343|60      |      ;
 
       CODE_FN_83A344:
                       LDX.W #$A34C                         ;83A344|A24CA3  |      ;
                       JSR.W CODE_FN_83A14A                 ;83A347|204AA1  |83A14A;
                       BRA +                                ;83A34A|8008    |83A354;
                       db $10,$03,$D2,$A5,$26,$0D,$03,$14   ;83A34C|        |      ;
 
                     + LDX.W #$A35C                         ;83A354|A25CA3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A357|2055A1  |83A155;
                       BRA +                                ;83A35A|8007    |83A363;
                       db $50,$03,$9E,$AA,$26,$0D,$01       ;83A35C|        |      ;
 
                     + LDY.W #$A36B                         ;83A363|A06BA3  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A366|20AFA1  |83A1AF;
                       BRA +                                ;83A369|8006    |83A371;
                       db $26,$00,$0C,$01,$2A,$03           ;83A36B|        |      ;
 
                     + RTS                                  ;83A371|60      |      ;
 
       CODE_FN_83A372:
                       LDX.W #$A37A                         ;83A372|A27AA3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A375|2055A1  |83A155;
                       BRA +                                ;83A378|8007    |83A381;
                       db $4C,$02,$D6,$AD,$16,$15,$01       ;83A37A|        |      ;
 
                     + LDX.W #$A389                         ;83A381|A289A3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A384|2055A1  |83A155;
                       BRA +                                ;83A387|8007    |83A390;
                       db $CC,$02,$22,$B0,$16,$15,$01       ;83A389|        |      ;
 
                     + LDX.W #$A398                         ;83A390|A298A3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A393|2055A1  |83A155;
                       BRA +                                ;83A396|8007    |83A39F;
                       db $8C,$02,$A4,$AF,$16,$15,$01       ;83A398|        |      ;
 
                     + LDY.W #$A3A7                         ;83A39F|A0A7A3  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A3A2|20AFA1  |83A1AF;
                       BRA +                                ;83A3A5|8006    |83A3AD;
                       db $16,$00,$14,$01,$76,$02           ;83A3A7|        |      ;
 
                     + RTS                                  ;83A3AD|60      |      ;
                       db $20,$72,$A3,$A2,$B9,$A3,$20,$55   ;83A3AE|        |83A372;
                       db $A1,$80,$07,$8C,$02,$F8,$AF,$16   ;83A3B6|        |000080;
                       db $15,$01,$60                       ;83A3BE|        |000001;
 
       CODE_FN_83A3C1:
                       LDX.W #$A3C9                         ;83A3C1|A2C9A3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A3C4|2055A1  |83A155;
                       BRA +                                ;83A3C7|8007    |83A3D0;
                       db $88,$01,$20,$A6,$26,$0D,$0B       ;83A3C9|        |      ;
 
                     + LDY.W #$A3D8                         ;83A3D0|A0D8A3  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A3D3|20AFA1  |83A1AF;
                       BRA +                                ;83A3D6|8006    |83A3DE;
                       db $26,$00,$0C,$09,$A2,$01           ;83A3D8|        |      ;
 
                     + RTS                                  ;83A3DE|60      |      ;
 
       CODE_FN_83A3DF:
                       LDX.W #$A3E7                         ;83A3DF|A2E7A3  |      ;
                       JSR.W CODE_FN_83A155                 ;83A3E2|2055A1  |83A155;
                       BRA +                                ;83A3E5|8007    |83A3EE;
                       db $4C,$02,$5C,$A8,$24,$0E,$0B       ;83A3E7|        |      ;
 
                     + LDY.W #$A3F6                         ;83A3EE|A0F6A3  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A3F1|20AFA1  |83A1AF;
                       BRA +                                ;83A3F4|8006    |83A3FC;
                       db $24,$00,$0D,$09,$68,$02           ;83A3F6|        |      ;
 
                     + RTS                                  ;83A3FC|60      |      ;
 
       CODE_FN_83A3FD:
                       LDX.W #$A405                         ;83A3FD|A205A4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A400|2055A1  |83A155;
                       BRA +                                ;83A403|8007    |83A40C;
                       db $4C,$02,$90,$A9,$24,$0E,$05       ;83A405|        |      ;
 
                     + LDY.W #$A414                         ;83A40C|A014A4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A40F|20AFA1  |83A1AF;
                       BRA +                                ;83A412|8006    |83A41A;
                       db $24,$00,$0D,$03,$68,$02           ;83A414|        |      ;
 
                     + RTS                                  ;83A41A|60      |      ;
 
       CODE_FN_83A41B:
                       LDX.W #$A423                         ;83A41B|A223A4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A41E|2055A1  |83A155;
                       BRA +                                ;83A421|8007    |83A42A;
                       db $4C,$02,$3E,$A7,$26,$0D,$0B       ;83A423|        |      ;
 
                     + LDY.W #$A432                         ;83A42A|A032A4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A42D|20AFA1  |83A1AF;
                       BRA +                                ;83A430|8006    |83A438;
                       db $26,$00,$0C,$09,$66,$02           ;83A432|        |      ;
 
                     + RTS                                  ;83A438|60      |      ;
 
       CODE_FN_83A439:
                       LDX.W #$A441                         ;83A439|A241A4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A43C|2055A1  |83A155;
                       BRA +                                ;83A43F|8007    |83A448;
                       db $4C,$02,$12,$AD,$24,$0E,$07       ;83A441|        |      ;
 
                     + LDY.W #$A450                         ;83A448|A050A4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A44B|20AFA1  |83A1AF;
                       BRA +                                ;83A44E|8006    |83A456;
                       db $24,$00,$0D,$05,$68,$02           ;83A450|        |      ;
 
                     + RTS                                  ;83A456|60      |      ;
 
       CODE_FN_83A457:
                       LDX.W #$A45F                         ;83A457|A25FA4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A45A|2055A1  |83A155;
                       BRA +                                ;83A45D|8007    |83A466;
                       db $4C,$02,$D6,$AD,$16,$15,$0F       ;83A45F|        |      ;
 
                     + LDY.W #$A46E                         ;83A466|A06EA4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A469|20AFA1  |83A1AF;
                       BRA +                                ;83A46C|8006    |83A474;
                       db $16,$00,$14,$0D,$76,$02           ;83A46E|        |      ;
 
                     + RTS                                  ;83A474|60      |      ;
 
       CODE_FN_83A475:
                       LDA.L $7E961E                        ;83A475|AF1E967E|7E961E;
                       BEQ +                                ;83A479|F01E    |83A499;
                       LDX.W #$A483                         ;83A47B|A283A4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A47E|2055A1  |83A155;
                       BRA ++                               ;83A481|8007    |83A48A;
                       db $10,$03,$1C,$AA,$26,$0D,$07       ;83A483|        |      ;
 
                    ++ LDY.W #$A492                         ;83A48A|A092A4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A48D|20AFA1  |83A1AF;
                       BRA ++                               ;83A490|8006    |83A498;
                       db $26,$00,$0C,$05,$2A,$03           ;83A492|        |      ;
 
                    ++ RTS                                  ;83A498|60      |      ;
 
                     + LDX.W #$A4A1                         ;83A499|A2A1A4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A49C|2055A1  |83A155;
                       BRA +                                ;83A49F|8007    |83A4A8;
                       db $10,$03,$50,$AA,$26,$0D,$05       ;83A4A1|        |      ;
 
                     + LDX.W #$A4B0                         ;83A4A8|A2B0A4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A4AB|2055A1  |83A155;
                       BRA +                                ;83A4AE|8007    |83A4B7;
                       db $10,$03,$1C,$AA,$26,$0D,$01       ;83A4B0|        |      ;
 
                     + LDY.W #$A4BF                         ;83A4B7|A0BFA4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A4BA|20AFA1  |83A1AF;
                       BRA +                                ;83A4BD|8006    |83A4C5;
                       db $26,$00,$0C,$03,$2A,$03           ;83A4BF|        |      ;
 
                     + RTS                                  ;83A4C5|60      |      ;
 
       CODE_FN_83A4C6:
                       LDX.W #$A4CE                         ;83A4C6|A2CEA4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A4C9|2055A1  |83A155;
                       BRA +                                ;83A4CC|8007    |83A4D5;
                       db $D4,$03,$D2,$AA,$28,$0C,$03       ;83A4CE|        |      ;
 
                     + LDY.W #$A4DD                         ;83A4D5|A0DDA4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A4D8|20AFA1  |83A1AF;
                       BRA +                                ;83A4DB|8006    |83A4E3;
                       db $28,$00,$0B,$01,$EC,$03           ;83A4DD|        |      ;
 
                     + RTS                                  ;83A4E3|60      |      ;
 
       CODE_FN_83A4E4:
                       LDX.W #$A4EC                         ;83A4E4|A2ECA4  |      ;
                       JSR.W CODE_FN_83A155                 ;83A4E7|2055A1  |83A155;
                       BRA +                                ;83A4EA|8007    |83A4F3;
                       db $94,$04,$1A,$AB,$1C,$12,$09       ;83A4EC|        |      ;
 
                     + LDY.W #$A4FB                         ;83A4F3|A0FBA4  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A4F6|20AFA1  |83A1AF;
                       BRA +                                ;83A4F9|8006    |83A501;
                       db $1C,$00,$11,$07,$B8,$04           ;83A4FB|        |      ;
 
                     + RTS                                  ;83A501|60      |      ;
                       db $A2,$0A,$A5,$20,$55,$A1,$80,$07   ;83A502|        |      ;
                       db $06,$05,$5E,$AC,$1C,$12,$05,$A0   ;83A50A|        |000005;
                       db $19,$A5,$20,$AF,$A1,$80,$06,$1C   ;83A512|        |0020A5;
                       db $00,$11,$03,$2A,$05,$60           ;83A51A|        |      ;
 
       CODE_FN_83A520:
                       LDX.W #$A528                         ;83A520|A228A5  |      ;
                       JSR.W CODE_FN_83A155                 ;83A523|2055A1  |83A155;
                       BRA +                                ;83A526|8007    |83A52F;
                       db $10,$03,$4C,$B0,$16,$15,$09       ;83A528|        |      ;
 
                     + LDY.W #$A537                         ;83A52F|A037A5  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A532|20AFA1  |83A1AF;
                       BRA +                                ;83A535|8006    |83A53D;
                       db $16,$00,$14,$07,$3A,$03           ;83A537|        |      ;
 
                     + RTS                                  ;83A53D|60      |      ;
 
       CODE_FN_83A53E:
                       LDX.W #$A546                         ;83A53E|A246A5  |      ;
                       JSR.W CODE_FN_83A155                 ;83A541|2055A1  |83A155;
                       BRA +                                ;83A544|8007    |83A54D;
 
                       db $10,$03,$C6,$B1,$16,$15,$0B       ;83A546|        |83A54B;
 
                     + LDY.W #$A555                         ;83A54D|A055A5  |      ;
                       JSR.W CODE_FN_83A1AF                 ;83A550|20AFA1  |83A1AF;
                       BRA +                                ;83A553|8006    |83A55B;
 
                       db $16,$00,$14,$09,$3A,$03           ;83A555|        |000000;
 
                     + RTS                                  ;83A55B|60      |      ;
 
                       LDY.W #$A564                         ;83A55C|A064A5  |      ;
                       JSR.W CODE_FN_8388AE                 ;83A55F|20AE88  |8388AE;
                       BRA +                                ;83A562|800A    |83A56E;
                       db $4D,$00,$70,$00,$9B,$00,$04,$00   ;83A564|        |      ;
                       db $04,$00                           ;83A56C|        |      ;
 
                     + RTS                                  ;83A56E|60      |      ;
                       LDY.W #$A577                         ;83A56F|A077A5  |      ;
                       JSR.W CODE_FN_8388AE                 ;83A572|20AE88  |8388AE;
                       BRA +                                ;83A575|800A    |83A581;
                       db $4D,$00,$80,$00,$9B,$00,$06,$00   ;83A577|        |      ;
                       db $02,$00                           ;83A57F|        |      ;
 
                     + RTS                                  ;83A581|60      |      ;
                       LDY.W #$A58A                         ;83A582|A08AA5  |      ;
                       JSR.W CODE_FN_8388AE                 ;83A585|20AE88  |8388AE;
                       BRA +                                ;83A588|800A    |83A594;
                       db $4D,$00,$90,$00,$9B,$00,$08,$00   ;83A58A|        |      ;
                       db $02,$00                           ;83A592|        |      ;
 
                     + RTS                                  ;83A594|60      |      ;
 
       CODE_FN_83A595:
                       LDA.L $7E961E                        ;83A595|AF1E967E|7E961E;
                       BEQ +                                ;83A599|F013    |83A5AE;
                       LDY.W #$A5A3                         ;83A59B|A0A3A5  |      ;
                       JSR.W CODE_FN_8388AE                 ;83A59E|20AE88  |8388AE;
                       BRA ++                               ;83A5A1|800A    |83A5AD;
                       db $65,$00,$88,$00,$93,$00,$04,$00   ;83A5A3|        |      ;
                       db $01,$00                           ;83A5AB|        |      ;
 
                    ++ RTS                                  ;83A5AD|60      |      ;
 
                     + LDY.W #$A5B6                         ;83A5AE|A0B6A5  |      ;
                       JSR.W CODE_FN_8388AE                 ;83A5B1|20AE88  |8388AE;
                       BRA +                                ;83A5B4|800A    |83A5C0;
                       db $65,$00,$78,$00,$83,$00,$02,$00   ;83A5B6|        |      ;
                       db $01,$00                           ;83A5BE|        |      ;
 
                     + RTS                                  ;83A5C0|60      |      ;
 
       CODE_FN_83A5C1:
                       LDY.W #$A5C9                         ;83A5C1|A0C9A5  |      ;
                       JSR.W CODE_FN_838C7D                 ;83A5C4|207D8C  |838C7D;
                       BRA +                                ;83A5C7|8003    |83A5CC;
                       db $48,$68,$07                       ;83A5C9|        |      ;
 
                     + RTS                                  ;83A5CC|60      |      ;
 
       CODE_FN_83A5CD:
                       LDY.W #$A5D5                         ;83A5CD|A0D5A5  |      ;
                       JSR.W CODE_FN_838C7D                 ;83A5D0|207D8C  |838C7D;
                       BRA +                                ;83A5D3|8003    |83A5D8;
                       db $48,$78,$07                       ;83A5D5|        |      ;
 
                     + RTS                                  ;83A5D8|60      |      ;
 
       CODE_FN_83A5D9:
                       LDY.W #$A5E1                         ;83A5D9|A0E1A5  |      ;
                       JSR.W CODE_FN_838C7D                 ;83A5DC|207D8C  |838C7D;
                       BRA +                                ;83A5DF|8003    |83A5E4;
                       db $48,$88,$07                       ;83A5E1|        |      ;
 
                     + RTS                                  ;83A5E4|60      |      ;
 
       CODE_FN_83A5E5:
                       LDA.L $7E961E                        ;83A5E5|AF1E967E|7E961E;
                       BEQ +                                ;83A5E9|F00C    |83A5F7;
                       LDY.W #$A5F3                         ;83A5EB|A0F3A5  |      ;
                       JSR.W CODE_FN_838C7D                 ;83A5EE|207D8C  |838C7D;
                       BRA ++                               ;83A5F1|8003    |83A5F6;
                       db $60,$80,$07                       ;83A5F3|        |      ;
 
                    ++ RTS                                  ;83A5F6|60      |      ;
 
                     + LDY.W #$A5FF                         ;83A5F7|A0FFA5  |      ;
                       JSR.W CODE_FN_838C7D                 ;83A5FA|207D8C  |838C7D;
                       BRA +                                ;83A5FD|8003    |83A602;
                       db $60,$70,$07                       ;83A5FF|        |      ;
 
                     + RTS                                  ;83A602|60      |      ;
 
       CODE_FN_83A603:
                       LDY.W #$A60B                         ;83A603|A00BA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A606|208A8A  |838A8A;
                       BRA +                                ;83A609|8003    |83A60E;
                       db $35,$83,$08                       ;83A60B|        |      ;
 
                     + RTS                                  ;83A60E|60      |      ;
 
       CODE_FN_83A60F:
                       LDY.W #$A617                         ;83A60F|A017A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A612|208A8A  |838A8A;
                       BRA +                                ;83A615|8003    |83A61A;
                       db $4D,$9B,$08                       ;83A617|        |      ;
 
                     + RTS                                  ;83A61A|60      |      ;
 
       CODE_FN_83A61B:
                       LDY.W #$A623                         ;83A61B|A023A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A61E|208A8A  |838A8A;
                       BRA +                                ;83A621|8003    |83A626;
                       db $4D,$6B,$08                       ;83A623|        |      ;
 
                     + RTS                                  ;83A626|60      |      ;
 
       CODE_FN_83A627:
                       LDY.W #$A62F                         ;83A627|A02FA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A62A|208A8A  |838A8A;
                       BRA +                                ;83A62D|8003    |83A632;
                       db $4D,$9B,$08                       ;83A62F|        |      ;
 
                     + RTS                                  ;83A632|60      |      ;
 
       CODE_FN_83A633:
                       LDY.W #$A63B                         ;83A633|A03BA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A636|208A8A  |838A8A;
                       BRA +                                ;83A639|8003    |83A63E;
                       db $4D,$BB,$08                       ;83A63B|        |      ;
 
                     + RTS                                  ;83A63E|60      |      ;
 
       CODE_FN_83A63F:
                       LDA.L $7E961E                        ;83A63F|AF1E967E|7E961E;
                       BEQ +                                ;83A643|F00C    |83A651;
                       LDY.W #$A64D                         ;83A645|A04DA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A648|208A8A  |838A8A;
                       BRA ++                               ;83A64B|8003    |83A650;
                       db $65,$93,$08                       ;83A64D|        |      ;
 
                    ++ RTS                                  ;83A650|60      |      ;
 
                     + LDY.W #$A659                         ;83A651|A059A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A654|208A8A  |838A8A;
                       BRA +                                ;83A657|8003    |83A65C;
                       db $65,$83,$08                       ;83A659|        |      ;
 
                     + RTS                                  ;83A65C|60      |      ;
 
       CODE_FN_83A65D:
                       LDY.W #$A665                         ;83A65D|A065A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A660|208A8A  |838A8A;
                       BRA +                                ;83A663|8003    |83A668;
                       db $95,$D3,$08                       ;83A665|        |      ;
 
                     + RTS                                  ;83A668|60      |      ;
 
       CODE_FN_83A669:
                       LDY.W #$A671                         ;83A669|A071A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A66C|208A8A  |838A8A;
                       BRA +                                ;83A66F|8003    |83A674;
                       db $35,$A0,$08                       ;83A671|        |      ;
 
                     + RTS                                  ;83A674|60      |      ;
 
       CODE_FN_83A675:
                       LDY.W #$A67D                         ;83A675|A07DA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A678|208A8A  |838A8A;
                       BRA +                                ;83A67B|8003    |83A680;
                       db $28,$73,$08                       ;83A67D|        |      ;
 
                     + RTS                                  ;83A680|60      |      ;
 
       CODE_FN_83A681:
                       LDY.W #$A689                         ;83A681|A089A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A684|208A8A  |838A8A;
                       BRA +                                ;83A687|8003    |83A68C;
                       db $80,$CB,$08                       ;83A689|        |      ;
 
                     + RTS                                  ;83A68C|60      |      ;
 
       CODE_FN_83A68D:
                       LDY.W #$A695                         ;83A68D|A095A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A690|208A8A  |838A8A;
                       BRA +                                ;83A693|8003    |83A698;
                       db $65,$A3,$08                       ;83A695|        |      ;
 
                     + RTS                                  ;83A698|60      |      ;
 
       CODE_FN_83A699:
                       LDY.W #$A6A1                         ;83A699|A0A1A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A69C|208A8A  |838A8A;
                       BRA +                                ;83A69F|8003    |83A6A4;
 
                       db $65,$B3,$08                       ;83A6A1|        |0000B3;
 
                     + RTS                                  ;83A6A4|60      |      ;
 
 
       CODE_FN_83A6A5:
                       LDY.W #$A6AD                         ;83A6A5|A0ADA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A6A8|208A8A  |838A8A;
                       BRA +                                ;83A6AB|8003    |83A6B0;
                       db $43,$83,$08                       ;83A6AD|        |      ;
 
                     + RTS                                  ;83A6B0|60      |      ;
 
       CODE_FN_83A6B1:
                       LDY.W #$A6B9                         ;83A6B1|A0B9A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A6B4|208A8A  |838A8A;
                       BRA +                                ;83A6B7|8003    |83A6BC;
                       db $5B,$9B,$08                       ;83A6B9|        |      ;
 
                     + RTS                                  ;83A6BC|60      |      ;
                       db $A0,$C5,$A6,$20,$8A,$8A,$80,$03   ;83A6BD|        |      ;
                       db $5B,$6B,$08,$60                   ;83A6C5|        |      ;
 
       CODE_FN_83A6C9:
                       LDY.W #$A6D1                         ;83A6C9|A0D1A6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A6CC|208A8A  |838A8A;
                       BRA +                                ;83A6CF|8003    |83A6D4;
                       db $5B,$BB,$08                       ;83A6D1|        |      ;
 
                     + RTS                                  ;83A6D4|60      |      ;
 
       CODE_FN_83A6D5:
                       LDA.L $7E961E                        ;83A6D5|AF1E967E|7E961E;
                       BEQ +                                ;83A6D9|F00C    |83A6E7;
                       db $A0,$E3,$A6,$20,$8A,$8A,$80,$03   ;83A6DB|        |      ;
                       db $73,$93,$08,$60                   ;83A6E3|        |000093;
 
                     + LDY.W #$A6EF                         ;83A6E7|A0EFA6  |      ;
                       JSR.W CODE_FN_838A8A                 ;83A6EA|208A8A  |838A8A;
                       BRA +                                ;83A6ED|8003    |83A6F2;
                       db $73,$83,$08                       ;83A6EF|        |      ;
 
                     + RTS                                  ;83A6F2|60      |      ;
                       LDY.W #$A6FB                         ;83A6F3|A0FBA6  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A6F6|20BA8B  |838BBA;
                       BRA +                                ;83A6F9|8003    |83A6FE;
                       db $4D,$9B,$0C                       ;83A6FB|        |      ;
 
                     + RTS                                  ;83A6FE|60      |      ;
                       LDY.W #$A707                         ;83A6FF|A007A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A702|20BA8B  |838BBA;
                       BRA +                                ;83A705|8003    |83A70A;
                       db $4D,$6B,$0C                       ;83A707|        |      ;
 
                     + RTS                                  ;83A70A|60      |      ;
                       LDY.W #$A713                         ;83A70B|A013A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A70E|20BA8B  |838BBA;
                       BRA +                                ;83A711|8003    |83A716;
                       db $4D,$9B,$0C                       ;83A713|        |      ;
 
                     + RTS                                  ;83A716|60      |      ;
 
       CODE_FN_83A717:
                       LDY.W #$A71F                         ;83A717|A01FA7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A71A|20BA8B  |838BBA;
                       BRA +                                ;83A71D|8003    |83A722;
                       db $4D,$BB,$0C                       ;83A71F|        |      ;
 
                     + RTS                                  ;83A722|60      |      ;
 
       CODE_FN_83A723:
                       LDA.L $7E961E                        ;83A723|AF1E967E|7E961E;
                       BEQ +                                ;83A727|F00C    |83A735;
                       LDY.W #$A731                         ;83A729|A031A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A72C|20BA8B  |838BBA;
                       BRA ++                               ;83A72F|8003    |83A734;
                       db $65,$93,$0C                       ;83A731|        |      ;
 
                    ++ RTS                                  ;83A734|60      |      ;
 
                     + LDY.W #$A73D                         ;83A735|A03DA7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A738|20BA8B  |838BBA;
                       BRA +                                ;83A73B|8003    |83A740;
                       db $65,$83,$0C                       ;83A73D|        |      ;
 
                     + RTS                                  ;83A740|60      |      ;
 
       CODE_FN_83A741:
                       LDY.W #$A749                         ;83A741|A049A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A744|20BA8B  |838BBA;
                       BRA +                                ;83A747|8003    |83A74C;
                       db $95,$D3,$0C                       ;83A749|        |      ;
 
                     + RTS                                  ;83A74C|60      |      ;
 
       CODE_FN_83A74D:
                       LDY.W #$A755                         ;83A74D|A055A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A750|20BA8B  |838BBA;
                       BRA +                                ;83A753|8003    |83A758;
                       db $38,$68,$0C                       ;83A755|        |      ;
 
                     + RTS                                  ;83A758|60      |      ;
 
       CODE_FN_83A759:
                       LDY.W #$A761                         ;83A759|A061A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A75C|20BA8B  |838BBA;
                       BRA +                                ;83A75F|8003    |83A764;
                       db $78,$A0,$0C                       ;83A761|        |      ;
 
                     + RTS                                  ;83A764|60      |      ;
 
       CODE_FN_83A765:
                       LDY.W #$A76D                         ;83A765|A06DA7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A768|20BA8B  |838BBA;
                       BRA +                                ;83A76B|8003    |83A770;
                       db $35,$A0,$0C                       ;83A76D|        |      ;
 
                     + RTS                                  ;83A770|60      |      ;
 
       CODE_FN_83A771:
                       LDY.W #$A779                         ;83A771|A079A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A774|20BA8B  |838BBA;
                       BRA +                                ;83A777|8003    |83A77C;
                       db $28,$73,$0C                       ;83A779|        |      ;
 
                     + RTS                                  ;83A77C|60      |      ;
 
       CODE_FN_83A77D:
                       LDY.W #$A785                         ;83A77D|A085A7  |      ;
                       JSR.W CODE_FN_838BBA                 ;83A780|20BA8B  |838BBA;
                       BRA +                                ;83A783|8003    |83A788;
                       db $80,$CB,$0C                       ;83A785|        |      ;
 
                     + RTS                                  ;83A788|60      |      ;
 
       CODE_FN_83A789:
                       JSL.L CODE_FL_80BB2D                 ;83A789|222DBB80|80BB2D;
                       db $79,$9E,$93,$00,$5D,$7F           ;83A78D|        |      ;
                       LDY.W #$A79B                         ;83A793|A09BA7  |      ;
                       JSR.W CODE_FN_8386F6                 ;83A796|20F686  |8386F6;
                       BRA +                                ;83A799|8006    |83A7A1;
                       db $E0,$5D,$E0,$20,$0E,$02           ;83A79B|        |      ;
 
                     + RTS                                  ;83A7A1|60      |      ;
 
       CODE_FN_83A7A2:
                       STA.B $00                            ;83A7A2|8500    |000000;
                       LDX.W $0000,Y                        ;83A7A4|BE0000  |830000;
                       LDA.W $0002,Y                        ;83A7A7|B90200  |830002;
                       STA.B $02                            ;83A7AA|8502    |000002;
                       LDA.W $0004,Y                        ;83A7AC|B90400  |830004;
                       STA.B $04                            ;83A7AF|8504    |000004;
                       LDA.W $0006,Y                        ;83A7B1|B90600  |830006;
                       STA.B $06                            ;83A7B4|8506    |000006;
                       LDA.W $0008,Y                        ;83A7B6|B90800  |830008;
                       AND.W #$00FF                         ;83A7B9|29FF00  |      ;
                       STA.B $08                            ;83A7BC|8508    |000008;
                       STA.B $68                            ;83A7BE|8568    |000068;
 
                     - PHX                                  ;83A7C0|DA      |      ;
                       LDX.W #$000A                         ;83A7C1|A20A00  |      ;
                       LDA.B $00                            ;83A7C4|A500    |000000;
                       BEQ +                                ;83A7C6|F015    |83A7DD;
                       JSR.W CODE_FN_838562                 ;83A7C8|206285  |838562;
                       PLX                                  ;83A7CB|FA      |      ;
 
                    -- CLC                                  ;83A7CC|18      |      ;
                       ADC.B $02                            ;83A7CD|6502    |000002;
                       STA.L $7E2000,X                      ;83A7CF|9F00207E|7E2000;
                       CLC                                  ;83A7D3|18      |      ;
                       ADC.W #$0010                         ;83A7D4|691000  |      ;
                       STA.L $7E2040,X                      ;83A7D7|9F40207E|7E2040;
                       BRA ++                               ;83A7DB|8018    |83A7F5;
 
                     + PLX                                  ;83A7DD|FA      |      ;
                       LDA.B $08                            ;83A7DE|A508    |000008;
                       CMP.B $68                            ;83A7E0|C568    |000068;
                       BNE +                                ;83A7E2|D005    |83A7E9;
                       LDA.W #$0000                         ;83A7E4|A90000  |      ;
                       BRA --                               ;83A7E7|80E3    |83A7CC;
 
                     + LDA.B $04                            ;83A7E9|A504    |000004;
                       STA.L $7E2000,X                      ;83A7EB|9F00207E|7E2000;
                       LDA.B $06                            ;83A7EF|A506    |000006;
                       STA.L $7E2040,X                      ;83A7F1|9F40207E|7E2040;
 
                    ++ TXA                                  ;83A7F5|8A      |      ;
                       CLC                                  ;83A7F6|18      |      ;
                       ADC.W #$FFFE                         ;83A7F7|69FEFF  |      ;
                       TAX                                  ;83A7FA|AA      |      ;
                       DEC.B $68                            ;83A7FB|C668    |000068;
                       BNE -                                ;83A7FD|D0C1    |83A7C0;
                       RTS                                  ;83A7FF|60      |      ;
 
       CODE_FN_83A800:
                       STA.B $02                            ;83A800|8502    |000002;
 
                     - LDA.B $00                            ;83A802|A500    |000000;
                       STA.B $68                            ;83A804|8568    |000068;
 
                    -- TYA                                  ;83A806|98      |      ;
                       STA.L $7E0000,X                      ;83A807|9F00007E|7E0000;
                       INX                                  ;83A80B|E8      |      ;
                       INX                                  ;83A80C|E8      |      ;
                       DEC.B $68                            ;83A80D|C668    |000068;
                       BPL --                               ;83A80F|10F5    |83A806;
                       TXA                                  ;83A811|8A      |      ;
                       CLC                                  ;83A812|18      |      ;
                       ADC.W #$003E                         ;83A813|693E00  |      ;
                       SEC                                  ;83A816|38      |      ;
                       SBC.B $00                            ;83A817|E500    |000000;
                       SEC                                  ;83A819|38      |      ;
                       SBC.B $00                            ;83A81A|E500    |000000;
                       TAX                                  ;83A81C|AA      |      ;
                       DEC.B $02                            ;83A81D|C602    |000002;
                       BNE -                                ;83A81F|D0E1    |83A802;
                       RTS                                  ;83A821|60      |      ;
 
       CODE_FN_83A822:
                       LDA.W $0000,Y                        ;83A822|B90000  |830000;
                       AND.W #$00FF                         ;83A825|29FF00  |      ;
                       STA.B $00                            ;83A828|8500    |000000;
                       LDA.W $0001,Y                        ;83A82A|B90100  |830001;
                       AND.W #$00FF                         ;83A82D|29FF00  |      ;
                       STA.B $02                            ;83A830|8502    |000002;
                       LDA.W $0002,Y                        ;83A832|B90200  |830002;
                       STA.B $04                            ;83A835|8504    |000004;
                       TYA                                  ;83A837|98      |      ;
                       CLC                                  ;83A838|18      |      ;
                       ADC.W #$0004                         ;83A839|690400  |      ;
                       TAY                                  ;83A83C|A8      |      ;
 
                     - LDA.B $00                            ;83A83D|A500    |000000;
                       STA.B $68                            ;83A83F|8568    |000068;
 
                    -- LDA.W $0000,Y                        ;83A841|B90000  |830000;
                       AND.W #$00FF                         ;83A844|29FF00  |      ;
                       ORA.B $04                            ;83A847|0504    |000004;
                       STA.L $7E0000,X                      ;83A849|9F00007E|7E0000;
                       INX                                  ;83A84D|E8      |      ;
                       INX                                  ;83A84E|E8      |      ;
                       INY                                  ;83A84F|C8      |      ;
                       DEC.B $68                            ;83A850|C668    |000068;
                       BPL --                               ;83A852|10ED    |83A841;
                       TXA                                  ;83A854|8A      |      ;
                       CLC                                  ;83A855|18      |      ;
                       ADC.W #$003E                         ;83A856|693E00  |      ;
                       SEC                                  ;83A859|38      |      ;
                       SBC.B $00                            ;83A85A|E500    |000000;
                       SEC                                  ;83A85C|38      |      ;
                       SBC.B $00                            ;83A85D|E500    |000000;
                       TAX                                  ;83A85F|AA      |      ;
                       DEC.B $02                            ;83A860|C602    |000002;
                       BNE -                                ;83A862|D0D9    |83A83D;
                       RTS                                  ;83A864|60      |      ;
 
       CODE_FN_83A865:
                       STA.B $02                            ;83A865|8502    |000002;
 
                     - LDA.B $00                            ;83A867|A500    |000000;
                       STA.B $68                            ;83A869|8568    |000068;
 
                    -- LDA.W $0000,Y                        ;83A86B|B90000  |000000;
                       STA.L $7E0000,X                      ;83A86E|9F00007E|7E0000;
                       INX                                  ;83A872|E8      |      ;
                       INX                                  ;83A873|E8      |      ;
                       INY                                  ;83A874|C8      |      ;
                       INY                                  ;83A875|C8      |      ;
                       DEC.B $68                            ;83A876|C668    |000068;
                       BPL --                               ;83A878|10F1    |83A86B;
                       TXA                                  ;83A87A|8A      |      ;
                       CLC                                  ;83A87B|18      |      ;
                       ADC.W #$003E                         ;83A87C|693E00  |      ;
                       SEC                                  ;83A87F|38      |      ;
                       SBC.B $00                            ;83A880|E500    |000000;
                       SEC                                  ;83A882|38      |      ;
                       SBC.B $00                            ;83A883|E500    |000000;
                       TAX                                  ;83A885|AA      |      ;
                       DEC.B $02                            ;83A886|C602    |000002;
                       BNE -                                ;83A888|D0DD    |83A867;
                       RTS                                  ;83A88A|60      |      ;
 
       CODE_FN_83A88B:
                       LDA.L $0002A8                        ;83A88B|AFA80200|0002A8;
                       BEQ +                                ;83A88F|F00B    |83A89C;
                       CMP.W #$0001                         ;83A891|C90100  |      ;
                       BEQ ++                               ;83A894|F03E    |83A8D4;
                       LDA.L $7E38FE                        ;83A896|AFFE387E|7E38FE;
                       BEQ ++                               ;83A89A|F038    |83A8D4;
 
                     + LDA.L $7E38FE                        ;83A89C|AFFE387E|7E38FE;
                       CMP.W #$0003                         ;83A8A0|C90300  |      ;
                       BNE +                                ;83A8A3|D00A    |83A8AF;
                       LDA.W Puzzle_LevelLo                 ;83A8A5|AD4C03  |83034C;
                       BEQ +                                ;83A8A8|F005    |83A8AF;
                       LDX.W #$0028                         ;83A8AA|A22800  |      ;
                       BRA CODE_83A8B7                      ;83A8AD|8008    |83A8B7;
 
                     + LDA.L $7E38FE                        ;83A8AF|AFFE387E|7E38FE;
                       ASL A                                ;83A8B3|0A      |      ;
                       ASL A                                ;83A8B4|0A      |      ;
                       ASL A                                ;83A8B5|0A      |      ;
                       TAX                                  ;83A8B6|AA      |      ;
 
          CODE_83A8B7:
                       LDA.W DATA8_83A8E1,X                 ;83A8B7|BDE1A8  |83A8E1;
                       STA.L $7E87D8                        ;83A8BA|8FD8877E|7E87D8;
                       LDA.W DATA8_83A8E3,X                 ;83A8BE|BDE3A8  |83A8E3;
                       STA.L $7E87DA                        ;83A8C1|8FDA877E|7E87DA;
                       LDA.W DATA8_83A8E5,X                 ;83A8C5|BDE5A8  |83A8E5;
                       STA.L $7E87DC                        ;83A8C8|8FDC877E|7E87DC;
                       LDA.W DATA8_83A8E7,X                 ;83A8CC|BDE7A8  |83A8E7;
                       STA.L $7E87DE                        ;83A8CF|8FDE877E|7E87DE;
                       RTS                                  ;83A8D3|60      |      ;
 
                    ++ LDX.W #$0020                         ;83A8D4|A22000  |      ;
                       BRA CODE_83A8B7                      ;83A8D7|80DE    |83A8B7;
                       db $B2,$75,$AF,$71,$8C,$69,$89,$65   ;83A8D9|        |000075;
 
         DATA8_83A8E1:
                       db $F3,$7D                           ;83A8E1|        |      ;
 
         DATA8_83A8E3:
                       db $92,$75                           ;83A8E3|        |      ;
 
         DATA8_83A8E5:
                       db $50,$69                           ;83A8E5|        |      ;
 
         DATA8_83A8E7:
                       db $0F,$61,$3C,$43,$FA,$26,$97,$12   ;83A8E7|        |      ;
                       db $35,$0A,$6F,$7E,$2C,$7E,$E8,$6D   ;83A8EF|        |      ;
                       db $A5,$61,$D7,$7D,$75,$7D,$13,$75   ;83A8F7|        |      ;
                       db $B2,$70,$75,$2F,$31,$2B,$ED,$22   ;83A8FF|        |      ;
                       db $AA,$16,$00,$7C,$00,$60,$00,$40   ;83A907|        |      ;
                       db $00,$20                           ;83A90F|        |      ;
 
       CODE_FN_83A911:
                       STA.L $7E9963                        ;83A911|8F63997E|7E9963;
 
       CODE_FN_83A915:
                       LDA.L $7E9963                        ;83A915|AF63997E|7E9963;
                       CMP.W #$0028                         ;83A919|C92800  |      ;
                       BNE +                                ;83A91C|D00C    |83A92A;
                       LDA.W Puzzle_LevelLo                 ;83A91E|AD4C03  |83034C;
                       BEQ +                                ;83A921|F007    |83A92A;
                       LDA.W #$0030                         ;83A923|A93000  |      ;
                       STA.L $7E9963                        ;83A926|8F63997E|7E9963;
 
                     + LDA.L $7E9963                        ;83A92A|AF63997E|7E9963;
                       CLC                                  ;83A92E|18      |      ;
                       ADC.W #$A94B                         ;83A92F|694BA9  |      ;
                       STA.B $0C                            ;83A932|850C    |00000C;
                       JSR.W CODE_FN_83A983                 ;83A934|2083A9  |83A983;
                       PHB                                  ;83A937|8B      |      ;
                       PHK                                  ;83A938|4B      |      ;
                       PLB                                  ;83A939|AB      |      ;
                       LDY.W #$A944                         ;83A93A|A044A9  |      ;
                       JSL.L CODE_FL_80A07F                 ;83A93D|227FA080|80A07F;
                       PLB                                  ;83A941|AB      |      ;
                       BRA +                                ;83A942|8006    |83A94A;
                       db $F6,$86,$7E,$00,$02,$00           ;83A944|        |      ;
 
                     + RTS                                  ;83A94A|60      |      ;
                       db $B2,$75,$AF,$71,$8C,$69,$89,$65   ;83A94B|        |      ;
                       db $F3,$7D,$92,$75,$50,$69,$0F,$61   ;83A953|        |      ;
                       db $6F,$7E,$2C,$7E,$E8,$6D,$A5,$61   ;83A95B|        |      ;
                       db $3C,$43,$FA,$26,$97,$12,$35,$0A   ;83A963|        |      ;
                       db $75,$2F,$31,$2B,$ED,$22,$AA,$16   ;83A96B|        |      ;
                       db $D7,$7D,$75,$7D,$13,$75,$B2,$70   ;83A973|        |      ;
                       db $00,$7C,$00,$60,$00,$40,$00,$20   ;83A97B|        |      ;
 
       CODE_FN_83A983:
                       STZ.W $0366                          ;83A983|9C6603  |830366;
                       LDX.W #$0006                         ;83A986|A20600  |      ;
 
                     - TXY                                  ;83A989|9B      |      ;
                       LDA.B ($0C),Y                        ;83A98A|B10C    |00000C;
                       CMP.L $7E87D8,X                      ;83A98C|DFD8877E|7E87D8;
                       BEQ +                                ;83A990|F014    |83A9A6;
                       STA.B $02                            ;83A992|8502    |000002;
                       LDA.W #$0001                         ;83A994|A90100  |      ;
                       STA.W $0366                          ;83A997|8D6603  |830366;
                       LDA.L $7E87D8,X                      ;83A99A|BFD8877E|7E87D8;
                       JSL.L CODE_FL_80B32C                 ;83A99E|222CB380|80B32C;
                       STA.L $7E87D8,X                      ;83A9A2|9FD8877E|7E87D8;
 
                     + DEX                                  ;83A9A6|CA      |      ;
                       DEX                                  ;83A9A7|CA      |      ;
                       BPL -                                ;83A9A8|10DF    |83A989;
                       RTS                                  ;83A9AA|60      |      ;
 
       CODE_FN_83A9AB:
                       JSR.W CODE_FN_83A911                 ;83A9AB|2011A9  |83A911;
                       JSR.W CODE_FN_83A9FF                 ;83A9AE|20FFA9  |83A9FF;
                       JSL.L CODE_FL_80BB2D                 ;83A9B1|222DBB80|80BB2D;
                       db $64,$AF,$91,$F6,$86,$7E           ;83A9B5|        |      ;
                       JSR.W CODE_FN_83AA20                 ;83A9BB|2020AA  |83AA20;
                       LDA.W $0366                          ;83A9BE|AD6603  |830366;
                       BNE +                                ;83A9C1|D003    |83A9C6;
                       db $20,$36,$A1                       ;83A9C3|        |83A136;
 
                     + RTS                                  ;83A9C6|60      |      ;
 
       CODE_FN_83A9C7:
                       JSR.W CODE_FN_83A911                 ;83A9C7|2011A9  |83A911;
                       JSR.W CODE_FN_83A9FF                 ;83A9CA|20FFA9  |83A9FF;
                       JSL.L CODE_FL_80BB2D                 ;83A9CD|222DBB80|80BB2D;
                       db $F7,$FE,$92,$F6,$86,$7E           ;83A9D1|        |      ;
                       JSR.W CODE_FN_83AA20                 ;83A9D7|2020AA  |83AA20;
                       LDA.W $0366                          ;83A9DA|AD6603  |830366;
                       BNE +                                ;83A9DD|D003    |83A9E2;
                       JSR.W CODE_FN_83A136                 ;83A9DF|2036A1  |83A136;
 
                     + RTS                                  ;83A9E2|60      |      ;
 
       CODE_FN_83A9E3:
                       JSR.W CODE_FN_83A911                 ;83A9E3|2011A9  |83A911;
                       JSR.W CODE_FN_83A9FF                 ;83A9E6|20FFA9  |83A9FF;
                       JSL.L CODE_FL_80BB2D                 ;83A9E9|222DBB80|80BB2D;
                       db $62,$A6,$93,$F6,$86,$7E           ;83A9ED|        |      ;
                       JSR.W CODE_FN_83AA20                 ;83A9F3|2020AA  |83AA20;
                       LDA.W $0366                          ;83A9F6|AD6603  |830366;
                       BNE +                                ;83A9F9|D003    |83A9FE;
                       db $20,$36,$A1                       ;83A9FB|        |83A136;
 
                     + RTS                                  ;83A9FE|60      |      ;
 
       CODE_FN_83A9FF:
                       LDA.L $7E87D8                        ;83A9FF|AFD8877E|7E87D8;
                       STA.L $7E99C1                        ;83AA03|8FC1997E|7E99C1;
                       LDA.L $7E87DA                        ;83AA07|AFDA877E|7E87DA;
                       STA.L $7E99C3                        ;83AA0B|8FC3997E|7E99C3;
                       LDA.L $7E87DC                        ;83AA0F|AFDC877E|7E87DC;
                       STA.L $7E99C5                        ;83AA13|8FC5997E|7E99C5;
                       LDA.L $7E87DE                        ;83AA17|AFDE877E|7E87DE;
                       STA.L $7E99C7                        ;83AA1B|8FC7997E|7E99C7;
                       RTS                                  ;83AA1F|60      |      ;
 
       CODE_FN_83AA20:
                       LDA.L $7E99C1                        ;83AA20|AFC1997E|7E99C1;
                       STA.L $7E87D8                        ;83AA24|8FD8877E|7E87D8;
                       LDA.L $7E99C3                        ;83AA28|AFC3997E|7E99C3;
                       STA.L $7E87DA                        ;83AA2C|8FDA877E|7E87DA;
                       LDA.L $7E99C5                        ;83AA30|AFC5997E|7E99C5;
                       STA.L $7E87DC                        ;83AA34|8FDC877E|7E87DC;
                       LDA.L $7E99C7                        ;83AA38|AFC7997E|7E99C7;
                       STA.L $7E87DE                        ;83AA3C|8FDE877E|7E87DE;
                       RTS                                  ;83AA40|60      |      ;
 
       CODE_FN_83AA41:
                       JSR.W CODE_FN_83A9FF                 ;83AA41|20FFA9  |83A9FF;
                       JSL.L CODE_FL_80BB2D                 ;83AA44|222DBB80|80BB2D;
                       db $D5,$FB,$92,$F6,$86,$7E           ;83AA48|        |      ;
                       JSR.W CODE_FN_83AA20                 ;83AA4E|2020AA  |83AA20;
                       JSR.W CODE_FN_83A10E                 ;83AA51|200EA1  |83A10E;
                       RTS                                  ;83AA54|60      |      ;
 
       CODE_FN_83AA55:
                       JSL.L CODE_FL_80BB2D                 ;83AA55|222DBB80|80BB2D;
                       db $62,$A6,$93,$F6,$86,$7E           ;83AA59|        |      ;
                       JSR.W CODE_FN_83A88B                 ;83AA5F|208BA8  |83A88B;
                       JSR.W CODE_FN_83A10E                 ;83AA62|200EA1  |83A10E;
                       RTS                                  ;83AA65|60      |      ;
 
       CODE_FN_83AA66:
                       LDX.W #$0088                         ;83AA66|A28800  |      ;
                       JSR.W CODE_FN_83916E                 ;83AA69|206E91  |83916E;
                       RTS                                  ;83AA6C|60      |      ;
 
       CODE_FN_83AA6D:
                       LDY.W #$AA75                         ;83AA6D|A075AA  |      ;
                       JSR.W CODE_FN_839FD8                 ;83AA70|20D89F  |839FD8;
                       BRA +                                ;83AA73|8004    |83AA79;
                       db $80,$01,$80,$03                   ;83AA75|        |      ;
 
                     + LDY.W #$AA81                         ;83AA79|A081AA  |      ;
                       JSR.W CODE_FN_839020                 ;83AA7C|202090  |839020;
                       BRA +                                ;83AA7F|8004    |83AA85;
                       db $02,$07,$1E,$0D                   ;83AA81|        |      ;
 
                     + RTS                                  ;83AA85|60      |      ;
 
       CODE_FN_83AA86:
                       LDY.W #$AA8E                         ;83AA86|A08EAA  |      ;
                       JSR.W CODE_FN_839FD8                 ;83AA89|20D89F  |839FD8;
                       BRA +                                ;83AA8C|8004    |83AA92;
                       db $80,$03,$40,$05                   ;83AA8E|        |      ;
 
                     + LDY.W #$AA9A                         ;83AA92|A09AAA  |      ;
                       JSR.W CODE_FN_839020                 ;83AA95|202090  |839020;
                       BRA +                                ;83AA98|8004    |83AA9E;
                       db $02,$0F,$1E,$14                   ;83AA9A|        |      ;
 
                     + RTS                                  ;83AA9E|60      |      ;
 
       CODE_FN_83AA9F:
                       LDX.W #$0182                         ;83AA9F|A28201  |      ;
                       LDY.W #$0006                         ;83AAA2|A00600  |      ;
                       JSR.W CODE_FN_839254                 ;83AAA5|205492  |839254;
                       RTS                                  ;83AAA8|60      |      ;
 
       CODE_FN_83AAA9:
                       LDX.W #$0382                         ;83AAA9|A28203  |      ;
                       LDY.W #$0005                         ;83AAAC|A00500  |      ;
                       JSR.W CODE_FN_839254                 ;83AAAF|205492  |839254;
                       RTS                                  ;83AAB2|60      |      ;
 
       CODE_FN_83AAB3:
                       LDA.W #$0050                         ;83AAB3|A95000  |      ;
                       STA.L $7E9971                        ;83AAB6|8F71997E|7E9971;
                       LDA.W #$0064                         ;83AABA|A96400  |      ;
                       SEC                                  ;83AABD|38      |      ;
                       SBC.W Speed_Level                    ;83AABE|EDB802  |8302B8;
                       TAX                                  ;83AAC1|AA      |      ;
                       LDA.W #$2D2C                         ;83AAC2|A92C2D  |      ;
 
                     - DEX                                  ;83AAC5|CA      |      ;
                       BEQ +                                ;83AAC6|F006    |83AACE;
                       SEC                                  ;83AAC8|38      |      ;
                       SBC.W #$0074                         ;83AAC9|E97400  |      ;
                       BRA -                                ;83AACC|80F7    |83AAC5;
 
                     + LDX.W #$0000                         ;83AACE|A20000  |      ;
 
                     - INX                                  ;83AAD1|E8      |      ;
                       SEC                                  ;83AAD2|38      |      ;
                       SBC.W #$0062                         ;83AAD3|E96200  |      ;
                       BPL -                                ;83AAD6|10F9    |83AAD1;
                       TXA                                  ;83AAD8|8A      |      ;
                       STA.L $7E9973                        ;83AAD9|8F73997E|7E9973;
                       LDX.W #$000F                         ;83AADD|A20F00  |      ;
 
                     - SEC                                  ;83AAE0|38      |      ;
                       SBC.W #$0008                         ;83AAE1|E90800  |      ;
                       BMI +                                ;83AAE4|3013    |83AAF9;
                       PHA                                  ;83AAE6|48      |      ;
                       LDA.L $7E9971                        ;83AAE7|AF71997E|7E9971;
                       CLC                                  ;83AAEB|18      |      ;
                       ADC.W #$0008                         ;83AAEC|690800  |      ;
                       STA.L $7E9971                        ;83AAEF|8F71997E|7E9971;
                       PLA                                  ;83AAF3|68      |      ;
                       DEX                                  ;83AAF4|CA      |      ;
                       BEQ ++                               ;83AAF5|F013    |83AB0A;
                       BRA -                                ;83AAF7|80E7    |83AAE0;
 
                     + EOR.W #$FFFF                         ;83AAF9|49FFFF  |      ;
                       JSR.W CODE_FN_83AB0B                 ;83AAFC|200BAB  |83AB0B;
 
                     - DEX                                  ;83AAFF|CA      |      ;
                       BEQ ++                               ;83AB00|F008    |83AB0A;
                       LDA.W #$0007                         ;83AB02|A90700  |      ;
                       JSR.W CODE_FN_83AB0B                 ;83AB05|200BAB  |83AB0B;
                       BRA -                                ;83AB08|80F5    |83AAFF;
 
                    ++ RTS                                  ;83AB0A|60      |      ;
 
       CODE_FN_83AB0B:
                       PHX                                  ;83AB0B|DA      |      ;
                       STA.B $02                            ;83AB0C|8502    |000002;
                       LDY.W #$0056                         ;83AB0E|A05600  |      ;
                       LDA.L $7E9971                        ;83AB11|AF71997E|7E9971;
                       TAX                                  ;83AB15|AA      |      ;
                       CLC                                  ;83AB16|18      |      ;
                       ADC.W #$0008                         ;83AB17|690800  |      ;
                       STA.L $7E9971                        ;83AB1A|8F71997E|7E9971;
                       LDA.W #$02ED                         ;83AB1E|A9ED02  |      ;
                       CLC                                  ;83AB21|18      |      ;
                       ADC.B $02                            ;83AB22|6502    |000002;
                       JSR.W CODE_FN_839B35                 ;83AB24|20359B  |839B35;
                       PLX                                  ;83AB27|FA      |      ;
                       RTS                                  ;83AB28|60      |      ;
 
       CODE_FN_83AB29:
                       LDA.W Speed_Level                    ;83AB29|ADB802  |8302B8;
                       LDY.W #$AB34                         ;83AB2C|A034AB  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83AB2F|20A2A7  |83A7A2;
                       BRA +                                ;83AB32|8009    |83AB3D;
                       db $E6,$01,$20,$07,$68,$07,$CE,$07   ;83AB34|        |      ;
                       db $02                               ;83AB3C|        |      ;
 
                     + RTS                                  ;83AB3D|60      |      ;
 
       CODE_FN_83AB3E:
                       LDA.W #$0400                         ;83AB3E|A90004  |      ;
                       LDX.W Difficulty                     ;83AB41|AEAA02  |8302AA;
                       BEQ +                                ;83AB44|F003    |83AB49;
                       LDA.W #$0800                         ;83AB46|A90008  |      ;
 
                     + LDX.W #$044C                         ;83AB49|A24C04  |      ;
                       JSR.W CODE_FN_83AB78                 ;83AB4C|2078AB  |83AB78;
                       LDA.W #$0400                         ;83AB4F|A90004  |      ;
                       LDX.W Difficulty                     ;83AB52|AEAA02  |8302AA;
                       CPX.W #$0001                         ;83AB55|E00100  |      ;
                       BEQ +                                ;83AB58|F003    |83AB5D;
                       LDA.W #$0800                         ;83AB5A|A90008  |      ;
 
                     + LDX.W #$045A                         ;83AB5D|A25A04  |      ;
                       JSR.W CODE_FN_83AB78                 ;83AB60|2078AB  |83AB78;
                       LDA.W #$0400                         ;83AB63|A90004  |      ;
                       LDX.W Difficulty                     ;83AB66|AEAA02  |8302AA;
                       CPX.W #$0002                         ;83AB69|E00200  |      ;
                       BEQ +                                ;83AB6C|F003    |83AB71;
                       LDA.W #$0800                         ;83AB6E|A90008  |      ;
 
                     + LDX.W #$0468                         ;83AB71|A26804  |      ;
                       JSR.W CODE_FN_83AB78                 ;83AB74|2078AB  |83AB78;
                       RTS                                  ;83AB77|60      |      ;
 
       CODE_FN_83AB78:
                       STA.B $00                            ;83AB78|8500    |000000;
                       LDA.W #$0002                         ;83AB7A|A90200  |      ;
                       STA.B $02                            ;83AB7D|8502    |000002;
 
                     - LDY.W #$0006                         ;83AB7F|A00600  |      ;
 
                    -- LDA.L $7E2000,X                      ;83AB82|BF00207E|7E2000;
                       AND.W #$E3FF                         ;83AB86|29FFE3  |      ;
                       ORA.B $00                            ;83AB89|0500    |000000;
                       STA.L $7E2000,X                      ;83AB8B|9F00207E|7E2000;
                       INX                                  ;83AB8F|E8      |      ;
                       INX                                  ;83AB90|E8      |      ;
                       DEY                                  ;83AB91|88      |      ;
                       BNE --                               ;83AB92|D0EE    |83AB82;
                       TXA                                  ;83AB94|8A      |      ;
                       CLC                                  ;83AB95|18      |      ;
                       ADC.W #$0034                         ;83AB96|693400  |      ;
                       TAX                                  ;83AB99|AA      |      ;
                       DEC.B $02                            ;83AB9A|C602    |000002;
                       BNE -                                ;83AB9C|D0E1    |83AB7F;
                       RTS                                  ;83AB9E|60      |      ;
 
       CODE_FN_83AB9F:
                       LDA.W $1A6E                          ;83AB9F|AD6E1A  |831A6E;
                       BNE +                                ;83ABA2|D043    |83ABE7;
                       LDX.W #$0007                         ;83ABA4|A20700  |      ;
 
                     - LDA.W #$0000                         ;83ABA7|A90000  |      ;
                       SEP #$20                             ;83ABAA|E220    |      ;
                       LDA.L Password_Input,X               ;83ABAC|BF00967E|7E9600;
                       BEQ ++                               ;83ABB0|F00C    |83ABBE;
                       CMP.B #$25                           ;83ABB2|C925    |      ;
                       BPL +++                              ;83ABB4|100F    |83ABC5;
                       REP #$20                             ;83ABB6|C220    |      ;
                       CLC                                  ;83ABB8|18      |      ;
                       ADC.W #$044F                         ;83ABB9|694F04  |      ;
                       BRA ++++                             ;83ABBC|8012    |83ABD0;
 
                    ++ REP #$20                             ;83ABBE|C220    |      ;
                       LDA.W #$0474                         ;83ABC0|A97404  |      ;
                       BRA ++++                             ;83ABC3|800B    |83ABD0;
 
                   +++ REP #$20                             ;83ABC5|C220    |      ;
                       SEC                                  ;83ABC7|38      |      ;
                       SBC.W #$0025                         ;83ABC8|E92500  |      ;
                       ASL A                                ;83ABCB|0A      |      ;
                       TAY                                  ;83ABCC|A8      |      ;
                       LDA.W DATA8_83ABF9,Y                 ;83ABCD|B9F9AB  |83ABF9;
 
                  ++++ PHX                                  ;83ABD0|DA      |      ;
                       PHA                                  ;83ABD1|48      |      ;
                       TXA                                  ;83ABD2|8A      |      ;
                       ASL A                                ;83ABD3|0A      |      ;
                       TAX                                  ;83ABD4|AA      |      ;
                       PLA                                  ;83ABD5|68      |      ;
                       STA.L $7E2418,X                      ;83ABD6|9F18247E|7E2418;
                       PLX                                  ;83ABDA|FA      |      ;
                       DEX                                  ;83ABDB|CA      |      ;
                       BPL -                                ;83ABDC|10C9    |83ABA7;
                       LDA.W #$0C0E                         ;83ABDE|A90E0C  |      ;
                       STA.L $7E2428                        ;83ABE1|8F28247E|7E2428;
                       BRA ++                               ;83ABE5|800E    |83ABF5;
 
                     + LDX.W #$0012                         ;83ABE7|A21200  |      ;
 
                     - LDA.W DATA8_83AC05,X                 ;83ABEA|BD05AC  |83AC05;
                       STA.L $7E2416,X                      ;83ABED|9F16247E|7E2416;
                       DEX                                  ;83ABF1|CA      |      ;
                       DEX                                  ;83ABF2|CA      |      ;
                       BPL -                                ;83ABF3|10F5    |83ABEA;
 
                    ++ JSR.W CODE_FN_83A02C                 ;83ABF5|202CA0  |83A02C;
                       RTS                                  ;83ABF8|60      |      ;
 
         DATA8_83ABF9:
                       db $DC,$04,$76,$04,$77,$04,$47,$04   ;83ABF9|        |      ;
                       db $75,$04,$0E,$04                   ;83AC01|        |000004;
 
         DATA8_83AC05:
                       db $0E,$04,$0E,$04,$5E,$04,$6B,$04   ;83AC05|        |      ;
                       db $6B,$04,$68,$04,$6B,$04,$77,$04   ;83AC0D|        |      ;
                       db $77,$04,$0E,$04                   ;83AC15|        |      ;
                       db $0E,$04,$0E,$04                   ;83AC19|        |000E04;
 
       CODE_FN_83AC1D:
                       LDX.W #$0086                         ;83AC1D|A28600  |      ;
                       LDY.W #$000B                         ;83AC20|A00B00  |      ;
                       JSR.W CODE_FN_839137                 ;83AC23|203791  |839137;
                       RTS                                  ;83AC26|60      |      ;
 
       CODE_FN_83AC27:
                       LDY.W #$AC2F                         ;83AC27|A02FAC  |      ;
                       JSR.W CODE_FN_8391C4                 ;83AC2A|20C491  |8391C4;
                       BRA +                                ;83AC2D|8004    |83AC33;
                       db $05,$06,$1A,$14                   ;83AC2F|        |      ;
 
                     + RTS                                  ;83AC33|60      |      ;
 
       CODE_FN_83AC34:
                       STA.L $7E3000,X                      ;83AC34|9F00307E|7E3000;
                       STA.L $7E3002,X                      ;83AC38|9F02307E|7E3002;
                       STA.L $7E3004,X                      ;83AC3C|9F04307E|7E3004;
                       STA.L $7E3006,X                      ;83AC40|9F06307E|7E3006;
                       STA.L $7E3040,X                      ;83AC44|9F40307E|7E3040;
                       STA.L $7E3042,X                      ;83AC48|9F42307E|7E3042;
                       STA.L $7E3044,X                      ;83AC4C|9F44307E|7E3044;
                       STA.L $7E3046,X                      ;83AC50|9F46307E|7E3046;
                       STA.L $7E3080,X                      ;83AC54|9F80307E|7E3080;
                       STA.L $7E3082,X                      ;83AC58|9F82307E|7E3082;
                       STA.L $7E3084,X                      ;83AC5C|9F84307E|7E3084;
                       STA.L $7E3086,X                      ;83AC60|9F86307E|7E3086;
                       STA.L $7E30C0,X                      ;83AC64|9FC0307E|7E30C0;
                       STA.L $7E30C2,X                      ;83AC68|9FC2307E|7E30C2;
                       STA.L $7E30C4,X                      ;83AC6C|9FC4307E|7E30C4;
                       STA.L $7E30C6,X                      ;83AC70|9FC6307E|7E30C6;
                       RTS                                  ;83AC74|60      |      ;
 
       CODE_FN_83AC75:
                       JSR.W CODE_FN_83AC93                 ;83AC75|2093AC  |83AC93;
                       LDA.W Character_1P                   ;83AC78|ADBA02  |8302BA;
                       ASL A                                ;83AC7B|0A      |      ;
                       TAY                                  ;83AC7C|A8      |      ;
                       LDX.W DATA8_83AC87,Y                 ;83AC7D|BE87AC  |83AC87;
                       LDA.W #$0000                         ;83AC80|A90000  |      ;
                       JSR.W CODE_FN_83AC34                 ;83AC83|2034AC  |83AC34;
                       RTS                                  ;83AC86|60      |      ;
 
         DATA8_83AC87:
                       db $10,$02,$1A,$02,$24,$02,$90,$03   ;83AC87|        |      ;
                       db $9A,$03,$A4,$03                   ;83AC8F|        |      ;
 
       CODE_FN_83AC93:
                       LDY.W #$000A                         ;83AC93|A00A00  |      ;
 
                     - LDX.W DATA8_83AC87,Y                 ;83AC96|BE87AC  |83AC87;
                       LDA.W #$0012                         ;83AC99|A91200  |      ;
                       JSR.W CODE_FN_83AC34                 ;83AC9C|2034AC  |83AC34;
                       DEY                                  ;83AC9F|88      |      ;
                       DEY                                  ;83ACA0|88      |      ;
                       BPL -                                ;83ACA1|10F3    |83AC96;
                       RTS                                  ;83ACA3|60      |      ;
 
       CODE_FN_83ACA4:
                       LDX.W #$0046                         ;83ACA4|A24600  |      ;
                       LDY.W #$0009                         ;83ACA7|A00900  |      ;
                       JSR.W CODE_FN_839137                 ;83ACAA|203791  |839137;
                       RTS                                  ;83ACAD|60      |      ;
 
       CODE_FN_83ACAE:
                       LDY.W #$ACB6                         ;83ACAE|A0B6AC  |      ;
                       JSR.W CODE_FN_839020                 ;83ACB1|202090  |839020;
                       BRA +                                ;83ACB4|8004    |83ACBA;
                       db $02,$05,$0F,$0B                   ;83ACB6|        |      ;
 
                     + LDY.W #$ACC2                         ;83ACBA|A0C2AC  |      ;
                       JSR.W CODE_FN_839020                 ;83ACBD|202090  |839020;
                       BRA +                                ;83ACC0|8004    |83ACC6;
                       db $11,$05,$1E,$0B                   ;83ACC2|        |      ;
 
                     + LDY.W #$ACCE                         ;83ACC6|A0CEAC  |      ;
                       JSR.W CODE_FN_839020                 ;83ACC9|202090  |839020;
                       BRA +                                ;83ACCC|8004    |83ACD2;
                       db $02,$0D,$0F,$13                   ;83ACCE|        |      ;
 
                     + LDY.W #$ACDA                         ;83ACD2|A0DAAC  |      ;
                       JSR.W CODE_FN_839020                 ;83ACD5|202090  |839020;
                       BRA +                                ;83ACD8|8004    |83ACDE;
                       db $11,$0D,$1E,$13                   ;83ACDA|        |      ;
 
                     + LDY.W #$ACE6                         ;83ACDE|A0E6AC  |      ;
                       JSR.W CODE_FN_839020                 ;83ACE1|202090  |839020;
                       BRA +                                ;83ACE4|8004    |83ACEA;
                       db $02,$15,$0F,$1B                   ;83ACE6|        |      ;
 
                     + LDY.W #$ACF2                         ;83ACEA|A0F2AC  |      ;
                       JSR.W CODE_FN_839020                 ;83ACED|202090  |839020;
                       BRA +                                ;83ACF0|8004    |83ACF6;
                       db $11,$15,$1E,$1B                   ;83ACF2|        |      ;
 
                     + RTS                                  ;83ACF6|60      |      ;
 
       CODE_FN_83ACF7:
                       JSL.L CODE_FL_80BB2D                 ;83ACF7|222DBB80|80BB2D;
                       db $99,$A5,$93,$00,$5D,$7F           ;83ACFB|        |      ;
                       PHB                                  ;83AD01|8B      |      ;
                       PEA.W $7E00                          ;83AD02|F4007E  |837E00;
                       PLB                                  ;83AD05|AB      |      ;
                       PLB                                  ;83AD06|AB      |      ;
                       LDA.W #$0008                         ;83AD07|A90800  |      ;
                       STA.B $02                            ;83AD0A|8502    |000002;
                       LDX.W #$0000                         ;83AD0C|A20000  |      ;
                       LDY.W #$0000                         ;83AD0F|A00000  |      ;
 
                     - LDA.W #$000F                         ;83AD12|A90F00  |      ;
                       STA.B $00                            ;83AD15|8500    |000000;
 
                    -- LDA.L $7F5D00,X                      ;83AD17|BF005D7F|7F5D00;
                       STA.W $2812,Y                        ;83AD1B|991228  |7E2812;
                       INX                                  ;83AD1E|E8      |      ;
                       INX                                  ;83AD1F|E8      |      ;
                       INY                                  ;83AD20|C8      |      ;
                       INY                                  ;83AD21|C8      |      ;
                       DEC.B $00                            ;83AD22|C600    |000000;
                       BNE --                               ;83AD24|D0F1    |83AD17;
                       TYA                                  ;83AD26|98      |      ;
                       CLC                                  ;83AD27|18      |      ;
                       ADC.W #$0022                         ;83AD28|692200  |      ;
                       TAY                                  ;83AD2B|A8      |      ;
                       DEC.B $02                            ;83AD2C|C602    |000002;
                       BNE -                                ;83AD2E|D0E2    |83AD12;
                       PLB                                  ;83AD30|AB      |      ;
                       LDA.W #$000D                         ;83AD31|A90D00  |      ;
                       STA.L $7E2A6E                        ;83AD34|8F6E2A7E|7E2A6E;
                       LDA.W #$001D                         ;83AD38|A91D00  |      ;
                       STA.L $7E2AAE                        ;83AD3B|8FAE2A7E|7E2AAE;
                       STA.L $7E2AEE                        ;83AD3F|8FEE2A7E|7E2AEE;
                       STA.L $7E2B2E                        ;83AD43|8F2E2B7E|7E2B2E;
                       STA.L $7E2B6E                        ;83AD47|8F6E2B7E|7E2B6E;
                       STA.L $7E2BAE                        ;83AD4B|8FAE2B7E|7E2BAE;
                       LDA.W #$002D                         ;83AD4F|A92D00  |      ;
                       STA.L $7E2BD4                        ;83AD52|8FD42B7E|7E2BD4;
                       LDY.W #$AD61                         ;83AD56|A061AD  |      ;
                       LDX.W #$2BD6                         ;83AD59|A2D62B  |      ;
                       JSR.W CODE_FN_839F7F                 ;83AD5C|207F9F  |839F7F;
                       BRA +                                ;83AD5F|8003    |83AD64;
                       db $0C,$2E,$00                       ;83AD61|        |      ;
 
                     + LDA.W #$002F                         ;83AD64|A92F00  |      ;
                       STA.L $7E2BEE                        ;83AD67|8FEE2B7E|7E2BEE;
                       RTS                                  ;83AD6B|60      |      ;
 
       CODE_FN_83AD6C:
                       PHB                                  ;83AD6C|8B      |      ;
                       PHK                                  ;83AD6D|4B      |      ;
                       PLB                                  ;83AD6E|AB      |      ;
                       LDY.W #$AD79                         ;83AD6F|A079AD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83AD72|22CAA080|80A0CA;
                       PLB                                  ;83AD76|AB      |      ;
                       BRA +                                ;83AD77|8008    |83AD81;
                       db $00,$28,$7E,$00,$02,$80,$00,$6D   ;83AD79|        |      ;
 
                     + PHB                                  ;83AD81|8B      |      ;
                       PHK                                  ;83AD82|4B      |      ;
                       PLB                                  ;83AD83|AB      |      ;
                       LDY.W #$AD8E                         ;83AD84|A08EAD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83AD87|22CAA080|80A0CA;
                       PLB                                  ;83AD8B|AB      |      ;
                       BRA +                                ;83AD8C|8008    |83AD96;
                       db $00,$2A,$7E,$00,$02,$80,$00,$7D   ;83AD8E|        |      ;
 
                     + RTS                                  ;83AD96|60      |      ;
 
       CODE_FN_83AD97:
                       LDX.W #$28A0                         ;83AD97|A2A028  |      ;
                       LDY.W #$ADD3                         ;83AD9A|A0D3AD  |      ;
                       LDA.W #$0006                         ;83AD9D|A90600  |      ;
                       STA.B $00                            ;83ADA0|8500    |000000;
                       LDA.W #$0003                         ;83ADA2|A90300  |      ;
                       JSR.W CODE_FN_83A865                 ;83ADA5|2065A8  |83A865;
                       PHB                                  ;83ADA8|8B      |      ;
                       PHK                                  ;83ADA9|4B      |      ;
                       PLB                                  ;83ADAA|AB      |      ;
                       LDY.W #$ADB5                         ;83ADAB|A0B5AD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83ADAE|22CAA080|80A0CA;
                       PLB                                  ;83ADB2|AB      |      ;
                       BRA +                                ;83ADB3|8008    |83ADBD;
                       db $00,$28,$7E,$00,$02,$80,$C0,$6B   ;83ADB5|        |      ;
 
                     + PHB                                  ;83ADBD|8B      |      ;
                       PHK                                  ;83ADBE|4B      |      ;
                       PLB                                  ;83ADBF|AB      |      ;
                       LDY.W #$ADCA                         ;83ADC0|A0CAAD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83ADC3|22CAA080|80A0CA;
                       PLB                                  ;83ADC7|AB      |      ;
                       BRA +                                ;83ADC8|8008    |83ADD2;
                       db $00,$2A,$7E,$00,$02,$80,$C0,$7B   ;83ADCA|        |      ;
 
                     + RTS                                  ;83ADD2|60      |      ;
                       db $90,$09,$91,$09,$92,$09,$93,$09   ;83ADD3|        |      ;
                       db $94,$09,$95,$09,$96,$09,$A0,$09   ;83ADDB|        |      ;
                       db $A1,$09,$A2,$09,$A3,$09,$A4,$09   ;83ADE3|        |      ;
                       db $A5,$09,$A6,$09,$97,$09,$98,$09   ;83ADEB|        |      ;
                       db $99,$09,$9A,$09,$A7,$09,$A8,$09   ;83ADF3|        |      ;
                       db $A9,$09                           ;83ADFB|        |      ;
 
       CODE_FN_83ADFD:
                       LDA.W $0342                          ;83ADFD|AD4203  |830342;
                       BEQ +                                ;83AE00|F020    |83AE22;
                       ASL A                                ;83AE02|0A      |      ;
                       TAY                                  ;83AE03|A8      |      ;
 
                     - DEY                                  ;83AE04|88      |      ;
                       DEY                                  ;83AE05|88      |      ;
                       BMI +                                ;83AE06|301A    |83AE22;
                       LDX.W DATA8_83AE42,Y                 ;83AE08|BE42AE  |83AE42;
                       PHY                                  ;83AE0B|5A      |      ;
                       LDY.W #$AE2F                         ;83AE0C|A02FAE  |      ;
                       JSR.W CODE_FN_83A822                 ;83AE0F|2022A8  |83A822;
                       PLY                                  ;83AE12|7A      |      ;
                       TXA                                  ;83AE13|8A      |      ;
                       SEC                                  ;83AE14|38      |      ;
                       SBC.W #$0038                         ;83AE15|E93800  |      ;
                       TAX                                  ;83AE18|AA      |      ;
                       LDA.W DATA8_83AE23,Y                 ;83AE19|B923AE  |83AE23;
                       STA.L $7E0000,X                      ;83AE1C|9F00007E|7E0000;
                       BRA -                                ;83AE20|80E2    |83AE04;
 
                     + RTS                                  ;83AE22|60      |      ;
 
         DATA8_83AE23:
                       db $CF,$05,$8C,$05,$8C,$05,$7F,$05   ;83AE23|        |      ;
                       db $8F,$05,$8F,$05,$04,$03,$00,$05   ;83AE2B|        |      ;
                       db $65,$66,$67,$68,$69,$BB,$BC,$BD   ;83AE33|        |      ;
                       db $BE,$BF,$CB,$CC,$CD,$CE,$CF       ;83AE3B|        |      ;
 
         DATA8_83AE42:
                       db $D2,$21,$F0,$21,$D2,$23,$F0,$23   ;83AE42|        |      ;
                       db $D2,$25,$F0,$25                   ;83AE4A|        |      ;
 
       CODE_FN_83AE4E:
                       LDA.W $0342                          ;83AE4E|AD4203  |830342;
                       ASL A                                ;83AE51|0A      |      ;
                       TAY                                  ;83AE52|A8      |      ;
                       PHY                                  ;83AE53|5A      |      ;
                       LDX.W DATA8_83AE42,Y                 ;83AE54|BE42AE  |83AE42;
                       LDY.W #$AE5F                         ;83AE57|A05FAE  |      ;
                       JSR.W CODE_FN_83A822                 ;83AE5A|2022A8  |83A822;
                       PLY                                  ;83AE5D|7A      |      ;
                       RTS                                  ;83AE5E|60      |      ;
                       db $04,$02,$00,$05,$65,$66,$67,$68   ;83AE5F|        |      ;
                       db $69,$85,$86,$87,$88,$89           ;83AE67|        |      ;
 
       CODE_FN_83AE6D:
                       LDA.W StageClear_LevelLo             ;83AE6D|AD3C03  |83033C;
                       DEC A                                ;83AE70|3A      |      ;
                       ASL A                                ;83AE71|0A      |      ;
                       TAY                                  ;83AE72|A8      |      ;
                       LDX.W DATA8_83AE42,Y                 ;83AE73|BE42AE  |83AE42;
                       LDY.W #$041E                         ;83AE76|A01E04  |      ;
                       LDA.W #$0004                         ;83AE79|A90400  |      ;
                       STA.B $00                            ;83AE7C|8500    |000000;
                       LDA.W #$0002                         ;83AE7E|A90200  |      ;
                       JSR.W CODE_FN_83A800                 ;83AE81|2000A8  |83A800;
                       LDY.W #$AEA7                         ;83AE84|A0A7AE  |      ;
                       JSR.W CODE_FN_83A822                 ;83AE87|2022A8  |83A822;
                       LDY.W StageClear_LevelLo             ;83AE8A|AC3C03  |83033C;
                       DEY                                  ;83AE8D|88      |      ;
                       TXA                                  ;83AE8E|8A      |      ;
                       SEC                                  ;83AE8F|38      |      ;
                       SBC.W #$0038                         ;83AE90|E93800  |      ;
                       TAX                                  ;83AE93|AA      |      ;
                       LDA.W DATA8_83AEA1,Y                 ;83AE94|B9A1AE  |83AEA1;
                       AND.W #$00FF                         ;83AE97|29FF00  |      ;
                       ORA.B $04                            ;83AE9A|0504    |000004;
                       STA.L $7E0000,X                      ;83AE9C|9F00007E|7E0000;
                       RTS                                  ;83AEA0|60      |      ;
 
         DATA8_83AEA1:
                       db $7A,$7B,$7B,$7E,$7D,$7D,$03,$01   ;83AEA1|        |      ;
                       db $00,$05,$5C,$5D,$5E,$5F,$60       ;83AEA9|        |      ;
 
       CODE_FN_83AEB0:
                       LDA.W $0342                          ;83AEB0|AD4203  |830342;
                       CMP.W #$0006                         ;83AEB3|C90600  |      ;
                       BEQ +                                ;83AEB6|F022    |83AEDA;
                       LSR A                                ;83AEB8|4A      |      ;
                       TAX                                  ;83AEB9|AA      |      ;
                       LDA.W DATA8_83AEDD,X                 ;83AEBA|BDDDAE  |83AEDD;
                       AND.W #$00FF                         ;83AEBD|29FF00  |      ;
                       TAY                                  ;83AEC0|A8      |      ;
                       LDA.W $0342                          ;83AEC1|AD4203  |830342;
                       AND.W #$0001                         ;83AEC4|290100  |      ;
                       TAX                                  ;83AEC7|AA      |      ;
                       LDA.W DATA8_83AEDB,X                 ;83AEC8|BDDBAE  |83AEDB;
                       AND.W #$00FF                         ;83AECB|29FF00  |      ;
                       TAX                                  ;83AECE|AA      |      ;
                       LDA.W StageClear_LevelHi             ;83AECF|AD3E03  |83033E;
                       BEQ +                                ;83AED2|F006    |83AEDA;
                       DEC A                                ;83AED4|3A      |      ;
                       BEQ +                                ;83AED5|F003    |83AEDA;
                       JSR.W CODE_FN_83B553                 ;83AED7|2053B5  |83B553;
 
                     + RTS                                  ;83AEDA|60      |      ;
 
         DATA8_83AEDB:
                       db $4F,$C7                           ;83AEDB|        |      ;
 
         DATA8_83AEDD:
                       db $40,$80,$C0                       ;83AEDD|        |      ;
 
       CODE_FN_83AEE0:
                       LDA.L $7E96E5                        ;83AEE0|AFE5967E|7E96E5;
                       STA.W $01CD                          ;83AEE4|8DCD01  |8301CD;
                       STA.W $01D5                          ;83AEE7|8DD501  |8301D5;
                       RTS                                  ;83AEEA|60      |      ;
 
       CODE_FN_83AEEB:
                       LDX.W #$01FE                         ;83AEEB|A2FE01  |      ;
 
                     - LDA.L $7E2100,X                      ;83AEEE|BF00217E|7E2100;
                       STA.L $7F5D00,X                      ;83AEF2|9F005D7F|7F5D00;
                       DEX                                  ;83AEF6|CA      |      ;
                       DEX                                  ;83AEF7|CA      |      ;
                       BPL -                                ;83AEF8|10F4    |83AEEE;
                       LDX.W #$01FE                         ;83AEFA|A2FE01  |      ;
                       LDA.W #$0000                         ;83AEFD|A90000  |      ;
 
                     - STA.L $7F5F00,X                      ;83AF00|9F005F7F|7F5F00;
                       DEX                                  ;83AF04|CA      |      ;
                       DEX                                  ;83AF05|CA      |      ;
                       BPL -                                ;83AF06|10F8    |83AF00;
                       LDX.W #$03FE                         ;83AF08|A2FE03  |      ;
 
                     - LDA.L $7E2300,X                      ;83AF0B|BF00237E|7E2300;
                       STA.L $7F6100,X                      ;83AF0F|9F00617F|7F6100;
                       DEX                                  ;83AF13|CA      |      ;
                       DEX                                  ;83AF14|CA      |      ;
                       BPL -                                ;83AF15|10F4    |83AF0B;
                       LDX.W #$06FE                         ;83AF17|A2FE06  |      ;
                       LDA.W #$0000                         ;83AF1A|A90000  |      ;
 
                     - STA.L $7F6500,X                      ;83AF1D|9F00657F|7F6500;
                       DEX                                  ;83AF21|CA      |      ;
                       DEX                                  ;83AF22|CA      |      ;
                       BPL -                                ;83AF23|10F8    |83AF1D;
                       LDX.W #$00FE                         ;83AF25|A2FE00  |      ;
 
                     - LDA.L $7E2000,X                      ;83AF28|BF00207E|7E2000;
                       STA.L $7F6C00,X                      ;83AF2C|9F006C7F|7F6C00;
                       DEX                                  ;83AF30|CA      |      ;
                       DEX                                  ;83AF31|CA      |      ;
                       BPL -                                ;83AF32|10F4    |83AF28;
                       LDX.W #$01FE                         ;83AF34|A2FE01  |      ;
 
                     - LDA.L $7E3100,X                      ;83AF37|BF00317E|7E3100;
                       STA.L $7F6D00,X                      ;83AF3B|9F006D7F|7F6D00;
                       DEX                                  ;83AF3F|CA      |      ;
                       DEX                                  ;83AF40|CA      |      ;
                       BPL -                                ;83AF41|10F4    |83AF37;
                       LDX.W #$01FE                         ;83AF43|A2FE01  |      ;
                       LDA.W #$0000                         ;83AF46|A90000  |      ;
 
                     - STA.L $7F6F00,X                      ;83AF49|9F006F7F|7F6F00;
                       DEX                                  ;83AF4D|CA      |      ;
                       DEX                                  ;83AF4E|CA      |      ;
                       BPL -                                ;83AF4F|10F8    |83AF49;
                       LDX.W #$03FE                         ;83AF51|A2FE03  |      ;
 
                     - LDA.L $7E3300,X                      ;83AF54|BF00337E|7E3300;
                       STA.L $7F7100,X                      ;83AF58|9F00717F|7F7100;
                       DEX                                  ;83AF5C|CA      |      ;
                       DEX                                  ;83AF5D|CA      |      ;
                       BPL -                                ;83AF5E|10F4    |83AF54;
                       LDX.W #$06FE                         ;83AF60|A2FE06  |      ;
                       LDA.W #$0000                         ;83AF63|A90000  |      ;
 
                     - STA.L $7F7500,X                      ;83AF66|9F00757F|7F7500;
                       DEX                                  ;83AF6A|CA      |      ;
                       DEX                                  ;83AF6B|CA      |      ;
                       BPL -                                ;83AF6C|10F8    |83AF66;
                       LDX.W #$00FE                         ;83AF6E|A2FE00  |      ;
 
                     - LDA.L $7E3000,X                      ;83AF71|BF00307E|7E3000;
                       STA.L $7F7C00,X                      ;83AF75|9F007C7F|7F7C00;
                       DEX                                  ;83AF79|CA      |      ;
                       DEX                                  ;83AF7A|CA      |      ;
                       BPL -                                ;83AF7B|10F4    |83AF71;
                       RTS                                  ;83AF7D|60      |      ;
                       LDY.W #$AF89                         ;83AF7E|A089AF  |      ;
                       LDX.W #$3144                         ;83AF81|A24431  |      ;
                       JSR.W CODE_FN_839F4C                 ;83AF84|204C9F  |839F4C;
                       BRA +                                ;83AF87|8003    |83AF8C;
                       db $0D,$06,$26                       ;83AF89|        |      ;
 
                     + RTS                                  ;83AF8C|60      |      ;
                       LDY.W #$AF98                         ;83AF8D|A098AF  |      ;
                       LDX.W #$3162                         ;83AF90|A26231  |      ;
                       JSR.W CODE_FN_839F4C                 ;83AF93|204C9F  |839F4C;
                       BRA +                                ;83AF96|8003    |83AF9B;
                       db $0D,$06,$26                       ;83AF98|        |      ;
 
                     + RTS                                  ;83AF9B|60      |      ;
                       LDY.W #$AFA7                         ;83AF9C|A0A7AF  |      ;
                       LDX.W #$3344                         ;83AF9F|A24433  |      ;
                       JSR.W CODE_FN_839F4C                 ;83AFA2|204C9F  |839F4C;
                       BRA +                                ;83AFA5|8003    |83AFAA;
                       db $0D,$06,$26                       ;83AFA7|        |      ;
 
                     + RTS                                  ;83AFAA|60      |      ;
                       LDY.W #$AFB6                         ;83AFAB|A0B6AF  |      ;
                       LDX.W #$3362                         ;83AFAE|A26233  |      ;
                       JSR.W CODE_FN_839F4C                 ;83AFB1|204C9F  |839F4C;
                       BRA +                                ;83AFB4|8003    |83AFB9;
                       db $0D,$06,$26                       ;83AFB6|        |      ;
 
                     + RTS                                  ;83AFB9|60      |      ;
                       LDY.W #$AFC5                         ;83AFBA|A0C5AF  |      ;
                       LDX.W #$3544                         ;83AFBD|A24435  |      ;
                       JSR.W CODE_FN_839F4C                 ;83AFC0|204C9F  |839F4C;
                       BRA +                                ;83AFC3|8003    |83AFC8;
                       db $0D,$06,$26                       ;83AFC5|        |      ;
 
                     + RTS                                  ;83AFC8|60      |      ;
                       LDY.W #$AFD4                         ;83AFC9|A0D4AF  |      ;
                       LDX.W #$3562                         ;83AFCC|A26235  |      ;
                       JSR.W CODE_FN_839F4C                 ;83AFCF|204C9F  |839F4C;
                       BRA +                                ;83AFD2|8003    |83AFD7;
                       db $0D,$06,$26                       ;83AFD4|        |      ;
 
                     + RTS                                  ;83AFD7|60      |      ;
 
       CODE_FN_83AFD8:
                       DEC.W $0342                          ;83AFD8|CE4203  |000342;
                       JSR.W CODE_FN_83AFE2                 ;83AFDB|20E2AF  |83AFE2;
                       INC.W $0342                          ;83AFDE|EE4203  |000342;
                       RTS                                  ;83AFE1|60      |      ;
 
       CODE_FN_83AFE2:
                       LDX.W #$000A                         ;83AFE2|A20A00  |      ;
 
                     - TXA                                  ;83AFE5|8A      |      ;
                       LSR A                                ;83AFE6|4A      |      ;
                       DEC A                                ;83AFE7|3A      |      ;
                       CMP.W $0342                          ;83AFE8|CD4203  |830342;
                       BMI +                                ;83AFEB|3005    |83AFF2;
                       LDA.W #$0012                         ;83AFED|A91200  |      ;
                       BRA ++                               ;83AFF0|8003    |83AFF5;
 
                     + LDA.W #$0000                         ;83AFF2|A90000  |      ;
 
                    ++ PHX                                  ;83AFF5|DA      |      ;
                       JSR.W (DATA8_83AFFF,X)               ;83AFF6|FCFFAF  |83AFFF;
                       PLX                                  ;83AFF9|FA      |      ;
                       DEX                                  ;83AFFA|CA      |      ;
                       DEX                                  ;83AFFB|CA      |      ;
                       BPL -                                ;83AFFC|10E7    |83AFE5;
                       RTS                                  ;83AFFE|60      |      ;
 
         DATA8_83AFFF:
                       db $7E,$AF,$8D,$AF,$9C,$AF,$AB,$AF   ;83AFFF|        |      ;
                       db $BA,$AF,$C9,$AF                   ;83B007|        |      ;
 
       CODE_FN_83B00B:
                       JSL.L CODE_FL_80BB2D                 ;83B00B|222DBB80|80BB2D;
                       db $A8,$A3,$93,$00,$5D,$7F           ;83B00F|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;83B015|222DBB80|80BB2D;
                       db $3B,$A9,$94,$00,$5E,$7F           ;83B019|        |      ;
                       LDY.W #$B027                         ;83B01F|A027B0  |      ;
                       JSR.W CODE_FN_8386F6                 ;83B022|20F686  |8386F6;
                       BRA +                                ;83B025|8006    |83B02D;
                       db $46,$5D,$0A,$21,$0C,$03           ;83B027|        |      ;
 
                     + LDY.W #$B035                         ;83B02D|A035B0  |      ;
                       JSR.W CODE_FN_8386F6                 ;83B030|20F686  |8386F6;
                       BRA +                                ;83B033|8006    |83B03B;
                       db $62,$5D,$22,$21,$0E,$03           ;83B035|        |      ;
 
                     + LDX.W #$010A                         ;83B03B|A20A01  |      ;
                       LDY.W #$0009                         ;83B03E|A00900  |      ;
                       JSR.W CODE_FN_839137                 ;83B041|203791  |839137;
                       LDA.W $0348                          ;83B044|AD4803  |830348;
                       CMP.W #$003C                         ;83B047|C93C00  |      ;
                       BEQ +                                ;83B04A|F011    |83B05D;
                       LDX.W #$000A                         ;83B04C|A20A00  |      ;
                       JSR.W CODE_FN_838562                 ;83B04F|206285  |838562;
                       STA.B $00                            ;83B052|8500    |000000;
                       TXA                                  ;83B054|8A      |      ;
                       ASL A                                ;83B055|0A      |      ;
                       TAY                                  ;83B056|A8      |      ;
                       LDX.W DATA8_83B05E,Y                 ;83B057|BE5EB0  |83B05E;
                       JSR.W CODE_FN_83B06A                 ;83B05A|206AB0  |83B06A;
 
                     + RTS                                  ;83B05D|60      |      ;
 
         DATA8_83B05E:
                       db $02,$01,$20,$01,$02,$03,$20,$03   ;83B05E|        |      ;
                       db $02,$05,$20,$05                   ;83B066|        |      ;
 
       CODE_FN_83B06A:
                       LDA.B $00                            ;83B06A|A500    |000000;
                       SEC                                  ;83B06C|38      |      ;
                       SBC.W #$0005                         ;83B06D|E90500  |      ;
                       BPL +                                ;83B070|101B    |83B08D;
                       TXA                                  ;83B072|8A      |      ;
                       CLC                                  ;83B073|18      |      ;
                       ADC.B $00                            ;83B074|6500    |000000;
                       CLC                                  ;83B076|18      |      ;
                       ADC.B $00                            ;83B077|6500    |000000;
                       TAX                                  ;83B079|AA      |      ;
                       LDA.W #$0550                         ;83B07A|A95005  |      ;
                       CLC                                  ;83B07D|18      |      ;
                       ADC.B $00                            ;83B07E|6500    |000000;
                       STA.L $7F5DD0,X                      ;83B080|9FD05D7F|7F5DD0;
                       CLC                                  ;83B084|18      |      ;
                       ADC.W #$0010                         ;83B085|691000  |      ;
                       STA.L $7F5E10,X                      ;83B088|9F105E7F|7F5E10;
                       RTS                                  ;83B08C|60      |      ;
 
                     + STA.B $00                            ;83B08D|8500    |000000;
                       TXA                                  ;83B08F|8A      |      ;
                       CLC                                  ;83B090|18      |      ;
                       ADC.B $00                            ;83B091|6500    |000000;
                       CLC                                  ;83B093|18      |      ;
                       ADC.B $00                            ;83B094|6500    |000000;
                       TAX                                  ;83B096|AA      |      ;
                       LDA.W #$0540                         ;83B097|A94005  |      ;
                       CLC                                  ;83B09A|18      |      ;
                       ADC.B $00                            ;83B09B|6500    |000000;
                       STA.L $7F5E50,X                      ;83B09D|9F505E7F|7F5E50;
                       LDA.W #$0570                         ;83B0A1|A97005  |      ;
                       CLC                                  ;83B0A4|18      |      ;
                       ADC.B $00                            ;83B0A5|6500    |000000;
                       STA.L $7F5E90,X                      ;83B0A7|9F905E7F|7F5E90;
                       RTS                                  ;83B0AB|60      |      ;
 
       CODE_FN_83B0AC:
                       ASL A                                ;83B0AC|0A      |      ;
                       TAX                                  ;83B0AD|AA      |      ;
                       LDA.W #$0000                         ;83B0AE|A90000  |      ;
                       JSR.W (DATA8_83B0BE,X)               ;83B0B1|FCBEB0  |83B0BE;
                       RTS                                  ;83B0B4|60      |      ;
 
       CODE_FN_83B0B5:
                       ASL A                                ;83B0B5|0A      |      ;
                       TAX                                  ;83B0B6|AA      |      ;
                       LDA.W #$0012                         ;83B0B7|A91200  |      ;
                       JSR.W (DATA8_83B0BE,X)               ;83B0BA|FCBEB0  |83B0BE;
                       RTS                                  ;83B0BD|60      |      ;
 
         DATA8_83B0BE:
                       db $CA,$B0,$CE,$B0,$D2,$B0,$D6,$B0   ;83B0BE|        |      ;
                       db $DF,$B0,$E3,$B0                   ;83B0C6|        |      ;
                       JSR.W CODE_FN_83B0EC                 ;83B0CA|20ECB0  |83B0EC;
                       RTS                                  ;83B0CD|60      |      ;
                       JSR.W CODE_FN_83B0FB                 ;83B0CE|20FBB0  |83B0FB;
                       RTS                                  ;83B0D1|60      |      ;
                       JSR.W CODE_FN_83B10A                 ;83B0D2|200AB1  |83B10A;
                       RTS                                  ;83B0D5|60      |      ;
                       PHA                                  ;83B0D6|48      |      ;
                       JSR.W CODE_FN_83B128                 ;83B0D7|2028B1  |83B128;
                       PLA                                  ;83B0DA|68      |      ;
                       JSR.W CODE_FN_83B119                 ;83B0DB|2019B1  |83B119;
                       RTS                                  ;83B0DE|60      |      ;
                       JSR.W CODE_FN_83B137                 ;83B0DF|2037B1  |83B137;
                       RTS                                  ;83B0E2|60      |      ;
                       PHA                                  ;83B0E3|48      |      ;
                       JSR.W CODE_FN_83B155                 ;83B0E4|2055B1  |83B155;
                       PLA                                  ;83B0E7|68      |      ;
                       JSR.W CODE_FN_83B146                 ;83B0E8|2046B1  |83B146;
                       RTS                                  ;83B0EB|60      |      ;
 
       CODE_FN_83B0EC:
                       LDY.W #$B0F7                         ;83B0EC|A0F7B0  |      ;
                       LDX.W #$3442                         ;83B0EF|A24234  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B0F2|204C9F  |839F4C;
                       BRA +                                ;83B0F5|8003    |83B0FA;
                       db $0D,$06,$26                       ;83B0F7|        |      ;
 
                     + RTS                                  ;83B0FA|60      |      ;
 
       CODE_FN_83B0FB:
                       LDY.W #$B106                         ;83B0FB|A006B1  |      ;
                       LDX.W #$3464                         ;83B0FE|A26434  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B101|204C9F  |839F4C;
                       BRA +                                ;83B104|8003    |83B109;
                       db $0D,$06,$26                       ;83B106|        |      ;
 
                     + RTS                                  ;83B109|60      |      ;
 
       CODE_FN_83B10A:
                       LDY.W #$B115                         ;83B10A|A015B1  |      ;
                       LDX.W #$3246                         ;83B10D|A24632  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B110|204C9F  |839F4C;
                       BRA +                                ;83B113|8003    |83B118;
                       db $0D,$06,$26                       ;83B115|        |      ;
 
                     + RTS                                  ;83B118|60      |      ;
 
       CODE_FN_83B119:
                       LDY.W #$B124                         ;83B119|A024B1  |      ;
                       LDX.W #$3268                         ;83B11C|A26832  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B11F|204C9F  |839F4C;
                       BRA +                                ;83B122|8003    |83B127;
                       db $0C,$06,$28                       ;83B124|        |      ;
 
                     + RTS                                  ;83B127|60      |      ;
 
       CODE_FN_83B128:
                       LDY.W #$B133                         ;83B128|A033B1  |      ;
                       LDX.W #$3440                         ;83B12B|A24034  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B12E|204C9F  |839F4C;
                       BRA +                                ;83B131|8003    |83B136;
                       db $01,$06,$3E                       ;83B133|        |      ;
 
                     + RTS                                  ;83B136|60      |      ;
 
       CODE_FN_83B137:
                       LDY.W #$B142                         ;83B137|A042B1  |      ;
                       LDX.W #$344A                         ;83B13A|A24A34  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B13D|204C9F  |839F4C;
                       BRA +                                ;83B140|8003    |83B145;
                       db $0D,$06,$26                       ;83B142|        |      ;
 
                     + RTS                                  ;83B145|60      |      ;
 
       CODE_FN_83B146:
                       LDY.W #$B151                         ;83B146|A051B1  |      ;
                       LDX.W #$346C                         ;83B149|A26C34  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B14C|204C9F  |839F4C;
                       BRA +                                ;83B14F|8003    |83B154;
                       db $0A,$06,$2C                       ;83B151|        |      ;
 
                     + RTS                                  ;83B154|60      |      ;
 
       CODE_FN_83B155:
                       LDY.W #$B160                         ;83B155|A060B1  |      ;
                       LDX.W #$3240                         ;83B158|A24032  |      ;
                       JSR.W CODE_FN_839F4C                 ;83B15B|204C9F  |839F4C;
                       BRA +                                ;83B15E|8003    |83B163;
                       db $03,$06,$3A                       ;83B160|        |      ;
 
                     + RTS                                  ;83B163|60      |      ;
 
       CODE_FN_83B164:
                       LDX.W #$5E02                         ;83B164|A2025E  |      ;
                       LDY.W #$2400                         ;83B167|A00024  |      ;
                       LDA.W #$0008                         ;83B16A|A90800  |      ;
                       STA.B $00                            ;83B16D|8500    |000000;
                       LDA.W #$000F                         ;83B16F|A90F00  |      ;
                       STA.B $02                            ;83B172|8502    |000002;
                       LDA.W #$0022                         ;83B174|A92200  |      ;
                       STA.B $04                            ;83B177|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B179|201887  |838718;
                       LDY.W #$B184                         ;83B17C|A084B1  |      ;
                       JSR.W CODE_FN_839020                 ;83B17F|202090  |839020;
                       BRA +                                ;83B182|8004    |83B188;
                       db $01,$11,$0E,$17                   ;83B184|        |      ;
 
                     + RTS                                  ;83B188|60      |      ;
 
       CODE_FN_83B189:
                       LDX.W #$5E20                         ;83B189|A2205E  |      ;
                       LDY.W #$2422                         ;83B18C|A02224  |      ;
                       LDA.W #$0008                         ;83B18F|A90800  |      ;
                       STA.B $00                            ;83B192|8500    |000000;
                       LDA.W #$000F                         ;83B194|A90F00  |      ;
                       STA.B $02                            ;83B197|8502    |000002;
                       LDA.W #$0022                         ;83B199|A92200  |      ;
                       STA.B $04                            ;83B19C|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B19E|201887  |838718;
                       LDY.W #$B1A9                         ;83B1A1|A0A9B1  |      ;
                       JSR.W CODE_FN_839020                 ;83B1A4|202090  |839020;
                       BRA +                                ;83B1A7|8004    |83B1AD;
                       db $12,$11,$1F,$17                   ;83B1A9|        |      ;
 
                     + RTS                                  ;83B1AD|60      |      ;
 
       CODE_FN_83B1AE:
                       LDX.W #$6002                         ;83B1AE|A20260  |      ;
                       LDY.W #$2204                         ;83B1B1|A00422  |      ;
                       LDA.W #$0008                         ;83B1B4|A90800  |      ;
                       STA.B $00                            ;83B1B7|8500    |000000;
                       LDA.W #$000F                         ;83B1B9|A90F00  |      ;
                       STA.B $02                            ;83B1BC|8502    |000002;
                       LDA.W #$0022                         ;83B1BE|A92200  |      ;
                       STA.B $04                            ;83B1C1|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B1C3|201887  |838718;
                       LDY.W #$B1CE                         ;83B1C6|A0CEB1  |      ;
                       JSR.W CODE_FN_839020                 ;83B1C9|202090  |839020;
                       BRA +                                ;83B1CC|8004    |83B1D2;
                       db $03,$09,$10,$0F                   ;83B1CE|        |      ;
 
                     + RTS                                  ;83B1D2|60      |      ;
 
       CODE_FN_83B1D3:
                       LDX.W #$6020                         ;83B1D3|A22060  |      ;
                       LDY.W #$2226                         ;83B1D6|A02622  |      ;
                       LDA.W #$0008                         ;83B1D9|A90800  |      ;
                       STA.B $00                            ;83B1DC|8500    |000000;
                       LDA.W #$000D                         ;83B1DE|A90D00  |      ;
                       STA.B $02                            ;83B1E1|8502    |000002;
                       LDA.W #$0026                         ;83B1E3|A92600  |      ;
                       STA.B $04                            ;83B1E6|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B1E8|201887  |838718;
                       LDA.W #$002D                         ;83B1EB|A92D00  |      ;
                       STA.L $7E33E8                        ;83B1EE|8FE8337E|7E33E8;
                       LDY.W #$B1FD                         ;83B1F2|A0FDB1  |      ;
                       LDX.W #$33EA                         ;83B1F5|A2EA33  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B1F8|207F9F  |839F7F;
                       BRA +                                ;83B1FB|8003    |83B200;
                       db $0B,$2E,$00                       ;83B1FD|        |      ;
 
                     + RTS                                  ;83B200|60      |      ;
 
       CODE_FN_83B201:
                       LDX.W #$603A                         ;83B201|A23A60  |      ;
                       LDY.W #$2400                         ;83B204|A00024  |      ;
                       LDA.W #$0008                         ;83B207|A90800  |      ;
                       STA.B $00                            ;83B20A|8500    |000000;
                       LDA.W #$0002                         ;83B20C|A90200  |      ;
                       STA.B $02                            ;83B20F|8502    |000002;
                       LDA.W #$003C                         ;83B211|A93C00  |      ;
                       STA.B $04                            ;83B214|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B216|201887  |838718;
                       LDA.W #$000D                         ;83B219|A90D00  |      ;
                       STA.L $7E3442                        ;83B21C|8F42347E|7E3442;
                       LDY.W #$B228                         ;83B220|A028B2  |      ;
                       JSR.W CODE_FN_839F97                 ;83B223|20979F  |839F97;
                       BRA +                                ;83B226|8005    |83B22D;
                       db $82,$04,$05,$1D,$00               ;83B228|        |      ;
 
                     + LDA.W #$002F                         ;83B22D|A92F00  |      ;
                       STA.L $7E35C2                        ;83B230|8FC2357E|7E35C2;
                       LDA.W #$002E                         ;83B234|A92E00  |      ;
                       STA.L $7E35C0                        ;83B237|8FC0357E|7E35C0;
                       RTS                                  ;83B23B|60      |      ;
                       JSR.W CODE_FN_83B1D3                 ;83B23C|20D3B1  |83B1D3;
                       JSR.W CODE_FN_83B201                 ;83B23F|2001B2  |83B201;
                       RTS                                  ;83B242|60      |      ;
 
       CODE_FN_83B243:
                       LDX.W #$6202                         ;83B243|A20262  |      ;
                       LDY.W #$2408                         ;83B246|A00824  |      ;
                       LDA.W #$0008                         ;83B249|A90800  |      ;
                       STA.B $00                            ;83B24C|8500    |000000;
                       LDA.W #$000F                         ;83B24E|A90F00  |      ;
                       STA.B $02                            ;83B251|8502    |000002;
                       LDA.W #$0022                         ;83B253|A92200  |      ;
                       STA.B $04                            ;83B256|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B258|201887  |838718;
                       LDY.W #$B263                         ;83B25B|A063B2  |      ;
                       JSR.W CODE_FN_839020                 ;83B25E|202090  |839020;
                       BRA +                                ;83B261|8004    |83B267;
                       db $05,$11,$12,$17                   ;83B263|        |      ;
 
                     + RTS                                  ;83B267|60      |      ;
 
       CODE_FN_83B268:
                       LDX.W #$6220                         ;83B268|A22062  |      ;
                       LDY.W #$242A                         ;83B26B|A02A24  |      ;
                       LDA.W #$0008                         ;83B26E|A90800  |      ;
                       STA.B $00                            ;83B271|8500    |000000;
                       LDA.W #$000B                         ;83B273|A90B00  |      ;
                       STA.B $02                            ;83B276|8502    |000002;
                       LDA.W #$002A                         ;83B278|A92A00  |      ;
                       STA.B $04                            ;83B27B|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B27D|201887  |838718;
                       LDA.W #$002D                         ;83B280|A92D00  |      ;
                       STA.L $7E35EC                        ;83B283|8FEC357E|7E35EC;
                       LDY.W #$B292                         ;83B287|A092B2  |      ;
                       LDX.W #$35EE                         ;83B28A|A2EE35  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B28D|207F9F  |839F7F;
                       BRA +                                ;83B290|8003    |83B295;
                       db $09,$2E,$00                       ;83B292|        |      ;
 
                     + RTS                                  ;83B295|60      |      ;
 
       CODE_FN_83B296:
                       LDX.W #$6236                         ;83B296|A23662  |      ;
                       LDY.W #$2200                         ;83B299|A00022  |      ;
                       LDA.W #$0008                         ;83B29C|A90800  |      ;
                       STA.B $00                            ;83B29F|8500    |000000;
                       LDA.W #$0004                         ;83B2A1|A90400  |      ;
                       STA.B $02                            ;83B2A4|8502    |000002;
                       LDA.W #$0038                         ;83B2A6|A93800  |      ;
                       STA.B $04                            ;83B2A9|8504    |000004;
                       JSR.W CODE_FN_838718                 ;83B2AB|201887  |838718;
                       LDY.W #$B2B6                         ;83B2AE|A0B6B2  |      ;
                       JSR.W CODE_FN_839020                 ;83B2B1|202090  |839020;
                       BRA +                                ;83B2B4|8004    |83B2BA;
                       db $01,$09,$03,$0F                   ;83B2B6|        |      ;
 
                     + LDA.W #$002E                         ;83B2BA|A92E00  |      ;
                       STA.L $7E33C0                        ;83B2BD|8FC0337E|7E33C0;
                       LDA.W #$002E                         ;83B2C1|A92E00  |      ;
                       STA.L $7E33C2                        ;83B2C4|8FC2337E|7E33C2;
                       RTS                                  ;83B2C8|60      |      ;
                       JSR.W CODE_FN_83B268                 ;83B2C9|2068B2  |83B268;
                       JSR.W CODE_FN_83B296                 ;83B2CC|2096B2  |83B296;
                       RTS                                  ;83B2CF|60      |      ;
                       LDY.W #$B2E4                         ;83B2D0|A0E4B2  |      ;
                       LDX.W #$2400                         ;83B2D3|A20024  |      ;
                       JSR.W CODE_FN_839F49                 ;83B2D6|20499F  |839F49;
                       LDY.W #$B2E4                         ;83B2D9|A0E4B2  |      ;
                       LDX.W #$3400                         ;83B2DC|A20034  |      ;
                       JSR.W CODE_FN_839F49                 ;83B2DF|20499F  |839F49;
                       BRA +                                ;83B2E2|8005    |83B2E9;
                       db $0F,$08,$22,$00,$00               ;83B2E4|        |      ;
 
                     + RTS                                  ;83B2E9|60      |      ;
                       LDY.W #$B2FE                         ;83B2EA|A0FEB2  |      ;
                       LDX.W #$2422                         ;83B2ED|A22224  |      ;
                       JSR.W CODE_FN_839F49                 ;83B2F0|20499F  |839F49;
                       LDY.W #$B2FE                         ;83B2F3|A0FEB2  |      ;
                       LDX.W #$3422                         ;83B2F6|A22234  |      ;
                       JSR.W CODE_FN_839F49                 ;83B2F9|20499F  |839F49;
                       BRA +                                ;83B2FC|8005    |83B303;
                       db $0F,$08,$22,$00,$00               ;83B2FE|        |      ;
 
                     + RTS                                  ;83B303|60      |      ;
                       LDY.W #$B318                         ;83B304|A018B3  |      ;
                       LDX.W #$2204                         ;83B307|A20422  |      ;
                       JSR.W CODE_FN_839F49                 ;83B30A|20499F  |839F49;
                       LDY.W #$B318                         ;83B30D|A018B3  |      ;
                       LDX.W #$3204                         ;83B310|A20432  |      ;
                       JSR.W CODE_FN_839F49                 ;83B313|20499F  |839F49;
                       BRA +                                ;83B316|8005    |83B31D;
                       db $0F,$08,$22,$00,$00               ;83B318|        |      ;
 
                     + RTS                                  ;83B31D|60      |      ;
                       LDY.W #$B332                         ;83B31E|A032B3  |      ;
                       LDX.W #$2226                         ;83B321|A22622  |      ;
                       JSR.W CODE_FN_839F49                 ;83B324|20499F  |839F49;
                       LDY.W #$B332                         ;83B327|A032B3  |      ;
                       LDX.W #$3226                         ;83B32A|A22632  |      ;
                       JSR.W CODE_FN_839F49                 ;83B32D|20499F  |839F49;
                       BRA +                                ;83B330|8005    |83B337;
                       db $0D,$08,$26,$00,$00               ;83B332|        |      ;
 
                     + LDY.W #$B34B                         ;83B337|A04BB3  |      ;
                       LDX.W #$2400                         ;83B33A|A20024  |      ;
                       JSR.W CODE_FN_839F49                 ;83B33D|20499F  |839F49;
                       LDY.W #$B34B                         ;83B340|A04BB3  |      ;
                       LDX.W #$3400                         ;83B343|A20034  |      ;
                       JSR.W CODE_FN_839F49                 ;83B346|20499F  |839F49;
                       BRA +                                ;83B349|8005    |83B350;
                       db $02,$08,$3C,$00,$00               ;83B34B|        |      ;
 
                     + RTS                                  ;83B350|60      |      ;
                       LDY.W #$B365                         ;83B351|A065B3  |      ;
                       LDX.W #$2408                         ;83B354|A20824  |      ;
                       JSR.W CODE_FN_839F49                 ;83B357|20499F  |839F49;
                       LDY.W #$B365                         ;83B35A|A065B3  |      ;
                       LDX.W #$3408                         ;83B35D|A20834  |      ;
                       JSR.W CODE_FN_839F49                 ;83B360|20499F  |839F49;
                       BRA +                                ;83B363|8005    |83B36A;
                       db $0F,$08,$22,$00,$00               ;83B365|        |      ;
 
                     + RTS                                  ;83B36A|60      |      ;
                       LDY.W #$B37F                         ;83B36B|A07FB3  |      ;
                       LDX.W #$242A                         ;83B36E|A22A24  |      ;
                       JSR.W CODE_FN_839F49                 ;83B371|20499F  |839F49;
                       LDY.W #$B37F                         ;83B374|A07FB3  |      ;
                       LDX.W #$342A                         ;83B377|A22A34  |      ;
                       JSR.W CODE_FN_839F49                 ;83B37A|20499F  |839F49;
                       BRA +                                ;83B37D|8005    |83B384;
                       db $0B,$08,$2A,$00,$00               ;83B37F|        |      ;
 
                     + LDY.W #$B398                         ;83B384|A098B3  |      ;
                       LDX.W #$2200                         ;83B387|A20022  |      ;
                       JSR.W CODE_FN_839F49                 ;83B38A|20499F  |839F49;
                       LDY.W #$B398                         ;83B38D|A098B3  |      ;
                       LDX.W #$3200                         ;83B390|A20032  |      ;
                       JSR.W CODE_FN_839F49                 ;83B393|20499F  |839F49;
                       BRA +                                ;83B396|8005    |83B39D;
                       db $04,$08,$38,$00,$00               ;83B398|        |      ;
 
                     + RTS                                  ;83B39D|60      |      ;
 
       CODE_FN_83B39E:
                       JSR.W CODE_FN_83B164                 ;83B39E|2064B1  |83B164;
                       JSR.W CODE_FN_83B189                 ;83B3A1|2089B1  |83B189;
                       LDA.W #$0012                         ;83B3A4|A91200  |      ;
                       JSR.W CODE_FN_83B0EC                 ;83B3A7|20ECB0  |83B0EC;
                       LDA.W #$0012                         ;83B3AA|A91200  |      ;
                       JSR.W CODE_FN_83B0FB                 ;83B3AD|20FBB0  |83B0FB;
                       RTS                                  ;83B3B0|60      |      ;
 
       CODE_FN_83B3B1:
                       JSR.W CODE_FN_83B1AE                 ;83B3B1|20AEB1  |83B1AE;
                       JSR.W CODE_FN_83B1D3                 ;83B3B4|20D3B1  |83B1D3;
                       LDA.W #$0012                         ;83B3B7|A91200  |      ;
                       JSR.W CODE_FN_83B10A                 ;83B3BA|200AB1  |83B10A;
                       LDA.W #$0012                         ;83B3BD|A91200  |      ;
                       JSR.W CODE_FN_83B119                 ;83B3C0|2019B1  |83B119;
                       RTS                                  ;83B3C3|60      |      ;
 
       CODE_FN_83B3C4:
                       JSR.W CODE_FN_83B201                 ;83B3C4|2001B2  |83B201;
                       JSR.W CODE_FN_83B243                 ;83B3C7|2043B2  |83B243;
                       JSR.W CODE_FN_83B268                 ;83B3CA|2068B2  |83B268;
                       LDA.W #$0012                         ;83B3CD|A91200  |      ;
                       JSR.W CODE_FN_83B128                 ;83B3D0|2028B1  |83B128;
                       LDA.W #$0012                         ;83B3D3|A91200  |      ;
                       JSR.W CODE_FN_83B137                 ;83B3D6|2037B1  |83B137;
                       LDA.W #$0012                         ;83B3D9|A91200  |      ;
                       JSR.W CODE_FN_83B146                 ;83B3DC|2046B1  |83B146;
                       RTS                                  ;83B3DF|60      |      ;
 
       CODE_FN_83B3E0:
                       JSR.W CODE_FN_83B296                 ;83B3E0|2096B2  |83B296;
                       LDA.W #$0012                         ;83B3E3|A91200  |      ;
                       JSR.W CODE_FN_83B155                 ;83B3E6|2055B1  |83B155;
                       RTS                                  ;83B3E9|60      |      ;
 
       CODE_FN_83B3EA:
                       LDY.W #$B3F2                         ;83B3EA|A0F2B3  |      ;
                       JSR.W CODE_FN_839FC2                 ;83B3ED|20C29F  |839FC2;
                       BRA +                                ;83B3F0|8004    |83B3F6;
                       db $00,$02,$00,$04                   ;83B3F2|        |      ;
 
                     + LDY.W #$B3FE                         ;83B3F6|A0FEB3  |      ;
                       JSR.W CODE_FN_839FD8                 ;83B3F9|20D89F  |839FD8;
                       BRA +                                ;83B3FC|8004    |83B402;
                       db $00,$02,$00,$04                   ;83B3FE|        |      ;
 
                     + RTS                                  ;83B402|60      |      ;
 
       CODE_FN_83B403:
                       LDY.W #$B40B                         ;83B403|A00BB4  |      ;
                       JSR.W CODE_FN_839FC2                 ;83B406|20C29F  |839FC2;
                       BRA +                                ;83B409|8004    |83B40F;
                       db $00,$04,$00,$06                   ;83B40B|        |      ;
 
                     + LDY.W #$B417                         ;83B40F|A017B4  |      ;
                       JSR.W CODE_FN_839FD8                 ;83B412|20D89F  |839FD8;
                       BRA +                                ;83B415|8004    |83B41B;
                       db $00,$04,$00,$06                   ;83B417|        |      ;
 
                     + JSR.W CODE_FN_83B39E                 ;83B41B|209EB3  |83B39E;
                       RTS                                  ;83B41E|60      |      ;
 
       CODE_FN_83B41F:
                       LDY.W #$B427                         ;83B41F|A027B4  |      ;
                       JSR.W CODE_FN_839FC2                 ;83B422|20C29F  |839FC2;
                       BRA +                                ;83B425|8004    |83B42B;
                       db $00,$02,$00,$04                   ;83B427|        |      ;
 
                     + LDY.W #$B433                         ;83B42B|A033B4  |      ;
                       JSR.W CODE_FN_839FD8                 ;83B42E|20D89F  |839FD8;
                       BRA +                                ;83B431|8004    |83B437;
                       db $00,$02,$00,$04                   ;83B433|        |      ;
 
                     + JSR.W CODE_FN_83B3B1                 ;83B437|20B1B3  |83B3B1;
                       RTS                                  ;83B43A|60      |      ;
 
       CODE_FN_83B43B:
                       LDY.W #$B443                         ;83B43B|A043B4  |      ;
                       JSR.W CODE_FN_839FC2                 ;83B43E|20C29F  |839FC2;
                       BRA +                                ;83B441|8004    |83B447;
                       db $00,$04,$00,$06                   ;83B443|        |      ;
 
                     + LDY.W #$B44F                         ;83B447|A04FB4  |      ;
                       JSR.W CODE_FN_839FD8                 ;83B44A|20D89F  |839FD8;
                       BRA +                                ;83B44D|8004    |83B453;
                       db $00,$04,$00,$06                   ;83B44F|        |      ;
 
                     + JSR.W CODE_FN_83B3C4                 ;83B453|20C4B3  |83B3C4;
                       RTS                                  ;83B456|60      |      ;
                       LDY.W #$B45F                         ;83B457|A05FB4  |      ;
                       JSR.W CODE_FN_839FC2                 ;83B45A|20C29F  |839FC2;
                       BRA +                                ;83B45D|8004    |83B463;
                       db $00,$02,$00,$04                   ;83B45F|        |      ;
 
                     + LDY.W #$B46B                         ;83B463|A06BB4  |      ;
                       JSR.W CODE_FN_839FD8                 ;83B466|20D89F  |839FD8;
                       BRA +                                ;83B469|8004    |83B46F;
                       db $00,$02,$00,$04                   ;83B46B|        |      ;
 
                     + JSR.W CODE_FN_83B3E0                 ;83B46F|20E0B3  |83B3E0;
                       RTS                                  ;83B472|60      |      ;
                       JSR.W CODE_FN_83B3EA                 ;83B473|20EAB3  |83B3EA;
                       JSR.W CODE_FN_83B403                 ;83B476|2003B4  |83B403;
                       RTS                                  ;83B479|60      |      ;
                       JSR.W CODE_FN_83B403                 ;83B47A|2003B4  |83B403;
                       JSR.W CODE_FN_83B41F                 ;83B47D|201FB4  |83B41F;
                       RTS                                  ;83B480|60      |      ;
                       JSR.W CODE_FN_83B41F                 ;83B481|201FB4  |83B41F;
                       JSR.W CODE_FN_83B43B                 ;83B484|203BB4  |83B43B;
                       RTS                                  ;83B487|60      |      ;
                       db $20,$3B,$B4,$20,$57,$B4,$60       ;83B488|        |83B43B;
 
       CODE_FN_83B48F:
                       PHB                                  ;83B48F|8B      |      ;
                       PHK                                  ;83B490|4B      |      ;
                       PLB                                  ;83B491|AB      |      ;
                       LDY.W #$B49C                         ;83B492|A09CB4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83B495|22CAA080|80A0CA;
                       PLB                                  ;83B499|AB      |      ;
                       BRA +                                ;83B49A|8008    |83B4A4;
                       db $00,$22,$7E,$00,$02,$80,$60,$69   ;83B49C|        |      ;
 
                     + PHB                                  ;83B4A4|8B      |      ;
                       PHK                                  ;83B4A5|4B      |      ;
                       PLB                                  ;83B4A6|AB      |      ;
                       LDY.W #$B4B1                         ;83B4A7|A0B1B4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83B4AA|22CAA080|80A0CA;
                       PLB                                  ;83B4AE|AB      |      ;
                       BRA +                                ;83B4AF|8008    |83B4B9;
                       db $00,$32,$7E,$00,$02,$80,$60,$79   ;83B4B1|        |      ;
 
                     + RTS                                  ;83B4B9|60      |      ;
 
       CODE_FN_83B4BA:
                       PHB                                  ;83B4BA|8B      |      ;
                       PHK                                  ;83B4BB|4B      |      ;
                       PLB                                  ;83B4BC|AB      |      ;
                       LDY.W #$B4C7                         ;83B4BD|A0C7B4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83B4C0|22CAA080|80A0CA;
                       PLB                                  ;83B4C4|AB      |      ;
                       BRA +                                ;83B4C5|8008    |83B4CF;
                       db $00,$24,$7E,$00,$02,$80,$60,$6D   ;83B4C7|        |      ;
 
                     + PHB                                  ;83B4CF|8B      |      ;
                       PHK                                  ;83B4D0|4B      |      ;
                       PLB                                  ;83B4D1|AB      |      ;
                       LDY.W #$B4DC                         ;83B4D2|A0DCB4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83B4D5|22CAA080|80A0CA;
                       PLB                                  ;83B4D9|AB      |      ;
                       BRA +                                ;83B4DA|8008    |83B4E4;
                       db $00,$34,$7E,$00,$02,$80,$60,$7D   ;83B4DC|        |      ;
 
                     + RTS                                  ;83B4E4|60      |      ;
 
       CODE_FN_83B4E5:
                       JSR.W CODE_FN_83B48F                 ;83B4E5|208FB4  |83B48F;
                       JSR.W CODE_FN_83B4BA                 ;83B4E8|20BAB4  |83B4BA;
                       RTS                                  ;83B4EB|60      |      ;
 
       CODE_FN_83B4EC:
                       LDA.W #$0148                         ;83B4EC|A94801  |      ;
                       SEC                                  ;83B4EF|38      |      ;
                       SBC.L $7E96E3                        ;83B4F0|EFE3967E|7E96E3;
                       TAX                                  ;83B4F4|AA      |      ;
                       LDY.W #$0075                         ;83B4F5|A07500  |      ;
                       LDA.W #$0000                         ;83B4F8|A90000  |      ;
                       STA.B $0C                            ;83B4FB|850C    |00000C;
                       LDA.W #$0178                         ;83B4FD|A97801  |      ;
                       STA.B $0E                            ;83B500|850E    |00000E;
                       LDA.W #$0000                         ;83B502|A90000  |      ;
                       STA.B $0A                            ;83B505|850A    |00000A;
                       LDA.W $0348                          ;83B507|AD4803  |830348;
 
                     - CMP.W #$0001                         ;83B50A|C90100  |      ;
                       BPL +                                ;83B50D|1001    |83B510;
                       RTS                                  ;83B50F|60      |      ;
 
                     + PHA                                  ;83B510|48      |      ;
                       LDA.L $7E961C                        ;83B511|AF1C967E|7E961C;
                       BEQ +                                ;83B515|F007    |83B51E;
                       LDA.B $0A                            ;83B517|A50A    |00000A;
                       CMP.W Character_1P                   ;83B519|CDBA02  |8302BA;
                       BEQ ++                               ;83B51C|F015    |83B533;
 
                     + LDA.L $7E96E3                        ;83B51E|AFE3967E|7E96E3;
                       CMP.B $0C                            ;83B522|C50C    |00000C;
                       BMI ++                               ;83B524|300D    |83B533;
                       CMP.B $0E                            ;83B526|C50E    |00000E;
                       BPL ++                               ;83B528|1009    |83B533;
                       PLA                                  ;83B52A|68      |      ;
                       PHA                                  ;83B52B|48      |      ;
                       PHX                                  ;83B52C|DA      |      ;
                       PHY                                  ;83B52D|5A      |      ;
                       JSR.W CODE_FN_83B553                 ;83B52E|2053B5  |83B553;
                       PLY                                  ;83B531|7A      |      ;
                       PLX                                  ;83B532|FA      |      ;
 
                    ++ INC.B $0A                            ;83B533|E60A    |00000A;
                       TXA                                  ;83B535|8A      |      ;
                       CLC                                  ;83B536|18      |      ;
                       ADC.W #$0088                         ;83B537|698800  |      ;
                       TAX                                  ;83B53A|AA      |      ;
                       LDA.B $0C                            ;83B53B|A50C    |00000C;
                       CLC                                  ;83B53D|18      |      ;
                       ADC.W #$0088                         ;83B53E|698800  |      ;
                       STA.B $0C                            ;83B541|850C    |00000C;
                       LDA.B $0E                            ;83B543|A50E    |00000E;
                       CLC                                  ;83B545|18      |      ;
                       ADC.W #$0088                         ;83B546|698800  |      ;
                       STA.B $0E                            ;83B549|850E    |00000E;
                       PLA                                  ;83B54B|68      |      ;
                       SEC                                  ;83B54C|38      |      ;
                       SBC.W #$000A                         ;83B54D|E90A00  |      ;
                       BRA -                                ;83B550|80B8    |83B50A;
                       db $60                               ;83B552|        |      ;
 
       CODE_FN_83B553:
                       CMP.W #$000A                         ;83B553|C90A00  |      ;
                       BMI +                                ;83B556|3003    |83B55B;
                       LDA.W #$000A                         ;83B558|A90A00  |      ;
 
                     + CMP.W #$0006                         ;83B55B|C90600  |      ;
                       BMI +                                ;83B55E|3020    |83B580;
                       PHX                                  ;83B560|DA      |      ;
                       PHY                                  ;83B561|5A      |      ;
                       SEC                                  ;83B562|38      |      ;
                       SBC.W #$0005                         ;83B563|E90500  |      ;
                       STA.B $00                            ;83B566|8500    |000000;
                       TYA                                  ;83B568|98      |      ;
                       CLC                                  ;83B569|18      |      ;
                       ADC.W #$0010                         ;83B56A|691000  |      ;
                       TAY                                  ;83B56D|A8      |      ;
 
                     - JSR.W CODE_FN_83B590                 ;83B56E|2090B5  |83B590;
                       TXA                                  ;83B571|8A      |      ;
                       CLC                                  ;83B572|18      |      ;
                       ADC.W #$0008                         ;83B573|690800  |      ;
                       TAX                                  ;83B576|AA      |      ;
                       DEC.B $00                            ;83B577|C600    |000000;
                       BNE -                                ;83B579|D0F3    |83B56E;
                       PLY                                  ;83B57B|7A      |      ;
                       PLX                                  ;83B57C|FA      |      ;
                       LDA.W #$0005                         ;83B57D|A90500  |      ;
 
                     + STA.B $00                            ;83B580|8500    |000000;
 
                     - JSR.W CODE_FN_83B590                 ;83B582|2090B5  |83B590;
                       TXA                                  ;83B585|8A      |      ;
                       CLC                                  ;83B586|18      |      ;
                       ADC.W #$0008                         ;83B587|690800  |      ;
                       TAX                                  ;83B58A|AA      |      ;
                       DEC.B $00                            ;83B58B|C600    |000000;
                       BNE -                                ;83B58D|D0F3    |83B582;
                       RTS                                  ;83B58F|60      |      ;
 
       CODE_FN_83B590:
                       PHX                                  ;83B590|DA      |      ;
                       PHY                                  ;83B591|5A      |      ;
                       LDA.W #$0302                         ;83B592|A90203  |      ;
                       JSR.W CODE_FN_839B35                 ;83B595|20359B  |839B35;
                       PLY                                  ;83B598|7A      |      ;
                       PLX                                  ;83B599|FA      |      ;
                       RTS                                  ;83B59A|60      |      ;
 
       CODE_FN_83B59B:
                       JSR.W CODE_FN_838209                 ;83B59B|200982  |838209;
                       JSR.W CODE_FN_839716                 ;83B59E|201697  |839716;
                       JSR.W CODE_FN_83B4EC                 ;83B5A1|20ECB4  |83B4EC;
                       JSR.W CODE_FN_83B4E5                 ;83B5A4|20E5B4  |83B4E5;
                       RTS                                  ;83B5A7|60      |      ;
 
       CODE_FN_83B5A8:
                       LDA.L $7E9973                        ;83B5A8|AF73997E|7E9973;
                       BEQ +                                ;83B5AC|F00C    |83B5BA;
                       CMP.W #$0001                         ;83B5AE|C90100  |      ;
                       BNE ++                               ;83B5B1|D004    |83B5B7;
                       JSR.W CODE_FN_83B602                 ;83B5B3|2002B6  |83B602;
                       RTS                                  ;83B5B6|60      |      ;
 
                    ++ JSR.W CODE_FN_83B5BB                 ;83B5B7|20BBB5  |83B5BB;
 
                     + RTS                                  ;83B5BA|60      |      ;
 
       CODE_FN_83B5BB:
                       LDA.L $7E96E3                        ;83B5BB|AFE3967E|7E96E3;
                       SEC                                  ;83B5BF|38      |      ;
                       SBC.L $7E9985                        ;83B5C0|EF85997E|7E9985;
                       STA.L $7E96E3                        ;83B5C4|8FE3967E|7E96E3;
                       CMP.L $7E9987                        ;83B5C8|CF87997E|7E9987;
                       BPL +                                ;83B5CC|1010    |83B5DE;
                       LDA.W #$0000                         ;83B5CE|A90000  |      ;
                       STA.L $7E9973                        ;83B5D1|8F73997E|7E9973;
                       LDA.L $7E9987                        ;83B5D5|AF87997E|7E9987;
                       STA.L $7E96E3                        ;83B5D9|8FE3967E|7E96E3;
                       RTS                                  ;83B5DD|60      |      ;
 
                     + CMP.L $7E9983                        ;83B5DE|CF83997E|7E9983;
                       BPL +                                ;83B5E2|1017    |83B5FB;
                       LDA.L $7E9983                        ;83B5E4|AF83997E|7E9983;
                       XBA                                  ;83B5E8|EB      |      ;
                       DEC A                                ;83B5E9|3A      |      ;
                       ASL A                                ;83B5EA|0A      |      ;
                       TAX                                  ;83B5EB|AA      |      ;
                       JSR.W (UNREACH_83B5FC,X)             ;83B5EC|FCFCB5  |83B5FC;
                       LDA.L $7E9983                        ;83B5EF|AF83997E|7E9983;
                       SEC                                  ;83B5F3|38      |      ;
                       SBC.W #$0100                         ;83B5F4|E90001  |      ;
                       STA.L $7E9983                        ;83B5F7|8F83997E|7E9983;
 
                     + RTS                                  ;83B5FB|60      |      ;
 
       UNREACH_83B5FC:
                       db $EA,$B3,$03,$B4,$1F,$B4           ;83B5FC|        |      ;
 
       CODE_FN_83B602:
                       LDA.L $7E96E3                        ;83B602|AFE3967E|7E96E3;
                       CLC                                  ;83B606|18      |      ;
                       ADC.L $7E9985                        ;83B607|6F85997E|7E9985;
                       STA.L $7E96E3                        ;83B60B|8FE3967E|7E96E3;
                       CMP.L $7E9987                        ;83B60F|CF87997E|7E9987;
                       BMI +                                ;83B613|3010    |83B625;
                       LDA.W #$0000                         ;83B615|A90000  |      ;
                       STA.L $7E9973                        ;83B618|8F73997E|7E9973;
                       LDA.L $7E9987                        ;83B61C|AF87997E|7E9987;
                       STA.L $7E96E3                        ;83B620|8FE3967E|7E96E3;
                       RTS                                  ;83B624|60      |      ;
 
                     + CMP.L $7E9983                        ;83B625|CF83997E|7E9983;
                       BMI +                                ;83B629|3017    |83B642;
                       LDA.L $7E9983                        ;83B62B|AF83997E|7E9983;
                       XBA                                  ;83B62F|EB      |      ;
                       DEC A                                ;83B630|3A      |      ;
                       ASL A                                ;83B631|0A      |      ;
                       TAX                                  ;83B632|AA      |      ;
                       JSR.W (DATA8_83B643,X)               ;83B633|FC43B6  |83B643;
                       LDA.L $7E9983                        ;83B636|AF83997E|7E9983;
                       CLC                                  ;83B63A|18      |      ;
                       ADC.W #$0100                         ;83B63B|690001  |      ;
                       STA.L $7E9983                        ;83B63E|8F83997E|7E9983;
 
                     + RTS                                  ;83B642|60      |      ;
 
         DATA8_83B643:
                       db $1F,$B4,$3B,$B4,$57,$B4           ;83B643|        |      ;
 
       CODE_FN_83B649:
                       LDA.W Character_1P                   ;83B649|ADBA02  |8302BA;
                       INC A                                ;83B64C|1A      |      ;
                       AND.W #$FFFE                         ;83B64D|29FEFF  |      ;
                       TAX                                  ;83B650|AA      |      ;
                       JSR.W (DATA8_83B655,X)               ;83B651|FC55B6  |83B655;
                       RTS                                  ;83B654|60      |      ;
 
         DATA8_83B655:
                       db $73,$B4,$7A,$B4,$81,$B4           ;83B655|        |      ;
                       db $88,$B4                           ;83B65B|        |      ;
 
       CODE_FN_83B65D:
                       LDX.W #$0048                         ;83B65D|A24800  |      ;
                       JSR.W CODE_FN_83916E                 ;83B660|206E91  |83916E;
                       RTS                                  ;83B663|60      |      ;
 
       CODE_FN_83B664:
                       LDY.W #$B66C                         ;83B664|A06CB6  |      ;
                       JSR.W CODE_FN_8390A8                 ;83B667|20A890  |8390A8;
                       BRA +                                ;83B66A|8004    |83B670;
                       db $02,$05,$1E,$0F                   ;83B66C|        |      ;
 
                     + LDA.L $7E3120                        ;83B670|AF20317E|7E3120;
                       CMP.W #$0012                         ;83B674|C91200  |      ;
                       BNE +                                ;83B677|D01C    |83B695;
                       db $A9,$63,$00,$8F,$C4,$33,$7E,$A0   ;83B679|        |      ;
                       db $8B,$B6,$A2,$C6,$33,$20,$7F,$9F   ;83B681|        |      ;
                       db $80,$03,$1A,$64,$00,$A9,$65,$00   ;83B689|        |83B68E;
                       db $8F,$FC,$33,$7E                   ;83B691|        |7E33FC;
 
                     + RTS                                  ;83B695|60      |      ;
 
       CODE_FN_83B696:
                       LDX.W #$0102                         ;83B696|A20201  |      ;
                       JSR.W CODE_FN_8392D4                 ;83B699|20D492  |8392D4;
                       LDA.W #$0021                         ;83B69C|A92100  |      ;
                       STA.L $7E310A                        ;83B69F|8F0A317E|7E310A;
                       LDY.W #$B6AE                         ;83B6A3|A0AEB6  |      ;
                       LDX.W #$310C                         ;83B6A6|A20C31  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B6A9|207F9F  |839F7F;
                       BRA +                                ;83B6AC|8003    |83B6B1;
                       db $09,$22,$00                       ;83B6AE|        |      ;
 
                     + LDA.W #$0023                         ;83B6B1|A92300  |      ;
                       STA.L $7E311E                        ;83B6B4|8F1E317E|7E311E;
                       RTS                                  ;83B6B8|60      |      ;
 
       CODE_FN_83B6B9:
                       LDY.W #$B6C4                         ;83B6B9|A0C4B6  |      ;
                       LDX.W #$3144                         ;83B6BC|A24431  |      ;
                       JSR.W CODE_FN_839F49                 ;83B6BF|20499F  |839F49;
                       BRA +                                ;83B6C2|8005    |83B6C9;
                       db $1C,$06,$08,$12,$00               ;83B6C4|        |      ;
 
                     + RTS                                  ;83B6C9|60      |      ;
 
       CODE_FN_83B6CA:
                       LDY.W #$B6D5                         ;83B6CA|A0D5B6  |      ;
                       LDX.W #$32C4                         ;83B6CD|A2C432  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B6D0|207F9F  |839F7F;
                       BRA +                                ;83B6D3|8003    |83B6D8;
                       db $1C,$50,$80                       ;83B6D5|        |      ;
 
                     + LDY.W #$B6E3                         ;83B6D8|A0E3B6  |      ;
                       LDX.W #$3304                         ;83B6DB|A20433  |      ;
                       JSR.W CODE_FN_839F49                 ;83B6DE|20499F  |839F49;
                       BRA +                                ;83B6E1|8005    |83B6E8;
                       db $1C,$02,$08,$12,$00               ;83B6E3|        |      ;
 
                     + LDY.W #$B6F3                         ;83B6E8|A0F3B6  |      ;
                       LDX.W #$3384                         ;83B6EB|A28433  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B6EE|207F9F  |839F7F;
                       BRA +                                ;83B6F1|8003    |83B6F6;
                       db $1C,$50,$00                       ;83B6F3|        |      ;
 
                     + RTS                                  ;83B6F6|60      |      ;
 
       CODE_FN_83B6F7:
                       LDY.W #$B6FF                         ;83B6F7|A0FFB6  |      ;
                       JSR.W CODE_FN_8390A8                 ;83B6FA|20A890  |8390A8;
                       BRA +                                ;83B6FD|8004    |83B703;
                       db $02,$10,$1E,$1A                   ;83B6FF|        |      ;
 
                     + RTS                                  ;83B703|60      |      ;
                       db $A2,$C2,$03,$20,$D4,$92,$A9,$05   ;83B704|        |      ;
                       db $00,$8F,$C2,$33,$7E,$A9,$63,$00   ;83B70C|        |      ;
                       db $8F,$C4,$33,$7E,$A0,$23,$B7,$A2   ;83B714|        |7E33C4;
                       db $C6,$33,$20,$7F,$9F,$80,$03,$1B   ;83B71C|        |000033;
                       db $64,$00,$A9,$65,$00,$8F,$FC,$33   ;83B724|        |000000;
                       db $7E,$60                           ;83B72C|        |00A060;
 
       CODE_FN_83B72E:
                       LDY.W #$B739                         ;83B72E|A039B7  |      ;
                       LDX.W #$3404                         ;83B731|A20434  |      ;
                       JSR.W CODE_FN_839F49                 ;83B734|20499F  |839F49;
                       BRA +                                ;83B737|8005    |83B73E;
                       db $1C,$06,$08,$12,$00               ;83B739|        |      ;
 
                     + RTS                                  ;83B73E|60      |      ;
 
       CODE_FN_83B73F:
                       LDY.W #$B74A                         ;83B73F|A04AB7  |      ;
                       LDX.W #$3584                         ;83B742|A28435  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B745|207F9F  |839F7F;
                       BRA +                                ;83B748|8003    |83B74D;
                       db $1C,$50,$80                       ;83B74A|        |      ;
 
                     + LDY.W #$B758                         ;83B74D|A058B7  |      ;
                       LDX.W #$35C4                         ;83B750|A2C435  |      ;
                       JSR.W CODE_FN_839F49                 ;83B753|20499F  |839F49;
                       BRA +                                ;83B756|8005    |83B75D;
                       db $1C,$02,$08,$12,$00               ;83B758|        |      ;
 
                     + LDY.W #$B768                         ;83B75D|A068B7  |      ;
                       LDX.W #$3644                         ;83B760|A24436  |      ;
                       JSR.W CODE_FN_839F7F                 ;83B763|207F9F  |839F7F;
                       BRA +                                ;83B766|8003    |83B76B;
                       db $1C,$50,$00                       ;83B768|        |      ;
 
                     + RTS                                  ;83B76B|60      |      ;
 
       CODE_FN_83B76C:
                       LDA.W #$0000                         ;83B76C|A90000  |      ;
                       JSL.L CODE_FL_80A1F1                 ;83B76F|22F1A180|80A1F1;
                       JSR.W CODE_FN_83B65D                 ;83B773|205DB6  |83B65D;
                       JSR.W CODE_FN_83B664                 ;83B776|2064B6  |83B664;
                       LDA.W $1A6E                          ;83B779|AD6E1A  |831A6E;
                       BNE +                                ;83B77C|D005    |83B783;
                       JSR.W CODE_FN_83B6CA                 ;83B77E|20CAB6  |83B6CA;
                       BRA ++                               ;83B781|800B    |83B78E;
 
                     + DEC A                                ;83B783|3A      |      ;
                       BNE +                                ;83B784|D005    |83B78B;
                       JSR.W CODE_FN_83B6B9                 ;83B786|20B9B6  |83B6B9;
                       BRA ++                               ;83B789|8003    |83B78E;
 
                     + JSR.W CODE_FN_83B696                 ;83B78B|2096B6  |83B696;
 
                    ++ JSR.W CODE_FN_83B6F7                 ;83B78E|20F7B6  |83B6F7;
                       LDA.W $1A70                          ;83B791|AD701A  |831A70;
                       BNE +                                ;83B794|D005    |83B79B;
                       JSR.W CODE_FN_83B73F                 ;83B796|203FB7  |83B73F;
                       BRA ++                               ;83B799|800B    |83B7A6;
 
                     + DEC A                                ;83B79B|3A      |      ;
                       BNE UNREACH_83B7A3                   ;83B79C|D005    |83B7A3;
                       JSR.W CODE_FN_83B72E                 ;83B79E|202EB7  |83B72E;
                       BRA ++                               ;83B7A1|8003    |83B7A6;
 
       UNREACH_83B7A3:
                       db $20,$04,$B7                       ;83B7A3|        |83B704;
 
                    ++ RTS                                  ;83B7A6|60      |      ;
 
       CODE_FN_83B7A7:
                       LDA.W Difficulty_1P                  ;83B7A7|ADAC02  |8302AC;
                       LDY.W #$B7B2                         ;83B7AA|A0B2B7  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83B7AD|20A2A7  |83A7A2;
                       BRA +                                ;83B7B0|8009    |83B7BB;
                       db $12,$02,$20,$07,$68,$07,$CE,$07   ;83B7B2|        |      ;
                       db $02                               ;83B7BA|        |      ;
 
                     + LDA.W Difficulty_2P                  ;83B7BB|ADAE02  |8302AE;
                       LDY.W #$B7C6                         ;83B7BE|A0C6B7  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83B7C1|20A2A7  |83A7A2;
                       BRA +                                ;83B7C4|8009    |83B7CF;
                       db $D2,$04,$20,$0F,$68,$0F,$CE,$0F   ;83B7C6|        |      ;
                       db $02                               ;83B7CE|        |      ;
 
                     + RTS                                  ;83B7CF|60      |      ;
 
       CODE_FN_83B7D0:
                       LDA.W Difficulty_1P                  ;83B7D0|ADAC02  |8302AC;
                       CMP.W #$000A                         ;83B7D3|C90A00  |      ;
                       BEQ +                                ;83B7D6|F010    |83B7E8;
                       EOR.W #$FFFF                         ;83B7D8|49FFFF  |      ;
                       CLC                                  ;83B7DB|18      |      ;
                       ADC.W #$0300                         ;83B7DC|690003  |      ;
                       LDX.W #$00B9                         ;83B7DF|A2B900  |      ;
                       LDY.W #$003F                         ;83B7E2|A03F00  |      ;
                       JSR.W CODE_FN_839B35                 ;83B7E5|20359B  |839B35;
 
                     + LDA.W Difficulty_2P                  ;83B7E8|ADAE02  |8302AE;
                       LDX.W #$00B9                         ;83B7EB|A2B900  |      ;
                       LDY.W #$0097                         ;83B7EE|A09700  |      ;
                       JSR.W CODE_FN_83B7F5                 ;83B7F1|20F5B7  |83B7F5;
                       RTS                                  ;83B7F4|60      |      ;
 
       CODE_FN_83B7F5:
                       EOR.W #$FFFF                         ;83B7F5|49FFFF  |      ;
                       INC A                                ;83B7F8|1A      |      ;
                       CLC                                  ;83B7F9|18      |      ;
                       ADC.W #$000A                         ;83B7FA|690A00  |      ;
                       BEQ +                                ;83B7FD|F007    |83B806;
                       CLC                                  ;83B7FF|18      |      ;
                       ADC.W #$02F5                         ;83B800|69F502  |      ;
                       JSR.W CODE_FN_839B35                 ;83B803|20359B  |839B35;
 
                     + RTS                                  ;83B806|60      |      ;
 
       CODE_FN_83B807:
                       LDA.L Handicap_1P-$7E0000            ;83B807|AFB40200|0002B4;
                       LDY.W #$B813                         ;83B80B|A013B8  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83B80E|20A2A7  |83A7A2;
                       BRA +                                ;83B811|8009    |83B81C;
                       db $2C,$03,$40,$07,$CF,$07,$CF,$87   ;83B813|        |      ;
                       db $04                               ;83B81B|        |      ;
 
                     + LDA.L Handicap_2P-$7E0000            ;83B81C|AFB60200|0002B6;
                       LDY.W #$B828                         ;83B820|A028B8  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83B823|20A2A7  |83A7A2;
                       BRA +                                ;83B826|8009    |83B831;
                       db $EC,$05,$40,$0F,$CF,$0F,$CF,$8F   ;83B828|        |      ;
                       db $04                               ;83B830|        |      ;
 
                     + RTS                                  ;83B831|60      |      ;
 
       CODE_FN_83B832:
                       LDA.W #$074D                         ;83B832|A94D07  |      ;
                       STA.L $7E231E                        ;83B835|8F1E237E|7E231E;
                       LDA.W #$074E                         ;83B839|A94E07  |      ;
                       STA.L $7E2320                        ;83B83C|8F20237E|7E2320;
                       LDA.W #$075D                         ;83B840|A95D07  |      ;
                       STA.L $7E235E                        ;83B843|8F5E237E|7E235E;
                       LDA.W #$075E                         ;83B847|A95E07  |      ;
                       STA.L $7E2360                        ;83B84A|8F60237E|7E2360;
                       LDA.W #$074F                         ;83B84E|A94F07  |      ;
                       STA.L $7E2332                        ;83B851|8F32237E|7E2332;
                       LDA.W #$0760                         ;83B855|A96007  |      ;
                       STA.L $7E2334                        ;83B858|8F34237E|7E2334;
                       LDA.W #$075F                         ;83B85C|A95F07  |      ;
                       STA.L $7E2372                        ;83B85F|8F72237E|7E2372;
                       LDA.W #$0770                         ;83B863|A97007  |      ;
                       STA.L $7E2374                        ;83B866|8F74237E|7E2374;
                       LDA.W #$5B4C                         ;83B86A|A94C5B  |      ;
                       STA.L $7E232E                        ;83B86D|8F2E237E|7E232E;
                       LDA.W #$DB4C                         ;83B871|A94CDB  |      ;
                       STA.L $7E236E                        ;83B874|8F6E237E|7E236E;
                       LDA.W #$1B5A                         ;83B878|A95A1B  |      ;
                       STA.L $7E2330                        ;83B87B|8F30237E|7E2330;
                       LDA.W #$9B5A                         ;83B87F|A95A9B  |      ;
                       STA.L $7E2370                        ;83B882|8F70237E|7E2370;
                       LDA.W #$1B4C                         ;83B886|A94C1B  |      ;
                       STA.L $7E2324                        ;83B889|8F24237E|7E2324;
                       LDA.W #$9B4C                         ;83B88D|A94C9B  |      ;
                       STA.L $7E2364                        ;83B890|8F64237E|7E2364;
                       LDA.W #$1B4A                         ;83B894|A94A1B  |      ;
                       STA.L $7E2322                        ;83B897|8F22237E|7E2322;
                       LDA.W #$9B4A                         ;83B89B|A94A9B  |      ;
                       STA.L $7E2362                        ;83B89E|8F62237E|7E2362;
                       LDA.L $7E9969                        ;83B8A2|AF69997E|7E9969;
                       DEC A                                ;83B8A6|3A      |      ;
                       BNE +                                ;83B8A7|D03A    |83B8E3;
                       LDA.W #$1363                         ;83B8A9|A96313  |      ;
                       STA.L $7E2332                        ;83B8AC|8F32237E|7E2332;
                       LDA.W #$1364                         ;83B8B0|A96413  |      ;
                       STA.L $7E2334                        ;83B8B3|8F34237E|7E2334;
                       LDA.W #$1373                         ;83B8B7|A97313  |      ;
                       STA.L $7E2372                        ;83B8BA|8F72237E|7E2372;
                       LDA.W #$1374                         ;83B8BE|A97413  |      ;
                       STA.L $7E2374                        ;83B8C1|8F74237E|7E2374;
                       LDA.W #$5B5C                         ;83B8C5|A95C5B  |      ;
                       STA.L $7E232E                        ;83B8C8|8F2E237E|7E232E;
                       LDA.W #$DB5C                         ;83B8CC|A95CDB  |      ;
                       STA.L $7E236E                        ;83B8CF|8F6E237E|7E236E;
                       LDA.W #$1B5B                         ;83B8D3|A95B1B  |      ;
                       STA.L $7E2330                        ;83B8D6|8F30237E|7E2330;
                       LDA.W #$9B5B                         ;83B8DA|A95B9B  |      ;
                       STA.L $7E2370                        ;83B8DD|8F70237E|7E2370;
                       BRA ++                               ;83B8E1|803B    |83B91E;
 
                     + DEC A                                ;83B8E3|3A      |      ;
                       BNE ++                               ;83B8E4|D038    |83B91E;
                       LDA.W #$1361                         ;83B8E6|A96113  |      ;
                       STA.L $7E231E                        ;83B8E9|8F1E237E|7E231E;
                       LDA.W #$1362                         ;83B8ED|A96213  |      ;
                       STA.L $7E2320                        ;83B8F0|8F20237E|7E2320;
                       LDA.W #$1371                         ;83B8F4|A97113  |      ;
                       STA.L $7E235E                        ;83B8F7|8F5E237E|7E235E;
                       LDA.W #$1372                         ;83B8FB|A97213  |      ;
                       STA.L $7E2360                        ;83B8FE|8F60237E|7E2360;
                       LDA.W #$1B5C                         ;83B902|A95C1B  |      ;
                       STA.L $7E2324                        ;83B905|8F24237E|7E2324;
                       LDA.W #$9B5C                         ;83B909|A95C9B  |      ;
                       STA.L $7E2364                        ;83B90C|8F64237E|7E2364;
                       LDA.W #$1B4B                         ;83B910|A94B1B  |      ;
                       STA.L $7E2322                        ;83B913|8F22237E|7E2322;
                       LDA.W #$9B4B                         ;83B917|A94B9B  |      ;
                       STA.L $7E2362                        ;83B91A|8F62237E|7E2362;
 
                    ++ LDA.W #$074D                         ;83B91E|A94D07  |      ;
                       STA.L $7E25DE                        ;83B921|8FDE257E|7E25DE;
                       LDA.W #$074E                         ;83B925|A94E07  |      ;
                       STA.L $7E25E0                        ;83B928|8FE0257E|7E25E0;
                       LDA.W #$075D                         ;83B92C|A95D07  |      ;
                       STA.L $7E261E                        ;83B92F|8F1E267E|7E261E;
                       LDA.W #$075E                         ;83B933|A95E07  |      ;
                       STA.L $7E2620                        ;83B936|8F20267E|7E2620;
                       LDA.W #$074F                         ;83B93A|A94F07  |      ;
                       STA.L $7E25F2                        ;83B93D|8FF2257E|7E25F2;
                       LDA.W #$0760                         ;83B941|A96007  |      ;
                       STA.L $7E25F4                        ;83B944|8FF4257E|7E25F4;
                       LDA.W #$075F                         ;83B948|A95F07  |      ;
                       STA.L $7E2632                        ;83B94B|8F32267E|7E2632;
                       LDA.W #$0770                         ;83B94F|A97007  |      ;
                       STA.L $7E2634                        ;83B952|8F34267E|7E2634;
                       LDA.W #$534C                         ;83B956|A94C53  |      ;
                       STA.L $7E25EE                        ;83B959|8FEE257E|7E25EE;
                       LDA.W #$D34C                         ;83B95D|A94CD3  |      ;
                       STA.L $7E262E                        ;83B960|8F2E267E|7E262E;
                       LDA.W #$135A                         ;83B964|A95A13  |      ;
                       STA.L $7E25F0                        ;83B967|8FF0257E|7E25F0;
                       LDA.W #$935A                         ;83B96B|A95A93  |      ;
                       STA.L $7E2630                        ;83B96E|8F30267E|7E2630;
                       LDA.W #$134C                         ;83B972|A94C13  |      ;
                       STA.L $7E25E4                        ;83B975|8FE4257E|7E25E4;
                       LDA.W #$934C                         ;83B979|A94C93  |      ;
                       STA.L $7E2624                        ;83B97C|8F24267E|7E2624;
                       LDA.W #$134A                         ;83B980|A94A13  |      ;
                       STA.L $7E25E2                        ;83B983|8FE2257E|7E25E2;
                       LDA.W #$934A                         ;83B987|A94A93  |      ;
                       STA.L $7E2622                        ;83B98A|8F22267E|7E2622;
                       LDA.L $7E996B                        ;83B98E|AF6B997E|7E996B;
                       DEC A                                ;83B992|3A      |      ;
                       BNE +                                ;83B993|D03A    |83B9CF;
                       LDA.W #$1363                         ;83B995|A96313  |      ;
                       STA.L $7E25F2                        ;83B998|8FF2257E|7E25F2;
                       LDA.W #$1364                         ;83B99C|A96413  |      ;
                       STA.L $7E25F4                        ;83B99F|8FF4257E|7E25F4;
                       LDA.W #$1373                         ;83B9A3|A97313  |      ;
                       STA.L $7E2632                        ;83B9A6|8F32267E|7E2632;
                       LDA.W #$1374                         ;83B9AA|A97413  |      ;
                       STA.L $7E2634                        ;83B9AD|8F34267E|7E2634;
                       LDA.W #$535C                         ;83B9B1|A95C53  |      ;
                       STA.L $7E25EE                        ;83B9B4|8FEE257E|7E25EE;
                       LDA.W #$D35C                         ;83B9B8|A95CD3  |      ;
                       STA.L $7E262E                        ;83B9BB|8F2E267E|7E262E;
                       LDA.W #$135B                         ;83B9BF|A95B13  |      ;
                       STA.L $7E25F0                        ;83B9C2|8FF0257E|7E25F0;
                       LDA.W #$935B                         ;83B9C6|A95B93  |      ;
                       STA.L $7E2630                        ;83B9C9|8F30267E|7E2630;
                       BRA ++                               ;83B9CD|803B    |83BA0A;
 
                     + DEC A                                ;83B9CF|3A      |      ;
                       BNE ++                               ;83B9D0|D038    |83BA0A;
                       LDA.W #$1361                         ;83B9D2|A96113  |      ;
                       STA.L $7E25DE                        ;83B9D5|8FDE257E|7E25DE;
                       LDA.W #$1362                         ;83B9D9|A96213  |      ;
                       STA.L $7E25E0                        ;83B9DC|8FE0257E|7E25E0;
                       LDA.W #$1371                         ;83B9E0|A97113  |      ;
                       STA.L $7E261E                        ;83B9E3|8F1E267E|7E261E;
                       LDA.W #$1372                         ;83B9E7|A97213  |      ;
                       STA.L $7E2620                        ;83B9EA|8F20267E|7E2620;
                       LDA.W #$135C                         ;83B9EE|A95C13  |      ;
                       STA.L $7E25E4                        ;83B9F1|8FE4257E|7E25E4;
                       LDA.W #$935C                         ;83B9F5|A95C93  |      ;
                       STA.L $7E2624                        ;83B9F8|8F24267E|7E2624;
                       LDA.W #$134B                         ;83B9FC|A94B13  |      ;
                       STA.L $7E25E2                        ;83B9FF|8FE2257E|7E25E2;
                       LDA.W #$934B                         ;83BA03|A94B93  |      ;
                       STA.L $7E2622                        ;83BA06|8F22267E|7E2622;
 
                    ++ LDA.W #$0000                         ;83BA0A|A90000  |      ;
                       STA.L $7E9969                        ;83BA0D|8F69997E|7E9969;
                       STA.L $7E996B                        ;83BA11|8F6B997E|7E996B;
                       RTS                                  ;83BA15|60      |      ;
 
       CODE_FN_83BA16:
                       LDA.L $7E9458                        ;83BA16|AF58947E|7E9458;
                       LDY.W #$BA22                         ;83BA1A|A022BA  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83BA1D|20A2A7  |83A7A2;
                       BRA +                                ;83BA20|8009    |83BA2B;
                       db $78,$01,$40,$07,$CF,$07,$CF,$87   ;83BA22|        |      ;
                       db $02                               ;83BA2A|        |      ;
 
                     + LDA.L $7E945A                        ;83BA2B|AF5A947E|7E945A;
                       LDY.W #$BA37                         ;83BA2F|A037BA  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83BA32|20A2A7  |83A7A2;
                       BRA +                                ;83BA35|8009    |83BA40;
                       db $38,$04,$40,$0F,$CF,$0F,$CF,$8F   ;83BA37|        |      ;
                       db $02                               ;83BA3F|        |      ;
 
                     + RTS                                  ;83BA40|60      |      ;
 
       CODE_FN_83BA41:
                       LDY.W #$BA49                         ;83BA41|A049BA  |      ;
                       JSR.W CODE_FN_8391C4                 ;83BA44|20C491  |8391C4;
                       BRA +                                ;83BA47|8004    |83BA4D;
                       db $02,$01,$1E,$0F                   ;83BA49|        |      ;
 
                     + RTS                                  ;83BA4D|60      |      ;
 
       CODE_FN_83BA4E:
                       LDX.W #$0406                         ;83BA4E|A20604  |      ;
                       LDY.W #$000B                         ;83BA51|A00B00  |      ;
                       JSR.W CODE_FN_839137                 ;83BA54|203791  |839137;
                       RTS                                  ;83BA57|60      |      ;
 
       CODE_FN_83BA58:
                       LDY.W #$BA60                         ;83BA58|A060BA  |      ;
                       JSR.W CODE_FN_8391C4                 ;83BA5B|20C491  |8391C4;
                       BRA +                                ;83BA5E|8004    |83BA64;
                       db $02,$13,$1E,$1B                   ;83BA60|        |      ;
 
                     + RTS                                  ;83BA64|60      |      ;
 
       CODE_FN_83BA65:
                       JSR.W CODE_FN_83BA9F                 ;83BA65|209FBA  |83BA9F;
                       LDA.W Character_1P                   ;83BA68|ADBA02  |8302BA;
                       ASL A                                ;83BA6B|0A      |      ;
                       TAY                                  ;83BA6C|A8      |      ;
                       LDX.W DATA8_83BA85,Y                 ;83BA6D|BE85BA  |83BA85;
                       LDA.W #$0000                         ;83BA70|A90000  |      ;
                       JSR.W CODE_FN_83AC34                 ;83BA73|2034AC  |83AC34;
                       LDA.W $02BC                          ;83BA76|ADBC02  |8302BC;
                       ASL A                                ;83BA79|0A      |      ;
                       TAY                                  ;83BA7A|A8      |      ;
                       LDX.W DATA8_83BA85,Y                 ;83BA7B|BE85BA  |83BA85;
                       LDA.W #$0000                         ;83BA7E|A90000  |      ;
                       JSR.W CODE_FN_83AC34                 ;83BA81|2034AC  |83AC34;
                       RTS                                  ;83BA84|60      |      ;
 
         DATA8_83BA85:
                       db $C8,$00,$D2,$00,$DC,$00,$E6,$00   ;83BA85|        |      ;
                       db $48,$02,$52,$02,$5C,$02,$66,$02   ;83BA8D|        |      ;
                       db $48,$05,$52,$05,$5C,$05,$66,$05   ;83BA95|        |      ;
                       db $70,$02                           ;83BA9D|        |      ;
 
       CODE_FN_83BA9F:
                       LDY.W #$0018                         ;83BA9F|A01800  |      ;
 
                     - LDX.W DATA8_83BA85,Y                 ;83BAA2|BE85BA  |83BA85;
                       LDA.W #$0012                         ;83BAA5|A91200  |      ;
                       JSR.W CODE_FN_83AC34                 ;83BAA8|2034AC  |83AC34;
                       DEY                                  ;83BAAB|88      |      ;
                       DEY                                  ;83BAAC|88      |      ;
                       BPL -                                ;83BAAD|10F3    |83BAA2;
                       RTS                                  ;83BAAF|60      |      ;
 
       CODE_FN_83BAB0:
                       LDX.W #$0088                         ;83BAB0|A28800  |      ;
                       JSR.W CODE_FN_83916E                 ;83BAB3|206E91  |83916E;
                       RTS                                  ;83BAB6|60      |      ;
 
       CODE_FN_83BAB7:
                       LDY.W #$BABF                         ;83BAB7|A0BFBA  |      ;
                       JSR.W CODE_FN_839020                 ;83BABA|202090  |839020;
                       BRA +                                ;83BABD|8004    |83BAC3;
                       db $02,$06,$1E,$0C                   ;83BABF|        |      ;
 
                     + RTS                                  ;83BAC3|60      |      ;
 
       CODE_FN_83BAC4:
                       LDY.W #$BACC                         ;83BAC4|A0CCBA  |      ;
                       JSR.W CODE_FN_839020                 ;83BAC7|202090  |839020;
                       BRA +                                ;83BACA|8004    |83BAD0;
                       db $02,$0E,$1E,$14                   ;83BACC|        |      ;
 
                     + RTS                                  ;83BAD0|60      |      ;
 
       CODE_FN_83BAD1:
                       LDX.W #$0142                         ;83BAD1|A24201  |      ;
                       LDY.W #$0006                         ;83BAD4|A00600  |      ;
                       JSR.W CODE_FN_839254                 ;83BAD7|205492  |839254;
                       LDA.W #$0021                         ;83BADA|A92100  |      ;
                       STA.L $7E314A                        ;83BADD|8F4A317E|7E314A;
                       LDY.W #$BAEC                         ;83BAE1|A0ECBA  |      ;
                       LDX.W #$314C                         ;83BAE4|A24C31  |      ;
                       JSR.W CODE_FN_839F7F                 ;83BAE7|207F9F  |839F7F;
                       BRA +                                ;83BAEA|8003    |83BAEF;
                       db $09,$22,$00                       ;83BAEC|        |      ;
 
                     + LDA.W #$0023                         ;83BAEF|A92300  |      ;
                       STA.L $7E315E                        ;83BAF2|8F5E317E|7E315E;
                       RTS                                  ;83BAF6|60      |      ;
 
       CODE_FN_83BAF7:
                       LDX.W #$0342                         ;83BAF7|A24203  |      ;
                       LDY.W #$0006                         ;83BAFA|A00600  |      ;
                       JSR.W CODE_FN_839254                 ;83BAFD|205492  |839254;
                       RTS                                  ;83BB00|60      |      ;
 
       CODE_FN_83BB01:
                       LDA.W #$0000                         ;83BB01|A90000  |      ;
                       JSL.L CODE_FL_80A1F1                 ;83BB04|22F1A180|80A1F1;
                       JSR.W CODE_FN_83BAB0                 ;83BB08|20B0BA  |83BAB0;
                       LDA.W $1A6E                          ;83BB0B|AD6E1A  |831A6E;
                       BNE +                                ;83BB0E|D005    |83BB15;
                       JSR.W CODE_FN_83BAB7                 ;83BB10|20B7BA  |83BAB7;
                       BRA ++                               ;83BB13|8003    |83BB18;
 
                     + JSR.W CODE_FN_83BAD1                 ;83BB15|20D1BA  |83BAD1;
 
                    ++ LDA.W $1A70                          ;83BB18|AD701A  |831A70;
                       BNE +                                ;83BB1B|D005    |83BB22;
                       JSR.W CODE_FN_83BAC4                 ;83BB1D|20C4BA  |83BAC4;
                       BRA ++                               ;83BB20|8003    |83BB25;
 
                     + JSR.W CODE_FN_83BAF7                 ;83BB22|20F7BA  |83BAF7;
 
                    ++ RTS                                  ;83BB25|60      |      ;
 
       CODE_FN_83BB26:
                       LDA.W Difficulty_1P                  ;83BB26|ADAC02  |8302AC;
                       LDX.W #$00B9                         ;83BB29|A2B900  |      ;
                       LDY.W #$0047                         ;83BB2C|A04700  |      ;
                       JSR.W CODE_FN_83B7F5                 ;83BB2F|20F5B7  |83B7F5;
                       LDA.W Difficulty_2P                  ;83BB32|ADAE02  |8302AE;
                       LDX.W #$00B9                         ;83BB35|A2B900  |      ;
                       LDY.W #$0087                         ;83BB38|A08700  |      ;
                       JSR.W CODE_FN_83B7F5                 ;83BB3B|20F5B7  |83B7F5;
                       RTS                                  ;83BB3E|60      |      ;
 
       CODE_FN_83BB3F:
                       LDA.W Difficulty_1P                  ;83BB3F|ADAC02  |8302AC;
                       LDY.W #$BB4A                         ;83BB42|A04ABB  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83BB45|20A2A7  |83A7A2;
                       BRA +                                ;83BB48|8009    |83BB53;
                       db $52,$02,$20,$07,$68,$07,$CE,$07   ;83BB4A|        |      ;
                       db $02                               ;83BB52|        |      ;
 
                     + LDA.W Difficulty_2P                  ;83BB53|ADAE02  |8302AE;
                       LDY.W #$BB5E                         ;83BB56|A05EBB  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83BB59|20A2A7  |83A7A2;
                       BRA +                                ;83BB5C|8009    |83BB67;
                       db $52,$04,$20,$0F,$68,$0F,$CE,$0F   ;83BB5E|        |      ;
                       db $02                               ;83BB66|        |      ;
 
                     + RTS                                  ;83BB67|60      |      ;
 
       CODE_FN_83BB68:
                       LDA.L $7E9458                        ;83BB68|AF58947E|7E9458;
                       LDY.W #$BB74                         ;83BB6C|A074BB  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83BB6F|20A2A7  |83A7A2;
                       BRA +                                ;83BB72|8009    |83BB7D;
                       db $B8,$01,$40,$07,$CF,$07,$CF,$87   ;83BB74|        |      ;
                       db $02                               ;83BB7C|        |      ;
 
                     + LDA.L $7E945A                        ;83BB7D|AF5A947E|7E945A;
                       LDY.W #$BB89                         ;83BB81|A089BB  |      ;
                       JSR.W CODE_FN_83A7A2                 ;83BB84|20A2A7  |83A7A2;
                       BRA +                                ;83BB87|8009    |83BB92;
                       db $B8,$03,$40,$0F,$CF,$0F,$CF,$8F   ;83BB89|        |      ;
                       db $02                               ;83BB91|        |      ;
 
                     + RTS                                  ;83BB92|60      |      ;
 
Options_UpdateOptionGeneric:
                       STA.B $00                            ;83BB93|8500    |000000;
                       AND.W #$000F                         ;83BB95|290F00  |      ;
                       STY.B $02                            ;83BB98|8402    |000002;
                       CLC                                  ;83BB9A|18      |      ;
                       ADC.W #$0050                         ;83BB9B|695000  |      ;
                       CLC                                  ;83BB9E|18      |      ;
                       ADC.B $02                            ;83BB9F|6502    |000002;
                       STA.L $7E2002,X                      ;83BBA1|9F02207E|7E2002;
                       LDA.B $00                            ;83BBA5|A500    |000000;
                       LSR A                                ;83BBA7|4A      |      ;
                       LSR A                                ;83BBA8|4A      |      ;
                       LSR A                                ;83BBA9|4A      |      ;
                       LSR A                                ;83BBAA|4A      |      ;
                       CLC                                  ;83BBAB|18      |      ;
                       ADC.W #$0050                         ;83BBAC|695000  |      ;
                       CLC                                  ;83BBAF|18      |      ;
                       ADC.B $02                            ;83BBB0|6502    |000002;
                       STA.L $7E2000,X                      ;83BBB2|9F00207E|7E2000;
                       RTS                                  ;83BBB6|60      |      ;
 
 
Options_UpdateOption1P2P:
                       STA.B $00                            ;83BBB7|8500    |000000;
                       STY.B $02                            ;83BBB9|8402    |000002;
                       CLC                                  ;83BBBB|18      |      ;
                       ADC.W #$0050                         ;83BBBC|695000  |      ;
                       CLC                                  ;83BBBF|18      |      ;
                       ADC.B $02                            ;83BBC0|6502    |000002;
                       STA.L $7E2002,X                      ;83BBC2|9F02207E|7E2002;
                       RTS                                  ;83BBC6|60      |      ;
 
   Options_DoLanguage:
                       LDA.W Language                       ;83BBC7|AD861A  |831A86;
                       EOR.W #$0001                         ;83BBCA|490100  |      ;
                       LDX.W #$02AE                         ;83BBCD|A2AE02  |      ;
                       LDY.W #$0800                         ;83BBD0|A00008  |      ;
                       JSR.W Options_UpdateOptionLanguage   ;83BBD3|2053BC  |83BC53;
                       RTS                                  ;83BBD6|60      |      ;
 
Options_DoMatchPoints:
                       LDA.L Match_Points_Selection         ;83BBD7|AF6C947E|7E946C;
                       LDX.W #$032C                         ;83BBDB|A22C03  |      ;
                       LDY.W #$0C00                         ;83BBDE|A0000C  |      ;
                       JSR.W Options_UpdateOption1P2P       ;83BBE1|20B7BB  |83BBB7;
                       RTS                                  ;83BBE4|60      |      ;
 
  Options_DoSoundTest:
                       LDA.L Sound_Test_Selection           ;83BBE5|AF3E957E|7E953E;
                       LDX.W #$03AE                         ;83BBE9|A2AE03  |      ;
                       LDY.W #$1400                         ;83BBEC|A00014  |      ;
                       JSR.W Options_UpdateOptionGeneric    ;83BBEF|2093BB  |83BB93;
                       RTS                                  ;83BBF2|60      |      ;
 
  Options_DoMusicTest:
                       LDA.L Music_Test_Selection           ;83BBF3|AF42957E|7E9542;
                       LDX.W #$042E                         ;83BBF7|A22E04  |      ;
                       LDY.W #$1400                         ;83BBFA|A00014  |      ;
                       JSR.W Options_UpdateOptionGeneric    ;83BBFD|2093BB  |83BB93;
                       RTS                                  ;83BC00|60      |      ;
 
  Options_DoCharacter:
                       LDA.L Options_Character_Selection    ;83BC01|AF45937E|7E9345;
                       LDX.W #$04AE                         ;83BC05|A2AE04  |      ;
                       LDY.W #$0800                         ;83BC08|A00008  |      ;
                       JSR.W Options_UpdateOptionGeneric    ;83BC0B|2093BB  |83BB93;
                       RTS                                  ;83BC0E|60      |      ;
 
 Options_DoOptionMenu:
                       JSR.W Options_DoMatchPoints          ;83BC0F|20D7BB  |83BBD7;
                       JSR.W Options_DoSoundTest            ;83BC12|20E5BB  |83BBE5;
                       JSR.W Options_DoMusicTest            ;83BC15|20F3BB  |83BBF3;
                       JSR.W Options_DoCharacter            ;83BC18|2001BC  |83BC01;
                       JSR.W Options_DoLanguage             ;83BC1B|20C7BB  |83BBC7;
                       JSR.W Options_DoMark                 ;83BC1E|20CFBC  |83BCCF;
                       RTS                                  ;83BC21|60      |      ;
 
Options_UpdateOptionOnOff:
                       STY.B $00                            ;83BC22|8400    |000000;
                       CMP.W #$0000                         ;83BC24|C90000  |      ;
                       BNE +                                ;83BC27|D005    |83BC2E;
                       LDY.W #$BC4F                         ;83BC29|A04FBC  |      ;
                       BRA ++                               ;83BC2C|8003    |83BC31;
 
 
                     + LDY.W #$BC52                         ;83BC2E|A052BC  |      ;
 
                    ++ LDA.W #$0002                         ;83BC31|A90200  |      ;
                       STA.B $02                            ;83BC34|8502    |000002;
 
                     - LDA.W $0000,Y                        ;83BC36|B90000  |830000;
                       AND.W #$00FF                         ;83BC39|29FF00  |      ;
                       CLC                                  ;83BC3C|18      |      ;
                       ADC.B $00                            ;83BC3D|6500    |000000;
                       STA.L $7E2000,X                      ;83BC3F|9F00207E|7E2000;
                       INX                                  ;83BC43|E8      |      ;
                       INX                                  ;83BC44|E8      |      ;
                       DEY                                  ;83BC45|88      |      ;
                       DEC.B $02                            ;83BC46|C602    |000002;
                       LDA.B $02                            ;83BC48|A502    |000002;
                       BPL -                                ;83BC4A|10EA    |83BC36;
                       RTS                                  ;83BC4C|60      |      ;
 
                       db $0E,$67,$68,$5F,$5F,$68           ;83BC4D|        |      ;
 
Options_UpdateOptionLanguage:
                       STY.B $00                            ;83BC53|8400    |000000;
                       CMP.W #$0000                         ;83BC55|C90000  |      ;
                       BNE +                                ;83BC58|D005    |83BC5F;
                       LDY.W #$BC80                         ;83BC5A|A080BC  |      ;
                       BRA ++                               ;83BC5D|8003    |83BC62;
 
                     + LDY.W #$BC83                         ;83BC5F|A083BC  |      ;
 
                    ++ LDA.W #$0002                         ;83BC62|A90200  |      ;
                       STA.B $02                            ;83BC65|8502    |000002;
 
                     - LDA.W $0000,Y                        ;83BC67|B90000  |830000;
                       AND.W #$00FF                         ;83BC6A|29FF00  |      ;
                       CLC                                  ;83BC6D|18      |      ;
                       ADC.B $00                            ;83BC6E|6500    |000000;
                       STA.L $7E2000,X                      ;83BC70|9F00207E|7E2000;
                       INX                                  ;83BC74|E8      |      ;
                       INX                                  ;83BC75|E8      |      ;
                       DEY                                  ;83BC76|88      |      ;
                       DEC.B $02                            ;83BC77|C602    |000002;
                       LDA.B $02                            ;83BC79|A502    |000002;
                       BPL -                                ;83BC7B|10EA    |83BC67;
                       RTS                                  ;83BC7D|60      |      ;
                       db $67,$69,$63,$60,$67,$5E           ;83BC7E|        |      ;
 
      Options_DoCPU1P:
                       LDA.L CPU_Selection_1P               ;83BC84|AF64947E|7E9464;
                       EOR.W #$0001                         ;83BC88|490100  |      ;
                       LDX.W #$0372                         ;83BC8B|A27203  |      ;
                       LDY.W #$0400                         ;83BC8E|A00004  |      ;
                       JSR.W Options_UpdateOptionOnOff      ;83BC91|2022BC  |83BC22;
                       RTS                                  ;83BC94|60      |      ;
 
 Options_DoCPULevel1P:
                       LDA.L CPU_Level_Selection_1P         ;83BC95|AF68947E|7E9468;
                       LDX.W #$03F2                         ;83BC99|A2F203  |      ;
                       LDY.W #$0400                         ;83BC9C|A00004  |      ;
                       JSR.W Options_UpdateOption1P2P       ;83BC9F|20B7BB  |83BBB7;
                       RTS                                  ;83BCA2|60      |      ;
 
      Options_DoCPU2P:
                       LDA.L CPU_Selection_2P               ;83BCA3|AF66947E|7E9466;
                       EOR.W #$0001                         ;83BCA7|490100  |      ;
                       LDX.W #$0472                         ;83BCAA|A27204  |      ;
                       LDY.W #$0800                         ;83BCAD|A00008  |      ;
                       JSR.W Options_UpdateOptionOnOff      ;83BCB0|2022BC  |83BC22;
                       RTS                                  ;83BCB3|60      |      ;
 
 Options_DoCPULevel2P:
                       LDA.L CPU_Level_Selection_2P         ;83BCB4|AF6A947E|7E946A;
                       LDX.W #$04F2                         ;83BCB8|A2F204  |      ;
                       LDY.W #$0800                         ;83BCBB|A00008  |      ;
                       JSR.W Options_UpdateOption1P2P       ;83BCBE|20B7BB  |83BBB7;
                       RTS                                  ;83BCC1|60      |      ;
 
Options_DoCPUSwitchMenu:
                       JSR.W Options_DoCPU1P                ;83BCC2|2084BC  |83BC84;
                       JSR.W Options_DoCPULevel1P           ;83BCC5|2095BC  |83BC95;
                       JSR.W Options_DoCPU2P                ;83BCC8|20A3BC  |83BCA3;
                       JSR.W Options_DoCPULevel2P           ;83BCCB|20B4BC  |83BCB4;
                       RTS                                  ;83BCCE|60      |      ;
 
       Options_DoMark:
                       LDA.L Mark_Selection-$7E0000         ;83BCCF|AF841A00|001A84;
                       EOR.W #$0001                         ;83BCD3|490100  |      ;
                       LDX.W #$05AE                         ;83BCD6|A2AE05  |      ;
                       LDY.W #$0800                         ;83BCD9|A00008  |      ;
                       JSR.W Options_UpdateOptionOnOff      ;83BCDC|2022BC  |83BC22;
                       RTS                                  ;83BCDF|60      |      ;
 
 
Options_DoVSLevelEasy:
                       LDA.L VSLevelAdj_Easy_Selection      ;83BCE0|AF70947E|7E9470; unused
                       LDX.W #$0472                         ;83BCE4|A27204  |      ;
                       LDY.W #$0400                         ;83BCE7|A00004  |      ;
                       JSR.W Options_UpdateOptionGeneric    ;83BCEA|2093BB  |83BB93;
                       RTS                                  ;83BCED|60      |      ;
 
 
Options_DoVSLevelNormal:
                       LDA.L VSLevelAdj_Normal_Selection    ;83BCEE|AF72947E|7E9472; unused
                       LDX.W #$04F2                         ;83BCF2|A2F204  |      ;
                       LDY.W #$0C00                         ;83BCF5|A0000C  |      ;
                       JSR.W Options_UpdateOptionGeneric    ;83BCF8|2093BB  |83BB93;
                       RTS                                  ;83BCFB|60      |      ;
 
 
Options_DoVSLevelHard:
                       LDA.L VSLevelAdj_Hard_Selection      ;83BCFC|AF74947E|7E9474; unused
                       LDX.W #$0572                         ;83BD00|A27205  |      ;
                       LDY.W #$0800                         ;83BD03|A00008  |      ;
                       JSR.W Options_UpdateOptionGeneric    ;83BD06|2093BB  |83BB93;
                       RTS                                  ;83BD09|60      |      ;
 
 
    Options_DoEtcMenu:
                       JSR.W Options_DoMark                 ;83BD0A|20CFBC  |83BCCF; unreferenced
                       JSR.W Options_DoVSLevelEasy          ;83BD0D|20E0BC  |83BCE0;
                       JSR.W Options_DoVSLevelNormal        ;83BD10|20EEBC  |83BCEE;
                       JSR.W Options_DoVSLevelHard          ;83BD13|20FCBC  |83BCFC;
                       RTS                                  ;83BD16|60      |      ;
 
                       PHP                                  ;83BD17|08      |      ;
                       PHK                                  ;83BD18|4B      |      ;
                       PLB                                  ;83BD19|AB      |      ;
                       REP #$30                             ;83BD1A|C230    |      ;
                       SEP #$20                             ;83BD1C|E220    |      ;
                       JSR.W Menu_MoveBackground            ;83BD1E|207182  |838271;
                       LDA.W $021E                          ;83BD21|AD1E02  |83021E;
                       STA.W HDMAEN                         ;83BD24|8D0C42  |83420C;
                       JSL.L CODE_FL_83804A                 ;83BD27|224A8083|83804A;
                       JSL.L CODE_FL_8380B3                 ;83BD2B|22B38083|8380B3;
                       REP #$20                             ;83BD2F|C220    |      ;
                       JSR.W CODE_FN_838787                 ;83BD31|208787  |838787;
                       LDA.W $0366                          ;83BD34|AD6603  |830366;
                       BEQ +                                ;83BD37|F003    |83BD3C;
                       JSR.W CODE_FN_83A915                 ;83BD39|2015A9  |83A915;
 
                     + REP #$20                             ;83BD3C|C220    |      ;
                       JSR.W CODE_FN_838667                 ;83BD3E|206786  |838667;
                       LDA.W #$0000                         ;83BD41|A90000  |      ;
                       STA.L $7E995F                        ;83BD44|8F5F997E|7E995F;
                       JSR.W CODE_FN_839E71                 ;83BD48|20719E  |839E71;
                       JSR.W CODE_FN_839D98                 ;83BD4B|20989D  |839D98;
                       LDA.L Game_State_State-$7E0000       ;83BD4E|AFA20200|0002A2;
                       ASL A                                ;83BD52|0A      |      ;
                       TAX                                  ;83BD53|AA      |      ;
                       JSR.W (DATA8_83BD59,X)               ;83BD54|FC59BD  |83BD59;
                       PLP                                  ;83BD57|28      |      ;
                       RTL                                  ;83BD58|6B      |      ;
 
         DATA8_83BD59:
                       db $2C,$BE,$85,$C0,$96,$C0,$DB,$C0   ;83BD59|        |      ;
                       db $47,$C1,$5E,$C1,$DB,$C1,$FC,$C1   ;83BD61|        |      ;
                       db $2D,$C3,$DB,$C4,$1F,$C5,$C0,$C5   ;83BD69|        |      ;
                       db $44,$C6,$FC,$C1,$2D,$C3,$E0,$C6   ;83BD71|        |      ;
                       db $1F,$C5,$C0,$C5,$42,$C7,$C5,$C7   ;83BD79|        |      ;
                       db $A0,$C8,$E4,$C8,$35,$C9           ;83BD81|        |      ;
                       db $42,$C7                           ;83BD87|        |      ;
                       db $C5,$C7,$26,$CE,$E4,$C8,$35,$C9   ;83BD89|        |      ;
                       db $50,$CA,$01,$CB,$15,$CD,$A7,$CD   ;83BD91|        |      ;
                       db $FC,$C1,$2D,$C3,$AE,$CE,$1F,$C5   ;83BD99|        |      ;
                       db $C0,$C5,$F8,$CE,$36,$CF,$49,$CF   ;83BDA1|        |      ;
                       db $2D,$C3,$79,$CF,$1F,$C5           ;83BDA9|        |      ;
                       db $87,$D5                           ;83BDAF|        |0000D5;
                       db $D8,$D2,$BA,$D3,$5D,$D4           ;83BDB1|        |      ;
                       db $D8,$D2,$D1,$D4,$5D,$D4           ;83BDB7|        |      ;
                       db $2D,$C3,$9C,$D5,$1F,$C5           ;83BDBD|        |      ;
                       db $42,$C7                           ;83BDC3|        |      ;
                       db $C5,$C7,$6A,$CE,$E4,$C8,$35,$C9   ;83BDC5|        |      ;
 
       CODE_FL_83BDCD:
                       LDA.W #$0001                         ;83BDCD|A90100  |      ;
                       STA.W Game_State                     ;83BDD0|8DA002  |8202A0;
                       LDA.W #$0005                         ;83BDD3|A90500  |      ;
                       STA.W Game_State_State               ;83BDD6|8DA202  |8202A2;
                       LDA.L $7E961E                        ;83BDD9|AF1E967E|7E961E;
                       BNE +                                ;83BDDD|D007    |83BDE6;
                       LDA.W #$0000                         ;83BDDF|A90000  |      ;
                       STA.L VS_MenuSelection               ;83BDE2|8F3C957E|7E953C;
 
                     + RTL                                  ;83BDE6|6B      |      ;
 
       CODE_FL_83BDE7:
                       LDA.W #$0001                         ;83BDE7|A90100  |      ;
                       STA.W Game_State                     ;83BDEA|8DA002  |8A02A0;
                       LDA.W #$0005                         ;83BDED|A90500  |      ;
                       STA.W Game_State_State               ;83BDF0|8DA202  |8A02A2;
                       RTL                                  ;83BDF3|6B      |      ;
 
       CODE_FL_83BDF4:
                       LDA.W #$0001                         ;83BDF4|A90100  |      ;
                       STA.W Game_State                     ;83BDF7|8DA002  |8702A0;
                       LDA.W #$0005                         ;83BDFA|A90500  |      ;
                       STA.W Game_State_State               ;83BDFD|8DA202  |8702A2;
                       RTL                                  ;83BE00|6B      |      ;
 
       CODE_FL_83BE01:
                       LDA.W #$0001                         ;83BE01|A90100  |      ;
                       STA.W Game_State                     ;83BE04|8DA002  |8902A0;
                       LDA.W #$0005                         ;83BE07|A90500  |      ;
                       STA.W Game_State_State               ;83BE0A|8DA202  |8902A2;
                       RTL                                  ;83BE0D|6B      |      ;
 
       CODE_FN_83BE0E:
                       JSR.W CODE_FN_83849D                 ;83BE0E|209D84  |83849D;
                       LDY.W #$0001                         ;83BE11|A00100  |      ;
                       JSL.L CODE_FL_80AF18                 ;83BE14|2218AF80|80AF18;
                       BCC +                                ;83BE18|900F    |83BE29;
                       REP #$20                             ;83BE1A|C220    |      ;
                       INC.W Game_State                     ;83BE1C|EEA002  |8302A0;
                       LDA.W #$0000                         ;83BE1F|A90000  |      ;
                       STA.W Game_State_State               ;83BE22|8DA202  |8302A2;
                       JSL.L CODE_FL_80A145                 ;83BE25|2245A180|80A145;
 
                     + REP #$20                             ;83BE29|C220    |      ;
                       RTS                                  ;83BE2B|60      |      ;
                       INC.W Game_State_State               ;83BE2C|EEA202  |8302A2;
                       JSR.W CODE_FN_83BE78                 ;83BE2F|2078BE  |83BE78;
                       JSL.L CODE_FL_8A8ACB                 ;83BE32|22CB8A8A|8A8ACB;
                       JSL.L CODE_FL_8A88F3                 ;83BE36|22F3888A|8A88F3;
                       JSR.W CODE_FN_83BF62                 ;83BE3A|2062BF  |83BF62;
                       LDA.W #$FFFF                         ;83BE3D|A9FFFF  |      ;
                       STA.W $02A8                          ;83BE40|8DA802  |8302A8;
                       LDA.W #$0000                         ;83BE43|A90000  |      ;
                       STA.L $7E38FE                        ;83BE46|8FFE387E|7E38FE;
                       STA.L Main_Menu_Selection            ;83BE4A|8F28957E|7E9528;
                       STA.L $7E96DF                        ;83BE4E|8FDF967E|7E96DF;
                       STA.L $7E96E0                        ;83BE52|8FE0967E|7E96E0;
                       STA.L $7E96E1                        ;83BE56|8FE1967E|7E96E1;
                       STA.L $7E96E2                        ;83BE5A|8FE2967E|7E96E2;
                       STA.W $1A6E                          ;83BE5E|8D6E1A  |831A6E;
                       STA.W $1A70                          ;83BE61|8D701A  |831A70;
                       STA.L BossChars_Available            ;83BE64|8FD2947E|7E94D2;
                       LDA.W #$0000                         ;83BE68|A90000  |      ;
                       JSR.W Move_MenuLipYoshi              ;83BE6B|200D9F  |839F0D;
                       JSR.W CODE_FN_838517                 ;83BE6E|201785  |838517;
                       JSR.W CODE_FN_838523                 ;83BE71|202385  |838523;
                       JSR.W CODE_FN_83852F                 ;83BE74|202F85  |83852F;
                       RTS                                  ;83BE77|60      |      ;
 
       CODE_FN_83BE78:
                       JSL.L CODE_FL_809CF7                 ;83BE78|22F79C80|809CF7;
                       JSL.L CODE_FL_80C602                 ;83BE7C|2202C680|80C602;
                       JSL.L CODE_FL_809E38                 ;83BE80|22389E80|809E38;
                       JSL.L CODE_FL_838767                 ;83BE84|22678783|838767;
                       JSL.L CODE_FL_80A145                 ;83BE88|2245A180|80A145;
                       SEP #$20                             ;83BE8C|E220    |      ;
                       LDA.B #$01                           ;83BE8E|A901    |      ;
                       STA.W $01BA                          ;83BE90|8DBA01  |8301BA;
                       LDA.B #$6A                           ;83BE93|A96A    |      ;
                       STA.W $01BC                          ;83BE95|8DBC01  |8301BC;
                       LDA.B #$70                           ;83BE98|A970    |      ;
                       STA.W $01BD                          ;83BE9A|8DBD01  |8301BD;
                       LDA.B #$7A                           ;83BE9D|A97A    |      ;
                       STA.W $01BE                          ;83BE9F|8DBE01  |8301BE;
                       STZ.W $01BF                          ;83BEA2|9CBF01  |8301BF;
                       LDA.B #$22                           ;83BEA5|A922    |      ;
                       STA.W $01C0                          ;83BEA7|8DC001  |8301C0;
                       LDA.B #$06                           ;83BEAA|A906    |      ;
                       STA.W $01C1                          ;83BEAC|8DC101  |8301C1;
                       LDA.B #$00                           ;83BEAF|A900    |      ;
                       STA.W $01B7                          ;83BEB1|8DB701  |8301B7;
                       STZ.W BG1HOFS                        ;83BEB4|9C0D21  |83210D;
                       STZ.W BG1HOFS                        ;83BEB7|9C0D21  |83210D;
                       STZ.W _BG1VOFS                       ;83BEBA|9C0E21  |83210E;
                       STZ.W _BG1VOFS                       ;83BEBD|9C0E21  |83210E;
                       STZ.W BG2HOFS                        ;83BEC0|9C0F21  |83210F;
                       STZ.W BG2HOFS                        ;83BEC3|9C0F21  |83210F;
                       STZ.W BG2VOFS                        ;83BEC6|9C1021  |832110;
                       STZ.W BG2VOFS                        ;83BEC9|9C1021  |832110;
                       STZ.W BG3HOFS                        ;83BECC|9C1121  |832111;
                       STZ.W BG3HOFS                        ;83BECF|9C1121  |832111;
                       STZ.W $01D3                          ;83BED2|9CD301  |8301D3;
                       STZ.W $01D4                          ;83BED5|9CD401  |8301D4;
                       STZ.W BG3VOFS                        ;83BED8|9C1221  |832112;
                       STZ.W BG3VOFS                        ;83BEDB|9C1221  |832112;
                       STZ.W VMAINC                         ;83BEDE|9C1521  |832115;
                       STZ.W $01C2                          ;83BEE1|9CC201  |8301C2;
                       STZ.W $01C3                          ;83BEE4|9CC301  |8301C3;
                       STZ.W $01C4                          ;83BEE7|9CC401  |8301C4;
                       STZ.W $01C5                          ;83BEEA|9CC501  |8301C5;
                       STZ.W $01C6                          ;83BEED|9CC601  |8301C6;
                       STZ.W $01C7                          ;83BEF0|9CC701  |8301C7;
                       STZ.W $01C8                          ;83BEF3|9CC801  |8301C8;
                       STZ.W $01C9                          ;83BEF6|9CC901  |8301C9;
                       STZ.W $01C9                          ;83BEF9|9CC901  |8301C9;
                       STZ.W $01CA                          ;83BEFC|9CCA01  |8301CA;
                       STZ.W $01DB                          ;83BEFF|9CDB01  |8301DB;
                       STZ.W $01DC                          ;83BF02|9CDC01  |8301DC;
                       STZ.W $01DD                          ;83BF05|9CDD01  |8301DD;
                       STZ.W $01DE                          ;83BF08|9CDE01  |8301DE;
                       STZ.W $01DF                          ;83BF0B|9CDF01  |8301DF;
                       STZ.W $01E0                          ;83BF0E|9CE001  |8301E0;
                       STZ.W $01E1                          ;83BF11|9CE101  |8301E1;
                       LDA.B #$13                           ;83BF14|A913    |      ;
                       STA.W $01E2                          ;83BF16|8DE201  |8301E2;
                       STZ.W $01E4                          ;83BF19|9CE401  |8301E4;
                       LDA.B #$04                           ;83BF1C|A904    |      ;
                       STA.W $01E3                          ;83BF1E|8DE301  |8301E3;
                       STZ.W $01E5                          ;83BF21|9CE501  |8301E5;
                       STZ.W CGADD                          ;83BF24|9C2121  |832121;
                       LDA.B #$02                           ;83BF27|A902    |      ;
                       STA.W CGSWSEL                        ;83BF29|8D3021  |832130;
                       STA.W $01E6                          ;83BF2C|8DE601  |8301E6;
                       LDA.B #$82                           ;83BF2F|A982    |      ;
                       STA.W CGADSUB                        ;83BF31|8D3121  |832131;
                       STA.W $01E7                          ;83BF34|8DE701  |8301E7;
                       LDA.B #$E0                           ;83BF37|A9E0    |      ;
                       STA.W COLDATA                        ;83BF39|8D3221  |832132;
                       STA.W $01EA                          ;83BF3C|8DEA01  |8301EA;
                       LDA.B #$00                           ;83BF3F|A900    |      ;
                       STA.W $01EB                          ;83BF41|8DEB01  |8301EB;
                       LDA.B #$81                           ;83BF44|A981    |      ;
                       STA.W $01EC                          ;83BF46|8DEC01  |8301EC;
                       STZ.W MDMAEN                         ;83BF49|9C0B42  |83420B;
                       STZ.W $01F1                          ;83BF4C|9CF101  |8301F1;
                       LDX.W #$0000                         ;83BF4F|A20000  |      ;
 
                     - NOP                                  ;83BF52|EA      |      ;
                       NOP                                  ;83BF53|EA      |      ;
                       NOP                                  ;83BF54|EA      |      ;
                       NOP                                  ;83BF55|EA      |      ;
                       INX                                  ;83BF56|E8      |      ;
                       BNE -                                ;83BF57|D0F9    |83BF52;
                       REP #$30                             ;83BF59|C230    |      ;
                       STZ.W $1A6E                          ;83BF5B|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83BF5E|9C701A  |831A70;
                       RTS                                  ;83BF61|60      |      ;
 
       CODE_FN_83BF62:
                       JSL.L CODE_FL_80BB2D                 ;83BF62|222DBB80|80BB2D;
                       db $BB,$C0,$91,$00,$5D,$7F           ;83BF66|        |      ;
                       PHB                                  ;83BF6C|8B      |      ;
                       PHK                                  ;83BF6D|4B      |      ;
                       PLB                                  ;83BF6E|AB      |      ;
                       LDY.W #$BF79                         ;83BF6F|A079BF  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83BF72|22CAA080|80A0CA;
                       PLB                                  ;83BF76|AB      |      ;
                       BRA +                                ;83BF77|8008    |83BF81;
                       db $00,$5D,$7F,$00,$60,$80,$00,$30   ;83BF79|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83BF81|222DBB80|80BB2D;
                       db $39,$B0,$93,$00,$5D,$7F           ;83BF85|        |      ;
                       PHB                                  ;83BF8B|8B      |      ;
                       PHK                                  ;83BF8C|4B      |      ;
                       PLB                                  ;83BF8D|AB      |      ;
                       LDY.W #$BF98                         ;83BF8E|A098BF  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83BF91|22CAA080|80A0CA;
                       PLB                                  ;83BF95|AB      |      ;
                       BRA +                                ;83BF96|8008    |83BFA0;
                       db $00,$5D,$7F,$00,$20,$80,$00,$10   ;83BF98|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83BFA0|222DBB80|80BB2D;
                       db $1C,$FA,$91,$00,$5D,$7F           ;83BFA4|        |      ;
                       PHB                                  ;83BFAA|8B      |      ;
                       PHK                                  ;83BFAB|4B      |      ;
                       PLB                                  ;83BFAC|AB      |      ;
                       LDY.W #$BFB7                         ;83BFAD|A0B7BF  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83BFB0|22CAA080|80A0CA;
                       PLB                                  ;83BFB4|AB      |      ;
                       BRA +                                ;83BFB5|8008    |83BFBF;
                       db $00,$5D,$7F,$00,$08,$80,$00,$60   ;83BFB7|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83BFBF|222DBB80|80BB2D;
                       db $7B,$FB,$91,$00,$5D,$7F           ;83BFC3|        |      ;
                       PHB                                  ;83BFC9|8B      |      ;
                       PHK                                  ;83BFCA|4B      |      ;
                       PLB                                  ;83BFCB|AB      |      ;
                       LDY.W #$BFD6                         ;83BFCC|A0D6BF  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83BFCF|22CAA080|80A0CA;
                       PLB                                  ;83BFD3|AB      |      ;
                       BRA +                                ;83BFD4|8008    |83BFDE;
                       db $00,$5D,$7F,$00,$08,$80,$00,$70   ;83BFD6|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83BFDE|222DBB80|80BB2D;
                       db $69,$EB,$91,$00,$83,$7F           ;83BFE2|        |      ;
                       PHB                                  ;83BFE8|8B      |      ;
                       PHK                                  ;83BFE9|4B      |      ;
                       PLB                                  ;83BFEA|AB      |      ;
                       LDY.W #$BFF5                         ;83BFEB|A0F5BF  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83BFEE|22CAA080|80A0CA;
                       PLB                                  ;83BFF2|AB      |      ;
                       BRA +                                ;83BFF3|8008    |83BFFD;
                       db $00,$83,$7F,$00,$20,$80,$00,$00   ;83BFF5|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83BFFD|222DBB80|80BB2D;
                       db $8E,$9E,$91,$00,$9D,$7F           ;83C001|        |      ;
                       PHB                                  ;83C007|8B      |      ;
                       PHK                                  ;83C008|4B      |      ;
                       PLB                                  ;83C009|AB      |      ;
                       LDY.W #$C014                         ;83C00A|A014C0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C00D|22CAA080|80A0CA;
                       PLB                                  ;83C011|AB      |      ;
                       BRA +                                ;83C012|8008    |83C01C;
                       db $00,$9D,$7F,$00,$20,$80,$00,$20   ;83C014|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83C01C|222DBB80|80BB2D;
                       db $AD,$B4,$91,$00,$BD,$7F           ;83C020|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;83C026|222DBB80|80BB2D;
                       db $82,$FD,$93,$00,$91,$7F           ;83C02A|        |      ;
                       PHB                                  ;83C030|8B      |      ;
                       PHK                                  ;83C031|4B      |      ;
                       PLB                                  ;83C032|AB      |      ;
                       LDY.W #$C03D                         ;83C033|A03DC0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C036|22CAA080|80A0CA;
                       PLB                                  ;83C03A|AB      |      ;
                       BRA +                                ;83C03B|8008    |83C045;
                       db $00,$91,$7F,$00,$0C,$80,$00,$01   ;83C03D|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;83C045|222DBB80|80BB2D;
                       db $20,$A2,$93,$1C,$39,$7E           ;83C049|        |      ;
                       JSR.W CODE_FN_839FB6                 ;83C04F|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83C052|2058A0  |83A058;
                       JSR.W CODE_FN_83A083                 ;83C055|2083A0  |83A083;
                       JSR.W CODE_FN_838DCE                 ;83C058|20CE8D  |838DCE;
                       JSL.L CODE_FL_80BB2D                 ;83C05B|222DBB80|80BB2D;
                       db $64,$AF,$91,$F6,$86,$7E           ;83C05F|        |      ;
                       JSR.W CODE_FN_83A10E                 ;83C065|200EA1  |83A10E;
                       JSR.W CODE_FN_838490                 ;83C068|209084  |838490;
                       LDA.W #$0001                         ;83C06B|A90100  |      ;
                       STA.L $7E95EC                        ;83C06E|8FEC957E|7E95EC;
                       STZ.W $01CB                          ;83C072|9CCB01  |8301CB;
                       STZ.W $01CD                          ;83C075|9CCD01  |8301CD;
                       STZ.W $01CF                          ;83C078|9CCF01  |8301CF;
                       STZ.W $01D1                          ;83C07B|9CD101  |8301D1;
                       STZ.W $01D3                          ;83C07E|9CD301  |8301D3;
                       STZ.W $01D5                          ;83C081|9CD501  |8301D5;
                       RTS                                  ;83C084|60      |      ;
                       LDY.W #$0001                         ;83C085|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;83C088|22CBAE80|80AECB;
                       BCC +                                ;83C08C|9005    |83C093;
                       REP #$20                             ;83C08E|C220    |      ;
                       INC.W Game_State_State               ;83C090|EEA202  |8302A2;
 
                     + REP #$20                             ;83C093|C220    |      ;
                       RTS                                  ;83C095|60      |      ;
                       LDA.W $1A6E                          ;83C096|AD6E1A  |831A6E;
                       ASL A                                ;83C099|0A      |      ;
                       TAX                                  ;83C09A|AA      |      ;
                       JSR.W (DATA8_83C09F,X)               ;83C09B|FC9FC0  |83C09F;
                       RTS                                  ;83C09E|60      |      ;
 
         DATA8_83C09F:
                       db $A5,$C0,$B2,$C0,$C2,$C0           ;83C09F|        |      ;
                       INC.W $1A6E                          ;83C0A5|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A24F                 ;83C0A8|204FA2  |83A24F;
                       JSR.W CODE_FN_83A789                 ;83C0AB|2089A7  |83A789;
                       JSR.W CODE_FN_83A058                 ;83C0AE|2058A0  |83A058;
                       RTS                                  ;83C0B1|60      |      ;
                       INC.W $1A6E                          ;83C0B2|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A3C1                 ;83C0B5|20C1A3  |83A3C1;
                       JSR.W CODE_FN_83A058                 ;83C0B8|2058A0  |83A058;
                       JSR.W CODE_FN_83A603                 ;83C0BB|2003A6  |83A603;
                       JSR.W CODE_FN_838ABD                 ;83C0BE|20BD8A  |838ABD;
                       RTS                                  ;83C0C1|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83C0C2|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C0C5|AF8D997E|7E998D;
                       BEQ +                                ;83C0C9|F003    |83C0CE;
                       JMP.W CODE_JP_83C0DA                 ;83C0CB|4CDAC0  |83C0DA;
 
                     + LDA.W #$0000                         ;83C0CE|A90000  |      ;
                       STA.W $1A6E                          ;83C0D1|8D6E1A  |831A6E;
                       STA.W $1A70                          ;83C0D4|8D701A  |831A70;
                       INC.W Game_State_State               ;83C0D7|EEA202  |8302A2;
 
       CODE_JP_83C0DA:
                       RTS                                  ;83C0DA|60      |      ;
                       LDA.W $1A6E                          ;83C0DB|AD6E1A  |831A6E;
                       ASL A                                ;83C0DE|0A      |      ;
                       TAX                                  ;83C0DF|AA      |      ;
                       JSR.W (DATA8_83C0E4,X)               ;83C0E0|FCE4C0  |83C0E4;
                       RTS                                  ;83C0E3|60      |      ;
 
         DATA8_83C0E4:
                       db $E8,$C0                           ;83C0E4|        |      ;
                       db $2F,$C1                           ;83C0E6|        |FFA9C1;
                       LDA.W #$FFFF                         ;83C0E8|A9FFFF  |      ;
                       STA.W $02A8                          ;83C0EB|8DA802  |8302A8;
                       LDA.L Main_Menu_Selection            ;83C0EE|AF28957E|7E9528;
                       INC A                                ;83C0F2|1A      |      ;
                       JSR.W CODE_FN_839DD7                 ;83C0F3|20D79D  |839DD7;
                       LDA.W #$0001                         ;83C0F6|A90100  |      ;
                       STA.L $7E96DB                        ;83C0F9|8FDB967E|7E96DB;
                       LDY.W #$C109                         ;83C0FD|A009C1  |      ;
                       LDA.L Main_Menu_Selection            ;83C100|AF28957E|7E9528;
                       JSR.W CODE_FN_8387F8                 ;83C104|20F887  |8387F8;
                       BRA +                                ;83C107|8003    |83C10C;
                       db $04,$29,$C1                       ;83C109|        |      ;
 
                     + LDA.B $00                            ;83C10C|A500    |000000;
                       STA.L Main_Menu_Selection            ;83C10E|8F28957E|7E9528;
                       LDX.W #$0028                         ;83C112|A22800  |      ;
                       LDY.W #$003B                         ;83C115|A03B00  |      ;
                       LDA.L Main_Menu_Selection            ;83C118|AF28957E|7E9528;
                       JSR.W CODE_FN_8397A1                 ;83C11C|20A197  |8397A1;
                       LDA.L $7E96FD                        ;83C11F|AFFD967E|7E96FD;
                       BEQ +                                ;83C123|F003    |83C128;
                       STZ.W $1A70                          ;83C125|9C701A  |831A70;
 
                     + RTS                                  ;83C128|60      |      ;
                       db $08,$0E,$21,$32,$28,$04,$AF       ;83C129|        |      ;
                       db $D4,$95,$7E,$F0,$0B,$9C,$6E,$1A   ;83C130|        |000095;
                       db $A2,$00,$05,$20,$EE,$9F,$80,$03   ;83C138|        |      ;
                       db $20,$02,$A5,$20,$58,$A0,$60       ;83C140|        |83A502;
                       JSR.W CODE_FN_83849D                 ;83C147|209D84  |83849D;
                       LDY.W #$0001                         ;83C14A|A00100  |      ;
                       JSL.L CODE_FL_80AF18                 ;83C14D|2218AF80|80AF18;
                       BCC +                                ;83C151|9008    |83C15B;
                       REP #$20                             ;83C153|C220    |      ;
                       STZ.W Game_State_State               ;83C155|9CA202  |8302A2;
                       STZ.W Game_State                     ;83C158|9CA002  |8302A0;
 
                     + REP #$20                             ;83C15B|C220    |      ;
                       RTS                                  ;83C15D|60      |      ;
                       INC.W Game_State_State               ;83C15E|EEA202  |8302A2;
                       JSR.W CODE_FN_83BE78                 ;83C161|2078BE  |83BE78;
                       JSL.L CODE_FL_8A8ACB                 ;83C164|22CB8A8A|8A8ACB;
                       JSL.L CODE_FL_8A88F3                 ;83C168|22F3888A|8A88F3;
                       JSR.W CODE_FN_83BF62                 ;83C16C|2062BF  |83BF62;
                       LDA.L Main_Menu_Selection            ;83C16F|AF28957E|7E9528;
                       ASL A                                ;83C173|0A      |      ;
                       TAX                                  ;83C174|AA      |      ;
                       JSR.W (DATA8_83C18E,X)               ;83C175|FC8EC1  |83C18E;
                       LDA.W #$0006                         ;83C178|A90600  |      ;
                       STA.W Game_State_State               ;83C17B|8DA202  |8302A2;
                       JSR.W CODE_FN_83A24F                 ;83C17E|204FA2  |83A24F;
                       JSR.W CODE_FN_83A789                 ;83C181|2089A7  |83A789;
                       JSR.W CODE_FN_83A058                 ;83C184|2058A0  |83A058;
                       LDA.W #$0000                         ;83C187|A90000  |      ;
                       STA.W $02A8                          ;83C18A|8DA802  |8302A8;
                       RTS                                  ;83C18D|60      |      ;
 
         DATA8_83C18E:
                       db $98,$C1                           ;83C18E|        |      ;
                       db $AA,$C1                           ;83C190|        |      ;
                       db $AA,$C1,$B1,$C1                   ;83C192|        |      ;
                       db $B8,$C1                           ;83C196|        |      ;
                       JSR.W CODE_FN_83A262                 ;83C198|2062A2  |83A262;
                       JSR.W CODE_FN_83A32E                 ;83C19B|202EA3  |83A32E;
                       LDA.L $7E9526                        ;83C19E|AF26957E|7E9526;
                       STA.L $7E961E                        ;83C1A2|8F1E967E|7E961E;
                       JSR.W CODE_FN_83A475                 ;83C1A6|2075A4  |83A475;
                       RTS                                  ;83C1A9|60      |      ;
                       JSR.W CODE_FN_83A29F                 ;83C1AA|209FA2  |83A29F;
                       JSR.W CODE_FN_83A41B                 ;83C1AD|201BA4  |83A41B;
                       RTS                                  ;83C1B0|60      |      ;
                       JSR.W CODE_FN_83A2B5                 ;83C1B1|20B5A2  |83A2B5;
                       JSR.W CODE_FN_83A439                 ;83C1B4|2039A4  |83A439;
                       RTS                                  ;83C1B7|60      |      ;
                       JSR.W CODE_FN_83A2CB                 ;83C1B8|20CBA2  |83A2CB;
                       JSR.W CODE_FN_83A457                 ;83C1BB|2057A4  |83A457;
                       JSR.W Options_DoOptionMenu           ;83C1BE|200FBC  |83BC0F;
                       LDA.W #$0002                         ;83C1C1|A90200  |      ;
                       JSR.W Move_MenuLipYoshi              ;83C1C4|200D9F  |839F0D;
                       LDA.L $7E9624                        ;83C1C7|AF24967E|7E9624;
                       STA.L $7E9620                        ;83C1CB|8F20967E|7E9620;
                       LDA.L $7E9626                        ;83C1CF|AF26967E|7E9626;
                       STA.L $7E9622                        ;83C1D3|8F22967E|7E9622;
                       JSR.W CODE_FN_8384A4                 ;83C1D7|20A484  |8384A4;
                       RTS                                  ;83C1DA|60      |      ;
                       LDY.W #$0001                         ;83C1DB|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;83C1DE|22CBAE80|80AECB;
                       BCC +                                ;83C1E2|9010    |83C1F4;
                       REP #$20                             ;83C1E4|C220    |      ;
                       LDA.L Main_Menu_Selection            ;83C1E6|AF28957E|7E9528;
                       TAX                                  ;83C1EA|AA      |      ;
                       LDA.W DATA8_83C1F7,X                 ;83C1EB|BDF7C1  |83C1F7;
                       AND.W #$00FF                         ;83C1EE|29FF00  |      ;
                       STA.W Game_State_State               ;83C1F1|8DA202  |8302A2;
 
                     + REP #$20                             ;83C1F4|C220    |      ;
                       RTS                                  ;83C1F6|60      |      ;
 
         DATA8_83C1F7:
                       db $37,$0F,$22,$33,$29               ;83C1F7|        |      ;
                       LDA.W $1A6E                          ;83C1FC|AD6E1A  |831A6E;
                       ASL A                                ;83C1FF|0A      |      ;
                       TAX                                  ;83C200|AA      |      ;
                       JSR.W (DATA8_83C205,X)               ;83C201|FC05C2  |83C205;
                       RTS                                  ;83C204|60      |      ;
 
         DATA8_83C205:
                       db $11,$C2,$39,$C2,$58,$C2,$71,$C2   ;83C205|        |      ;
                       db $8A,$C2,$EE,$C2                   ;83C20D|        |      ;
                       INC.W $1A6E                          ;83C211|EE6E1A  |831A6E;
                       LDA.W #$0000                         ;83C214|A90000  |      ;
                       JSR.W CODE_FN_83A9AB                 ;83C217|20ABA9  |83A9AB;
                       PHB                                  ;83C21A|8B      |      ;
                       PHK                                  ;83C21B|4B      |      ;
                       PLB                                  ;83C21C|AB      |      ;
                       LDY.W #$C227                         ;83C21D|A027C2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C220|22CAA080|80A0CA;
                       PLB                                  ;83C224|AB      |      ;
                       BRA +                                ;83C225|8008    |83C22F;
                       db $00,$9D,$7F,$00,$0A,$80,$00,$20   ;83C227|        |      ;
 
                     + JSR.W CODE_FN_838517                 ;83C22F|201785  |838517;
                       JSR.W CODE_FN_838523                 ;83C232|202385  |838523;
                       JSR.W CODE_FN_83852F                 ;83C235|202F85  |83852F;
                       RTS                                  ;83C238|60      |      ;
                       INC.W $1A6E                          ;83C239|EE6E1A  |831A6E;
                       JSR.W CODE_FN_8386A8                 ;83C23C|20A886  |8386A8;
                       JSR.W CODE_FN_8386D4                 ;83C23F|20D486  |8386D4;
                       PHB                                  ;83C242|8B      |      ;
                       PHK                                  ;83C243|4B      |      ;
                       PLB                                  ;83C244|AB      |      ;
                       LDY.W #$C24F                         ;83C245|A04FC2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C248|22CAA080|80A0CA;
                       PLB                                  ;83C24C|AB      |      ;
                       BRA +                                ;83C24D|8008    |83C257;
                       db $00,$A7,$7F,$00,$0A,$80,$00,$25   ;83C24F|        |      ;
 
                     + RTS                                  ;83C257|60      |      ;
                       INC.W $1A6E                          ;83C258|EE6E1A  |831A6E;
                       PHB                                  ;83C25B|8B      |      ;
                       PHK                                  ;83C25C|4B      |      ;
                       PLB                                  ;83C25D|AB      |      ;
                       LDY.W #$C268                         ;83C25E|A068C2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C261|22CAA080|80A0CA;
                       PLB                                  ;83C265|AB      |      ;
                       BRA +                                ;83C266|8008    |83C270;
                       db $00,$B1,$7F,$00,$0C,$80,$00,$2A   ;83C268|        |      ;
 
                     + RTS                                  ;83C270|60      |      ;
                       INC.W $1A6E                          ;83C271|EE6E1A  |831A6E;
                       PHB                                  ;83C274|8B      |      ;
                       PHK                                  ;83C275|4B      |      ;
                       PLB                                  ;83C276|AB      |      ;
                       LDY.W #$C281                         ;83C277|A081C2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C27A|22CAA080|80A0CA;
                       PLB                                  ;83C27E|AB      |      ;
                       BRA +                                ;83C27F|8008    |83C289;
                       db $00,$91,$7F,$00,$0C,$80,$00,$01   ;83C281|        |      ;
 
                     + RTS                                  ;83C289|60      |      ;
                       INC.W $1A6E                          ;83C28A|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A24F                 ;83C28D|204FA2  |83A24F;
                       JSR.W CODE_FN_83A789                 ;83C290|2089A7  |83A789;
                       LDA.L Main_Menu_Selection            ;83C293|AF28957E|7E9528;
                       ASL A                                ;83C297|0A      |      ;
                       TAX                                  ;83C298|AA      |      ;
                       JSR.W (DATA8_83C2CA,X)               ;83C299|FCCAC2  |83C2CA;
                       PHB                                  ;83C29C|8B      |      ;
                       PHK                                  ;83C29D|4B      |      ;
                       PLB                                  ;83C29E|AB      |      ;
                       LDY.W #$C2A9                         ;83C29F|A0A9C2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C2A2|22CAA080|80A0CA;
                       PLB                                  ;83C2A6|AB      |      ;
                       BRA +                                ;83C2A7|8008    |83C2B1;
                       db $80,$20,$7E,$C0,$05,$80,$40,$68   ;83C2A9|        |      ;
 
                     + PHB                                  ;83C2B1|8B      |      ;
                       PHK                                  ;83C2B2|4B      |      ;
                       PLB                                  ;83C2B3|AB      |      ;
                       LDY.W #$C2BE                         ;83C2B4|A0BEC2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C2B7|22CAA080|80A0CA;
                       PLB                                  ;83C2BB|AB      |      ;
                       BRA +                                ;83C2BC|8008    |83C2C6;
                       db $80,$30,$7E,$C0,$05,$80,$40,$78   ;83C2BE|        |      ;
 
                     + JSR.W CODE_FN_838ABD                 ;83C2C6|20BD8A  |838ABD;
                       RTS                                  ;83C2C9|60      |      ;
 
         DATA8_83C2CA:
                       db $D0,$C2,$DA,$C2,$E4,$C2           ;83C2CA|        |      ;
                       JSR.W CODE_FN_83A262                 ;83C2D0|2062A2  |83A262;
                       JSR.W CODE_FN_83A3DF                 ;83C2D3|20DFA3  |83A3DF;
                       JSR.W CODE_FN_83A60F                 ;83C2D6|200FA6  |83A60F;
                       RTS                                  ;83C2D9|60      |      ;
                       JSR.W CODE_FN_83A289                 ;83C2DA|2089A2  |83A289;
                       JSR.W CODE_FN_83A3FD                 ;83C2DD|20FDA3  |83A3FD;
                       JSR.W CODE_FN_83A61B                 ;83C2E0|201BA6  |83A61B;
                       RTS                                  ;83C2E3|60      |      ;
                       JSR.W CODE_FN_83A29F                 ;83C2E4|209FA2  |83A29F;
                       JSR.W CODE_FN_83A41B                 ;83C2E7|201BA4  |83A41B;
                       JSR.W CODE_FN_83A627                 ;83C2EA|2027A6  |83A627;
                       RTS                                  ;83C2ED|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83C2EE|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C2F1|AF8D997E|7E998D;
                       BNE +                                ;83C2F5|D01A    |83C311;
                       LDA.L Main_Menu_Selection            ;83C2F7|AF28957E|7E9528;
                       ASL A                                ;83C2FB|0A      |      ;
                       TAX                                  ;83C2FC|AA      |      ;
                       JSR.W (DATA8_83C312,X)               ;83C2FD|FC12C3  |83C312;
                       LDA.W #$0000                         ;83C300|A90000  |      ;
                       STA.W $1A6E                          ;83C303|8D6E1A  |831A6E;
                       STA.W $1A70                          ;83C306|8D701A  |831A70;
                       STA.L $7E9458                        ;83C309|8F58947E|7E9458;
                       STA.L $7E945A                        ;83C30D|8F5A947E|7E945A;
 
                     + RTS                                  ;83C311|60      |      ;
 
         DATA8_83C312:
                       db $18,$C3,$1F,$C3,$26,$C3           ;83C312|        |      ;
                       LDA.W #$0009                         ;83C318|A90900  |      ;
                       STA.W Game_State_State               ;83C31B|8DA202  |8302A2;
                       RTS                                  ;83C31E|60      |      ;
                       LDA.W #$000F                         ;83C31F|A90F00  |      ;
                       STA.W Game_State_State               ;83C322|8DA202  |8302A2;
                       RTS                                  ;83C325|60      |      ;
                       LDA.W #$0022                         ;83C326|A92200  |      ;
                       STA.W Game_State_State               ;83C329|8DA202  |8302A2;
                       RTS                                  ;83C32C|60      |      ;
                       LDA.W $1A6E                          ;83C32D|AD6E1A  |831A6E;
                       ASL A                                ;83C330|0A      |      ;
                       TAX                                  ;83C331|AA      |      ;
                       JSR.W (DATA8_83C336,X)               ;83C332|FC36C3  |83C336;
                       RTS                                  ;83C335|60      |      ;
 
         DATA8_83C336:
                       db $40,$C3,$4F,$C3,$EB,$C3,$6C,$C4   ;83C336|        |      ;
                       db $B1,$C4                           ;83C33E|        |      ;
 
       CODE_FN_83C340:
                       LDA.W #$0002                         ;83C340|A90200  |      ;
                       STA.W $1A70                          ;83C343|8D701A  |831A70;
                       JSR.W CODE_FN_839DD7                 ;83C346|20D79D  |839DD7;
                       BCS +                                ;83C349|B003    |83C34E;
                       INC.W $1A6E                          ;83C34B|EE6E1A  |831A6E;
 
                     + RTS                                  ;83C34E|60      |      ;
                       INC.W $1A6E                          ;83C34F|EE6E1A  |831A6E;
                       LDA.L Main_Menu_Selection            ;83C352|AF28957E|7E9528;
                       ASL A                                ;83C356|0A      |      ;
                       TAX                                  ;83C357|AA      |      ;
                       JSR.W (DATA8_83C35F,X)               ;83C358|FC5FC3  |83C35F;
                       JSR.W CODE_FN_8388FF                 ;83C35B|20FF88  |8388FF;
                       RTS                                  ;83C35E|60      |      ;
 
         DATA8_83C35F:
                       db $69,$C3,$82,$C3,$9B,$C3,$AE,$C3   ;83C35F|        |      ;
                       db $C8,$C3                           ;83C367|        |      ;
                       LDA.W #$0000                         ;83C369|A90000  |      ;
                       STA.W $02A8                          ;83C36C|8DA802  |8302A8;
                       LDY.W #$C377                         ;83C36F|A077C3  |      ;
                       JSR.W CODE_FN_8388AE                 ;83C372|20AE88  |8388AE;
                       BRA +                                ;83C375|800A    |83C381;
                       db $35,$00,$38,$00,$83,$00,$01,$00   ;83C377|        |      ;
                       db $06,$00                           ;83C37F|        |      ;
 
                     + RTS                                  ;83C381|60      |      ;
                       LDA.W #$0002                         ;83C382|A90200  |      ;
                       STA.W $02A8                          ;83C385|8DA802  |8302A8;
                       LDY.W #$C390                         ;83C388|A090C3  |      ;
                       JSR.W CODE_FN_8388AE                 ;83C38B|20AE88  |8388AE;
                       BRA +                                ;83C38E|800A    |83C39A;
                       db $35,$00,$48,$00,$83,$00,$02,$00   ;83C390|        |      ;
                       db $04,$00                           ;83C398|        |      ;
 
                     + RTS                                  ;83C39A|60      |      ;
                       LDY.W #$C3A3                         ;83C39B|A0A3C3  |      ;
                       JSR.W CODE_FN_8388AE                 ;83C39E|20AE88  |8388AE;
                       BRA +                                ;83C3A1|800A    |83C3AD;
                       db $35,$00,$58,$00,$83,$00,$04,$00   ;83C3A3|        |      ;
                       db $04,$00                           ;83C3AB|        |      ;
 
                     + RTS                                  ;83C3AD|60      |      ;
                       LDY.W #$C3B6                         ;83C3AE|A0B6C3  |      ;
                       JSR.W CODE_FN_8388AE                 ;83C3B1|20AE88  |8388AE;
                       BRA +                                ;83C3B4|800A    |83C3C0;
                       db $35,$00,$68,$00,$83,$00,$06,$00   ;83C3B6|        |      ;
                       db $02,$00                           ;83C3BE|        |      ;
 
                     + LDA.W #$0000                         ;83C3C0|A90000  |      ;
                       STA.L $7E96DB                        ;83C3C3|8FDB967E|7E96DB;
                       RTS                                  ;83C3C7|60      |      ;
                       LDY.W #$C3D0                         ;83C3C8|A0D0C3  |      ;
                       JSR.W CODE_FN_8388AE                 ;83C3CB|20AE88  |8388AE;
                       BRA +                                ;83C3CE|800A    |83C3DA;
                       db $35,$00,$78,$00,$83,$00,$06,$00   ;83C3D0|        |      ;
                       db $01,$00                           ;83C3D8|        |      ;
 
                     + LDA.W #$0002                         ;83C3DA|A90200  |      ;
                       JSR.W Move_MenuLipYoshi              ;83C3DD|200D9F  |839F0D;
                       LDA.W #$0000                         ;83C3E0|A90000  |      ;
                       STA.L $7E96DB                        ;83C3E3|8FDB967E|7E96DB;
                       JSR.W CODE_FN_83849D                 ;83C3E7|209D84  |83849D;
                       RTS                                  ;83C3EA|60      |      ;
                       JSR.W CODE_FN_8388FF                 ;83C3EB|20FF88  |8388FF;
                       LDA.L $7E998D                        ;83C3EE|AF8D997E|7E998D;
                       BNE +                                ;83C3F2|D015    |83C409;
                       LDX.W #$0180                         ;83C3F4|A28001  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C3F7|20EE9F  |839FEE;
                       INC.W $1A6E                          ;83C3FA|EE6E1A  |831A6E;
                       LDA.L Main_Menu_Selection            ;83C3FD|AF28957E|7E9528;
                       ASL A                                ;83C401|0A      |      ;
                       TAX                                  ;83C402|AA      |      ;
                       JSR.W (DATA8_83C40A,X)               ;83C403|FC0AC4  |83C40A;
                       JSR.W CODE_FN_83A058                 ;83C406|2058A0  |83A058;
 
                     + RTS                                  ;83C409|60      |      ;
 
         DATA8_83C40A:
                       db $14,$C4,$24,$C4,$36,$C4,$48,$C4   ;83C40A|        |      ;
                       db $5A,$C4                           ;83C412|        |      ;
                       INC.W $1A6E                          ;83C414|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A262                 ;83C417|2062A2  |83A262;
                       JSR.W CODE_FN_83A3DF                 ;83C41A|20DFA3  |83A3DF;
                       JSR.W CODE_FN_83A60F                 ;83C41D|200FA6  |83A60F;
                       JSR.W CODE_FN_838ABD                 ;83C420|20BD8A  |838ABD;
                       RTS                                  ;83C423|60      |      ;
                       JSR.W CODE_FN_83A289                 ;83C424|2089A2  |83A289;
                       LDY.W #$C42F                         ;83C427|A02FC4  |      ;
                       JSR.W CODE_FN_838C7D                 ;83C42A|207D8C  |838C7D;
                       BRA +                                ;83C42D|8003    |83C432;
                       db $30,$40,$07                       ;83C42F|        |      ;
 
                     + JSR.W CODE_FN_838CB5                 ;83C432|20B58C  |838CB5;
                       RTS                                  ;83C435|60      |      ;
                       JSR.W CODE_FN_83A29F                 ;83C436|209FA2  |83A29F;
                       LDY.W #$C441                         ;83C439|A041C4  |      ;
                       JSR.W CODE_FN_838C7D                 ;83C43C|207D8C  |838C7D;
                       BRA +                                ;83C43F|8003    |83C444;
                       db $30,$50,$07                       ;83C441|        |      ;
 
                     + JSR.W CODE_FN_838CB5                 ;83C444|20B58C  |838CB5;
                       RTS                                  ;83C447|60      |      ;
                       JSR.W CODE_FN_83A2B5                 ;83C448|20B5A2  |83A2B5;
                       LDY.W #$C453                         ;83C44B|A053C4  |      ;
                       JSR.W CODE_FN_838C7D                 ;83C44E|207D8C  |838C7D;
                       BRA +                                ;83C451|8003    |83C456;
                       db $30,$60,$07                       ;83C453|        |      ;
 
                     + JSR.W CODE_FN_838CB5                 ;83C456|20B58C  |838CB5;
                       RTS                                  ;83C459|60      |      ;
                       JSR.W CODE_FN_83A2CB                 ;83C45A|20CBA2  |83A2CB;
                       LDY.W #$C465                         ;83C45D|A065C4  |      ;
                       JSR.W CODE_FN_838C7D                 ;83C460|207D8C  |838C7D;
                       BRA +                                ;83C463|8003    |83C468;
                       db $30,$70,$07                       ;83C465|        |      ;
 
                     + JSR.W CODE_FN_838CB5                 ;83C468|20B58C  |838CB5;
                       RTS                                  ;83C46B|60      |      ;
                       JSR.W CODE_FN_838CB5                 ;83C46C|20B58C  |838CB5;
                       LDA.L $7E998D                        ;83C46F|AF8D997E|7E998D;
                       BNE +                                ;83C473|D012    |83C487;
                       INC.W $1A6E                          ;83C475|EE6E1A  |831A6E;
                       LDA.L Main_Menu_Selection            ;83C478|AF28957E|7E9528;
                       ASL A                                ;83C47C|0A      |      ;
                       TAX                                  ;83C47D|AA      |      ;
                       JSR.W (UNREACH_83C488,X)             ;83C47E|FC88C4  |83C488;
                       JSR.W CODE_FN_83A058                 ;83C481|2058A0  |83A058;
                       JSR.W CODE_FN_838ABD                 ;83C484|20BD8A  |838ABD;
 
                     + RTS                                  ;83C487|60      |      ;
 
       UNREACH_83C488:
                       db $92,$C4                           ;83C488|        |0000C4;
                       db $92,$C4,$99,$C4,$A0,$C4,$A7,$C4   ;83C48A|        |      ;
                       JSR.W CODE_FN_83A3FD                 ;83C492|20FDA3  |83A3FD;
                       JSR.W CODE_FN_83A61B                 ;83C495|201BA6  |83A61B;
                       RTS                                  ;83C498|60      |      ;
                       JSR.W CODE_FN_83A41B                 ;83C499|201BA4  |83A41B;
                       JSR.W CODE_FN_83A627                 ;83C49C|2027A6  |83A627;
                       RTS                                  ;83C49F|60      |      ;
                       JSR.W CODE_FN_83A439                 ;83C4A0|2039A4  |83A439;
                       JSR.W CODE_FN_83A627                 ;83C4A3|2027A6  |83A627;
                       RTS                                  ;83C4A6|60      |      ;
                       JSR.W CODE_FN_83A457                 ;83C4A7|2057A4  |83A457;
                       JSR.W Options_DoOptionMenu           ;83C4AA|200FBC  |83BC0F;
                       JSR.W CODE_FN_83A633                 ;83C4AD|2033A6  |83A633;
                       RTS                                  ;83C4B0|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83C4B1|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C4B4|AF8D997E|7E998D;
                       BNE +                                ;83C4B8|D020    |83C4DA;
                       INC.W Game_State_State               ;83C4BA|EEA202  |8302A2;
                       STZ.W $1A6E                          ;83C4BD|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83C4C0|9C701A  |831A70;
                       LDA.W #$0000                         ;83C4C3|A90000  |      ;
                       STA.L Game1P_Selection               ;83C4C6|8F2A957E|7E952A;
                       STA.L Game2P_Selection               ;83C4CA|8F2C957E|7E952C;
                       STA.L HowtoPlay_Selection            ;83C4CE|8F32957E|7E9532;
                       STA.L Options_Selection              ;83C4D2|8F34957E|7E9534;
                       STA.L HowtoImprove_Selection         ;83C4D6|8F3A957E|7E953A;
 
                     + RTS                                  ;83C4DA|60      |      ;
                       LDA.L Game1P_Selection               ;83C4DB|AF2A957E|7E952A;
                       CLC                                  ;83C4DF|18      |      ;
                       ADC.W #$0006                         ;83C4E0|690600  |      ;
                       JSR.W CODE_FN_839DD7                 ;83C4E3|20D79D  |839DD7;
                       LDA.W #$0001                         ;83C4E6|A90100  |      ;
                       STA.L $7E96DB                        ;83C4E9|8FDB967E|7E96DB;
                       LDY.W #$C4F9                         ;83C4ED|A0F9C4  |      ;
                       LDA.L Game1P_Selection               ;83C4F0|AF2A957E|7E952A;
                       JSR.W CODE_FN_8387F8                 ;83C4F4|20F887  |8387F8;
                       BRA +                                ;83C4F7|8003    |83C4FC;
                       db $04,$19,$C5                       ;83C4F9|        |      ;
 
                     + LDA.B $00                            ;83C4FC|A500    |000000;
                       STA.L Game1P_Selection               ;83C4FE|8F2A957E|7E952A;
                       LDX.W #$0038                         ;83C502|A23800  |      ;
                       LDY.W #$0053                         ;83C505|A05300  |      ;
                       LDA.L Game1P_Selection               ;83C508|AF2A957E|7E952A;
                       JSR.W CODE_FN_8397A1                 ;83C50C|20A197  |8397A1;
                       LDA.L $7E96FD                        ;83C50F|AFFD967E|7E96FD;
                       BEQ +                                ;83C513|F003    |83C518;
                       STZ.W $1A70                          ;83C515|9C701A  |831A70;
 
                     + RTS                                  ;83C518|60      |      ;
                       db $0B,$0B,$13,$18,$36,$0A           ;83C519|        |      ;
                       LDA.W $1A6E                          ;83C51F|AD6E1A  |831A6E;
                       ASL A                                ;83C522|0A      |      ;
                       TAX                                  ;83C523|AA      |      ;
                       JSR.W (DATA8_83C528,X)               ;83C524|FC28C5  |83C528;
                       RTS                                  ;83C527|60      |      ;
 
         DATA8_83C528:
                       db $32,$C5,$4A,$C5,$71,$C5,$9A,$C5   ;83C528|        |      ;
                       db $AD,$C5                           ;83C530|        |      ;
 
       CODE_FN_83C532:
                       LDA.L Main_Menu_Selection            ;83C532|AF28957E|7E9528;
                       CMP.W #$0003                         ;83C536|C90300  |      ;
                       BPL +                                ;83C539|100B    |83C546;
                       LDA.W #$0002                         ;83C53B|A90200  |      ;
                       STA.W $1A70                          ;83C53E|8D701A  |831A70;
                       JSR.W CODE_FN_839DD7                 ;83C541|20D79D  |839DD7;
                       BCS ++                               ;83C544|B003    |83C549;
 
                     + INC.W $1A6E                          ;83C546|EE6E1A  |831A6E;
 
                    ++ RTS                                  ;83C549|60      |      ;
                       INC.W $1A6E                          ;83C54A|EE6E1A  |831A6E;
                       LDA.L Main_Menu_Selection            ;83C54D|AF28957E|7E9528;
                       ASL A                                ;83C551|0A      |      ;
                       TAX                                  ;83C552|AA      |      ;
                       JSR.W (DATA8_83C55A,X)               ;83C553|FC5AC5  |83C55A;
                       JSR.W CODE_FN_838BF1                 ;83C556|20F18B  |838BF1;
                       RTS                                  ;83C559|60      |      ;
 
         DATA8_83C55A:
                       db $F3,$A6,$FF,$A6,$0B,$A7,$0B,$A7   ;83C55A|        |      ;
                       db $64,$C5                           ;83C562|        |      ;
                       JSR.W CODE_FN_83A717                 ;83C564|2017A7  |83A717;
                       LDA.W #$0000                         ;83C567|A90000  |      ;
                       JSR.W Move_MenuLipYoshi              ;83C56A|200D9F  |839F0D;
                       JSR.W CODE_FN_838490                 ;83C56D|209084  |838490;
                       RTS                                  ;83C570|60      |      ;
                       JSR.W CODE_FN_838BF1                 ;83C571|20F18B  |838BF1;
                       LDA.L $7E998D                        ;83C574|AF8D997E|7E998D;
                       BNE +                                ;83C578|D015    |83C58F;
                       INC.W $1A6E                          ;83C57A|EE6E1A  |831A6E;
                       LDX.W #$0240                         ;83C57D|A24002  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C580|20EE9F  |839FEE;
                       LDA.L Main_Menu_Selection            ;83C583|AF28957E|7E9528;
                       ASL A                                ;83C587|0A      |      ;
                       TAX                                  ;83C588|AA      |      ;
                       JSR.W (DATA8_83C590,X)               ;83C589|FC90C5  |83C590;
                       JSR.W CODE_FN_83A058                 ;83C58C|2058A0  |83A058;
 
                     + RTS                                  ;83C58F|60      |      ;
 
         DATA8_83C590:
                       db $62,$A2,$89,$A2,$9F,$A2,$B5,$A2   ;83C590|        |      ;
                       db $CB,$A2                           ;83C598|        |      ;
                       INC.W $1A6E                          ;83C59A|EE6E1A  |831A6E;
                       STZ.W $1A70                          ;83C59D|9C701A  |831A70;
                       JSR.W CODE_FN_83A3C1                 ;83C5A0|20C1A3  |83A3C1;
                       JSR.W CODE_FN_83A0E3                 ;83C5A3|20E3A0  |83A0E3;
                       JSR.W CODE_FN_83A6A5                 ;83C5A6|20A5A6  |83A6A5;
                       JSR.W CODE_FN_838ABD                 ;83C5A9|20BD8A  |838ABD;
                       RTS                                  ;83C5AC|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83C5AD|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C5B0|AF8D997E|7E998D;
                       BNE +                                ;83C5B4|D009    |83C5BF;
                       LDA.W #$0003                         ;83C5B6|A90300  |      ;
                       STA.W Game_State_State               ;83C5B9|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83C5BC|9C6E1A  |831A6E;
 
                     + RTS                                  ;83C5BF|60      |      ;
                       LDA.W $1A6E                          ;83C5C0|AD6E1A  |831A6E;
                       ASL A                                ;83C5C3|0A      |      ;
                       TAX                                  ;83C5C4|AA      |      ;
                       JSR.W (DATA8_83C5C9,X)               ;83C5C5|FCC9C5  |83C5C9;
                       RTS                                  ;83C5C8|60      |      ;
 
         DATA8_83C5C9:
                       db $D3,$C5,$4A,$C5,$71,$C5,$ED,$C5   ;83C5C9|        |      ;
                       db $FA,$C5                           ;83C5D1|        |      ;
                       JSR.W CODE_FN_83C532                 ;83C5D3|2032C5  |83C532;
                       LDA.W #$0000                         ;83C5D6|A90000  |      ;
                       STA.L $7E96DB                        ;83C5D9|8FDB967E|7E96DB;
                       LDA.L Main_Menu_Selection            ;83C5DD|AF28957E|7E9528;
                       CMP.W #$0002                         ;83C5E1|C90200  |      ;
                       BPL +                                ;83C5E4|1006    |83C5EC;
                       LDA.W #$0002                         ;83C5E6|A90200  |      ;
                       JSR.W Move_MenuLipYoshi              ;83C5E9|200D9F  |839F0D;
 
                     + RTS                                  ;83C5EC|60      |      ;
                       INC.W $1A6E                          ;83C5ED|EE6E1A  |831A6E;
                       LDX.W #$0180                         ;83C5F0|A28001  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C5F3|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A058                 ;83C5F6|2058A0  |83A058;
                       RTS                                  ;83C5F9|60      |      ;
                       INC.W $1A6E                          ;83C5FA|EE6E1A  |831A6E;
                       JSR.W CODE_FN_839FB6                 ;83C5FD|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83C600|2058A0  |83A058;
                       LDA.L Main_Menu_Selection            ;83C603|AF28957E|7E9528;
                       ASL A                                ;83C607|0A      |      ;
                       TAX                                  ;83C608|AA      |      ;
                       JSR.W (DATA8_83C610,X)               ;83C609|FC10C6  |83C610;
                       STZ.W $1A6E                          ;83C60C|9C6E1A  |831A6E;
                       RTS                                  ;83C60F|60      |      ;
 
         DATA8_83C610:
                       db $16,$C6,$28,$C6,$3D,$C6           ;83C610|        |      ;
                       INC.W Game_State                     ;83C616|EEA002  |8302A0;
                       LDA.W #$0002                         ;83C619|A90200  |      ;
                       STA.W Game_State_State               ;83C61C|8DA202  |8302A2;
                       LDA.L Game1P_Selection               ;83C61F|AF2A957E|7E952A;
                       STA.L $7E38FE                        ;83C623|8FFE387E|7E38FE;
                       RTS                                  ;83C627|60      |      ;
                       INC.W Game_State                     ;83C628|EEA002  |8302A0;
                       LDA.W #$0002                         ;83C62B|A90200  |      ;
                       STA.W Game_State_State               ;83C62E|8DA202  |8302A2;
                       LDA.L Game2P_Selection               ;83C631|AF2C957E|7E952C;
                       EOR.W #$0001                         ;83C635|490100  |      ;
                       STA.L $7E38FE                        ;83C638|8FFE387E|7E38FE;
                       RTS                                  ;83C63C|60      |      ;
                       LDA.W #$0025                         ;83C63D|A92500  |      ;
                       STA.W Game_State_State               ;83C640|8DA202  |8302A2;
                       RTS                                  ;83C643|60      |      ;
                       JSR.W CODE_FN_83849D                 ;83C644|209D84  |83849D;
                       LDY.W #$0001                         ;83C647|A00100  |      ;
                       JSL.L CODE_FL_80AF18                 ;83C64A|2218AF80|80AF18;
                       BCC +                                ;83C64E|900F    |83C65F;
                       REP #$20                             ;83C650|C220    |      ;
                       LDA.L Main_Menu_Selection            ;83C652|AF28957E|7E9528;
                       ASL A                                ;83C656|0A      |      ;
                       TAX                                  ;83C657|AA      |      ;
                       JSR.W (DATA8_83C662,X)               ;83C658|FC62C6  |83C662;
                       JSL.L CODE_FL_80A145                 ;83C65B|2245A180|80A145;
 
                     + REP #$20                             ;83C65F|C220    |      ;
                       RTS                                  ;83C661|60      |      ;
 
         DATA8_83C662:
                       db $6C,$C6                           ;83C662|        |      ;
                       db $76,$C6                           ;83C664|        |0000C6;
                       db $76,$C6,$AA,$C6                   ;83C666|        |      ;
                       db $DB,$C6                           ;83C66A|        |      ;
                       LDA.W #$0006                         ;83C66C|A90600  |      ;
                       STA.W Game_State                     ;83C66F|8DA002  |8302A0;
                       STZ.W Game_State_State               ;83C672|9CA202  |8302A2;
                       RTS                                  ;83C675|60      |      ;
                       PHP                                  ;83C676|08      |      ;
                       REP #$30                             ;83C677|C230    |      ;
                       LDA.L HowtoPlay_Selection            ;83C679|AF32957E|7E9532;
                       ASL A                                ;83C67D|0A      |      ;
                       CLC                                  ;83C67E|18      |      ;
                       ADC.L HowtoPlay_Selection            ;83C67F|6F32957E|7E9532;
                       TAX                                  ;83C683|AA      |      ;
                       LDA.W LOOSE_OP_83C69B,X              ;83C684|BD9BC6  |83C69B;
                       STA.B $00                            ;83C687|8500    |000000;
                       LDA.W CODE_83C69C,X                  ;83C689|BD9CC6  |83C69C;
                       STA.B $01                            ;83C68C|8501    |000001;
                       SEP #$20                             ;83C68E|E220    |      ;
                       LDA.B #$83                           ;83C690|A983    |      ;
                       PHA                                  ;83C692|48      |      ;
                       REP #$20                             ;83C693|C220    |      ;
                       LDA.W #$C69B                         ;83C695|A99BC6  |      ;
                       PHA                                  ;83C698|48      |      ;
                       JML.W [$0000]                        ;83C699|DC0000  |000000;
 
          CODE_83C69C:
                       PLP                                  ;83C69C|28      |      ;
                       RTS                                  ;83C69D|60      |      ;
                       db $BB,$AE,$8A,$C1,$AE,$8A,$C7,$AE   ;83C69E|        |      ;
                       db $8A,$CD,$AE,$8A                   ;83C6A6|        |      ;
                       PHP                                  ;83C6AA|08      |      ;
                       REP #$30                             ;83C6AB|C230    |      ;
                       LDA.L HowtoImprove_Selection         ;83C6AD|AF3A957E|7E953A;
                       ASL A                                ;83C6B1|0A      |      ;
                       CLC                                  ;83C6B2|18      |      ;
                       ADC.L HowtoImprove_Selection         ;83C6B3|6F3A957E|7E953A;
                       TAX                                  ;83C6B7|AA      |      ;
                       LDA.W DATA8_83C6D2,X                 ;83C6B8|BDD2C6  |83C6D2;
                       STA.B $00                            ;83C6BB|8500    |000000;
                       LDA.W DATA8_83C6D3,X                 ;83C6BD|BDD3C6  |83C6D3;
                       STA.B $01                            ;83C6C0|8501    |000001;
                       SEP #$20                             ;83C6C2|E220    |      ;
                       LDA.B #$83                           ;83C6C4|A983    |      ;
                       PHA                                  ;83C6C6|48      |      ;
                       REP #$20                             ;83C6C7|C220    |      ;
                       LDA.W #$C6CF                         ;83C6C9|A9CFC6  |      ;
                       PHA                                  ;83C6CC|48      |      ;
                       JML.W [$0000]                        ;83C6CD|DC0000  |000000;
                       PLP                                  ;83C6D0|28      |      ;
                       RTS                                  ;83C6D1|60      |      ;
 
         DATA8_83C6D2:
                       db $E1                               ;83C6D2|        |      ;
 
         DATA8_83C6D3:
                       db $D7,$86,$F6,$D7,$86,$0B,$D8,$86   ;83C6D3|        |      ;
                       JSL.L CODE_FL_86D87F                 ;83C6DB|227FD886|86D87F;
                       RTS                                  ;83C6DF|60      |      ;
                       LDA.W #$0000                         ;83C6E0|A90000  |      ;
                       STA.L $7EF1E0                        ;83C6E3|8FE0F17E|7EF1E0;
                       LDA.L Game2P_Selection               ;83C6E7|AF2C957E|7E952C;
                       CLC                                  ;83C6EB|18      |      ;
                       ADC.W #$000B                         ;83C6EC|690B00  |      ;
                       JSR.W CODE_FN_839DD7                 ;83C6EF|20D79D  |839DD7;
                       LDA.W #$0001                         ;83C6F2|A90100  |      ;
                       STA.L $7E96DB                        ;83C6F5|8FDB967E|7E96DB;
                       LDY.W #$C705                         ;83C6F9|A005C7  |      ;
                       LDA.L Game2P_Selection               ;83C6FC|AF2C957E|7E952C;
                       JSR.W CODE_FN_8387F8                 ;83C700|20F887  |8387F8;
                       BRA +                                ;83C703|8003    |83C708;
                       db $01,$25,$C7                       ;83C705|        |      ;
 
                     + LDA.B $00                            ;83C708|A500    |000000;
                       STA.L Game2P_Selection               ;83C70A|8F2C957E|7E952C;
                       LDX.W #$0038                         ;83C70E|A23800  |      ;
                       LDY.W #$0053                         ;83C711|A05300  |      ;
                       LDA.L Game2P_Selection               ;83C714|AF2C957E|7E952C;
                       JSR.W CODE_FN_8397A1                 ;83C718|20A197  |8397A1;
                       LDA.L $7E96FD                        ;83C71B|AFFD967E|7E96FD;
                       BEQ +                                ;83C71F|F003    |83C724;
                       STZ.W $1A70                          ;83C721|9C701A  |831A70;
 
                     + RTS                                  ;83C724|60      |      ;
                       db $11,$11,$10,$20                   ;83C725|        |      ;
                       db $9D,$84,$A0,$01,$00,$22,$18,$AF   ;83C729|        |00A084;
                       db $80,$90,$0B,$C2,$20,$A9,$06,$00   ;83C731|        |83C6C3;
                       db $8D,$A0,$02,$9C,$A2,$02,$C2,$20   ;83C739|        |0002A0;
                       db $60                               ;83C741|        |      ;
                       LDA.W $1A6E                          ;83C742|AD6E1A  |831A6E;
                       ASL A                                ;83C745|0A      |      ;
                       TAX                                  ;83C746|AA      |      ;
                       JSR.W (DATA8_83C74B,X)               ;83C747|FC4BC7  |83C74B;
                       RTS                                  ;83C74A|60      |      ;
 
         DATA8_83C74B:
                       db $11,$C2,$39,$C2,$58,$C2,$71,$C2   ;83C74B|        |      ;
                       db $57,$C7,$A4,$C7                   ;83C753|        |      ;
                       INC.W $1A6E                          ;83C757|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A24F                 ;83C75A|204FA2  |83A24F;
                       JSR.W CODE_FN_83A262                 ;83C75D|2062A2  |83A262;
                       JSR.W CODE_FN_83A789                 ;83C760|2089A7  |83A789;
                       LDA.L Game1P_Selection               ;83C763|AF2A957E|7E952A;
                       ASL A                                ;83C767|0A      |      ;
                       TAX                                  ;83C768|AA      |      ;
                       JSR.W (DATA8_83C79C,X)               ;83C769|FC9CC7  |83C79C;
                       JSR.W CODE_FN_83A475                 ;83C76C|2075A4  |83A475;
                       JSR.W CODE_FN_83A63F                 ;83C76F|203FA6  |83A63F;
                       JSR.W CODE_FN_838ABD                 ;83C772|20BD8A  |838ABD;
                       PHB                                  ;83C775|8B      |      ;
                       PHK                                  ;83C776|4B      |      ;
                       PLB                                  ;83C777|AB      |      ;
                       LDY.W #$C782                         ;83C778|A082C7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C77B|22CAA080|80A0CA;
                       PLB                                  ;83C77F|AB      |      ;
                       BRA +                                ;83C780|8008    |83C78A;
                       db $80,$20,$7E,$00,$05,$80,$40,$68   ;83C782|        |      ;
 
                     + PHB                                  ;83C78A|8B      |      ;
                       PHK                                  ;83C78B|4B      |      ;
                       PLB                                  ;83C78C|AB      |      ;
                       LDY.W #$C797                         ;83C78D|A097C7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83C790|22CAA080|80A0CA;
                       PLB                                  ;83C794|AB      |      ;
                       BRA +                                ;83C795|8008    |83C79F;
                       db $80,$30,$7E,$00,$05               ;83C797|        |      ;
 
         DATA8_83C79C:
                       db $80,$40,$78                       ;83C79C|        |      ;
 
                     + RTS                                  ;83C79F|60      |      ;
                       db $E1,$A2                           ;83C7A0|        |      ;
                       db $18,$A3                           ;83C7A2|        |      ;
                       JSR.W CODE_FN_838ABD                 ;83C7A4|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C7A7|AF8D997E|7E998D;
                       BNE +                                ;83C7AB|D017    |83C7C4;
                       LDA.L Game1P_Selection               ;83C7AD|AF2A957E|7E952A;
                       CMP.W #$0002                         ;83C7B1|C90200  |      ;
                       BNE ++                               ;83C7B4|D005    |83C7BB;
                       LDA.W #$0014                         ;83C7B6|A91400  |      ;
                       BRA +++                              ;83C7B9|8003    |83C7BE;
 
                    ++ LDA.W #$0019                         ;83C7BB|A91900  |      ;
 
                   +++ STA.W Game_State_State               ;83C7BE|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83C7C1|9C6E1A  |831A6E;
 
                     + RTS                                  ;83C7C4|60      |      ;
                       LDA.W $1A6E                          ;83C7C5|AD6E1A  |831A6E;
                       ASL A                                ;83C7C8|0A      |      ;
                       TAX                                  ;83C7C9|AA      |      ;
                       JSR.W (DATA8_83C7CE,X)               ;83C7CA|FCCEC7  |83C7CE;
                       RTS                                  ;83C7CD|60      |      ;
 
         DATA8_83C7CE:
                       db $DA,$C7,$0B,$C8,$21,$C8,$61,$C8   ;83C7CE|        |      ;
                       db $71,$C8,$81,$C8                   ;83C7D6|        |      ;
                       JSR.W CODE_FN_83C340                 ;83C7DA|2040C3  |83C340;
                       LDA.W #$0000                         ;83C7DD|A90000  |      ;
                       STA.L $7E96DB                        ;83C7E0|8FDB967E|7E96DB;
                       LDA.L Game1P_Selection               ;83C7E4|AF2A957E|7E952A;
                       STA.L $7E38FE                        ;83C7E8|8FFE387E|7E38FE;
                       CMP.W #$0002                         ;83C7EC|C90200  |      ;
                       BNE +                                ;83C7EF|D006    |83C7F7;
                       LDA.L $7E94E6                        ;83C7F1|AFE6947E|7E94E6;
                       BRA ++                               ;83C7F5|800F    |83C806;
 
                     + CMP.W #$0003                         ;83C7F7|C90300  |      ;
                       BNE +                                ;83C7FA|D006    |83C802;
                       LDA.L $7E94D6                        ;83C7FC|AFD6947E|7E94D6;
                       BRA ++                               ;83C800|8004    |83C806;
 
                     + LDA.L $7E9526                        ;83C802|AF26957E|7E9526;
 
                    ++ STA.L $7E961E                        ;83C806|8F1E967E|7E961E;
                       RTS                                  ;83C80A|60      |      ;
                       INC.W $1A6E                          ;83C80B|EE6E1A  |831A6E;
                       LDA.L Game1P_Selection               ;83C80E|AF2A957E|7E952A;
                       ASL A                                ;83C812|0A      |      ;
                       TAX                                  ;83C813|AA      |      ;
                       JSR.W (CODE_83C817,X)                ;83C814|FC17C8  |83C817;
 
          CODE_83C817:
                       JSR.W CODE_FN_8388FF                 ;83C817|20FF88  |8388FF;
                       RTS                                  ;83C81A|60      |      ;
                       db $5C,$A5,$6F,$A5,$82,$A5           ;83C81B|        |      ;
                       JSR.W CODE_FN_8388FF                 ;83C821|20FF88  |8388FF;
                       LDA.L $7E998D                        ;83C824|AF8D997E|7E998D;
                       BNE +                                ;83C828|D01B    |83C845;
                       INC.W $1A6E                          ;83C82A|EE6E1A  |831A6E;
                       LDX.W #$0240                         ;83C82D|A24002  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C830|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A262                 ;83C833|2062A2  |83A262;
                       LDA.L Game1P_Selection               ;83C836|AF2A957E|7E952A;
                       ASL A                                ;83C83A|0A      |      ;
                       TAX                                  ;83C83B|AA      |      ;
                       JSR.W (CODE_83C842,X)                ;83C83C|FC42C8  |83C842;
                       JSR.W CODE_FN_83A058                 ;83C83F|2058A0  |83A058;
 
          CODE_83C842:
                       JSR.W CODE_FN_838CB5                 ;83C842|20B58C  |838CB5;
 
                     + RTS                                  ;83C845|60      |      ;
                       db $4C,$C8,$53,$C8,$5A,$C8           ;83C846|        |      ;
                       JSR.W CODE_FN_83A2E1                 ;83C84C|20E1A2  |83A2E1;
                       JSR.W CODE_FN_83A5C1                 ;83C84F|20C1A5  |83A5C1;
                       RTS                                  ;83C852|60      |      ;
                       JSR.W CODE_FN_83A318                 ;83C853|2018A3  |83A318;
                       JSR.W CODE_FN_83A5CD                 ;83C856|20CDA5  |83A5CD;
                       RTS                                  ;83C859|60      |      ;
                       JSR.W CODE_FN_83A32E                 ;83C85A|202EA3  |83A32E;
                       JSR.W CODE_FN_83A5D9                 ;83C85D|20D9A5  |83A5D9;
                       RTS                                  ;83C860|60      |      ;
                       JSR.W CODE_FN_838CB5                 ;83C861|20B58C  |838CB5;
                       LDA.L $7E998D                        ;83C864|AF8D997E|7E998D;
                       BEQ +                                ;83C868|F003    |83C86D;
                       JMP.W CODE_JP_83C870                 ;83C86A|4C70C8  |83C870;
 
                     + INC.W $1A6E                          ;83C86D|EE6E1A  |831A6E;
 
       CODE_JP_83C870:
                       RTS                                  ;83C870|60      |      ;
                       INC.W $1A6E                          ;83C871|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A058                 ;83C874|2058A0  |83A058;
                       JSR.W CODE_FN_83A475                 ;83C877|2075A4  |83A475;
                       JSR.W CODE_FN_83A63F                 ;83C87A|203FA6  |83A63F;
                       JSR.W CODE_FN_838ABD                 ;83C87D|20BD8A  |838ABD;
                       RTS                                  ;83C880|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83C881|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C884|AF8D997E|7E998D;
                       BNE +                                ;83C888|D015    |83C89F;
                       INC.W Game_State_State               ;83C88A|EEA202  |8302A2;
                       STZ.W $1A6E                          ;83C88D|9C6E1A  |831A6E;
                       LDA.W #$0000                         ;83C890|A90000  |      ;
                       STA.L StageClear_MenuSelection       ;83C893|8F2E957E|7E952E;
                       STA.L Puzzle_MenuSelection           ;83C897|8F30957E|7E9530;
                       STA.L VS_MenuSelection               ;83C89B|8F3C957E|7E953C;
 
                     + RTS                                  ;83C89F|60      |      ;
                       LDA.L $7E961E                        ;83C8A0|AF1E967E|7E961E;
                       BEQ +                                ;83C8A4|F017    |83C8BD;
                       LDY.W #$C8B2                         ;83C8A6|A0B2C8  |      ;
                       LDA.L StageClear_MenuSelection       ;83C8A9|AF2E957E|7E952E;
                       JSR.W CODE_FN_8387F8                 ;83C8AD|20F887  |8387F8;
                       BRA ++                               ;83C8B0|8003    |83C8B5;
                       db $02,$E0,$C8                       ;83C8B2|        |      ;
 
                    ++ LDA.B $00                            ;83C8B5|A500    |000000;
                       STA.L StageClear_MenuSelection       ;83C8B7|8F2E957E|7E952E;
                       BRA ++                               ;83C8BB|8015    |83C8D2;
 
                     + LDY.W #$C8C9                         ;83C8BD|A0C9C8  |      ;
                       LDA.L StageClear_MenuSelection       ;83C8C0|AF2E957E|7E952E;
                       JSR.W CODE_FN_8387F8                 ;83C8C4|20F887  |8387F8;
                       BRA +                                ;83C8C7|8003    |83C8CC;
                       db $01,$E1,$C8                       ;83C8C9|        |      ;
 
                     + LDA.B $00                            ;83C8CC|A500    |000000;
                       STA.L StageClear_MenuSelection       ;83C8CE|8F2E957E|7E952E;
 
                    ++ LDX.W #$0048                         ;83C8D2|A24800  |      ;
                       LDY.W #$006B                         ;83C8D5|A06B00  |      ;
                       LDA.L StageClear_MenuSelection       ;83C8D8|AF2E957E|7E952E;
                       JSR.W CODE_FN_8397A1                 ;83C8DC|20A197  |8397A1;
                       RTS                                  ;83C8DF|60      |      ;
                       db $16,$16,$1C,$15                   ;83C8E0|        |      ;
                       LDA.W $1A6E                          ;83C8E4|AD6E1A  |831A6E;
                       ASL A                                ;83C8E7|0A      |      ;
                       TAX                                  ;83C8E8|AA      |      ;
                       JSR.W (DATA8_83C8ED,X)               ;83C8E9|FCEDC8  |83C8ED;
                       RTS                                  ;83C8EC|60      |      ;
 
         DATA8_83C8ED:
                       db $F3,$C8,$FD,$C8,$1F,$C9           ;83C8ED|        |      ;
 
       CODE_FN_83C8F3:
                       INC.W $1A6E                          ;83C8F3|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A723                 ;83C8F6|2023A7  |83A723;
                       JSR.W CODE_FN_838BF1                 ;83C8F9|20F18B  |838BF1;
                       RTS                                  ;83C8FC|60      |      ;
                       JSR.W CODE_FN_838BF1                 ;83C8FD|20F18B  |838BF1;
                       LDA.L $7E998D                        ;83C900|AF8D997E|7E998D;
                       BEQ +                                ;83C904|F003    |83C909;
                       JMP.W CODE_JP_83C91E                 ;83C906|4C1EC9  |83C91E;
 
                     + INC.W $1A6E                          ;83C909|EE6E1A  |831A6E;
                       LDX.W #$0300                         ;83C90C|A20003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C90F|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A3DF                 ;83C912|20DFA3  |83A3DF;
                       JSR.W CODE_FN_83A058                 ;83C915|2058A0  |83A058;
                       JSR.W CODE_FN_83A6B1                 ;83C918|20B1A6  |83A6B1;
                       JSR.W CODE_FN_838ABD                 ;83C91B|20BD8A  |838ABD;
 
       CODE_JP_83C91E:
                       RTS                                  ;83C91E|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83C91F|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83C922|AF8D997E|7E998D;
                       BNE +                                ;83C926|D00C    |83C934;
                       LDA.W #$0009                         ;83C928|A90900  |      ;
                       STA.W Game_State_State               ;83C92B|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83C92E|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83C931|9C701A  |831A70;
 
                     + RTS                                  ;83C934|60      |      ;
                       LDA.W $1A6E                          ;83C935|AD6E1A  |831A6E;
                       ASL A                                ;83C938|0A      |      ;
                       TAX                                  ;83C939|AA      |      ;
                       JSR.W (DATA8_83C93E,X)               ;83C93A|FC3EC9  |83C93E;
                       RTS                                  ;83C93D|60      |      ;
 
         DATA8_83C93E:
                       db $46,$C9,$50,$C9,$69,$C9,$76,$C9   ;83C93E|        |      ;
                       JSR.W CODE_FN_83C8F3                 ;83C946|20F3C8  |83C8F3;
                       LDA.W #$0002                         ;83C949|A90200  |      ;
                       JSR.W Move_MenuLipYoshi              ;83C94C|200D9F  |839F0D;
                       RTS                                  ;83C94F|60      |      ;
                       JSR.W CODE_FN_838BF1                 ;83C950|20F18B  |838BF1;
                       LDA.L $7E998D                        ;83C953|AF8D997E|7E998D;
                       BNE +                                ;83C957|D00F    |83C968;
                       INC.W $1A6E                          ;83C959|EE6E1A  |831A6E;
                       LDX.W #$0240                         ;83C95C|A24002  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C95F|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A262                 ;83C962|2062A2  |83A262;
                       JSR.W CODE_FN_83A058                 ;83C965|2058A0  |83A058;
 
                     + RTS                                  ;83C968|60      |      ;
                       INC.W $1A6E                          ;83C969|EE6E1A  |831A6E;
                       LDX.W #$0180                         ;83C96C|A28001  |      ;
                       JSR.W CODE_FN_839FEE                 ;83C96F|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A058                 ;83C972|2058A0  |83A058;
                       RTS                                  ;83C975|60      |      ;
                       JSR.W CODE_FN_839FB6                 ;83C976|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83C979|2058A0  |83A058;
                       LDA.L Game1P_Selection               ;83C97C|AF2A957E|7E952A;
                       CMP.W #$0004                         ;83C980|C90400  |      ;
                       BNE +                                ;83C983|D00B    |83C990;
                       LDA.W #$000C                         ;83C985|A90C00  |      ;
                       STA.W Game_State_State               ;83C988|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83C98B|9C6E1A  |831A6E;
                       BRA ++                               ;83C98E|800C    |83C99C;
 
                     + INC.W Game_State                     ;83C990|EEA002  |8302A0;
                       LDA.W #$0002                         ;83C993|A90200  |      ;
                       STA.W Game_State_State               ;83C996|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83C999|9C6E1A  |831A6E;
 
                    ++ LDA.L Game1P_Selection               ;83C99C|AF2A957E|7E952A;
                       ASL A                                ;83C9A0|0A      |      ;
                       TAX                                  ;83C9A1|AA      |      ;
 
          CODE_83C9A2:
                       JSR.W (CODE_83C9A2,X)                ;83C9A2|FCA2C9  |83C9A2;
                       RTS                                  ;83C9A5|60      |      ;
                       db $AC,$C9,$EE,$C9,$17,$CA           ;83C9A6|        |      ;
                       LDA.L StageClear_MenuSelection       ;83C9AC|AF2E957E|7E952E;
                       ASL A                                ;83C9B0|0A      |      ;
                       TAX                                  ;83C9B1|AA      |      ;
                       JSR.W (DATA8_83C9B6,X)               ;83C9B2|FCB6C9  |83C9B6;
                       RTS                                  ;83C9B5|60      |      ;
 
         DATA8_83C9B6:
                       db $CE,$C9                           ;83C9B6|        |      ;
                       db $BA,$C9                           ;83C9B8|        |      ;
 
                     - LDA.W #$0000                         ;83C9BA|A90000  |      ;
                       STA.L $7E943A                        ;83C9BD|8F3A947E|7E943A;
                       STA.L $7E94E6                        ;83C9C1|8FE6947E|7E94E6;
                       STA.L $7E961E                        ;83C9C5|8F1E967E|7E961E;
                       JSL.L InitStageClear                 ;83C9C9|2207AA87|87AA07;
                       RTS                                  ;83C9CD|60      |      ;
                       LDA.L $7E94E6                        ;83C9CE|AFE6947E|7E94E6;
                       BEQ -                                ;83C9D2|F0E6    |83C9BA;
                       LDA.L $7E94F6                        ;83C9D4|AFF6947E|7E94F6;
                       BEQ +                                ;83C9D8|F013    |83C9ED;
                       LDA.L $7E94F4                        ;83C9DA|AFF4947E|7E94F4;
                       CMP.W #$0001                         ;83C9DE|C90100  |      ;
                       BNE +                                ;83C9E1|D00A    |83C9ED;
                       db $A9,$00,$00,$8D,$46,$03,$8F,$F4   ;83C9E3|        |      ;
                       db $94,$7E                           ;83C9EB|        |00007E;
 
                     + RTS                                  ;83C9ED|60      |      ;
                       LDA.L Puzzle_MenuSelection           ;83C9EE|AF30957E|7E9530;
                       ASL A                                ;83C9F2|0A      |      ;
                       TAX                                  ;83C9F3|AA      |      ;
                       JSR.W (DATA8_83C9F8,X)               ;83C9F4|FCF8C9  |83C9F8;
                       RTS                                  ;83C9F7|60      |      ;
 
         DATA8_83C9F8:
                       db $10,$CA                           ;83C9F8|        |      ;
                       db $FC,$C9                           ;83C9FA|        |83A9C9;
 
                     - LDA.W #$0000                         ;83C9FC|A90000  |      ;
                       STA.L $7E943C                        ;83C9FF|8F3C947E|7E943C;
                       STA.L $7E94D6                        ;83CA03|8FD6947E|7E94D6;
                       STA.L $7E961E                        ;83CA07|8F1E967E|7E961E;
                       JSL.L CODE_FL_87AB2D                 ;83CA0B|222DAB87|87AB2D;
                       RTS                                  ;83CA0F|60      |      ;
                       LDA.L $7E94D6                        ;83CA10|AFD6947E|7E94D6;
                       BEQ -                                ;83CA14|F0E6    |83C9FC;
                       RTS                                  ;83CA16|60      |      ;
                       LDA.L VS_MenuSelection               ;83CA17|AF3C957E|7E953C;
                       ASL A                                ;83CA1B|0A      |      ;
                       TAX                                  ;83CA1C|AA      |      ;
                       JSR.W (DATA8_83CA21,X)               ;83CA1D|FC21CA  |83CA21;
                       RTS                                  ;83CA20|60      |      ;
 
         DATA8_83CA21:
                       db $25,$CA,$41,$CA                   ;83CA21|        |      ;
                       LDA.L $7E9526                        ;83CA25|AF26957E|7E9526;
                       BEQ +                                ;83CA29|F016    |83CA41;
                       STA.W $1A82                          ;83CA2B|8D821A  |001A82;
                       JSL.L CODE_FL_838382                 ;83CA2E|22828383|838382;
                       JSL.L CODE_FL_86F1CE                 ;83CA32|22CEF186|86F1CE;
                       JSL.L CODE_FL_86F276                 ;83CA36|2276F286|86F276;
                       LDA.W $0338                          ;83CA3A|AD3803  |000338;
                       BEQ ++                               ;83CA3D|F001    |83CA40;
                       db $00                               ;83CA3F|        |      ;
 
                    ++ RTS                                  ;83CA40|60      |      ;
 
                     + LDA.W #$0000                         ;83CA41|A90000  |      ;
                       STA.L $7E9526                        ;83CA44|8F26957E|7E9526;
                       STA.L $7E961E                        ;83CA48|8F1E967E|7E961E;
                       STA.W $1A82                          ;83CA4C|8D821A  |831A82;
                       RTS                                  ;83CA4F|60      |      ;
                       LDA.W $1A6E                          ;83CA50|AD6E1A  |831A6E;
                       ASL A                                ;83CA53|0A      |      ;
                       TAX                                  ;83CA54|AA      |      ;
                       JSR.W (DATA8_83CA59,X)               ;83CA55|FC59CA  |83CA59;
                       RTS                                  ;83CA58|60      |      ;
 
         DATA8_83CA59:
                       db $65,$CA,$75,$CA,$AA,$CA,$BA,$CA   ;83CA59|        |      ;
                       db $C4,$CA,$D3,$CA                   ;83CA61|        |      ;
                       INC.W $1A6E                          ;83CA65|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A595                 ;83CA68|2095A5  |83A595;
                       JSR.W CODE_FN_8388FF                 ;83CA6B|20FF88  |8388FF;
                       LDA.W #$0001                         ;83CA6E|A90100  |      ;
                       JSR.W Move_MenuLipYoshi              ;83CA71|200D9F  |839F0D;
                       RTS                                  ;83CA74|60      |      ;
                       JSR.W CODE_FN_8388FF                 ;83CA75|20FF88  |8388FF;
                       LDA.L $7E998D                        ;83CA78|AF8D997E|7E998D;
                       BEQ +                                ;83CA7C|F003    |83CA81;
                       JMP.W CODE_JP_83CA9F                 ;83CA7E|4C9FCA  |83CA9F;
 
                     + INC.W $1A6E                          ;83CA81|EE6E1A  |831A6E;
                       LDX.W #$0300                         ;83CA84|A20003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83CA87|20EE9F  |839FEE;
                       LDA.L Game1P_Selection               ;83CA8A|AF2A957E|7E952A;
                       ASL A                                ;83CA8E|0A      |      ;
                       TAX                                  ;83CA8F|AA      |      ;
                       JSR.W (UNREACH_83CAA0,X)             ;83CA90|FCA0CA  |83CAA0;
                       JSR.W CODE_FN_83A344                 ;83CA93|2044A3  |83A344;
                       JSR.W CODE_FN_83A058                 ;83CA96|2058A0  |83A058;
                       JSR.W CODE_FN_83A5E5                 ;83CA99|20E5A5  |83A5E5;
                       JSR.W CODE_FN_838CB5                 ;83CA9C|20B58C  |838CB5;
 
       CODE_JP_83CA9F:
                       RTS                                  ;83CA9F|60      |      ;
 
       UNREACH_83CAA0:
                       db $00,$00,$00,$00                   ;83CAA0|        |      ;
                       db $E1,$A2,$18,$A3,$2E,$A3           ;83CAA4|        |      ;
                       JSR.W CODE_FN_838CB5                 ;83CAAA|20B58C  |838CB5;
                       LDA.L $7E998D                        ;83CAAD|AF8D997E|7E998D;
                       BEQ +                                ;83CAB1|F003    |83CAB6;
                       JMP.W CODE_JP_83CAB9                 ;83CAB3|4CB9CA  |83CAB9;
 
                     + INC.W $1A6E                          ;83CAB6|EE6E1A  |831A6E;
 
       CODE_JP_83CAB9:
                       RTS                                  ;83CAB9|60      |      ;
                       INC.W $1A6E                          ;83CABA|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A4C6                 ;83CABD|20C6A4  |83A4C6;
                       JSR.W CODE_FN_83A058                 ;83CAC0|2058A0  |83A058;
                       RTS                                  ;83CAC3|60      |      ;
                       INC.W $1A6E                          ;83CAC4|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A4E4                 ;83CAC7|20E4A4  |83A4E4;
                       JSR.W CODE_FN_83A058                 ;83CACA|2058A0  |83A058;
                       JSR.W CODE_FN_83A65D                 ;83CACD|205DA6  |83A65D;
                       JSR.W CODE_FN_838ABD                 ;83CAD0|20BD8A  |838ABD;
                       JSR.W CODE_FN_838ABD                 ;83CAD3|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83CAD6|AF8D997E|7E998D;
                       BNE +                                ;83CADA|D024    |83CB00;
                       INC.W Game_State_State               ;83CADC|EEA202  |8302A2;
                       STZ.W $1A6E                          ;83CADF|9C6E1A  |831A6E;
                       LDA.W #$0000                         ;83CAE2|A90000  |      ;
                       STA.L Password_Input_Length          ;83CAE5|8F0C967E|7E960C;
                       STA.L $7E96E7                        ;83CAE9|8FE7967E|7E96E7;
                       STA.L $7E96EB                        ;83CAED|8FEB967E|7E96EB;
                       STA.L $7E96F5                        ;83CAF1|8FF5967E|7E96F5;
                       LDX.W #$0016                         ;83CAF5|A21600  |      ;
 
                     - STA.L $7E95F4,X                      ;83CAF8|9FF4957E|7E95F4;
                       DEX                                  ;83CAFC|CA      |      ;
                       DEX                                  ;83CAFD|CA      |      ;
                       BPL -                                ;83CAFE|10F8    |83CAF8;
 
                     + RTS                                  ;83CB00|60      |      ;
                       LDA.W $1A6E                          ;83CB01|AD6E1A  |831A6E;
                       ASL A                                ;83CB04|0A      |      ;
                       TAX                                  ;83CB05|AA      |      ;
                       JSR.W (DATA8_83CB0A,X)               ;83CB06|FC0ACB  |83CB0A;
                       RTS                                  ;83CB09|60      |      ;
 
         DATA8_83CB0A:
                       db $0E,$CB,$0A,$CD                   ;83CB0A|        |      ;
                       LDA.W #$000D                         ;83CB0E|A90D00  |      ;
                       STA.L $7E95D8                        ;83CB11|8FD8957E|7E95D8;
                       LDA.W #$000D                         ;83CB15|A90D00  |      ;
                       STA.L $7E95DA                        ;83CB18|8FDA957E|7E95DA;
                       LDA.W #$000D                         ;83CB1C|A90D00  |      ;
                       STA.L $7E95DC                        ;83CB1F|8FDC957E|7E95DC;
                       LDA.W #$0002                         ;83CB23|A90200  |      ;
                       STA.L $7E95DE                        ;83CB26|8FDE957E|7E95DE;
                       LDA.W #$0003                         ;83CB2A|A90300  |      ;
                       STA.L $7E95E8                        ;83CB2D|8FE8957E|7E95E8;
                       LDA.L $7E96F5                        ;83CB31|AFF5967E|7E96F5;
                       STA.L $7E96F9                        ;83CB35|8FF9967E|7E96F9;
                       LDX.W #$0000                         ;83CB39|A20000  |      ;
                       JSR.W CODE_FN_838E7D                 ;83CB3C|207D8E  |838E7D;
                       LDA.L $7E96F5                        ;83CB3F|AFF5967E|7E96F5;
                       CMP.L $7E96F9                        ;83CB43|CFF9967E|7E96F9;
                       BEQ +                                ;83CB47|F024    |83CB6D;
                       CMP.W #$0003                         ;83CB49|C90300  |      ;
                       BNE ++                               ;83CB4C|D043    |83CB91;
                       LDA.L $7E96EB                        ;83CB4E|AFEB967E|7E96EB;
                       TAX                                  ;83CB52|AA      |      ;
                       LDA.W DATA8_83CB5F,X                 ;83CB53|BD5FCB  |83CB5F;
                       AND.W #$00FF                         ;83CB56|29FF00  |      ;
                       STA.L $7E96E7                        ;83CB59|8FE7967E|7E96E7;
                       BRA ++                               ;83CB5D|8032    |83CB91;
 
         DATA8_83CB5F:
                       db $00,$00,$00,$00,$00,$01,$01,$01   ;83CB5F|        |      ;
                       db $01,$01,$02,$02,$02               ;83CB67|        |      ;
                       db $02                               ;83CB6C|        |      ;
 
                     + LDA.L $7E96F5                        ;83CB6D|AFF5967E|7E96F5;
                       CMP.W #$0003                         ;83CB71|C90300  |      ;
                       BNE ++                               ;83CB74|D01B    |83CB91;
                       LDA.B $BB                            ;83CB76|A5BB    |0000BB;
                       BIT.W #$0300                         ;83CB78|890003  |      ;
                       BEQ ++                               ;83CB7B|F014    |83CB91;
                       LDA.L $7E96E7                        ;83CB7D|AFE7967E|7E96E7;
                       TAX                                  ;83CB81|AA      |      ;
                       LDA.W DATA8_83CB8E,X                 ;83CB82|BD8ECB  |83CB8E;
                       AND.W #$00FF                         ;83CB85|29FF00  |      ;
                       STA.L $7E96EB                        ;83CB88|8FEB967E|7E96EB;
                       BRA ++                               ;83CB8C|8003    |83CB91;
 
         DATA8_83CB8E:
                       db $00,$05,$0A                       ;83CB8E|        |      ;
 
                    ++ LDA.B $B7                            ;83CB91|A5B7    |0000B7;
                       BIT.W #$1080                         ;83CB93|898010  |      ;
                       BNE +                                ;83CB96|D003    |83CB9B;
                       JMP.W CODE_JP_83CCDE                 ;83CB98|4CDECC  |83CCDE;
 
                     + LDA.L $7E96F5                        ;83CB9B|AFF5967E|7E96F5;
                       CMP.W #$0003                         ;83CB9F|C90300  |      ;
                       BEQ +                                ;83CBA2|F04D    |83CBF1;
                       LDA.L Password_Input_Length          ;83CBA4|AF0C967E|7E960C;
                       CMP.W #$0008                         ;83CBA8|C90800  |      ;
                       BEQ ++                               ;83CBAB|F030    |83CBDD;
                       LDA.L $7E96F5                        ;83CBAD|AFF5967E|7E96F5;
                       TAX                                  ;83CBB1|AA      |      ;
                       LDA.W #$000E                         ;83CBB2|A90E00  |      ;
                       JSR.W CODE_FN_8385CD                 ;83CBB5|20CD85  |8385CD;
                       CLC                                  ;83CBB8|18      |      ;
                       ADC.L $7E96E7                        ;83CBB9|6FE7967E|7E96E7;
                       STA.B $0E                            ;83CBBD|850E    |00000E;
                       LDA.L Password_Input_Length          ;83CBBF|AF0C967E|7E960C;
                       TAX                                  ;83CBC3|AA      |      ;
                       LDA.B $0E                            ;83CBC4|A50E    |00000E;
                       INC A                                ;83CBC6|1A      |      ;
                       SEP #$20                             ;83CBC7|E220    |      ;
                       STA.L Password_Input,X               ;83CBC9|9F00967E|7E9600; write char
                       REP #$20                             ;83CBCD|C220    |      ;
                       LDA.L Password_Input_Length          ;83CBCF|AF0C967E|7E960C;
                       INC A                                ;83CBD3|1A      |      ;
                       STA.L Password_Input_Length          ;83CBD4|8F0C967E|7E960C; increase inputted length
                       CMP.W #$0008                         ;83CBD8|C90800  |      ;
                       BNE +++                              ;83CBDB|D00E    |83CBEB;
 
                    ++ LDA.W #$0003                         ;83CBDD|A90300  |      ;
                       STA.L $7E96F5                        ;83CBE0|8FF5967E|7E96F5;
                       LDA.W #$0002                         ;83CBE4|A90200  |      ;
                       STA.L $7E96E7                        ;83CBE7|8FE7967E|7E96E7;
 
                   +++ JSR.W CODE_FN_8384CD                 ;83CBEB|20CD84  |8384CD;
                       JMP.W CODE_JP_83CD00                 ;83CBEE|4C00CD  |83CD00;
 
                     + LDA.L $7E96E7                        ;83CBF1|AFE7967E|7E96E7;
                       ASL A                                ;83CBF5|0A      |      ;
                       TAX                                  ;83CBF6|AA      |      ;
                       JSR.W (DATA8_83CBFD,X)               ;83CBF7|FCFDCB  |83CBFD;
                       JMP.W CODE_JP_83CD00                 ;83CBFA|4C00CD  |83CD00;
 
         DATA8_83CBFD:
                       db $03,$CC,$0A,$CC,$24,$CC           ;83CBFD|        |      ;
 
       CODE_FN_83CC03:
                       INC.W Game_State_State               ;83CC03|EEA202  |8302A2;
                       JSR.W CODE_FN_8384CD                 ;83CC06|20CD84  |8384CD;
                       RTS                                  ;83CC09|60      |      ;
 
       CODE_FN_83CC0A:
                       LDA.L Password_Input_Length          ;83CC0A|AF0C967E|7E960C;
                       BEQ +                                ;83CC0E|F013    |83CC23;
                       DEC A                                ;83CC10|3A      |      ;
                       STA.L Password_Input_Length          ;83CC11|8F0C967E|7E960C;
                       TAX                                  ;83CC15|AA      |      ;
                       SEP #$20                             ;83CC16|E220    |      ;
                       LDA.B #$00                           ;83CC18|A900    |      ;
                       STA.L Password_Input,X               ;83CC1A|9F00967E|7E9600;
                       REP #$20                             ;83CC1E|C220    |      ;
                       JSR.W CODE_FN_8384CD                 ;83CC20|20CD84  |8384CD;
 
                     + RTS                                  ;83CC23|60      |      ;
                       LDA.L Game1P_Selection               ;83CC24|AF2A957E|7E952A;
                       CMP.W #$0004                         ;83CC28|C90400  |      ;
                       BNE +                                ;83CC2B|D025    |83CC52;
                       JSR.W CODE_FN_8387C8                 ;83CC2D|20C887  |8387C8;
                       JSL.L CODE_FL_86F360                 ;83CC30|2260F386|86F360;
                       LDA.W $0338                          ;83CC34|AD3803  |830338;
                       BEQ ++                               ;83CC37|F003    |83CC3C;
                       JMP.W CODE_JP_83CCD7                 ;83CC39|4CD7CC  |83CCD7;
 
                    ++ JSR.W CODE_FN_8384CD                 ;83CC3C|20CD84  |8384CD;
                       LDA.W #$0001                         ;83CC3F|A90100  |      ;
                       STA.L $7E9526                        ;83CC42|8F26957E|7E9526;
                       JSL.L CODE_FL_838312                 ;83CC46|22128383|838312;
                       LDA.W #$000C                         ;83CC4A|A90C00  |      ;
                       STA.L Game_State_State-$7E0000       ;83CC4D|8FA20200|0002A2;
                       RTS                                  ;83CC51|60      |      ;
 
                     + LDA.L $7E38FE                        ;83CC52|AFFE387E|7E38FE;
                       CMP.W #$0002                         ;83CC56|C90200  |      ;
                       BNE +                                ;83CC59|D048    |83CCA3;
                       JSR.W CODE_FN_8387C8                 ;83CC5B|20C887  |8387C8;
                       JSL.L CODE_FL_89DAD3                 ;83CC5E|22D3DA89|89DAD3;
                       LDA.W $0338                          ;83CC62|AD3803  |830338;
                       BNE CODE_JP_83CCD7                   ;83CC65|D070    |83CCD7;
                       LDA.W $0342                          ;83CC67|AD4203  |830342;
                       CMP.W #$0007                         ;83CC6A|C90700  |      ;
                       BPL CODE_JP_83CCD7                   ;83CC6D|1068    |83CCD7;
                       LDA.W StageClear_LevelHi             ;83CC6F|AD3E03  |83033E;
                       BEQ CODE_JP_83CCD7                   ;83CC72|F063    |83CCD7;
                       CMP.W #$0007                         ;83CC74|C90700  |      ;
                       BPL CODE_JP_83CCD7                   ;83CC77|105E    |83CCD7;
                       JSR.W CODE_FN_8384CD                 ;83CC79|20CD84  |8384CD;
                       JSL.L CODE_FL_83839B                 ;83CC7C|229B8383|83839B;
                       LDA.W #$001F                         ;83CC80|A91F00  |      ;
                       STA.W Game_State_State               ;83CC83|8DA202  |8302A2;
                       LDA.W #$0003                         ;83CC86|A90300  |      ;
                       STA.L $7E943A                        ;83CC89|8F3A947E|7E943A;
                       LDA.W $0342                          ;83CC8D|AD4203  |830342;
                       CMP.W #$0006                         ;83CC90|C90600  |      ;
                       BPL UNREACH_83CC9B                   ;83CC93|1006    |83CC9B;
                       INC A                                ;83CC95|1A      |      ;
                       STA.W StageClear_LevelLo             ;83CC96|8D3C03  |83033C;
                       BRA ++                               ;83CC99|8042    |83CCDD;
 
       UNREACH_83CC9B:
                       db $A9,$06,$00,$8D,$BA,$02,$80,$3A   ;83CC9B|        |      ;
 
                     + JSR.W CODE_FN_8387C8                 ;83CCA3|20C887  |8387C8;
                       JSL.L CODE_FL_89DAFD                 ;83CCA6|22FDDA89|89DAFD;
                       LDA.W $0338                          ;83CCAA|AD3803  |830338;
                       BNE CODE_JP_83CCD7                   ;83CCAD|D028    |83CCD7;
                       JSR.W CODE_FN_8384CD                 ;83CCAF|20CD84  |8384CD;
                       JSL.L CODE_FL_8382BA                 ;83CCB2|22BA8283|8382BA;
                       LDA.W #$001F                         ;83CCB6|A91F00  |      ;
                       STA.W Game_State_State               ;83CCB9|8DA202  |8302A2;
                       LDA.W #$0003                         ;83CCBC|A90300  |      ;
                       STA.L $7E943C                        ;83CCBF|8F3C947E|7E943C;
                       LDA.W $0348                          ;83CCC3|AD4803  |830348;
                       INC A                                ;83CCC6|1A      |      ;
                       STA.W Puzzle_LevelHi                 ;83CCC7|8D4E03  |83034E;
                       CMP.W #$003D                         ;83CCCA|C93D00  |      ;
                       BMI ++                               ;83CCCD|300E    |83CCDD;
                       db $A9,$3C,$00,$8D,$4E,$03,$80,$06   ;83CCCF|        |      ;
 
       CODE_JP_83CCD7:
                       INC.W $1A6E                          ;83CCD7|EE6E1A  |831A6E;
                       JSR.W CODE_FN_8384D4                 ;83CCDA|20D484  |8384D4;
 
                    ++ RTS                                  ;83CCDD|60      |      ;
 
       CODE_JP_83CCDE:
                       LDA.B $BB                            ;83CCDE|A5BB    |0000BB;
                       BIT.W #$8000                         ;83CCE0|890080  |      ;
                       BEQ CODE_JP_83CD00                   ;83CCE3|F01B    |83CD00;
                       JSR.W CODE_FN_8384D4                 ;83CCE5|20D484  |8384D4;
                       LDA.L Password_Input_Length          ;83CCE8|AF0C967E|7E960C;
                       BEQ +                                ;83CCEC|F008    |83CCF6;
                       JSR.W CODE_FN_83CC0A                 ;83CCEE|200ACC  |83CC0A;
                       JSR.W CODE_FN_8384D4                 ;83CCF1|20D484  |8384D4;
                       BRA CODE_JP_83CD00                   ;83CCF4|800A    |83CD00;
 
                     + LDA.B $B7                            ;83CCF6|A5B7    |0000B7;
                       BIT.W #$8000                         ;83CCF8|890080  |      ;
                       BEQ CODE_JP_83CD00                   ;83CCFB|F003    |83CD00;
                       JSR.W CODE_FN_83CC03                 ;83CCFD|2003CC  |83CC03;
 
       CODE_JP_83CD00:
                       JSR.W CODE_FN_8397BA                 ;83CD00|20BA97  |8397BA;
                       JSR.W Menu_DrawPasswordUnderscore    ;83CD03|201698  |839816;
                       JSR.W CODE_FN_83AB9F                 ;83CD06|209FAB  |83AB9F;
                       RTS                                  ;83CD09|60      |      ;
                       LDA.B $B7                            ;83CD0A|A5B7    |0000B7;
                       BIT.W #$9080                         ;83CD0C|898090  |      ;
                       BEQ +                                ;83CD0F|F003    |83CD14;
                       STZ.W $1A6E                          ;83CD11|9C6E1A  |831A6E;
 
                     + RTS                                  ;83CD14|60      |      ;
                       LDA.W $1A6E                          ;83CD15|AD6E1A  |831A6E;
                       ASL A                                ;83CD18|0A      |      ;
                       TAX                                  ;83CD19|AA      |      ;
                       JSR.W (DATA8_83CD1E,X)               ;83CD1A|FC1ECD  |83CD1E;
                       RTS                                  ;83CD1D|60      |      ;
 
         DATA8_83CD1E:
                       db $28,$CD,$38,$CD,$54,$CD,$64,$CD   ;83CD1E|        |      ;
                       db $74,$CD                           ;83CD26|        |      ;
 
       CODE_FN_83CD28:
                       INC.W $1A6E                          ;83CD28|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A741                 ;83CD2B|2041A7  |83A741;
                       JSR.W CODE_FN_838BF1                 ;83CD2E|20F18B  |838BF1;
                       LDA.W #$0000                         ;83CD31|A90000  |      ;
                       JSR.W Move_MenuLipYoshi              ;83CD34|200D9F  |839F0D;
                       RTS                                  ;83CD37|60      |      ;
                       JSR.W CODE_FN_838BF1                 ;83CD38|20F18B  |838BF1;
                       LDA.L $7E998D                        ;83CD3B|AF8D997E|7E998D;
                       BEQ +                                ;83CD3F|F003    |83CD44;
                       JMP.W CODE_JP_83CD53                 ;83CD41|4C53CD  |83CD53;
 
                     + INC.W $1A6E                          ;83CD44|EE6E1A  |831A6E;
                       LDX.W #$0480                         ;83CD47|A28004  |      ;
                       JSR.W CODE_FN_839FEE                 ;83CD4A|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A4C6                 ;83CD4D|20C6A4  |83A4C6;
                       JSR.W CODE_FN_83A058                 ;83CD50|2058A0  |83A058;
 
       CODE_JP_83CD53:
                       RTS                                  ;83CD53|60      |      ;
                       INC.W $1A6E                          ;83CD54|EE6E1A  |831A6E;
                       LDX.W #$03C0                         ;83CD57|A2C003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83CD5A|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A344                 ;83CD5D|2044A3  |83A344;
                       JSR.W CODE_FN_83A058                 ;83CD60|2058A0  |83A058;
                       RTS                                  ;83CD63|60      |      ;
                       INC.W $1A6E                          ;83CD64|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A475                 ;83CD67|2075A4  |83A475;
                       JSR.W CODE_FN_83A058                 ;83CD6A|2058A0  |83A058;
                       JSR.W CODE_FN_83A6D5                 ;83CD6D|20D5A6  |83A6D5;
                       JSR.W CODE_FN_838ABD                 ;83CD70|20BD8A  |838ABD;
                       RTS                                  ;83CD73|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83CD74|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83CD77|AF8D997E|7E998D;
                       BNE +                                ;83CD7B|D024    |83CDA1;
                       LDA.L Game1P_Selection               ;83CD7D|AF2A957E|7E952A;
                       CMP.W #$0004                         ;83CD81|C90400  |      ;
                       BNE ++                               ;83CD84|D00A    |83CD90;
                       LDA.W #$0037                         ;83CD86|A93700  |      ;
                       STA.W Game_State_State               ;83CD89|8DA202  |0002A2;
                       STZ.W $1A6E                          ;83CD8C|9C6E1A  |001A6E;
                       RTS                                  ;83CD8F|60      |      ;
 
                    ++ LDA.L $7E38FE                        ;83CD90|AFFE387E|7E38FE;
                       TAX                                  ;83CD94|AA      |      ;
                       LDA.W UNREACH_83CDA2,X               ;83CD95|BDA2CD  |83CDA2;
                       AND.W #$00FF                         ;83CD98|29FF00  |      ;
                       STA.W Game_State_State               ;83CD9B|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83CD9E|9C6E1A  |831A6E;
 
                     + RTS                                  ;83CDA1|60      |      ;
 
       UNREACH_83CDA2:
                       db $00,$00,$14                       ;83CDA2|        |      ;
                       db $19,$37                           ;83CDA5|        |      ;
                       LDA.W $1A6E                          ;83CDA7|AD6E1A  |831A6E;
                       ASL A                                ;83CDAA|0A      |      ;
                       TAX                                  ;83CDAB|AA      |      ;
                       JSR.W (DATA8_83CDB0,X)               ;83CDAC|FCB0CD  |83CDB0;
                       RTS                                  ;83CDAF|60      |      ;
 
         DATA8_83CDB0:
                       db $BC,$CD,$38,$CD,$54,$CD,$C6,$CD   ;83CDB0|        |      ;
                       db $E0,$CD,$F0,$CD                   ;83CDB8|        |      ;
                       JSR.W CODE_FN_83CD28                 ;83CDBC|2028CD  |83CD28;
                       LDA.W #$0002                         ;83CDBF|A90200  |      ;
                       JSR.W Move_MenuLipYoshi              ;83CDC2|200D9F  |839F0D;
                       RTS                                  ;83CDC5|60      |      ;
                       INC.W $1A6E                          ;83CDC6|EE6E1A  |831A6E;
                       LDX.W #$0300                         ;83CDC9|A20003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83CDCC|20EE9F  |839FEE;
                       LDA.L $7E38FE                        ;83CDCF|AFFE387E|7E38FE;
                       ASL A                                ;83CDD3|0A      |      ;
                       TAX                                  ;83CDD4|AA      |      ;
                       JSR.W (CODE_83CDD8,X)                ;83CDD5|FCD8CD  |83CDD8;
 
          CODE_83CDD8:
                       JSR.W CODE_FN_83A058                 ;83CDD8|2058A0  |83A058;
                       RTS                                  ;83CDDB|60      |      ;
                       db $E1,$A2,$18,$A3                   ;83CDDC|        |      ;
                       INC.W $1A6E                          ;83CDE0|EE6E1A  |831A6E;
                       LDX.W #$0240                         ;83CDE3|A24002  |      ;
                       JSR.W CODE_FN_839FEE                 ;83CDE6|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A262                 ;83CDE9|2062A2  |83A262;
                       JSR.W CODE_FN_83A058                 ;83CDEC|2058A0  |83A058;
                       RTS                                  ;83CDEF|60      |      ;
                       JSR.W CODE_FN_839FB6                 ;83CDF0|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83CDF3|2058A0  |83A058;
                       INC.W Game_State                     ;83CDF6|EEA002  |8302A0;
                       LDA.W #$0002                         ;83CDF9|A90200  |      ;
                       STA.W Game_State_State               ;83CDFC|8DA202  |8302A2;
                       LDA.W #$0001                         ;83CDFF|A90100  |      ;
                       STA.W $1A6E                          ;83CE02|8D6E1A  |831A6E;
                       STZ.W $02A8                          ;83CE05|9CA802  |8302A8;
                       LDA.L $7E38FE                        ;83CE08|AFFE387E|7E38FE;
                       CMP.W #$0002                         ;83CE0C|C90200  |      ;
                       BNE +                                ;83CE0F|D009    |83CE1A;
                       LDA.W #$0001                         ;83CE11|A90100  |      ;
                       STA.L $7E94E6                        ;83CE14|8FE6947E|7E94E6;
                       BRA ++                               ;83CE18|8007    |83CE21;
 
                     + LDA.W #$0001                         ;83CE1A|A90100  |      ;
                       STA.L $7E94D6                        ;83CE1D|8FD6947E|7E94D6;
 
                    ++ STA.L $7E961E                        ;83CE21|8F1E967E|7E961E;
                       RTS                                  ;83CE25|60      |      ;
                       LDA.L $7E961E                        ;83CE26|AF1E967E|7E961E;
                       BEQ +                                ;83CE2A|F017    |83CE43;
                       LDY.W #$CE38                         ;83CE2C|A038CE  |      ;
                       LDA.L Puzzle_MenuSelection           ;83CE2F|AF30957E|7E9530;
                       JSR.W CODE_FN_8387F8                 ;83CE33|20F887  |8387F8;
                       BRA ++                               ;83CE36|8003    |83CE3B;
                       db $02,$66,$CE                       ;83CE38|        |      ;
 
                    ++ LDA.B $00                            ;83CE3B|A500    |000000;
                       STA.L Puzzle_MenuSelection           ;83CE3D|8F30957E|7E9530;
                       BRA ++                               ;83CE41|8015    |83CE58;
 
                     + LDY.W #$CE4F                         ;83CE43|A04FCE  |      ;
                       LDA.L Puzzle_MenuSelection           ;83CE46|AF30957E|7E9530;
                       JSR.W CODE_FN_8387F8                 ;83CE4A|20F887  |8387F8;
                       BRA +                                ;83CE4D|8003    |83CE52;
                       db $01,$67,$CE                       ;83CE4F|        |      ;
 
                     + LDA.B $00                            ;83CE52|A500    |000000;
                       STA.L Puzzle_MenuSelection           ;83CE54|8F30957E|7E9530;
 
                    ++ LDX.W #$0048                         ;83CE58|A24800  |      ;
                       LDY.W #$006B                         ;83CE5B|A06B00  |      ;
                       LDA.L Puzzle_MenuSelection           ;83CE5E|AF30957E|7E9530;
                       JSR.W CODE_FN_8397A1                 ;83CE62|20A197  |8397A1;
                       RTS                                  ;83CE65|60      |      ;
                       db $1B,$1B,$1C,$1A                   ;83CE66|        |      ;
                       LDA.L $7E961E                        ;83CE6A|AF1E967E|7E961E;
                       BEQ +                                ;83CE6E|F017    |83CE87;
                       LDY.W #$CE7C                         ;83CE70|A07CCE  |      ;
                       LDA.L VS_MenuSelection               ;83CE73|AF3C957E|7E953C;
                       JSR.W CODE_FN_8387F8                 ;83CE77|20F887  |8387F8;
                       BRA ++                               ;83CE7A|8003    |83CE7F;
                       db $02,$AA,$CE                       ;83CE7C|        |      ;
 
                    ++ LDA.B $00                            ;83CE7F|A500    |000000;
                       STA.L VS_MenuSelection               ;83CE81|8F3C957E|7E953C;
                       BRA ++                               ;83CE85|8015    |83CE9C;
 
                     + LDY.W #$CE93                         ;83CE87|A093CE  |      ;
                       LDA.L VS_MenuSelection               ;83CE8A|AF3C957E|7E953C;
                       JSR.W CODE_FN_8387F8                 ;83CE8E|20F887  |8387F8;
                       BRA +                                ;83CE91|8003    |83CE96;
                       db $01,$AB,$CE                       ;83CE93|        |      ;
 
                     + LDA.B $00                            ;83CE96|A500    |000000;
                       STA.L VS_MenuSelection               ;83CE98|8F3C957E|7E953C;
 
                    ++ LDX.W #$0048                         ;83CE9C|A24800  |      ;
                       LDY.W #$006B                         ;83CE9F|A06B00  |      ;
                       LDA.L VS_MenuSelection               ;83CEA2|AF3C957E|7E953C;
                       JSR.W CODE_FN_8397A1                 ;83CEA6|20A197  |8397A1;
                       RTS                                  ;83CEA9|60      |      ;
                       db $39,$39,$1C,$38                   ;83CEAA|        |      ;
                       LDA.W #$FFFF                         ;83CEAE|A9FFFF  |      ;
                       STA.W $02A8                          ;83CEB1|8DA802  |8302A8;
                       LDA.L HowtoPlay_Selection            ;83CEB4|AF32957E|7E9532;
                       CLC                                  ;83CEB8|18      |      ;
                       ADC.W #$000D                         ;83CEB9|690D00  |      ;
                       JSR.W CODE_FN_839DD7                 ;83CEBC|20D79D  |839DD7;
                       LDA.W #$0001                         ;83CEBF|A90100  |      ;
                       STA.L $7E96DB                        ;83CEC2|8FDB967E|7E96DB;
                       LDY.W #$CED2                         ;83CEC6|A0D2CE  |      ;
                       LDA.L HowtoPlay_Selection            ;83CEC9|AF32957E|7E9532;
                       JSR.W CODE_FN_8387F8                 ;83CECD|20F887  |8387F8;
                       BRA +                                ;83CED0|8003    |83CED5;
                       db $04,$F2,$CE                       ;83CED2|        |      ;
 
                     + LDA.B $00                            ;83CED5|A500    |000000;
                       STA.L HowtoPlay_Selection            ;83CED7|8F32957E|7E9532;
                       LDX.W #$0038                         ;83CEDB|A23800  |      ;
                       LDY.W #$0053                         ;83CEDE|A05300  |      ;
                       LDA.L HowtoPlay_Selection            ;83CEE1|AF32957E|7E9532;
                       JSR.W CODE_FN_8397A1                 ;83CEE5|20A197  |8397A1;
                       LDA.L $7E96FD                        ;83CEE8|AFFD967E|7E96FD;
                       BEQ +                                ;83CEEC|F003    |83CEF1;
                       STZ.W $1A70                          ;83CEEE|9C701A  |831A70;
 
                     + RTS                                  ;83CEF1|60      |      ;
                       db $24,$0C,$0C,$0C,$0C,$23           ;83CEF2|        |      ;
                       LDA.W $1A6E                          ;83CEF8|AD6E1A  |831A6E;
                       ASL A                                ;83CEFB|0A      |      ;
                       TAX                                  ;83CEFC|AA      |      ;
                       JSR.W (DATA8_83CF01,X)               ;83CEFD|FC01CF  |83CF01;
                       RTS                                  ;83CF00|60      |      ;
 
         DATA8_83CF01:
                       db $09,$CF,$58,$86,$58,$86,$13,$CF   ;83CF01|        |      ;
                       INC.W $1A6E                          ;83CF09|EE6E1A  |831A6E;
                       LDA.W #$0003                         ;83CF0C|A90300  |      ;
                       JSR.W Move_MenuLipYoshi              ;83CF0F|200D9F  |839F0D;
                       RTS                                  ;83CF12|60      |      ;
                       INC.W Game_State_State               ;83CF13|EEA202  |8302A2;
                       STZ.W $1A6E                          ;83CF16|9C6E1A  |831A6E;
                       JSR.W CODE_FN_8384DB                 ;83CF19|20DB84  |8384DB;
                       JSR.W CODE_FN_8384E7                 ;83CF1C|20E784  |8384E7;
                       JSR.W CODE_FN_8384F3                 ;83CF1F|20F384  |8384F3;
                       JSR.W CODE_FN_8384FF                 ;83CF22|20FF84  |8384FF;
                       JSR.W CODE_FN_83850B                 ;83CF25|200B85  |83850B;
                       JSL.L CODE_FL_80BB2D                 ;83CF28|222DBB80|80BB2D;
                       db $1F,$CC,$93,$00,$20,$7E           ;83CF2C|        |      ;
                       JSR.W CODE_FN_83A058                 ;83CF32|2058A0  |83A058;
                       RTS                                  ;83CF35|60      |      ;
                       JSR.W CODE_FN_839B9F                 ;83CF36|209F9B  |839B9F;
                       JSR.W CODE_FN_839C17                 ;83CF39|20179C  |839C17;
                       LDA.L $7E95D4                        ;83CF3C|AFD4957E|7E95D4;
                       BEQ +                                ;83CF40|F006    |83CF48;
                       JSR.W CODE_FN_8384CD                 ;83CF42|20CD84  |8384CD;
                       INC.W Game_State_State               ;83CF45|EEA202  |8302A2;
 
                     + RTS                                  ;83CF48|60      |      ;
                       LDA.W $1A6E                          ;83CF49|AD6E1A  |831A6E;
                       ASL A                                ;83CF4C|0A      |      ;
                       TAX                                  ;83CF4D|AA      |      ;
                       JSR.W (DATA8_83CF52,X)               ;83CF4E|FC52CF  |83CF52;
                       RTS                                  ;83CF51|60      |      ;
 
         DATA8_83CF52:
                       db $5C,$CF,$58,$86,$58,$86,$58,$86   ;83CF52|        |      ;
                       db $6C,$CF                           ;83CF5A|        |      ;
                       INC.W $1A6E                          ;83CF5C|EE6E1A  |831A6E;
                       JSR.W CODE_FN_839FB6                 ;83CF5F|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83CF62|2058A0  |83A058;
                       LDA.W #$0000                         ;83CF65|A90000  |      ;
                       JSR.W Move_MenuLipYoshi              ;83CF68|200D9F  |839F0D;
                       RTS                                  ;83CF6B|60      |      ;
                       LDA.W #$0020                         ;83CF6C|A92000  |      ;
                       STA.W Game_State_State               ;83CF6F|8DA202  |8302A2;
                       LDA.W #$0002                         ;83CF72|A90200  |      ;
                       STA.W $1A6E                          ;83CF75|8D6E1A  |831A6E;
                       RTS                                  ;83CF78|60      |      ;
                       LDA.L $7E95D2                        ;83CF79|AFD2957E|7E95D2;
                       STA.B $BB                            ;83CF7D|85BB    |0000BB;
                       LDY.W #$CF8B                         ;83CF7F|A08BCF  |      ;
                       LDA.L Options_Selection              ;83CF82|AF34957E|7E9534;
                       JSR.W CODE_FN_8387F8                 ;83CF86|20F887  |8387F8;
                       BRA +                                ;83CF89|8003    |83CF8E;
                       db $06,$AE,$CF                       ;83CF8B|        |      ;
 
                     + LDA.B $00                            ;83CF8E|A500    |000000;
                       STA.L Options_Selection              ;83CF90|8F34957E|7E9534;
                       LDX.W #$0038                         ;83CF94|A23800  |      ;
                       LDY.W #$0053                         ;83CF97|A05300  |      ;
                       LDA.L Options_Selection              ;83CF9A|AF34957E|7E9534;
                       JSR.W CODE_FN_8397A1                 ;83CF9E|20A197  |8397A1;
                       LDA.L Options_Selection              ;83CFA1|AF34957E|7E9534;
                       ASL A                                ;83CFA5|0A      |      ;
                       TAX                                  ;83CFA6|AA      |      ;
                       JSR.W (DATA8_83CFB6,X)               ;83CFA7|FCB6CF  |83CFB6;
                       JSR.W CODE_FN_83A058                 ;83CFAA|2058A0  |83A058;
                       RTS                                  ;83CFAD|60      |      ;
                       db $29,$29,$29,$29,$0C,$2C,$29,$2A   ;83CFAE|        |      ;
 
         DATA8_83CFB6:
                       db $C6,$CF,$E3,$CF,$02,$D0,$24,$D2   ;83CFB6|        |      ;
                       db $BE,$D2,$AD,$CF,$1B,$D5           ;83CFBE|        |      ;
                       db $AD,$CF                           ;83CFC4|        |00A9CF;
                       LDA.W #$0003                         ;83CFC6|A90300  |      ;
                       STA.B $B1                            ;83CFC9|85B1    |0000B1;
                       LDX.W #$0000                         ;83CFCB|A20000  |      ;
                       LDA.W Language,X                     ;83CFCE|BD861A  |831A86;
                       LDY.W #$CFDC                         ;83CFD1|A0DCCF  |      ;
                       JSR.W CODE_FN_838F98                 ;83CFD4|20988F  |838F98;
                       STA.W Language,X                     ;83CFD7|9D861A  |831A86;
                       BRA +                                ;83CFDA|8003    |83CFDF;
                       db $00,$02,$00                       ;83CFDC|        |      ;
 
                     + JSR.W Options_DoLanguage             ;83CFDF|20C7BB  |83BBC7;
                       RTS                                  ;83CFE2|60      |      ;
                       LDA.W #$0003                         ;83CFE3|A90300  |      ;
                       STA.B $B1                            ;83CFE6|85B1    |0000B1;
                       LDX.W #$0000                         ;83CFE8|A20000  |      ;
                       LDA.L Match_Points_Selection,X       ;83CFEB|BF6C947E|7E946C;
                       LDY.W #$CFFB                         ;83CFEF|A0FBCF  |      ;
                       JSR.W CODE_FN_838F98                 ;83CFF2|20988F  |838F98;
                       STA.L Match_Points_Selection,X       ;83CFF5|9F6C947E|7E946C;
                       BRA +                                ;83CFF9|8003    |83CFFE;
                       db $01,$03,$00                       ;83CFFB|        |      ;
 
                     + JSR.W Options_DoMatchPoints          ;83CFFE|20D7BB  |83BBD7;
                       RTS                                  ;83D001|60      |      ;
                       LDA.L $7E9540                        ;83D002|AF40957E|7E9540;
                       BEQ +                                ;83D006|F021    |83D029;
                       LDA.L Sound_Test_Selection           ;83D008|AF3E957E|7E953E;
                       TAX                                  ;83D00C|AA      |      ;
                       LDA.W DATA8_83D141,X                 ;83D00D|BD41D1  |83D141;
                       AND.W #$00FF                         ;83D010|29FF00  |      ;
                       STA.W $199C                          ;83D013|8D9C19  |83199C;
                       LDA.W DATA8_83D05E,X                 ;83D016|BD5ED0  |83D05E;
                       AND.W #$00FF                         ;83D019|29FF00  |      ;
                       STA.W $1988                          ;83D01C|8D8819  |831988;
                       LDA.W #$0000                         ;83D01F|A90000  |      ;
                       STA.L $7E9540                        ;83D022|8F40957E|7E9540;
                       JSR.W CODE_FN_8384A4                 ;83D026|20A484  |8384A4;
 
                     + LDA.W #$0001                         ;83D029|A90100  |      ;
                       STA.B $B1                            ;83D02C|85B1    |0000B1;
                       LDX.W #$0000                         ;83D02E|A20000  |      ;
                       LDA.L Sound_Test_Selection,X         ;83D031|BF3E957E|7E953E;
                       LDY.W #$D041                         ;83D035|A041D0  |      ;
                       JSR.W CODE_FN_838F98                 ;83D038|20988F  |838F98;
                       STA.L Sound_Test_Selection,X         ;83D03B|9F3E957E|7E953E;
                       BRA +                                ;83D03F|8003    |83D044;
                       db $00,$E3,$00                       ;83D041|        |      ;
 
                     + JSR.W Options_DoSoundTest            ;83D044|20E5BB  |83BBE5;
                       LDA.L $7E95D4                        ;83D047|AFD4957E|7E95D4;
                       BIT.W #$0080                         ;83D04B|898000  |      ;
                       BEQ +                                ;83D04E|F00D    |83D05D;
                       LDA.W #$0001                         ;83D050|A90100  |      ;
                       STA.L $7E9540                        ;83D053|8F40957E|7E9540;
                       LDA.W #$00FF                         ;83D057|A9FF00  |      ;
                       STA.W $1988                          ;83D05A|8D8819  |831988;
 
                     + RTS                                  ;83D05D|60      |      ;
 
         DATA8_83D05E:
                       db $01,$02,$03,$04,$05,$06,$07,$08   ;83D05E|        |      ;
                       db $09,$0A,$0B,$0C,$0D,$0E,$0F,$0F   ;83D066|        |      ;
                       db $11,$12,$13,$15,$17,$19,$1A,$1B   ;83D06E|        |      ;
                       db $1C,$1D,$1F,$21,$22,$23,$24,$25   ;83D076|        |      ;
                       db $26,$27,$28,$29,$2A,$2B,$2C,$2D   ;83D07E|        |      ;
                       db $2E,$2F,$30,$31,$32,$33,$34,$35   ;83D086|        |      ;
                       db $36,$37,$38,$39,$3A,$3B,$3C,$3D   ;83D08E|        |      ;
                       db $3E,$41,$42,$43,$44,$45,$46,$47   ;83D096|        |      ;
                       db $48,$49,$4A,$4C,$4D,$4E,$4F,$51   ;83D09E|        |      ;
                       db $52,$53,$54,$55,$56,$57,$58,$59   ;83D0A6|        |      ;
                       db $5A,$5B,$5C,$5D,$5E,$5F,$60,$61   ;83D0AE|        |      ;
                       db $62,$63,$64,$65,$66,$67,$68,$69   ;83D0B6|        |      ;
                       db $6A,$6B,$6C,$6D,$6E,$71,$72,$73   ;83D0BE|        |      ;
                       db $74,$75,$76,$77,$78,$79,$7A,$7D   ;83D0C6|        |      ;
                       db $7E,$7F,$81,$82,$83,$84,$85,$86   ;83D0CE|        |      ;
                       db $87,$88,$89,$8A,$8B,$8C,$8D,$8E   ;83D0D6|        |      ;
                       db $8F,$90,$91,$92,$93,$94,$95,$96   ;83D0DE|        |      ;
                       db $97,$98,$99,$9A,$9B,$9C,$9D,$9E   ;83D0E6|        |      ;
                       db $A1,$A2,$A3,$A4,$A5,$A6,$A7,$A8   ;83D0EE|        |      ;
                       db $A9,$AA,$AD,$AE,$AF,$B1,$B2,$B3   ;83D0F6|        |      ;
                       db $B4,$B5,$B6,$B7,$B8,$B9,$BA,$BB   ;83D0FE|        |      ;
                       db $BC,$BD,$BE,$C1,$C2,$C3,$C4,$C5   ;83D106|        |      ;
                       db $C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD   ;83D10E|        |      ;
                       db $D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8   ;83D116|        |      ;
                       db $D9,$DA,$DB,$DC,$DE,$DF,$E1,$E2   ;83D11E|        |      ;
                       db $E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA   ;83D126|        |      ;
                       db $EB,$EC,$EE,$EF,$F1,$F2,$F3,$F4   ;83D12E|        |      ;
                       db $F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC   ;83D136|        |      ;
                       db $FD,$DD,$ED                       ;83D13E|        |      ;
 
         DATA8_83D141:
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D141|        |      ;
                       db $00,$00,$05,$00,$00,$00,$00,$00   ;83D149|        |      ;
                       db $00,$00,$00,$05,$12,$00,$00,$00   ;83D151|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D159|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D161|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D169|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D171|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D179|        |      ;
                       db $00,$00,$00,$00,$00,$00,$21,$00   ;83D181|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D189|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D191|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D199|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1A1|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1A9|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1B1|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1B9|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1C1|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1C9|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83D1D1|        |      ;
                       db $00,$00,$00,$00,$00,$21,$23,$25   ;83D1D9|        |      ;
                       db $27,$29,$2B,$2D,$2F,$31,$33,$35   ;83D1E1|        |      ;
                       db $37,$3C,$39,$22,$24,$26,$28,$2A   ;83D1E9|        |      ;
                       db $2C,$2E,$30,$32,$34,$36,$38,$3D   ;83D1F1|        |      ;
                       db $21,$23,$25,$27,$29,$2B,$2D,$2F   ;83D1F9|        |      ;
                       db $31,$33,$35,$37,$3F,$3A,$22,$24   ;83D201|        |      ;
                       db $26,$28,$2A,$2C,$2E,$30,$32,$34   ;83D209|        |      ;
                       db $36,$38,$12,$12,$00,$00,$00,$00   ;83D211|        |      ;
                       db $00,$00,$00,$00,$3A,$3A,$3A,$00   ;83D219|        |      ;
                       db $00,$3C,$3D                       ;83D221|        |      ;
                       LDA.W #$0001                         ;83D224|A90100  |      ;
                       STA.B $B1                            ;83D227|85B1    |0000B1;
                       LDX.W #$0000                         ;83D229|A20000  |      ;
                       LDA.L Music_Test_Selection,X         ;83D22C|BF42957E|7E9542;
                       LDY.W #$D23C                         ;83D230|A03CD2  |      ;
                       JSR.W CODE_FN_838F98                 ;83D233|20988F  |838F98;
                       STA.L Music_Test_Selection,X         ;83D236|9F42957E|7E9542;
                       BRA +                                ;83D23A|8003    |83D23F;
                       db $00,$24,$00                       ;83D23C|        |      ;
 
                     + JSR.W Options_DoMusicTest            ;83D23F|20F3BB  |83BBF3;
                       LDA.L $7E95D4                        ;83D242|AFD4957E|7E95D4;
                       BIT.W #$0080                         ;83D246|898000  |      ;
                       BEQ +                                ;83D249|F01E    |83D269;
                       LDA.W #$00FE                         ;83D24B|A9FE00  |      ;
                       STA.W $1988                          ;83D24E|8D8819  |831988;
                       LDA.L Music_Test_Selection           ;83D251|AF42957E|7E9542;
                       ASL A                                ;83D255|0A      |      ;
                       TAX                                  ;83D256|AA      |      ;
                       LDA.W DATA8_83D26A,X                 ;83D257|BD6AD2  |83D26A;
                       AND.W #$00FF                         ;83D25A|29FF00  |      ;
                       STA.W $199C                          ;83D25D|8D9C19  |83199C;
                       LDA.W DATA8_83D26B,X                 ;83D260|BD6BD2  |83D26B;
                       AND.W #$00FF                         ;83D263|29FF00  |      ;
                       STA.W $1986                          ;83D266|8D8619  |831986;
 
                     + RTS                                  ;83D269|60      |      ;
 
         DATA8_83D26A:
                       db $01                               ;83D26A|        |      ;
 
         DATA8_83D26B:
                       db $D1,$01,$D2,$02,$D1,$03,$D1,$04   ;83D26B|        |      ;
                       db $D1,$05,$D1,$05,$D2,$06,$D1,$06   ;83D273|        |      ;
                       db $D2,$07,$D1,$08,$D1,$08,$D2,$09   ;83D27B|        |      ;
                       db $D1,$09,$D2,$0A,$D1,$0A,$D2,$0B   ;83D283|        |      ;
                       db $D1,$0B,$D2,$0C,$D1,$0C,$D2,$0D   ;83D28B|        |      ;
                       db $D1,$0D,$D2,$0E,$D1,$0E,$D2,$0F   ;83D293|        |      ;
                       db $D1,$0F,$D2,$10,$D1,$10,$D2,$11   ;83D29B|        |      ;
                       db $D1,$11,$D2,$12,$D1,$12,$D2,$13   ;83D2A3|        |      ;
                       db $D1,$13,$D2,$14,$D1,$04,$D2,$15   ;83D2AB|        |      ;
                       db $D1,$16,$D1,$17,$D1,$18,$D1,$19   ;83D2B3|        |000016;
                       db $D1,$1A,$D1                       ;83D2BB|        |00001A;
                       LDX.W #$0000                         ;83D2BE|A20000  |      ;
                       LDA.L Options_Character_Selection,X  ;83D2C1|BF45937E|7E9345;
                       LDY.W #$D2D1                         ;83D2C5|A0D1D2  |      ;
                       JSR.W CODE_FN_838F98                 ;83D2C8|20988F  |838F98;
                       STA.L Options_Character_Selection,X  ;83D2CB|9F45937E|7E9345;
                       BRA +                                ;83D2CF|8003    |83D2D4;
                       db $00,$0D,$00                       ;83D2D1|        |      ;
 
                     + JSR.W Options_DoCharacter            ;83D2D4|2001BC  |83BC01;
                       RTS                                  ;83D2D7|60      |      ;
                       LDA.L $001A6E                        ;83D2D8|AF6E1A00|001A6E;
                       ASL A                                ;83D2DC|0A      |      ;
                       TAX                                  ;83D2DD|AA      |      ;
                       JSR.W (DATA8_83D2E2,X)               ;83D2DE|FCE2D2  |83D2E2;
                       RTS                                  ;83D2E1|60      |      ;
 
         DATA8_83D2E2:
                       db $EA,$D2,$24,$D3,$6B,$D3,$9F,$D3   ;83D2E2|        |      ;
                       INC.W $1A6E                          ;83D2EA|EE6E1A  |831A6E;
                       LDA.L Options_Selection              ;83D2ED|AF34957E|7E9534;
                       ASL A                                ;83D2F1|0A      |      ;
                       TAX                                  ;83D2F2|AA      |      ;
                       JSR.W (LOOSE_OP_83D2F0,X)            ;83D2F3|FCF0D2  |83D2F0;
                       JSR.W CODE_FN_8388FF                 ;83D2F6|20FF88  |8388FF;
                       RTS                                  ;83D2F9|60      |      ;
                       db $FE,$D2                           ;83D2FA|        |      ;
                       db $11,$D3                           ;83D2FC|        |0000D3;
                       LDY.W #$D306                         ;83D2FE|A006D3  |      ;
                       JSR.W CODE_FN_8388AE                 ;83D301|20AE88  |8388AE;
                       BRA +                                ;83D304|800A    |83D310;
                       db $4D,$00,$90,$00,$9B,$00,$06,$00   ;83D306|        |      ;
                       db $02,$00                           ;83D30E|        |      ;
 
                     + RTS                                  ;83D310|60      |      ;
                       db $A0,$19,$D3,$20,$AE,$88,$80,$0A   ;83D311|        |      ;
                       db $4D,$00,$98,$00,$9B,$00,$06,$00   ;83D319|        |009800;
                       db $01,$00,$60                       ;83D321|        |000000;
                       JSR.W CODE_FN_8388FF                 ;83D324|20FF88  |8388FF;
                       LDA.L $7E998D                        ;83D327|AF8D997E|7E998D;
                       BNE +                                ;83D32B|D01B    |83D348;
                       INC.W $1A6E                          ;83D32D|EE6E1A  |831A6E;
                       LDX.W #$0240                         ;83D330|A24002  |      ;
                       JSR.W CODE_FN_839FEE                 ;83D333|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A2CB                 ;83D336|20CBA2  |83A2CB;
                       LDA.L Options_Selection              ;83D339|AF34957E|7E9534;
                       ASL A                                ;83D33D|0A      |      ;
                       TAX                                  ;83D33E|AA      |      ;
 
          CODE_83D33F:
                       JSR.W (CODE_83D33F,X)                ;83D33F|FC3FD3  |83D33F;
                       JSR.W CODE_FN_838CB5                 ;83D342|20B58C  |838CB5;
                       JSR.W CODE_FN_83A058                 ;83D345|2058A0  |83A058;
 
                     + RTS                                  ;83D348|60      |      ;
                       db $4D,$D3                           ;83D349|        |      ;
                       db $5C,$D3                           ;83D34B|        |7220D3;
                       JSR.W CODE_FN_83A372                 ;83D34D|2072A3  |83A372;
                       LDY.W #$D358                         ;83D350|A058D3  |      ;
                       JSR.W CODE_FN_838C7D                 ;83D353|207D8C  |838C7D;
                       BRA +                                ;83D356|8003    |83D35B;
                       db $48,$78,$07                       ;83D358|        |      ;
 
                     + RTS                                  ;83D35B|60      |      ;
                       db $20,$AE,$A3,$A0,$67,$D3,$20,$7D   ;83D35C|        |83A3AE;
                       db $8C,$80,$03,$48,$88,$07,$60       ;83D364|        |000380;
                       JSR.W CODE_FN_838CB5                 ;83D36B|20B58C  |838CB5;
                       LDA.L $7E998D                        ;83D36E|AF8D997E|7E998D;
                       BNE +                                ;83D372|D012    |83D386;
                       INC.W $1A6E                          ;83D374|EE6E1A  |831A6E;
                       LDA.L Options_Selection              ;83D377|AF34957E|7E9534;
                       ASL A                                ;83D37B|0A      |      ;
                       TAX                                  ;83D37C|AA      |      ;
 
          CODE_83D37D:
                       JSR.W (CODE_83D37D,X)                ;83D37D|FC7DD3  |83D37D;
                       JSR.W CODE_FN_83A058                 ;83D380|2058A0  |83A058;
                       JSR.W CODE_FN_838ABD                 ;83D383|20BD8A  |838ABD;
 
                     + RTS                                  ;83D386|60      |      ;
                       db $8B,$D3                           ;83D387|        |      ;
                       db $95,$D3                           ;83D389|        |0000D3;
                       JSR.W CODE_FN_83A520                 ;83D38B|2020A5  |83A520;
                       JSR.W Options_DoCPUSwitchMenu        ;83D38E|20C2BC  |83BCC2;
                       JSR.W CODE_FN_83A68D                 ;83D391|208DA6  |83A68D;
                       RTS                                  ;83D394|60      |      ;
                       JSR.W CODE_FN_83A53E                 ;83D395|203EA5  |83A53E; unreferenced
                       JSR.W Options_DoEtcMenu              ;83D398|200ABD  |83BD0A;
                       JSR.W CODE_FN_83A699                 ;83D39B|2099A6  |83A699;
                       RTS                                  ;83D39E|60      |      ;
 
                       JSR.W CODE_FN_838ABD                 ;83D39F|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83D3A2|AF8D997E|7E998D;
                       BNE +                                ;83D3A6|D011    |83D3B9;
                       INC.W Game_State_State               ;83D3A8|EEA202  |8302A2;
                       STZ.W $1A6E                          ;83D3AB|9C6E1A  |831A6E;
                       LDA.W #$0000                         ;83D3AE|A90000  |      ;
                       STA.L CPU_Switch_Selection           ;83D3B1|8F36957E|7E9536;
                       STA.L Etc_Selection                  ;83D3B5|8F38957E|7E9538;
 
                     + RTS                                  ;83D3B9|60      |      ;
                       LDA.L $7E95D2                        ;83D3BA|AFD2957E|7E95D2;
                       STA.B $BB                            ;83D3BE|85BB    |0000BB;
                       LDY.W #$D3CC                         ;83D3C0|A0CCD3  |      ;
                       LDA.L CPU_Switch_Selection           ;83D3C3|AF36957E|7E9536;
                       JSR.W CODE_FN_8387F8                 ;83D3C7|20F887  |8387F8;
                       BRA +                                ;83D3CA|8003    |83D3CF;
                       db $03,$F2,$D3                       ;83D3CC|        |      ;
 
                     + LDA.B $00                            ;83D3CF|A500    |000000;
                       STA.L CPU_Switch_Selection           ;83D3D1|8F36957E|7E9536;
                       LDX.W #$0048                         ;83D3D5|A24800  |      ;
                       LDY.W #$006B                         ;83D3D8|A06B00  |      ;
                       LDA.L CPU_Switch_Selection           ;83D3DB|AF36957E|7E9536;
                       JSR.W CODE_FN_8397A1                 ;83D3DF|20A197  |8397A1;
                       LDA.L CPU_Switch_Selection           ;83D3E2|AF36957E|7E9536;
                       ASL A                                ;83D3E6|0A      |      ;
                       TAX                                  ;83D3E7|AA      |      ;
                       JSR.W (DATA8_83D3F7,X)               ;83D3E8|FCF7D3  |83D3F7;
                       JSR.W Options_DoCPUSwitchMenu        ;83D3EB|20C2BC  |83BCC2;
                       JSR.W CODE_FN_83A058                 ;83D3EE|2058A0  |83A058;
                       RTS                                  ;83D3F1|60      |      ;
                       db $2D,$2D,$2D,$2D,$2E               ;83D3F2|        |      ;
 
         DATA8_83D3F7:
                       db $01,$D4,$18,$D4,$2F,$D4,$46,$D4   ;83D3F7|        |      ;
                       db $F1,$D3                           ;83D3FF|        |0000D3;
                       LDX.W #$0000                         ;83D401|A20000  |      ;
                       LDA.L CPU_Selection_1P,X             ;83D404|BF64947E|7E9464;
                       LDY.W #$D414                         ;83D408|A014D4  |      ;
                       JSR.W CODE_FN_838F98                 ;83D40B|20988F  |838F98;
                       STA.L CPU_Selection_1P,X             ;83D40E|9F64947E|7E9464;
                       BRA +                                ;83D412|8003    |83D417;
                       db $00,$02,$00                       ;83D414|        |      ;
 
                     + RTS                                  ;83D417|60      |      ;
                       LDX.W #$0000                         ;83D418|A20000  |      ;
                       LDA.L CPU_Level_Selection_1P,X       ;83D41B|BF68947E|7E9468;
                       LDY.W #$D42B                         ;83D41F|A02BD4  |      ;
                       JSR.W CODE_FN_838F98                 ;83D422|20988F  |838F98;
                       STA.L CPU_Level_Selection_1P,X       ;83D425|9F68947E|7E9468;
                       BRA +                                ;83D429|8003    |83D42E;
                       db $00,$08,$00                       ;83D42B|        |      ;
 
                     + RTS                                  ;83D42E|60      |      ;
                       LDX.W #$0000                         ;83D42F|A20000  |      ;
                       LDA.L CPU_Selection_2P,X             ;83D432|BF66947E|7E9466;
                       LDY.W #$D442                         ;83D436|A042D4  |      ;
                       JSR.W CODE_FN_838F98                 ;83D439|20988F  |838F98;
                       STA.L CPU_Selection_2P,X             ;83D43C|9F66947E|7E9466;
                       BRA +                                ;83D440|8003    |83D445;
                       db $00,$02,$00                       ;83D442|        |      ;
 
                     + RTS                                  ;83D445|60      |      ;
                       LDX.W #$0000                         ;83D446|A20000  |      ;
                       LDA.L CPU_Level_Selection_2P,X       ;83D449|BF6A947E|7E946A;
                       LDY.W #$D459                         ;83D44D|A059D4  |      ;
                       JSR.W CODE_FN_838F98                 ;83D450|20988F  |838F98;
                       STA.L CPU_Level_Selection_2P,X       ;83D453|9F6A947E|7E946A;
                       BRA +                                ;83D457|8003    |83D45C;
                       db $00,$08,$00                       ;83D459|        |      ;
 
                     + RTS                                  ;83D45C|60      |      ;
                       LDA.W $1A6E                          ;83D45D|AD6E1A  |831A6E;
                       ASL A                                ;83D460|0A      |      ;
                       TAX                                  ;83D461|AA      |      ;
                       JSR.W (DATA8_83D466,X)               ;83D462|FC66D4  |83D466;
                       RTS                                  ;83D465|60      |      ;
 
         DATA8_83D466:
                       db $6C,$D4,$9C,$D4,$BE,$D4           ;83D466|        |      ;
                       LDA.W $1A6E                          ;83D46C|AD6E1A  |831A6E;
                       INC A                                ;83D46F|1A      |      ;
                       STA.W $1A6E                          ;83D470|8D6E1A  |831A6E;
                       LDA.L Options_Selection              ;83D473|AF34957E|7E9534;
                       ASL A                                ;83D477|0A      |      ;
                       TAX                                  ;83D478|AA      |      ;
                       JSR.W (LOOSE_OP_83D476,X)            ;83D479|FC76D4  |83D476;
                       JSR.W CODE_FN_838BF1                 ;83D47C|20F18B  |838BF1;
                       RTS                                  ;83D47F|60      |      ;
                       db $84,$D4                           ;83D480|        |      ;
                       db $90,$D4                           ;83D482|        |83D458;
                       LDY.W #$D48C                         ;83D484|A08CD4  |      ;
                       JSR.W CODE_FN_838BBA                 ;83D487|20BA8B  |838BBA;
                       BRA +                                ;83D48A|8003    |83D48F;
                       db $65,$B3,$0C                       ;83D48C|        |      ;
 
                     + RTS                                  ;83D48F|60      |      ;
                       db $A0,$98,$D4,$20,$BA,$8B,$80,$03   ;83D490|        |      ;
                       db $65,$D3,$0C,$60                   ;83D498|        |0000D3;
                       JSR.W CODE_FN_838BF1                 ;83D49C|20F18B  |838BF1;
                       LDA.L $7E998D                        ;83D49F|AF8D997E|7E998D;
                       BNE +                                ;83D4A3|D018    |83D4BD;
                       INC.W $1A6E                          ;83D4A5|EE6E1A  |831A6E;
                       LDX.W #$0300                         ;83D4A8|A20003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83D4AB|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A457                 ;83D4AE|2057A4  |83A457;
                       JSR.W Options_DoOptionMenu           ;83D4B1|200FBC  |83BC0F;
                       JSR.W CODE_FN_83A6C9                 ;83D4B4|20C9A6  |83A6C9;
                       JSR.W CODE_FN_838ABD                 ;83D4B7|20BD8A  |838ABD;
                       JSR.W CODE_FN_83A058                 ;83D4BA|2058A0  |83A058;
 
                     + RTS                                  ;83D4BD|60      |      ;
                       JSR.W CODE_FN_838ABD                 ;83D4BE|20BD8A  |838ABD;
                       LDA.L $7E998D                        ;83D4C1|AF8D997E|7E998D;
                       BNE +                                ;83D4C5|D009    |83D4D0;
                       LDA.W #$0029                         ;83D4C7|A92900  |      ;
                       STA.W Game_State_State               ;83D4CA|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83D4CD|9C6E1A  |831A6E;
 
                     + RTS                                  ;83D4D0|60      |      ;
                       db $AF,$D2,$95,$7E,$85,$BB,$A0,$E3   ;83D4D1|        |7E95D2;
                       db $D4,$AF,$38,$95,$7E,$20,$F8,$87   ;83D4D9|        |0000AF;
                       db $80,$03,$04,$09,$D5,$A5,$00,$8F   ;83D4E1|        |83D4E6;
                       db $38,$95,$7E,$A2,$48,$00,$A0,$6B   ;83D4E9|        |      ;
                       db $00,$AF,$38,$95,$7E,$20,$A1,$97   ;83D4F1|        |      ;
                       db $AF,$38,$95,$7E,$0A,$AA,$FC,$0F   ;83D4F9|        |7E9538;
                       db $D5,$20,$0A,$BD,$20,$58,$A0,$60   ;83D501|        |000020;
                       db $30,$30,$30,$30,$30,$31,$1B,$D5   ;83D509|        |83D53B;
                       db $08,$D5,$33,$D5,$4F,$D5,$6B,$D5   ;83D511|        |      ;
                       db $08,$D5                           ;83D519|        |      ;
                       LDX.W #$0000                         ;83D51B|A20000  |      ;
                       LDA.W Mark_Selection,X               ;83D51E|BD841A  |831A84;
                       LDY.W #$D52C                         ;83D521|A02CD5  |      ;
                       JSR.W CODE_FN_838F98                 ;83D524|20988F  |838F98;
                       STA.W Mark_Selection,X               ;83D527|9D841A  |831A84;
                       BRA +                                ;83D52A|8003    |83D52F;
                       db $00,$02,$00                       ;83D52C|        |      ;
 
                     + JSR.W Options_DoMark                 ;83D52F|20CFBC  |83BCCF;
                       RTS                                  ;83D532|60      |      ;
                       db $A9,$01,$00,$85,$B1,$A2,$00,$00   ;83D533|        |      ;
                       db $BF,$70,$94,$7E,$A0,$4B,$D5,$20   ;83D53B|        |7E9470;
                       db $98,$8F,$9F,$70,$94,$7E,$80,$03   ;83D543|        |      ;
                       db $01,$0B,$00,$60,$A9,$01,$00,$85   ;83D54B|        |00000B;
                       db $B1,$A2,$00,$00,$BF,$72,$94,$7E   ;83D553|        |0000A2;
                       db $A0,$67,$D5,$20,$98,$8F,$9F,$72   ;83D55B|        |      ;
                       db $94,$7E,$80,$03,$01,$0B,$00,$60   ;83D563|        |00007E;
                       db $A9,$01,$00,$85,$B1,$A2,$00,$00   ;83D56B|        |      ;
                       db $BF,$74,$94,$7E,$A0,$83,$D5,$20   ;83D573|        |7E9474;
                       db $98,$8F,$9F,$74,$94,$7E,$80,$03   ;83D57B|        |      ;
                       db $01,$0B,$00,$60,$20,$9D,$84,$A0   ;83D583|        |00000B;
                       db $01,$00,$22,$18,$AF,$80,$90,$06   ;83D58B|        |000000;
                       db $C2,$20,$22,$7F,$D8,$86,$C2,$20   ;83D593|        |      ;
                       db $60                               ;83D59B|        |      ;
                       LDA.W #$FFFF                         ;83D59C|A9FFFF  |      ;
                       STA.W $02A8                          ;83D59F|8DA802  |8302A8;
                       LDA.L $7E95D2                        ;83D5A2|AFD2957E|7E95D2;
                       STA.B $BB                            ;83D5A6|85BB    |0000BB;
                       LDY.W #$D5B4                         ;83D5A8|A0B4D5  |      ;
                       LDA.L HowtoImprove_Selection         ;83D5AB|AF3A957E|7E953A;
                       JSR.W CODE_FN_8387F8                 ;83D5AF|20F887  |8387F8;
                       BRA +                                ;83D5B2|8003    |83D5B7;
                       db $02,$CB,$D5                       ;83D5B4|        |      ;
 
                     + LDA.B $00                            ;83D5B7|A500    |000000;
                       STA.L HowtoImprove_Selection         ;83D5B9|8F3A957E|7E953A;
                       LDX.W #$0038                         ;83D5BD|A23800  |      ;
                       LDY.W #$0053                         ;83D5C0|A05300  |      ;
                       LDA.L HowtoImprove_Selection         ;83D5C3|AF3A957E|7E953A;
                       JSR.W CODE_FN_8397A1                 ;83D5C7|20A197  |8397A1;
                       RTS                                  ;83D5CA|60      |      ;
                       db $0C,$0C,$0C,$34                   ;83D5CB|        |      ;
                       PHP                                  ;83D5CF|08      |      ;
                       PHK                                  ;83D5D0|4B      |      ;
                       PLB                                  ;83D5D1|AB      |      ;
                       REP #$30                             ;83D5D2|C230    |      ;
                       SEP #$20                             ;83D5D4|E220    |      ;
                       JSR.W Menu_MoveBackground            ;83D5D6|207182  |838271;
                       LDA.W $021E                          ;83D5D9|AD1E02  |83021E;
                       STA.W HDMAEN                         ;83D5DC|8D0C42  |83420C;
                       JSL.L CODE_FL_83804A                 ;83D5DF|224A8083|83804A;
                       JSL.L CODE_FL_8380B3                 ;83D5E3|22B38083|8380B3;
                       REP #$20                             ;83D5E7|C220    |      ;
                       JSR.W CODE_FN_838787                 ;83D5E9|208787  |838787;
                       LDA.W $0366                          ;83D5EC|AD6603  |830366;
                       BEQ +                                ;83D5EF|F003    |83D5F4;
                       JSR.W CODE_FN_83A915                 ;83D5F1|2015A9  |83A915;
 
                     + REP #$20                             ;83D5F4|C220    |      ;
                       JSR.W CODE_FN_838667                 ;83D5F6|206786  |838667;
                       LDA.W #$0000                         ;83D5F9|A90000  |      ;
                       STA.L $7E9961                        ;83D5FC|8F61997E|7E9961;
                       STA.L $7E995F                        ;83D600|8F5F997E|7E995F;
                       LDA.W #$0050                         ;83D604|A95000  |      ;
                       STA.L $7E9620                        ;83D607|8F20967E|7E9620;
                       LDA.W #$0000                         ;83D60B|A90000  |      ;
                       STA.L $7E9622                        ;83D60E|8F22967E|7E9622;
                       LDA.W #$0000                         ;83D612|A90000  |      ;
                       JSR.W Move_MenuLipYoshi              ;83D615|200D9F  |839F0D;
                       LDA.W $02A8                          ;83D618|ADA802  |8302A8;
                       ASL A                                ;83D61B|0A      |      ;
                       TAX                                  ;83D61C|AA      |      ;
                       JSR.W (DATA8_83D622,X)               ;83D61D|FC22D6  |83D622;
                       PLP                                  ;83D620|28      |      ;
                       RTL                                  ;83D621|6B      |      ;
 
         DATA8_83D622:
                       db $28,$D6                           ;83D622|        |      ;
                       db $3A,$D6                           ;83D624|        |      ;
                       db $42,$D6                           ;83D626|        |      ;
                       LDA.L $7E38FE                        ;83D628|AFFE387E|7E38FE;
                       ASL A                                ;83D62C|0A      |      ;
                       TAX                                  ;83D62D|AA      |      ;
                       JSR.W (DATA8_83D632,X)               ;83D62E|FC32D6  |83D632;
                       RTS                                  ;83D631|60      |      ;
 
         DATA8_83D632:
                       db $50,$D6,$50,$D6,$E0,$DB,$A7,$EA   ;83D632|        |      ;
                       db $A9,$00,$00,$8F,$3C,$95,$7E,$60   ;83D63A|        |      ;
                       LDA.L $7E38FE                        ;83D642|AFFE387E|7E38FE;
                       ASL A                                ;83D646|0A      |      ;
                       TAX                                  ;83D647|AA      |      ;
                       JSR.W (DATA8_83D64C,X)               ;83D648|FC4CD6  |83D64C;
                       RTS                                  ;83D64B|60      |      ;
 
         DATA8_83D64C:
                       db $71,$F7,$7E,$F0                   ;83D64C|        |      ;
                       LDA.W Game_State_State               ;83D650|ADA202  |8302A2;
                       ASL A                                ;83D653|0A      |      ;
                       TAX                                  ;83D654|AA      |      ;
                       JSR.W (DATA8_83D659,X)               ;83D655|FC59D6  |83D659;
                       RTS                                  ;83D658|60      |      ;
 
         DATA8_83D659:
                       db $6F,$D6,$85,$C0,$BA,$D6,$76,$D8   ;83D659|        |      ;
                       db $65,$D9,$E0,$D9,$FE,$D9,$90,$DA   ;83D661|        |      ;
                       db $3A,$DB,$8D,$DB,$D0,$DB           ;83D669|        |      ;
                       JSR.W CODE_FN_83BE78                 ;83D66F|2078BE  |83BE78;
                       JSL.L CODE_FL_8A87A0                 ;83D672|22A0878A|8A87A0;
                       JSR.W CODE_FN_83BF62                 ;83D676|2062BF  |83BF62;
                       JSL.L CODE_FL_80BB2D                 ;83D679|222DBB80|80BB2D;
                       db $F7,$FE,$92,$F6,$86,$7E           ;83D67D|        |      ;
                       JSR.W CODE_FN_83A88B                 ;83D683|208BA8  |83A88B;
                       JSR.W CODE_FN_83A122                 ;83D686|2022A1  |83A122;
                       INC.W Game_State_State               ;83D689|EEA202  |8302A2;
                       LDA.W #$0002                         ;83D68C|A90200  |      ;
                       STA.W $1A6E                          ;83D68F|8D6E1A  |831A6E;
                       LDA.L $7E38FE                        ;83D692|AFFE387E|7E38FE;
                       CMP.W #$0001                         ;83D696|C90100  |      ;
                       BNE +                                ;83D699|D00C    |83D6A7;
                       LDA.W $02A8                          ;83D69B|ADA802  |8302A8;
                       BNE +                                ;83D69E|D007    |83D6A7;
                       LDA.L $7E94D4                        ;83D6A0|AFD4947E|7E94D4;
                       STA.W Speed_Level                    ;83D6A4|8DB802  |8302B8;
 
                     + LDA.W $02A8                          ;83D6A7|ADA802  |8302A8;
                       CMP.W #$0002                         ;83D6AA|C90200  |      ;
                       BNE +                                ;83D6AD|D00A    |83D6B9;
                       JSL.L CODE_FL_80BB2D                 ;83D6AF|222DBB80|80BB2D;
                       db $94,$DB,$97,$1C,$42,$7E           ;83D6B3|        |      ;
 
                     + RTS                                  ;83D6B9|60      |      ;
                       LDA.W $1A6E                          ;83D6BA|AD6E1A  |831A6E;
                       ASL A                                ;83D6BD|0A      |      ;
                       TAX                                  ;83D6BE|AA      |      ;
                       JSR.W (DATA8_83D6C3,X)               ;83D6BF|FCC3D6  |83D6C3;
                       RTS                                  ;83D6C2|60      |      ;
 
         DATA8_83D6C3:
                       db $D7,$D6,$2B,$D7,$3F,$D7,$5B,$D7   ;83D6C3|        |      ;
                       db $74,$D7,$8D,$D7,$AA,$D7,$CA,$D7   ;83D6CB|        |      ;
                       db $0C,$D8,$5A,$D8                   ;83D6D3|        |      ;
 
       CODE_FN_83D6D7:
                       INC.W $1A6E                          ;83D6D7|EE6E1A  |831A6E;
                       STZ.W Difficulty                     ;83D6DA|9CAA02  |8302AA;
                       LDA.W #$0001                         ;83D6DD|A90100  |      ;
                       STA.W $02B0                          ;83D6E0|8DB002  |8302B0;
                       STA.W Speed_Level                    ;83D6E3|8DB802  |8302B8;
                       STA.L $7E94D4                        ;83D6E6|8FD4947E|7E94D4;
                       LDA.W $02A8                          ;83D6EA|ADA802  |8302A8;
                       CMP.W #$0002                         ;83D6ED|C90200  |      ;
                       BNE +                                ;83D6F0|D006    |83D6F8;
                       LDA.L $7EF1E0                        ;83D6F2|AFE0F17E|7EF1E0;
                       BNE ++                               ;83D6F6|D020    |83D718;
 
                     + STZ.W Character_1P                   ;83D6F8|9CBA02  |8302BA;
                       STZ.W $02BC                          ;83D6FB|9CBC02  |8302BC;
                       STZ.W Handicap_1P                    ;83D6FE|9CB402  |8302B4;
                       STZ.W Handicap_2P                    ;83D701|9CB602  |8302B6;
                       LDA.W #$0005                         ;83D704|A90500  |      ;
                       STA.W Difficulty_1P                  ;83D707|8DAC02  |8302AC;
                       STA.W Difficulty_2P                  ;83D70A|8DAE02  |8302AE;
                       LDA.W #$0000                         ;83D70D|A90000  |      ;
                       STA.L $7E9458                        ;83D710|8F58947E|7E9458;
                       STA.L $7E945A                        ;83D714|8F5A947E|7E945A;
 
                    ++ LDA.W $02A8                          ;83D718|ADA802  |8302A8;
                       CMP.W #$0002                         ;83D71B|C90200  |      ;
                       BNE +                                ;83D71E|D00A    |83D72A;
                       JSL.L CODE_FL_80BB2D                 ;83D720|222DBB80|80BB2D;
                       db $94,$DB,$97,$1C,$42,$7E           ;83D724|        |      ;
 
                     + RTS                                  ;83D72A|60      |      ;
                       INC.W $1A6E                          ;83D72B|EE6E1A  |831A6E;
                       LDA.L $7E38FE                        ;83D72E|AFFE387E|7E38FE;
                       TAX                                  ;83D732|AA      |      ;
                       LDA.W DATA8_83D73D,X                 ;83D733|BD3DD7  |83D73D;
                       AND.W #$00FF                         ;83D736|29FF00  |      ;
                       JSR.W CODE_FN_83A9C7                 ;83D739|20C7A9  |83A9C7;
                       RTS                                  ;83D73C|60      |      ;
 
         DATA8_83D73D:
                       db $08,$18                           ;83D73D|        |      ;
                       INC.W $1A6E                          ;83D73F|EE6E1A  |831A6E;
                       PHB                                  ;83D742|8B      |      ;
                       PHK                                  ;83D743|4B      |      ;
                       PLB                                  ;83D744|AB      |      ;
                       LDY.W #$D74F                         ;83D745|A04FD7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D748|22CAA080|80A0CA;
                       PLB                                  ;83D74C|AB      |      ;
                       BRA +                                ;83D74D|8008    |83D757;
                       db $00,$BD,$7F,$00,$0A,$80,$00,$20   ;83D74F|        |      ;
 
                     + JSR.W CODE_FN_83868B                 ;83D757|208B86  |83868B;
                       RTS                                  ;83D75A|60      |      ;
                       INC.W $1A6E                          ;83D75B|EE6E1A  |831A6E;
                       PHB                                  ;83D75E|8B      |      ;
                       PHK                                  ;83D75F|4B      |      ;
                       PLB                                  ;83D760|AB      |      ;
                       LDY.W #$D76B                         ;83D761|A06BD7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D764|22CAA080|80A0CA;
                       PLB                                  ;83D768|AB      |      ;
                       BRA +                                ;83D769|8008    |83D773;
                       db $00,$C7,$7F,$00,$0A,$80,$00,$25   ;83D76B|        |      ;
 
                     + RTS                                  ;83D773|60      |      ;
                       INC.W $1A6E                          ;83D774|EE6E1A  |831A6E;
                       PHB                                  ;83D777|8B      |      ;
                       PHK                                  ;83D778|4B      |      ;
                       PLB                                  ;83D779|AB      |      ;
                       LDY.W #$D784                         ;83D77A|A084D7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D77D|22CAA080|80A0CA;
                       PLB                                  ;83D781|AB      |      ;
                       BRA +                                ;83D782|8008    |83D78C;
                       db $00,$D1,$7F,$00,$0C,$80,$00,$2A   ;83D784|        |      ;
 
                     + RTS                                  ;83D78C|60      |      ;
                       INC.W $1A6E                          ;83D78D|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83D794                 ;83D790|2094D7  |83D794;
                       RTS                                  ;83D793|60      |      ;
 
       CODE_FN_83D794:
                       PHB                                  ;83D794|8B      |      ;
                       PHK                                  ;83D795|4B      |      ;
                       PLB                                  ;83D796|AB      |      ;
                       LDY.W #$D7A1                         ;83D797|A0A1D7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D79A|22CAA080|80A0CA;
                       PLB                                  ;83D79E|AB      |      ;
                       BRA +                                ;83D79F|8008    |83D7A9;
                       db $00,$85,$7F,$00,$0C,$80,$00,$01   ;83D7A1|        |      ;
 
                     + RTS                                  ;83D7A9|60      |      ;
                       INC.W $1A6E                          ;83D7AA|EE6E1A  |831A6E;
                       JSL.L CODE_FL_80BB2D                 ;83D7AD|222DBB80|80BB2D;
                       db $79,$9E,$93,$00,$20,$7E           ;83D7B1|        |      ;
                       JSR.W CODE_FN_83AB29                 ;83D7B7|2029AB  |83AB29;
                       JSR.W CODE_FN_83AB3E                 ;83D7BA|203EAB  |83AB3E;
                       JSR.W CODE_FN_83AA66                 ;83D7BD|2066AA  |83AA66;
                       JSR.W CODE_FN_83AA6D                 ;83D7C0|206DAA  |83AA6D;
                       JSR.W CODE_FN_83AAA9                 ;83D7C3|20A9AA  |83AAA9;
                       JSR.W CODE_FN_83A001                 ;83D7C6|2001A0  |83A001;
                       RTS                                  ;83D7C9|60      |      ;
                       INC.W $1A6E                          ;83D7CA|EE6E1A  |831A6E;
                       LDY.W #$D7D5                         ;83D7CD|A0D5D7  |      ;
                       JSR.W CODE_FN_838A8A                 ;83D7D0|208A8A  |838A8A;
                       BRA +                                ;83D7D3|8003    |83D7D8;
                       db $38,$68,$08                       ;83D7D5|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83D7D8|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83D7DB|20BD8A  |838ABD;
                       JSR.W CODE_FN_83AAB3                 ;83D7DE|20B3AA  |83AAB3;
                       PHB                                  ;83D7E1|8B      |      ;
                       PHK                                  ;83D7E2|4B      |      ;
                       PLB                                  ;83D7E3|AB      |      ;
                       LDY.W #$D7EE                         ;83D7E4|A0EED7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D7E7|22CAA080|80A0CA;
                       PLB                                  ;83D7EB|AB      |      ;
                       BRA +                                ;83D7EC|8008    |83D7F6;
                       db $80,$21,$7E,$00,$02,$80,$C0,$68   ;83D7EE|        |      ;
 
                     + PHB                                  ;83D7F6|8B      |      ;
                       PHK                                  ;83D7F7|4B      |      ;
                       PLB                                  ;83D7F8|AB      |      ;
                       LDY.W #$D803                         ;83D7F9|A003D8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D7FC|22CAA080|80A0CA;
                       PLB                                  ;83D800|AB      |      ;
                       BRA +                                ;83D801|8008    |83D80B;
                       db $80,$31,$7E,$00,$02,$80,$C0,$78   ;83D803|        |      ;
 
                     + RTS                                  ;83D80B|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83D80C|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83D80F|20BD8A  |838ABD;
                       JSR.W CODE_FN_83AAB3                 ;83D812|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839867                 ;83D815|206798  |839867;
                       LDA.L $7E998D                        ;83D818|AF8D997E|7E998D;
                       BNE +                                ;83D81C|D03B    |83D859;
                       INC.W $1A6E                          ;83D81E|EE6E1A  |831A6E;
                       LDY.W #$D829                         ;83D821|A029D8  |      ;
                       JSR.W CODE_FN_838A8A                 ;83D824|208A8A  |838A8A;
                       BRA ++                               ;83D827|8003    |83D82C;
                       db $78,$A0,$08                       ;83D829|        |      ;
 
                    ++ JSR.W CODE_FN_838ABD                 ;83D82C|20BD8A  |838ABD;
                       PHB                                  ;83D82F|8B      |      ;
                       PHK                                  ;83D830|4B      |      ;
                       PLB                                  ;83D831|AB      |      ;
                       LDY.W #$D83C                         ;83D832|A03CD8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D835|22CAA080|80A0CA;
                       PLB                                  ;83D839|AB      |      ;
                       BRA ++                               ;83D83A|8008    |83D844;
                       db $80,$23,$7E,$00,$02,$80,$C0,$69   ;83D83C|        |      ;
 
                    ++ PHB                                  ;83D844|8B      |      ;
                       PHK                                  ;83D845|4B      |      ;
                       PLB                                  ;83D846|AB      |      ;
                       LDY.W #$D851                         ;83D847|A051D8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83D84A|22CAA080|80A0CA;
                       PLB                                  ;83D84E|AB      |      ;
                       BRA +                                ;83D84F|8008    |83D859;
                       db $80,$33,$7E,$00,$02,$80,$C0,$79   ;83D851|        |      ;
 
                     + RTS                                  ;83D859|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83D85A|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83D85D|20BD8A  |838ABD;
                       JSR.W CODE_FN_83AAB3                 ;83D860|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839867                 ;83D863|206798  |839867;
                       LDA.L $7E998D                        ;83D866|AF8D997E|7E998D;
                       BNE +                                ;83D86A|D009    |83D875;
                       JSR.W CODE_FN_838193                 ;83D86C|209381  |838193;
                       INC.W Game_State_State               ;83D86F|EEA202  |8302A2;
                       STZ.W $1A6E                          ;83D872|9C6E1A  |831A6E;
 
                     + RTS                                  ;83D875|60      |      ;
                       LDA.W $1A6E                          ;83D876|AD6E1A  |831A6E;
                       ASL A                                ;83D879|0A      |      ;
                       TAX                                  ;83D87A|AA      |      ;
                       JSR.W (DATA8_83D87F,X)               ;83D87B|FC7FD8  |83D87F;
                       RTS                                  ;83D87E|60      |      ;
 
         DATA8_83D87F:
                       db $83,$D8,$FE,$D8                   ;83D87F|        |      ;
                       LDA.W #$0001                         ;83D883|A90100  |      ;
                       STA.B $B1                            ;83D886|85B1    |0000B1;
                       LDA.W #$0000                         ;83D888|A90000  |      ;
                       STA.L $7E95EE                        ;83D88B|8FEE957E|7E95EE;
                       LDX.W #$0000                         ;83D88F|A20000  |      ;
                       LDA.W Speed_Level                    ;83D892|ADB802  |8302B8;
                       PHA                                  ;83D895|48      |      ;
                       LDA.W Speed_Level,X                  ;83D896|BDB802  |8302B8;
                       LDY.W #$D8A4                         ;83D899|A0A4D8  |      ;
                       JSR.W CODE_FN_838F98                 ;83D89C|20988F  |838F98;
                       STA.W Speed_Level,X                  ;83D89F|9DB802  |8302B8;
                       BRA +                                ;83D8A2|8003    |83D8A7;
                       db $01,$64,$00                       ;83D8A4|        |      ;
 
                     + PLA                                  ;83D8A7|68      |      ;
                       CMP.W Speed_Level                    ;83D8A8|CDB802  |8302B8;
                       BEQ +                                ;83D8AB|F006    |83D8B3;
                       LDA.W #$004C                         ;83D8AD|A94C00  |      ;
                       STA.W $1988                          ;83D8B0|8D8819  |831988;
 
                     + LDA.B $BB                            ;83D8B3|A5BB    |0000BB;
                       BIT.W #$0400                         ;83D8B5|890004  |      ;
                       BNE +                                ;83D8B8|D007    |83D8C1;
                       LDA.B $B7                            ;83D8BA|A5B7    |0000B7;
                       BIT.W #$1080                         ;83D8BC|898010  |      ;
                       BEQ ++                               ;83D8BF|F019    |83D8DA;
 
                     + JSR.W CODE_FN_8384CD                 ;83D8C1|20CD84  |8384CD;
                       JSR.W CODE_FN_8384DB                 ;83D8C4|20DB84  |8384DB;
                       INC.W $1A6E                          ;83D8C7|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83AA9F                 ;83D8CA|209FAA  |83AA9F;
                       JSR.W CODE_FN_83AA86                 ;83D8CD|2086AA  |83AA86;
                       JSR.W CODE_FN_83AAB3                 ;83D8D0|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839861                 ;83D8D3|206198  |839861;
                       JSR.W CODE_FN_83A058                 ;83D8D6|2058A0  |83A058;
                       RTS                                  ;83D8D9|60      |      ;
 
                    ++ BIT.W #$8000                         ;83D8DA|890080  |      ;
                       BEQ +                                ;83D8DD|F00F    |83D8EE;
                       JSR.W CODE_FN_8384D4                 ;83D8DF|20D484  |8384D4;
                       JSR.W CODE_FN_8384DB                 ;83D8E2|20DB84  |8384DB;
                       LDA.W #$0004                         ;83D8E5|A90400  |      ;
                       STA.W Game_State_State               ;83D8E8|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83D8EB|9C6E1A  |831A6E;
 
                     + JSR.W CODE_FN_83AAB3                 ;83D8EE|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839861                 ;83D8F1|206198  |839861;
                       JSR.W CODE_FN_839847                 ;83D8F4|204798  |839847;
                       JSR.W CODE_FN_83AB29                 ;83D8F7|2029AB  |83AB29;
                       JSR.W CODE_FN_83A02C                 ;83D8FA|202CA0  |83A02C;
                       RTS                                  ;83D8FD|60      |      ;
                       LDA.W #$0003                         ;83D8FE|A90300  |      ;
                       STA.B $B1                            ;83D901|85B1    |0000B1;
                       LDX.W #$0000                         ;83D903|A20000  |      ;
                       LDA.W Difficulty,X                   ;83D906|BDAA02  |8302AA;
                       LDY.W #$D914                         ;83D909|A014D9  |      ;
                       JSR.W CODE_FN_838F98                 ;83D90C|20988F  |838F98;
                       STA.W Difficulty,X                   ;83D90F|9DAA02  |8302AA;
                       BRA +                                ;83D912|8003    |83D917;
                       db $00,$03,$00                       ;83D914|        |      ;
 
                     + LDA.B $BB                            ;83D917|A5BB    |0000BB;
                       BIT.W #$0800                         ;83D919|890008  |      ;
                       BNE +                                ;83D91C|D01E    |83D93C;
                       LDA.B $B7                            ;83D91E|A5B7    |0000B7;
                       BIT.W #$1080                         ;83D920|898010  |      ;
                       BEQ ++                               ;83D923|F012    |83D937;
                       JSR.W CODE_FN_8384CD                 ;83D925|20CD84  |8384CD;
                       JSR.W CODE_FN_8384DB                 ;83D928|20DB84  |8384DB;
                       LDA.W #$0005                         ;83D92B|A90500  |      ;
                       STA.W Game_State_State               ;83D92E|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83D931|9C6E1A  |831A6E;
                       JMP.W CODE_JP_83D955                 ;83D934|4C55D9  |83D955;
 
                    ++ BIT.W #$8000                         ;83D937|890080  |      ;
                       BEQ CODE_JP_83D955                   ;83D93A|F019    |83D955;
 
                     + JSR.W CODE_FN_8384D4                 ;83D93C|20D484  |8384D4;
                       JSR.W CODE_FN_8384DB                 ;83D93F|20DB84  |8384DB;
                       DEC.W $1A6E                          ;83D942|CE6E1A  |831A6E;
                       JSR.W CODE_FN_83AA6D                 ;83D945|206DAA  |83AA6D;
                       JSR.W CODE_FN_83AAA9                 ;83D948|20A9AA  |83AAA9;
                       JSR.W CODE_FN_83AAB3                 ;83D94B|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839861                 ;83D94E|206198  |839861;
                       JSR.W CODE_FN_83A058                 ;83D951|2058A0  |83A058;
                       RTS                                  ;83D954|60      |      ;
 
       CODE_JP_83D955:
                       JSR.W CODE_FN_83AAB3                 ;83D955|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839861                 ;83D958|206198  |839861;
                       JSR.W CODE_FN_83987A                 ;83D95B|207A98  |83987A;
                       JSR.W CODE_FN_83AB3E                 ;83D95E|203EAB  |83AB3E;
                       JSR.W CODE_FN_83A02C                 ;83D961|202CA0  |83A02C;
                       RTS                                  ;83D964|60      |      ;
                       LDA.W $1A6E                          ;83D965|AD6E1A  |831A6E;
                       ASL A                                ;83D968|0A      |      ;
                       TAX                                  ;83D969|AA      |      ;
                       JSR.W (DATA8_83D96E,X)               ;83D96A|FC6ED9  |83D96E;
                       RTS                                  ;83D96D|60      |      ;
 
         DATA8_83D96E:
                       db $76,$D9,$89,$D9,$AE,$D9,$CA,$D9   ;83D96E|        |      ;
                       INC.W $1A6E                          ;83D976|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A759                 ;83D979|2059A7  |83A759;
                       JSR.W CODE_FN_8380FC                 ;83D97C|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83D97F|20F18B  |838BF1;
                       JSR.W CODE_FN_83AAB3                 ;83D982|20B3AA  |83AAB3;
                       JSR.W CODE_FN_839861                 ;83D985|206198  |839861;
                       RTS                                  ;83D988|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83D989|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83D98C|20F18B  |838BF1;
                       JSR.W CODE_FN_83AAB3                 ;83D98F|20B3AA  |83AAB3;
                       LDA.L $7E998D                        ;83D992|AF8D997E|7E998D;
                       BNE +                                ;83D996|D015    |83D9AD;
                       INC.W $1A6E                          ;83D998|EE6E1A  |831A6E;
                       LDX.W #$0380                         ;83D99B|A28003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83D99E|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A74D                 ;83D9A1|204DA7  |83A74D;
                       JSR.W CODE_FN_8380FC                 ;83D9A4|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83D9A7|20F18B  |838BF1;
                       JSR.W CODE_FN_83A058                 ;83D9AA|2058A0  |83A058;
 
                     + RTS                                  ;83D9AD|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83D9AE|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83D9B1|20F18B  |838BF1;
                       JSR.W CODE_FN_83AAB3                 ;83D9B4|20B3AA  |83AAB3;
                       LDA.L $7E998D                        ;83D9B7|AF8D997E|7E998D;
                       BNE +                                ;83D9BB|D00C    |83D9C9;
                       INC.W $1A6E                          ;83D9BD|EE6E1A  |831A6E;
                       LDX.W #$0180                         ;83D9C0|A28001  |      ;
                       JSR.W CODE_FN_839FEE                 ;83D9C3|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A058                 ;83D9C6|2058A0  |83A058;
 
                     + RTS                                  ;83D9C9|60      |      ;
 
       CODE_FN_83D9CA:
                       JSR.W CODE_FN_838193                 ;83D9CA|209381  |838193;
                       DEC.W Game_State                     ;83D9CD|CEA002  |8302A0;
                       LDA.W #$0007                         ;83D9D0|A90700  |      ;
                       STA.W Game_State_State               ;83D9D3|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83D9D6|9C6E1A  |831A6E;
                       JSR.W CODE_FN_839FB6                 ;83D9D9|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83D9DC|2058A0  |83A058;
                       RTS                                  ;83D9DF|60      |      ;
                       LDA.W $1A6E                          ;83D9E0|AD6E1A  |831A6E;
                       ASL A                                ;83D9E3|0A      |      ;
                       TAX                                  ;83D9E4|AA      |      ;
                       JSR.W (DATA8_83D9E9,X)               ;83D9E5|FCE9D9  |83D9E9;
                       RTS                                  ;83D9E8|60      |      ;
 
         DATA8_83D9E9:
                       db $76,$D9,$89,$D9,$AE,$D9,$F1,$D9   ;83D9E9|        |      ;
                       JSR.W CODE_FN_83D9CA                 ;83D9F1|20CAD9  |83D9CA;
                       INC.W Game_State                     ;83D9F4|EEA002  |8302A0;
                       LDA.W #$0006                         ;83D9F7|A90600  |      ;
                       STA.W Game_State_State               ;83D9FA|8DA202  |8302A2;
                       RTS                                  ;83D9FD|60      |      ;
                       LDA.W $1A6E                          ;83D9FE|AD6E1A  |831A6E;
                       ASL A                                ;83DA01|0A      |      ;
                       TAX                                  ;83DA02|AA      |      ;
                       JSR.W (DATA8_83DA07,X)               ;83DA03|FC07DA  |83DA07;
                       RTS                                  ;83DA06|60      |      ;
 
         DATA8_83DA07:
                       db $0D,$DA,$2A,$DA,$44,$DA           ;83DA07|        |      ;
                       INC.W $1A6E                          ;83DA0D|EE6E1A  |831A6E;
                       JSL.L CODE_FL_80BB2D                 ;83DA10|222DBB80|80BB2D;
                       db $1C,$A0,$93,$00,$20,$7E           ;83DA14|        |      ;
                       JSR.W CODE_FN_83AC1D                 ;83DA1A|201DAC  |83AC1D;
                       JSR.W CODE_FN_83AC27                 ;83DA1D|2027AC  |83AC27;
                       JSR.W CODE_FN_83AC93                 ;83DA20|2093AC  |83AC93;
                       JSR.W CODE_FN_83A001                 ;83DA23|2001A0  |83A001;
                       JSR.W CODE_FN_83AA41                 ;83DA26|2041AA  |83AA41;
                       RTS                                  ;83DA29|60      |      ;
                       INC.W $1A6E                          ;83DA2A|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A669                 ;83DA2D|2069A6  |83A669;
                       JSR.W CODE_FN_8380FC                 ;83DA30|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83DA33|20BD8A  |838ABD;
                       LDA.W #$0001                         ;83DA36|A90100  |      ;
                       STA.L $7E995F                        ;83DA39|8F5F997E|7E995F;
                       JSR.W CODE_FN_8394B6                 ;83DA3D|20B694  |8394B6;
                       JSR.W CODE_FN_83A058                 ;83DA40|2058A0  |83A058;
                       RTS                                  ;83DA43|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83DA44|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83DA47|20BD8A  |838ABD;
                       JSR.W CODE_FN_8394B6                 ;83DA4A|20B694  |8394B6;
                       LDA.L $7E998D                        ;83DA4D|AF8D997E|7E998D;
                       BNE +                                ;83DA51|D03C    |83DA8F;
                       JSR.W CODE_FN_838193                 ;83DA53|209381  |838193;
                       INC.W Game_State_State               ;83DA56|EEA202  |8302A2;
                       LDA.W #$0000                         ;83DA59|A90000  |      ;
                       STA.W $1A6E                          ;83DA5C|8D6E1A  |831A6E;
                       STA.L $7E9610                        ;83DA5F|8F10967E|7E9610;
                       LDA.W Character_1P                   ;83DA63|ADBA02  |8302BA;
                       LDX.W #$0003                         ;83DA66|A20300  |      ;
                       JSR.W CODE_FN_838562                 ;83DA69|206285  |838562;
                       STA.L $7E96E7                        ;83DA6C|8FE7967E|7E96E7;
                       STA.L $7E96EB                        ;83DA70|8FEB967E|7E96EB;
                       LDA.B $00                            ;83DA74|A500    |000000;
                       STA.L $7E96F5                        ;83DA76|8FF5967E|7E96F5;
                       LDA.W #$0002                         ;83DA7A|A90200  |      ;
                       STA.L $7E95D8                        ;83DA7D|8FD8957E|7E95D8;
                       LDA.W #$0002                         ;83DA81|A90200  |      ;
                       STA.L $7E95DA                        ;83DA84|8FDA957E|7E95DA;
                       LDA.W #$0001                         ;83DA88|A90100  |      ;
                       STA.L $7E95E8                        ;83DA8B|8FE8957E|7E95E8;
 
                     + RTS                                  ;83DA8F|60      |      ;
                       JSR.W CODE_FN_83DB28                 ;83DA90|2028DB  |83DB28;
                       LDX.W #$0000                         ;83DA93|A20000  |      ;
                       JSR.W CODE_FN_838E7D                 ;83DA96|207D8E  |838E7D;
                       LDA.L $7E95EA                        ;83DA99|AFEA957E|7E95EA;
                       BEQ +                                ;83DA9D|F003    |83DAA2;
                       JSR.W CODE_FN_8384F3                 ;83DA9F|20F384  |8384F3;
 
                     + LDA.B $B7                            ;83DAA2|A5B7    |0000B7;
                       BIT.W #$1080                         ;83DAA4|898010  |      ;
                       BEQ +                                ;83DAA7|F05E    |83DB07;
                       JSR.W CODE_FN_8384CD                 ;83DAA9|20CD84  |8384CD;
                       JSR.W CODE_FN_8384DB                 ;83DAAC|20DB84  |8384DB;
                       LDA.W #$0010                         ;83DAAF|A91000  |      ;
                       STA.L $7E9610                        ;83DAB2|8F10967E|7E9610;
                       LDA.B $B7                            ;83DAB6|A5B7    |0000B7;
                       BIT.W #$1000                         ;83DAB8|890010  |      ;
                       BNE ++                               ;83DABB|D00E    |83DACB;
                       LDA.W #$0050                         ;83DABD|A95000  |      ;
                       STA.W $1A6E                          ;83DAC0|8D6E1A  |831A6E;
                       LDA.W #$0009                         ;83DAC3|A90900  |      ;
                       STA.W Game_State_State               ;83DAC6|8DA202  |8302A2;
                       BRA +++                              ;83DAC9|8010    |83DADB;
 
                    ++ LDA.W #$0000                         ;83DACB|A90000  |      ;
                       STA.W $1A6E                          ;83DACE|8D6E1A  |831A6E;
                       STA.L $7E9610                        ;83DAD1|8F10967E|7E9610;
                       LDA.W #$000A                         ;83DAD5|A90A00  |      ;
                       STA.W Game_State_State               ;83DAD8|8DA202  |8302A2;
 
                   +++ LDA.W Speed_Level                    ;83DADB|ADB802  |8302B8;
                       STA.W $02B0                          ;83DADE|8DB002  |8302B0;
                       LDA.L BALL_Active                    ;83DAE1|AF60947E|7E9460;
                       BNE ++                               ;83DAE5|D00E    |83DAF5;
                       LDA.W $02B0                          ;83DAE7|ADB002  |8302B0;
                       CMP.W #$0032                         ;83DAEA|C93200  |      ;
                       BMI ++                               ;83DAED|3006    |83DAF5;
                       db $A9,$32,$00,$8D,$B0,$02           ;83DAEF|        |      ;
 
                    ++ LDA.L $7E38FE                        ;83DAF5|AFFE387E|7E38FE;
                       CMP.W #$0001                         ;83DAF9|C90100  |      ;
                       BNE ++                               ;83DAFC|D01A    |83DB18;
                       LDA.W Speed_Level                    ;83DAFE|ADB802  |8302B8;
                       STA.L $7E94D4                        ;83DB01|8FD4947E|7E94D4;
                       BRA ++                               ;83DB05|8011    |83DB18;
 
                     + BIT.W #$8000                         ;83DB07|890080  |      ;
                       BEQ ++                               ;83DB0A|F00C    |83DB18;
                       JSR.W CODE_FN_8384D4                 ;83DB0C|20D484  |8384D4;
                       JSR.W CODE_FN_8384F3                 ;83DB0F|20F384  |8384F3;
                       LDA.W #$0008                         ;83DB12|A90800  |      ;
                       STA.W Game_State_State               ;83DB15|8DA202  |8302A2;
 
                    ++ JSR.W CODE_FN_83989D                 ;83DB18|209D98  |83989D;
                       JSR.W CODE_FN_83AC75                 ;83DB1B|2075AC  |83AC75;
                       JSR.W CODE_FN_8394B6                 ;83DB1E|20B694  |8394B6;
                       JSR.W CODE_FN_8394D1                 ;83DB21|20D194  |8394D1;
                       JSR.W CODE_FN_83A058                 ;83DB24|2058A0  |83A058;
                       RTS                                  ;83DB27|60      |      ;
 
       CODE_FN_83DB28:
                       LDA.L $7E96F5                        ;83DB28|AFF5967E|7E96F5;
                       BEQ +                                ;83DB2C|F003    |83DB31;
                       LDA.W #$0003                         ;83DB2E|A90300  |      ;
 
                     + CLC                                  ;83DB31|18      |      ;
                       ADC.L $7E96E7                        ;83DB32|6FE7967E|7E96E7;
                       STA.W Character_1P                   ;83DB36|8DBA02  |8302BA;
                       RTS                                  ;83DB39|60      |      ;
                       LDA.W $1A6E                          ;83DB3A|AD6E1A  |831A6E;
                       ASL A                                ;83DB3D|0A      |      ;
                       TAX                                  ;83DB3E|AA      |      ;
                       JSR.W (DATA8_83DB43,X)               ;83DB3F|FC43DB  |83DB43;
                       RTS                                  ;83DB42|60      |      ;
 
         DATA8_83DB43:
                       db $47,$DB,$64,$DB                   ;83DB43|        |      ;
                       INC.W $1A6E                          ;83DB47|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83AC93                 ;83DB4A|2093AC  |83AC93;
                       LDA.W #$0001                         ;83DB4D|A90100  |      ;
                       STA.L $7E995F                        ;83DB50|8F5F997E|7E995F;
                       JSR.W CODE_FN_8394B6                 ;83DB54|20B694  |8394B6;
                       JSR.W CODE_FN_8394D1                 ;83DB57|20D194  |8394D1;
                       JSR.W CODE_FN_83A765                 ;83DB5A|2065A7  |83A765;
                       JSR.W CODE_FN_838BF1                 ;83DB5D|20F18B  |838BF1;
                       JSR.W CODE_FN_83A042                 ;83DB60|2042A0  |83A042;
                       RTS                                  ;83DB63|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83DB64|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83DB67|20F18B  |838BF1;
                       LDA.W #$0001                         ;83DB6A|A90100  |      ;
                       STA.L $7E995F                        ;83DB6D|8F5F997E|7E995F;
                       JSR.W CODE_FN_8394B6                 ;83DB71|20B694  |8394B6;
                       LDA.L $7E998D                        ;83DB74|AF8D997E|7E998D;
                       BNE +                                ;83DB78|D012    |83DB8C;
                       LDA.W #$0001                         ;83DB7A|A90100  |      ;
                       STA.W $1A6E                          ;83DB7D|8D6E1A  |831A6E;
                       LDA.W #$0002                         ;83DB80|A90200  |      ;
                       STA.W Game_State_State               ;83DB83|8DA202  |8302A2;
                       JSR.W CODE_FN_839FB6                 ;83DB86|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83DB89|2058A0  |83A058;
 
                     + RTS                                  ;83DB8C|60      |      ;
                       LDA.B $B7                            ;83DB8D|A5B7    |0000B7;
                       BIT.W #$1080                         ;83DB8F|898010  |      ;
                       BNE +                                ;83DB92|D00A    |83DB9E;
                       BIT.W #$8000                         ;83DB94|890080  |      ;
                       BNE UNREACH_83DBB0                   ;83DB97|D017    |83DBB0;
                       DEC.W $1A6E                          ;83DB99|CE6E1A  |831A6E;
                       BNE ++                               ;83DB9C|D025    |83DBC3;
 
                     + LDA.W #$000A                         ;83DB9E|A90A00  |      ;
                       STA.W Game_State_State               ;83DBA1|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83DBA4|9C6E1A  |831A6E;
                       LDA.W #$0001                         ;83DBA7|A90100  |      ;
                       STA.L $7E9610                        ;83DBAA|8F10967E|7E9610;
                       BRA ++                               ;83DBAE|8013    |83DBC3;
 
       UNREACH_83DBB0:
                       db $20,$D4,$84,$A9,$07,$00,$8D,$A2   ;83DBB0|        |8384D4;
                       db $02,$A9,$00,$00,$8D,$6E,$1A,$8F   ;83DBB8|        |      ;
                       db $10,$96,$7E                       ;83DBC0|        |83DB58;
 
                    ++ JSR.W CODE_FN_83989D                 ;83DBC3|209D98  |83989D;
                       JSR.W CODE_FN_8394B6                 ;83DBC6|20B694  |8394B6;
                       JSR.W CODE_FN_8394D1                 ;83DBC9|20D194  |8394D1;
                       JSR.W CODE_FN_83A058                 ;83DBCC|2058A0  |83A058;
                       RTS                                  ;83DBCF|60      |      ;
                       JSR.W CODE_FN_83BE0E                 ;83DBD0|200EBE  |83BE0E;
                       JSR.W CODE_FN_83989D                 ;83DBD3|209D98  |83989D;
                       JSR.W CODE_FN_8394B6                 ;83DBD6|20B694  |8394B6;
                       JSR.W CODE_FN_8394D1                 ;83DBD9|20D194  |8394D1;
                       JSR.W CODE_FN_83A058                 ;83DBDC|2058A0  |83A058;
                       RTS                                  ;83DBDF|60      |      ;
                       LDA.L Game_State_State-$7E0000       ;83DBE0|AFA20200|0002A2;
                       ASL A                                ;83DBE4|0A      |      ;
                       TAX                                  ;83DBE5|AA      |      ;
                       JSR.W (DATA8_83DBEA,X)               ;83DBE6|FCEADB  |83DBEA;
                       RTS                                  ;83DBE9|60      |      ;
 
         DATA8_83DBEA:
                       db $02,$DC                           ;83DBEA|        |      ;
                       db $BC,$DD                           ;83DBEC|        |006CDD;
                       db $6C,$E0,$F8,$DD,$AE,$DE,$99,$E2   ;83DBEE|        |      ;
                       db $D5,$E2,$3A,$E5,$55,$E6,$1A,$E8   ;83DBF6|        |      ;
                       db $63,$E9                           ;83DBFE|        |0000E9;
                       db $64,$E9                           ;83DC00|        |      ;
                       JSR.W CODE_FN_83BE78                 ;83DC02|2078BE  |83BE78;
                       JSL.L CODE_FL_8A87A0                 ;83DC05|22A0878A|8A87A0;
                       JSR.W CODE_FN_83BF62                 ;83DC09|2062BF  |83BF62;
                       LDA.L $7E94E6                        ;83DC0C|AFE6947E|7E94E6;
                       STA.L $7E961E                        ;83DC10|8F1E967E|7E961E;
                       LDA.W #$0000                         ;83DC14|A90000  |      ;
                       STA.L StageClear_MenuSelection       ;83DC17|8F2E957E|7E952E;
                       JSR.W CODE_FN_838481                 ;83DC1B|208184  |838481;
                       JSR.W CODE_FN_83846B                 ;83DC1E|206B84  |83846B;
                       LDA.W $0342                          ;83DC21|AD4203  |830342;
                       INC A                                ;83DC24|1A      |      ;
                       CMP.W StageClear_LevelLo             ;83DC25|CD3C03  |83033C;
                       BEQ +                                ;83DC28|F006    |83DC30;
                       LDA.W #$0001                         ;83DC2A|A90100  |      ;
                       STA.W StageClear_LevelHi             ;83DC2D|8D3E03  |00033E;
 
                     + LDA.W #$0000                         ;83DC30|A90000  |      ;
                       STA.L $7E96E5                        ;83DC33|8FE5967E|7E96E5;
                       STA.L $7E96E3                        ;83DC37|8FE3967E|7E96E3;
                       JSR.W CODE_FN_83AA55                 ;83DC3B|2055AA  |83AA55;
                       LDA.W #$0000                         ;83DC3E|A90000  |      ;
                       JSL.L CODE_FL_80A1E0                 ;83DC41|22E0A180|80A1E0;
                       JSR.W CODE_FN_83ACF7                 ;83DC45|20F7AC  |83ACF7;
                       PHB                                  ;83DC48|8B      |      ;
                       PHK                                  ;83DC49|4B      |      ;
                       PLB                                  ;83DC4A|AB      |      ;
                       LDY.W #$DC55                         ;83DC4B|A055DC  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83DC4E|22CAA080|80A0CA;
                       PLB                                  ;83DC52|AB      |      ;
                       BRA +                                ;83DC53|8008    |83DC5D;
                       db $00,$BD,$7F,$00,$20,$80,$00,$20   ;83DC55|        |      ;
 
                     + JSR.W CODE_FN_83D794                 ;83DC5D|2094D7  |83D794;
                       JSR.W CODE_FN_83868B                 ;83DC60|208B86  |83868B;
                       JSR.W CODE_FN_8386D4                 ;83DC63|20D486  |8386D4;
                       JSR.W CODE_FN_83E666                 ;83DC66|2066E6  |83E666;
                       JSL.L CODE_FL_80BB2D                 ;83DC69|222DBB80|80BB2D;
                       db $A8,$A3,$93,$00,$20,$7E           ;83DC6D|        |      ;
                       JSR.W CODE_FN_83ACA4                 ;83DC73|20A4AC  |83ACA4;
                       JSR.W CODE_FN_83ACAE                 ;83DC76|20AEAC  |83ACAE;
                       LDA.W $0340                          ;83DC79|AD4003  |830340;
                       CMP.W #$0001                         ;83DC7C|C90100  |      ;
                       BNE +                                ;83DC7F|D020    |83DCA1;
                       LDA.W $0346                          ;83DC81|AD4603  |830346;
                       CMP.W #$0001                         ;83DC84|C90100  |      ;
                       BNE +                                ;83DC87|D018    |83DCA1;
                       LDA.W #$0002                         ;83DC89|A90200  |      ;
                       STA.L $7E9614                        ;83DC8C|8F14967E|7E9614;
                       LDA.W #$0001                         ;83DC90|A90100  |      ;
                       STA.L $7E9616                        ;83DC93|8F16967E|7E9616;
                       LDA.W #$0004                         ;83DC97|A90400  |      ;
                       STA.W Game_State_State               ;83DC9A|8DA202  |8302A2;
                       JSR.W CODE_FN_83DD54                 ;83DC9D|2054DD  |83DD54;
                       RTS                                  ;83DCA0|60      |      ;
 
                     + LDA.W $0342                          ;83DCA1|AD4203  |830342;
                       CMP.L $7E94EA                        ;83DCA4|CFEA947E|7E94EA;
                       BNE +                                ;83DCA8|D053    |83DCFD;
                       LDA.W Character_1P                   ;83DCAA|ADBA02  |8302BA;
                       CMP.W #$0006                         ;83DCAD|C90600  |      ;
                       BEQ UNREACH_83DCD0                   ;83DCB0|F01E    |83DCD0;
                       LDA.W #$0000                         ;83DCB2|A90000  |      ;
                       STA.L $7E9614                        ;83DCB5|8F14967E|7E9614;
                       STA.L $7E9616                        ;83DCB9|8F16967E|7E9616;
                       LDA.W #$0001                         ;83DCBD|A90100  |      ;
                       STA.W Game_State_State               ;83DCC0|8DA202  |8302A2;
                       JSR.W CODE_FN_83E69F                 ;83DCC3|209FE6  |83E69F;
                       JSR.W CODE_FN_83ADFD                 ;83DCC6|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AE4E                 ;83DCC9|204EAE  |83AE4E;
                       JSR.W CODE_FN_83AFE2                 ;83DCCC|20E2AF  |83AFE2;
                       RTS                                  ;83DCCF|60      |      ;
 
       UNREACH_83DCD0:
                       db $A9,$02,$00,$8F,$14,$96,$7E,$A9   ;83DCD0|        |      ;
                       db $00,$00,$8F,$16,$96,$7E,$A9,$01   ;83DCD8|        |      ;
                       db $00,$8D,$A2,$02,$A9,$00,$00,$8F   ;83DCE0|        |      ;
                       db $E7,$96,$7E,$8F,$EB,$96,$7E,$A9   ;83DCE8|        |000096;
                       db $70,$00,$8F,$E5,$96,$7E,$20,$FD   ;83DCF0|        |83DCF2;
                       db $AD,$20,$97,$AD,$60               ;83DCF8|        |009720;
 
                     + LDA.W $0342                          ;83DCFD|AD4203  |830342;
                       CMP.W #$0006                         ;83DD00|C90600  |      ;
                       BNE +                                ;83DD03|D01E    |83DD23;
                       LDA.W #$0000                         ;83DD05|A90000  |      ;
                       STA.L $7E9614                        ;83DD08|8F14967E|7E9614;
                       LDA.W #$0003                         ;83DD0C|A90300  |      ;
                       STA.L $7E9616                        ;83DD0F|8F16967E|7E9616;
                       LDA.W #$0003                         ;83DD13|A90300  |      ;
                       STA.W Game_State_State               ;83DD16|8DA202  |0002A2;
                       JSR.W CODE_FN_83ADFD                 ;83DD19|20FDAD  |83ADFD;
                       DEC.W $0342                          ;83DD1C|CE4203  |000342;
                       JSR.W CODE_FN_83E69F                 ;83DD1F|209FE6  |83E69F;
                       RTS                                  ;83DD22|60      |      ;
 
                     + LDA.W #$0000                         ;83DD23|A90000  |      ;
                       STA.L $7E9614                        ;83DD26|8F14967E|7E9614;
                       LDA.W $0342                          ;83DD2A|AD4203  |830342;
                       CMP.W #$0003                         ;83DD2D|C90300  |      ;
                       BEQ +                                ;83DD30|F005    |83DD37;
                       LDA.W #$0001                         ;83DD32|A90100  |      ;
                       BRA ++                               ;83DD35|8003    |83DD3A;
 
                     + LDA.W #$0002                         ;83DD37|A90200  |      ;
 
                    ++ STA.L $7E9616                        ;83DD3A|8F16967E|7E9616;
                       LDA.W #$0003                         ;83DD3E|A90300  |      ;
                       STA.W Game_State_State               ;83DD41|8DA202  |8302A2;
                       DEC.W $0342                          ;83DD44|CE4203  |830342;
                       DEC.W StageClear_LevelLo             ;83DD47|CE3C03  |83033C;
                       JSR.W CODE_FN_83E69F                 ;83DD4A|209FE6  |83E69F;
                       JSR.W CODE_FN_83ADFD                 ;83DD4D|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AFE2                 ;83DD50|20E2AF  |83AFE2;
                       RTS                                  ;83DD53|60      |      ;
 
       CODE_FN_83DD54:
                       JSR.W CODE_FN_83ADFD                 ;83DD54|20FDAD  |83ADFD;
                       DEC.W $0342                          ;83DD57|CE4203  |830342;
                       JSR.W CODE_FN_83AFE2                 ;83DD5A|20E2AF  |83AFE2;
                       INC.W $0342                          ;83DD5D|EE4203  |830342;
                       JSR.W CODE_FN_83A058                 ;83DD60|2058A0  |83A058;
                       JSR.W CODE_FN_83AEEB                 ;83DD63|20EBAE  |83AEEB;
                       PHB                                  ;83DD66|8B      |      ;
                       PHK                                  ;83DD67|4B      |      ;
                       PLB                                  ;83DD68|AB      |      ;
                       LDY.W #$DD73                         ;83DD69|A073DD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83DD6C|22CAA080|80A0CA;
                       PLB                                  ;83DD70|AB      |      ;
                       BRA +                                ;83DD71|8008    |83DD7B;
                       db $00,$5D,$7F,$00,$10,$80,$00,$68   ;83DD73|        |      ;
 
                     + PHB                                  ;83DD7B|8B      |      ;
                       PHK                                  ;83DD7C|4B      |      ;
                       PLB                                  ;83DD7D|AB      |      ;
                       LDY.W #$DD88                         ;83DD7E|A088DD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83DD81|22CAA080|80A0CA;
                       PLB                                  ;83DD85|AB      |      ;
                       BRA +                                ;83DD86|8008    |83DD90;
                       db $00,$6D,$7F,$00,$10,$80,$00,$78   ;83DD88|        |      ;
 
                     + JSR.W CODE_FN_83AD6C                 ;83DD90|206CAD  |83AD6C;
                       LDA.W #$FFE0                         ;83DD93|A9E0FF  |      ;
                       STA.L $7E96E5                        ;83DD96|8FE5967E|7E96E5;
                       LDA.W #$0000                         ;83DD9A|A90000  |      ;
                       STA.L $7E96E3                        ;83DD9D|8FE3967E|7E96E3;
                       LDA.W #$0000                         ;83DDA1|A90000  |      ;
                       STA.L $7E96E7                        ;83DDA4|8FE7967E|7E96E7;
                       STA.L $7E96E9                        ;83DDA8|8FE9967E|7E96E9;
                       STA.L $7E96F5                        ;83DDAC|8FF5967E|7E96F5;
                       STA.L $7E96F7                        ;83DDB0|8FF7967E|7E96F7;
                       STA.L $7E9973                        ;83DDB4|8F73997E|7E9973;
                       JSR.W CODE_FN_8386C5                 ;83DDB8|20C586  |8386C5;
                       RTS                                  ;83DDBB|60      |      ;
                       JSR.W CODE_FN_83AEE0                 ;83DDBC|20E0AE  |83AEE0;
                       LDY.W #$0001                         ;83DDBF|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;83DDC2|22CBAE80|80AECB;
                       BCC +                                ;83DDC6|9014    |83DDDC;
                       REP #$20                             ;83DDC8|C220    |      ;
                       LDA.L $7E9614                        ;83DDCA|AF14967E|7E9614;
                       BEQ ++                               ;83DDCE|F006    |83DDD6;
                       db $A9,$02,$00,$8D,$6E,$1A           ;83DDD0|        |      ;
 
                    ++ LDA.W #$0008                         ;83DDD6|A90800  |      ;
                       STA.W Game_State_State               ;83DDD9|8DA202  |8302A2;
 
                     + REP #$20                             ;83DDDC|C220    |      ;
                       LDA.W #$0001                         ;83DDDE|A90100  |      ;
                       STA.L $7E995F                        ;83DDE1|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83DDE5|206595  |839565;
                       JSR.W CODE_FN_8398D7                 ;83DDE8|20D798  |8398D7;
                       JSR.W CODE_FN_839937                 ;83DDEB|203799  |839937;
                       JSR.W CODE_FN_83958D                 ;83DDEE|208D95  |83958D;
                       JSR.W CODE_FN_83AEB0                 ;83DDF1|20B0AE  |83AEB0;
                       JSR.W CODE_FN_83A0E3                 ;83DDF4|20E3A0  |83A0E3;
                       RTS                                  ;83DDF7|60      |      ;
                       LDA.W $1A6E                          ;83DDF8|AD6E1A  |831A6E;
                       ASL A                                ;83DDFB|0A      |      ;
                       TAX                                  ;83DDFC|AA      |      ;
                       JSR.W (DATA8_83DE01,X)               ;83DDFD|FC01DE  |83DE01;
                       RTS                                  ;83DE00|60      |      ;
 
         DATA8_83DE01:
                       db $07,$DE,$2D,$DE,$52,$DE           ;83DE01|        |      ;
                       LDY.W #$0001                         ;83DE07|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;83DE0A|22CBAE80|80AECB;
                       BCC +                                ;83DE0E|9005    |83DE15;
                       REP #$20                             ;83DE10|C220    |      ;
                       INC.W $1A6E                          ;83DE12|EE6E1A  |831A6E;
 
                     + REP #$20                             ;83DE15|C220    |      ;
                       JSR.W CODE_FN_8395CD                 ;83DE17|20CD95  |8395CD;
                       LDA.W #$0006                         ;83DE1A|A90600  |      ;
                       STA.W StageClear_LevelHi             ;83DE1D|8D3E03  |83033E;
                       JSR.W CODE_FN_839565                 ;83DE20|206595  |839565;
                       JSR.W CODE_FN_83AEB0                 ;83DE23|20B0AE  |83AEB0;
                       JSR.W CODE_FN_8398D7                 ;83DE26|20D798  |8398D7;
                       JSR.W CODE_FN_83A058                 ;83DE29|2058A0  |83A058;
                       RTS                                  ;83DE2C|60      |      ;
                       INC.W $1A6E                          ;83DE2D|EE6E1A  |831A6E;
                       LDA.W #$0050                         ;83DE30|A95000  |      ;
                       STA.W $1A70                          ;83DE33|8D701A  |831A70;
                       JSR.W CODE_FN_8384E7                 ;83DE36|20E784  |8384E7;
                       JSR.W CODE_FN_839565                 ;83DE39|206595  |839565;
                       JSR.W CODE_FN_8398D7                 ;83DE3C|20D798  |8398D7;
                       JSR.W CODE_FN_83AEB0                 ;83DE3F|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83DE42|A90100  |      ;
                       STA.W StageClear_LevelHi             ;83DE45|8D3E03  |83033E;
                       JSR.W CODE_FN_83A058                 ;83DE48|2058A0  |83A058;
                       JSR.W CODE_FN_83E69A                 ;83DE4B|209AE6  |83E69A;
                       INC.W $0342                          ;83DE4E|EE4203  |830342;
                       RTS                                  ;83DE51|60      |      ;
                       LDA.W $1A70                          ;83DE52|AD701A  |831A70;
                       CMP.W #$0050                         ;83DE55|C95000  |      ;
                       BEQ +                                ;83DE58|F007    |83DE61;
                       CMP.W #$004C                         ;83DE5A|C94C00  |      ;
                       BEQ +                                ;83DE5D|F002    |83DE61;
                       BRA ++                               ;83DE5F|8003    |83DE64;
 
                     + JSR.W CODE_FN_8384CD                 ;83DE61|20CD84  |8384CD;
 
                    ++ LDA.B $B7                            ;83DE64|A5B7    |0000B7;
                       BIT.W #$1080                         ;83DE66|898010  |      ;
                       BEQ +                                ;83DE69|F00E    |83DE79;
                       db $A9,$02,$00,$8D,$6E,$1A,$A9,$01   ;83DE6B|        |      ;
                       db $00,$8D,$70,$1A,$80,$00           ;83DE73|        |      ;
 
                     + DEC.W $1A70                          ;83DE79|CE701A  |831A70;
                       BNE +                                ;83DE7C|D020    |83DE9E;
                       LDA.L $7E9616                        ;83DE7E|AF16967E|7E9616;
                       DEC A                                ;83DE82|3A      |      ;
                       TAX                                  ;83DE83|AA      |      ;
                       LDA.W DATA8_83DEAB,X                 ;83DE84|BDABDE  |83DEAB;
                       AND.W #$00FF                         ;83DE87|29FF00  |      ;
                       STA.W Game_State_State               ;83DE8A|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83DE8D|9C6E1A  |831A6E;
                       LDA.W $0342                          ;83DE90|AD4203  |830342;
                       STA.W Character_1P                   ;83DE93|8DBA02  |8302BA;
                       INC.W StageClear_LevelLo             ;83DE96|EE3C03  |83033C;
                       JSR.W CODE_FN_83E69A                 ;83DE99|209AE6  |83E69A;
                       BRA ++                               ;83DE9C|8003    |83DEA1;
 
                     + JSR.W CODE_FN_83E5D6                 ;83DE9E|20D6E5  |83E5D6;
 
                    ++ JSR.W CODE_FN_839565                 ;83DEA1|206595  |839565;
                       JSR.W CODE_FN_8395CD                 ;83DEA4|20CD95  |8395CD;
                       JSR.W CODE_FN_83A058                 ;83DEA7|2058A0  |83A058;
                       RTS                                  ;83DEAA|60      |      ;
 
         DATA8_83DEAB:
                       db $05,$06,$07                       ;83DEAB|        |      ;
                       LDA.W $1A6E                          ;83DEAE|AD6E1A  |831A6E;
                       ASL A                                ;83DEB1|0A      |      ;
                       TAX                                  ;83DEB2|AA      |      ;
                       JSR.W (DATA8_83DEEB,X)               ;83DEB3|FCEBDE  |83DEEB;
                       LDA.W $1A6E                          ;83DEB6|AD6E1A  |831A6E;
                       BEQ +                                ;83DEB9|F02F    |83DEEA;
                       LDA.B $B7                            ;83DEBB|A5B7    |0000B7;
                       BIT.W #$1080                         ;83DEBD|898010  |      ;
                       BEQ +                                ;83DEC0|F028    |83DEEA;
                       db $A9,$0B,$00,$8F,$A2,$02,$00,$A9   ;83DEC2|        |      ;
                       db $03,$00,$8D,$BA,$02,$A9,$04,$00   ;83DECA|        |000000;
                       db $8D,$3C,$03,$A9,$00,$00,$8D,$46   ;83DED2|        |00033C;
                       db $03,$8F,$F4,$94,$7E,$A9,$04,$00   ;83DEDA|        |00008F;
                       db $8F,$16,$96,$7E,$22,$53,$85,$83   ;83DEE2|        |7E9616;
 
                     + RTS                                  ;83DEEA|60      |      ;
 
         DATA8_83DEEB:
                       db $F3,$DE,$5D,$DF,$C9,$DF,$3E,$E0   ;83DEEB|        |      ;
                       LDY.W #$0001                         ;83DEF3|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;83DEF6|22CBAE80|80AECB;
                       BCC +                                ;83DEFA|900F    |83DF0B;
                       REP #$20                             ;83DEFC|C220    |      ;
                       LDA.W #$0000                         ;83DEFE|A90000  |      ;
                       STA.W $0346                          ;83DF01|8D4603  |830346;
                       STA.L $7E94F4                        ;83DF04|8FF4947E|7E94F4;
                       INC.W $1A6E                          ;83DF08|EE6E1A  |831A6E;
 
                     + REP #$20                             ;83DF0B|C220    |      ;
                       JSR.W CODE_FN_8381DC                 ;83DF0D|20DC81  |8381DC;
                       SEP #$20                             ;83DF10|E220    |      ;
                       LDA.B #$02                           ;83DF12|A902    |      ;
                       STA.W DMA7PARAM                      ;83DF14|8D7043  |834370;
                       LDA.B #$0D                           ;83DF17|A90D    |      ;
                       STA.W DMA7REG                        ;83DF19|8D7143  |834371;
                       LDA.B #$FF                           ;83DF1C|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83DF1E|8D7243  |834372;
                       LDA.B #$96                           ;83DF21|A996    |      ;
                       STA.W DMA7ADDRM                      ;83DF23|8D7343  |834373;
                       LDA.B #$7E                           ;83DF26|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83DF28|8D7443  |834374;
                       REP #$20                             ;83DF2B|C220    |      ;
                       SEP #$20                             ;83DF2D|E220    |      ;
                       LDA.B #$02                           ;83DF2F|A902    |      ;
                       STA.W DMA6PARAM                      ;83DF31|8D6043  |834360;
                       LDA.B #$11                           ;83DF34|A911    |      ;
                       STA.W DMA6REG                        ;83DF36|8D6143  |834361;
                       LDA.B #$FF                           ;83DF39|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83DF3B|8D6243  |834362;
                       LDA.B #$96                           ;83DF3E|A996    |      ;
                       STA.W DMA6ADDRM                      ;83DF40|8D6343  |834363;
                       LDA.B #$7E                           ;83DF43|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83DF45|8D6443  |834364;
                       REP #$20                             ;83DF48|C220    |      ;
                       SEP #$20                             ;83DF4A|E220    |      ;
                       LDA.W $021E                          ;83DF4C|AD1E02  |83021E;
                       ORA.B #$C0                           ;83DF4F|09C0    |      ;
                       STA.W $021E                          ;83DF51|8D1E02  |83021E;
                       REP #$20                             ;83DF54|C220    |      ;
                       JSR.W CODE_FN_839565                 ;83DF56|206595  |839565;
                       JSR.W CODE_FN_839573                 ;83DF59|207395  |839573;
                       RTS                                  ;83DF5C|60      |      ;
                       LDA.L $7E96E3                        ;83DF5D|AFE3967E|7E96E3;
                       DEC A                                ;83DF61|3A      |      ;
                       STA.L $7E96E3                        ;83DF62|8FE3967E|7E96E3;
                       JSR.W CODE_FN_8381DC                 ;83DF66|20DC81  |8381DC;
                       SEP #$20                             ;83DF69|E220    |      ;
                       LDA.B #$02                           ;83DF6B|A902    |      ;
                       STA.W DMA7PARAM                      ;83DF6D|8D7043  |834370;
                       LDA.B #$0D                           ;83DF70|A90D    |      ;
                       STA.W DMA7REG                        ;83DF72|8D7143  |834371;
                       LDA.B #$FF                           ;83DF75|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83DF77|8D7243  |834372;
                       LDA.B #$96                           ;83DF7A|A996    |      ;
                       STA.W DMA7ADDRM                      ;83DF7C|8D7343  |834373;
                       LDA.B #$7E                           ;83DF7F|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83DF81|8D7443  |834374;
                       REP #$20                             ;83DF84|C220    |      ;
                       SEP #$20                             ;83DF86|E220    |      ;
                       LDA.B #$02                           ;83DF88|A902    |      ;
                       STA.W DMA6PARAM                      ;83DF8A|8D6043  |834360;
                       LDA.B #$11                           ;83DF8D|A911    |      ;
                       STA.W DMA6REG                        ;83DF8F|8D6143  |834361;
                       LDA.B #$FF                           ;83DF92|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83DF94|8D6243  |834362;
                       LDA.B #$96                           ;83DF97|A996    |      ;
                       STA.W DMA6ADDRM                      ;83DF99|8D6343  |834363;
                       LDA.B #$7E                           ;83DF9C|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83DF9E|8D6443  |834364;
                       REP #$20                             ;83DFA1|C220    |      ;
                       SEP #$20                             ;83DFA3|E220    |      ;
                       LDA.W $021E                          ;83DFA5|AD1E02  |83021E;
                       ORA.B #$C0                           ;83DFA8|09C0    |      ;
                       STA.W $021E                          ;83DFAA|8D1E02  |83021E;
                       REP #$20                             ;83DFAD|C220    |      ;
                       JSR.W CODE_FN_839565                 ;83DFAF|206595  |839565;
                       JSR.W CODE_FN_839573                 ;83DFB2|207395  |839573;
                       LDA.L $7E96E3                        ;83DFB5|AFE3967E|7E96E3;
                       CMP.W #$FF00                         ;83DFB9|C900FF  |      ;
                       BNE +                                ;83DFBC|D00A    |83DFC8;
                       INC.W $1A6E                          ;83DFBE|EE6E1A  |831A6E;
                       LDA.W #$FFE0                         ;83DFC1|A9E0FF  |      ;
                       STA.L $7E96E5                        ;83DFC4|8FE5967E|7E96E5;
 
                     + RTS                                  ;83DFC8|60      |      ;
                       JSR.W CODE_FN_8386D4                 ;83DFC9|20D486  |8386D4;
                       LDA.L $7E96E5                        ;83DFCC|AFE5967E|7E96E5;
                       INC A                                ;83DFD0|1A      |      ;
                       BMI +                                ;83DFD1|301A    |83DFED;
                       STA.L $7E96E5                        ;83DFD3|8FE5967E|7E96E5;
                       SEP #$20                             ;83DFD7|E220    |      ;
                       LDA.W $021E                          ;83DFD9|AD1E02  |83021E;
                       AND.B #$3F                           ;83DFDC|293F    |      ;
                       STA.W $021E                          ;83DFDE|8D1E02  |83021E;
                       REP #$20                             ;83DFE1|C220    |      ;
                       INC.W $1A6E                          ;83DFE3|EE6E1A  |831A6E;
                       JSR.W CODE_FN_839565                 ;83DFE6|206595  |839565;
                       JSR.W CODE_FN_83A058                 ;83DFE9|2058A0  |83A058;
                       RTS                                  ;83DFEC|60      |      ;
 
                     + STA.L $7E96E5                        ;83DFED|8FE5967E|7E96E5;
                       JSR.W CODE_FN_8381A0                 ;83DFF1|20A081  |8381A0;
                       SEP #$20                             ;83DFF4|E220    |      ;
                       LDA.B #$02                           ;83DFF6|A902    |      ;
                       STA.W DMA7PARAM                      ;83DFF8|8D7043  |834370;
                       LDA.B #$0E                           ;83DFFB|A90E    |      ;
                       STA.W DMA7REG                        ;83DFFD|8D7143  |834371;
                       LDA.B #$FF                           ;83E000|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83E002|8D7243  |834372;
                       LDA.B #$96                           ;83E005|A996    |      ;
                       STA.W DMA7ADDRM                      ;83E007|8D7343  |834373;
                       LDA.B #$7E                           ;83E00A|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83E00C|8D7443  |834374;
                       REP #$20                             ;83E00F|C220    |      ;
                       SEP #$20                             ;83E011|E220    |      ;
                       LDA.B #$02                           ;83E013|A902    |      ;
                       STA.W DMA6PARAM                      ;83E015|8D6043  |834360;
                       LDA.B #$12                           ;83E018|A912    |      ;
                       STA.W DMA6REG                        ;83E01A|8D6143  |834361;
                       LDA.B #$FF                           ;83E01D|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83E01F|8D6243  |834362;
                       LDA.B #$96                           ;83E022|A996    |      ;
                       STA.W DMA6ADDRM                      ;83E024|8D6343  |834363;
                       LDA.B #$7E                           ;83E027|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83E029|8D6443  |834364;
                       REP #$20                             ;83E02C|C220    |      ;
                       SEP #$20                             ;83E02E|E220    |      ;
                       LDA.W $021E                          ;83E030|AD1E02  |83021E;
                       ORA.B #$C0                           ;83E033|09C0    |      ;
                       STA.W $021E                          ;83E035|8D1E02  |83021E;
                       REP #$20                             ;83E038|C220    |      ;
                       JSR.W CODE_FN_839565                 ;83E03A|206595  |839565;
                       RTS                                  ;83E03D|60      |      ;
                       STZ.W $1A70                          ;83E03E|9C701A  |831A70;
                       STZ.W $1A6E                          ;83E041|9C6E1A  |831A6E;
                       LDA.W #$0005                         ;83E044|A90500  |      ;
                       STA.W Game_State_State               ;83E047|8DA202  |8302A2;
                       LDA.W #$0003                         ;83E04A|A90300  |      ;
                       STA.W Character_1P                   ;83E04D|8DBA02  |8302BA;
                       LDA.W #$0004                         ;83E050|A90400  |      ;
                       STA.W StageClear_LevelLo             ;83E053|8D3C03  |83033C;
                       JSR.W CODE_FN_8386E3                 ;83E056|20E386  |8386E3;
                       JSR.W CODE_FN_83ADFD                 ;83E059|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AE4E                 ;83E05C|204EAE  |83AE4E;
                       JSR.W CODE_FN_83E69F                 ;83E05F|209FE6  |83E69F;
                       JSR.W CODE_FN_83AFE2                 ;83E062|20E2AF  |83AFE2;
                       JSR.W CODE_FN_839565                 ;83E065|206595  |839565;
                       JSR.W CODE_FN_83A058                 ;83E068|2058A0  |83A058;
                       RTS                                  ;83E06B|60      |      ;
                       LDA.W $1A6E                          ;83E06C|AD6E1A  |831A6E;
                       ASL A                                ;83E06F|0A      |      ;
                       TAX                                  ;83E070|AA      |      ;
                       JSR.W (DATA8_83E075,X)               ;83E071|FC75E0  |83E075;
                       RTS                                  ;83E074|60      |      ;
 
         DATA8_83E075:
                       db $8D,$E0,$BF,$E0,$3F,$D7,$5B,$D7   ;83E075|        |      ;
                       db $74,$D7,$8D,$D7,$C9,$E0,$04,$E1   ;83E07D|        |      ;
                       db $62,$E1,$AD,$E1,$02,$E2,$2C,$E2   ;83E085|        |      ;
                       LDA.W #$0000                         ;83E08D|A90000  |      ;
                       STA.L StageClear_MenuSelection       ;83E090|8F2E957E|7E952E;
                       LDA.L $7E94E6                        ;83E094|AFE6947E|7E94E6;
                       BEQ +                                ;83E098|F01D    |83E0B7;
                       INC.W $1A6E                          ;83E09A|EE6E1A  |831A6E;
                       JSR.W CODE_FN_838419                 ;83E09D|201984  |838419;
                       LDA.W #$0004                         ;83E0A0|A90400  |      ;
                       STA.L $7E943A                        ;83E0A3|8F3A947E|7E943A;
                       LDA.W $0342                          ;83E0A7|AD4203  |830342;
                       INC A                                ;83E0AA|1A      |      ;
                       CMP.W StageClear_LevelLo             ;83E0AB|CD3C03  |83033C;
                       BEQ ++                               ;83E0AE|F006    |83E0B6;
                       LDA.W #$0001                         ;83E0B0|A90100  |      ;
                       STA.W StageClear_LevelHi             ;83E0B3|8D3E03  |00033E;
 
                    ++ RTS                                  ;83E0B6|60      |      ;
 
                     + JSR.W CODE_FN_83D6D7                 ;83E0B7|20D7D6  |83D6D7;
                       JSL.L CODE_FL_83839B                 ;83E0BA|229B8383|83839B;
                       RTS                                  ;83E0BE|60      |      ;
                       INC.W $1A6E                          ;83E0BF|EE6E1A  |831A6E;
                       LDA.W #$0010                         ;83E0C2|A91000  |      ;
                       JSR.W CODE_FN_83A9E3                 ;83E0C5|20E3A9  |83A9E3;
                       RTS                                  ;83E0C8|60      |      ;
                       INC.W $1A6E                          ;83E0C9|EE6E1A  |831A6E;
                       JSL.L CODE_FL_80BB2D                 ;83E0CC|222DBB80|80BB2D;
                       db $A8,$A3,$93,$00,$20,$7E           ;83E0D0|        |      ;
                       JSR.W CODE_FN_83ACA4                 ;83E0D6|20A4AC  |83ACA4;
                       PHB                                  ;83E0D9|8B      |      ;
                       PHK                                  ;83E0DA|4B      |      ;
                       PLB                                  ;83E0DB|AB      |      ;
                       LDY.W #$E0E6                         ;83E0DC|A0E6E0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E0DF|22CAA080|80A0CA;
                       PLB                                  ;83E0E3|AB      |      ;
                       BRA +                                ;83E0E4|8008    |83E0EE;
                       db $00,$20,$7E,$00,$01,$80,$00,$68   ;83E0E6|        |      ;
 
                     + PHB                                  ;83E0EE|8B      |      ;
                       PHK                                  ;83E0EF|4B      |      ;
                       PLB                                  ;83E0F0|AB      |      ;
                       LDY.W #$E0FB                         ;83E0F1|A0FBE0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E0F4|22CAA080|80A0CA;
                       PLB                                  ;83E0F8|AB      |      ;
                       BRA +                                ;83E0F9|8008    |83E103;
                       db $00,$30,$7E,$40,$01,$80,$00,$78   ;83E0FB|        |      ;
 
                     + RTS                                  ;83E103|60      |      ;
                       INC.W $1A6E                          ;83E104|EE6E1A  |831A6E;
                       LDA.W $0346                          ;83E107|AD4603  |830346;
                       CMP.W #$0001                         ;83E10A|C90100  |      ;
                       BNE +                                ;83E10D|D008    |83E117;
                       JSR.W CODE_FN_83AFD8                 ;83E10F|20D8AF  |83AFD8;
                       JSR.W CODE_FN_83ADFD                 ;83E112|20FDAD  |83ADFD;
                       BRA ++                               ;83E115|8009    |83E120;
 
                     + JSR.W CODE_FN_83AFE2                 ;83E117|20E2AF  |83AFE2;
                       JSR.W CODE_FN_83ADFD                 ;83E11A|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AE4E                 ;83E11D|204EAE  |83AE4E;
 
                    ++ JSR.W CODE_FN_83ACAE                 ;83E120|20AEAC  |83ACAE;
                       JSR.W CODE_FN_83AEB0                 ;83E123|20B0AE  |83AEB0;
                       LDY.W #$E12E                         ;83E126|A02EE1  |      ;
                       JSR.W CODE_FN_838A8A                 ;83E129|208A8A  |838A8A;
                       BRA +                                ;83E12C|8003    |83E131;
                       db $28,$58,$08                       ;83E12E|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83E131|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83E134|20BD8A  |838ABD;
                       PHB                                  ;83E137|8B      |      ;
                       PHK                                  ;83E138|4B      |      ;
                       PLB                                  ;83E139|AB      |      ;
                       LDY.W #$E144                         ;83E13A|A044E1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E13D|22CAA080|80A0CA;
                       PLB                                  ;83E141|AB      |      ;
                       BRA +                                ;83E142|8008    |83E14C;
                       db $00,$21,$7E,$00,$02,$80,$80,$68   ;83E144|        |      ;
 
                     + PHB                                  ;83E14C|8B      |      ;
                       PHK                                  ;83E14D|4B      |      ;
                       PLB                                  ;83E14E|AB      |      ;
                       LDY.W #$E159                         ;83E14F|A059E1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E152|22CAA080|80A0CA;
                       PLB                                  ;83E156|AB      |      ;
                       BRA +                                ;83E157|8008    |83E161;
                       db $40,$31,$7E,$C0,$01,$80,$A0,$78   ;83E159|        |      ;
 
                     + RTS                                  ;83E161|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83E162|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83E165|20BD8A  |838ABD;
                       JSR.W CODE_FN_83AEB0                 ;83E168|20B0AE  |83AEB0;
                       LDA.L $7E998D                        ;83E16B|AF8D997E|7E998D;
                       BNE +                                ;83E16F|D03B    |83E1AC;
                       INC.W $1A6E                          ;83E171|EE6E1A  |831A6E;
                       LDY.W #$E17C                         ;83E174|A07CE1  |      ;
                       JSR.W CODE_FN_838A8A                 ;83E177|208A8A  |838A8A;
                       BRA ++                               ;83E17A|8003    |83E17F;
                       db $68,$98,$08                       ;83E17C|        |      ;
 
                    ++ JSR.W CODE_FN_838ABD                 ;83E17F|20BD8A  |838ABD;
                       PHB                                  ;83E182|8B      |      ;
                       PHK                                  ;83E183|4B      |      ;
                       PLB                                  ;83E184|AB      |      ;
                       LDY.W #$E18F                         ;83E185|A08FE1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E188|22CAA080|80A0CA;
                       PLB                                  ;83E18C|AB      |      ;
                       BRA ++                               ;83E18D|8008    |83E197;
                       db $00,$23,$7E,$00,$02,$80,$80,$69   ;83E18F|        |      ;
 
                    ++ PHB                                  ;83E197|8B      |      ;
                       PHK                                  ;83E198|4B      |      ;
                       PLB                                  ;83E199|AB      |      ;
                       LDY.W #$E1A4                         ;83E19A|A0A4E1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E19D|22CAA080|80A0CA;
                       PLB                                  ;83E1A1|AB      |      ;
                       BRA +                                ;83E1A2|8008    |83E1AC;
                       db $00,$33,$7E,$00,$02,$80,$80,$79   ;83E1A4|        |      ;
 
                     + RTS                                  ;83E1AC|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83E1AD|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83E1B0|20BD8A  |838ABD;
                       JSR.W CODE_FN_83AEB0                 ;83E1B3|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83E1B6|A90100  |      ;
                       STA.L $7E995F                        ;83E1B9|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E1BD|206595  |839565;
                       LDA.L $7E998D                        ;83E1C0|AF8D997E|7E998D;
                       BNE +                                ;83E1C4|D03B    |83E201;
                       INC.W $1A6E                          ;83E1C6|EE6E1A  |831A6E;
                       LDY.W #$E1D1                         ;83E1C9|A0D1E1  |      ;
                       JSR.W CODE_FN_838A8A                 ;83E1CC|208A8A  |838A8A;
                       BRA ++                               ;83E1CF|8003    |83E1D4;
                       db $A8,$D8,$08                       ;83E1D1|        |      ;
 
                    ++ JSR.W CODE_FN_838ABD                 ;83E1D4|20BD8A  |838ABD;
                       PHB                                  ;83E1D7|8B      |      ;
                       PHK                                  ;83E1D8|4B      |      ;
                       PLB                                  ;83E1D9|AB      |      ;
                       LDY.W #$E1E4                         ;83E1DA|A0E4E1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E1DD|22CAA080|80A0CA;
                       PLB                                  ;83E1E1|AB      |      ;
                       BRA ++                               ;83E1E2|8008    |83E1EC;
                       db $00,$25,$7E,$00,$02,$80,$80,$6A   ;83E1E4|        |      ;
 
                    ++ PHB                                  ;83E1EC|8B      |      ;
                       PHK                                  ;83E1ED|4B      |      ;
                       PLB                                  ;83E1EE|AB      |      ;
                       LDY.W #$E1F9                         ;83E1EF|A0F9E1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E1F2|22CAA080|80A0CA;
                       PLB                                  ;83E1F6|AB      |      ;
                       BRA +                                ;83E1F7|8008    |83E201;
                       db $00,$35,$7E,$00,$02,$80,$80,$7A   ;83E1F9|        |      ;
 
                     + RTS                                  ;83E201|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83E202|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83E205|20BD8A  |838ABD;
                       JSR.W CODE_FN_83AEB0                 ;83E208|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83E20B|A90100  |      ;
                       STA.L $7E995F                        ;83E20E|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E212|206595  |839565;
                       LDA.L $7E998D                        ;83E215|AF8D997E|7E998D;
                       BNE +                                ;83E219|D010    |83E22B;
                       JSR.W CODE_FN_838193                 ;83E21B|209381  |838193;
                       INC.W $1A6E                          ;83E21E|EE6E1A  |831A6E;
                       LDA.W #$0000                         ;83E221|A90000  |      ;
                       JSL.L CODE_FL_80A1E0                 ;83E224|22E0A180|80A1E0;
                       JSR.W CODE_FN_83ACF7                 ;83E228|20F7AC  |83ACF7;
 
                     + RTS                                  ;83E22B|60      |      ;
                       LDA.W #$0000                         ;83E22C|A90000  |      ;
                       STA.L $7E96E3                        ;83E22F|8FE3967E|7E96E3;
                       STA.L $7E96E5                        ;83E233|8FE5967E|7E96E5;
                       STA.L $7E9973                        ;83E237|8F73997E|7E9973;
                       JSR.W CODE_FN_83E666                 ;83E23B|2066E6  |83E666;
                       LDA.W $0346                          ;83E23E|AD4603  |830346;
                       CMP.W #$0001                         ;83E241|C90100  |      ;
                       BNE +                                ;83E244|D012    |83E258;
                       LDA.W #$0002                         ;83E246|A90200  |      ;
                       STA.L $7E9616                        ;83E249|8F16967E|7E9616;
                       LDA.W #$0006                         ;83E24D|A90600  |      ;
                       STA.W Game_State_State               ;83E250|8DA202  |0002A2;
                       STZ.W $1A6E                          ;83E253|9C6E1A  |001A6E;
                       BRA ++                               ;83E256|8037    |83E28F;
 
                     + LDA.W $0342                          ;83E258|AD4203  |830342;
                       CMP.W #$0006                         ;83E25B|C90600  |      ;
                       BNE +                                ;83E25E|D012    |83E272;
                       LDA.W #$0003                         ;83E260|A90300  |      ;
                       STA.L $7E9616                        ;83E263|8F16967E|7E9616;
                       STZ.W $1A6E                          ;83E267|9C6E1A  |001A6E;
                       LDA.W #$0007                         ;83E26A|A90700  |      ;
                       STA.W Game_State_State               ;83E26D|8DA202  |0002A2;
                       BRA ++                               ;83E270|801D    |83E28F;
 
                     + LDA.W #$0001                         ;83E272|A90100  |      ;
                       STA.L $7E9616                        ;83E275|8F16967E|7E9616;
                       STZ.W $1A6E                          ;83E279|9C6E1A  |831A6E;
                       LDA.W #$0001                         ;83E27C|A90100  |      ;
                       STA.L $7E9610                        ;83E27F|8F10967E|7E9610;
                       LDA.W #$0005                         ;83E283|A90500  |      ;
                       STA.W Game_State_State               ;83E286|8DA202  |8302A2;
                       JSR.W CODE_FN_83E69A                 ;83E289|209AE6  |83E69A;
                       JSR.W CODE_FN_83E6C0                 ;83E28C|20C0E6  |83E6C0;
 
                    ++ JSR.W CODE_FN_839565                 ;83E28F|206595  |839565;
                       JSR.W CODE_FN_83AEB0                 ;83E292|20B0AE  |83AEB0;
                       JSR.W CODE_FN_83A058                 ;83E295|2058A0  |83A058;
                       RTS                                  ;83E298|60      |      ;
                       LDA.W $1A6E                          ;83E299|AD6E1A  |831A6E;
                       ASL A                                ;83E29C|0A      |      ;
                       TAX                                  ;83E29D|AA      |      ;
                       JSR.W (DATA8_83E2AB,X)               ;83E29E|FCABE2  |83E2AB;
                       JSR.W CODE_FN_839565                 ;83E2A1|206595  |839565;
                       JSR.W CODE_FN_8395CD                 ;83E2A4|20CD95  |8395CD;
                       JSR.W CODE_FN_83A058                 ;83E2A7|2058A0  |83A058;
                       RTS                                  ;83E2AA|60      |      ;
 
         DATA8_83E2AB:
                       db $AF,$E2,$C6,$E2                   ;83E2AB|        |      ;
                       INC.W $1A6E                          ;83E2AF|EE6E1A  |831A6E;
                       LDA.W #$0050                         ;83E2B2|A95000  |      ;
                       STA.W $1A70                          ;83E2B5|8D701A  |831A70;
                       LDA.W #$0001                         ;83E2B8|A90100  |      ;
                       STA.L $7E9610                        ;83E2BB|8F10967E|7E9610;
                       JSR.W CODE_FN_83AEB0                 ;83E2BF|20B0AE  |83AEB0;
                       JSR.W CODE_FN_83AFE2                 ;83E2C2|20E2AF  |83AFE2;
                       RTS                                  ;83E2C5|60      |      ;
                       DEC.W $1A70                          ;83E2C6|CE701A  |831A70;
                       BPL +                                ;83E2C9|1006    |83E2D1;
                       LDA.W #$000B                         ;83E2CB|A90B00  |      ;
                       STA.W Game_State_State               ;83E2CE|8DA202  |8302A2;
 
                     + JSR.W CODE_FN_83E5F3                 ;83E2D1|20F3E5  |83E5F3;
                       RTS                                  ;83E2D4|60      |      ;
                       LDA.B $B7                            ;83E2D5|A5B7    |0000B7;
                       BIT.W #$1080                         ;83E2D7|898010  |      ;
                       BEQ +                                ;83E2DA|F00E    |83E2EA;
                       LDA.W $1A6E                          ;83E2DC|AD6E1A  |001A6E;
                       CMP.W #$0003                         ;83E2DF|C90300  |      ;
                       BMI +                                ;83E2E2|3006    |83E2EA;
                       LDA.W #$000B                         ;83E2E4|A90B00  |      ;
                       STA.W Game_State_State               ;83E2E7|8DA202  |0002A2;
 
                     + LDA.W $1A6E                          ;83E2EA|AD6E1A  |831A6E;
                       ASL A                                ;83E2ED|0A      |      ;
                       TAX                                  ;83E2EE|AA      |      ;
                       JSR.W (DATA8_83E2FD,X)               ;83E2EF|FCFDE2  |83E2FD;
                       LDA.W #$0001                         ;83E2F2|A90100  |      ;
                       STA.L $7E995F                        ;83E2F5|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E2F9|206595  |839565;
                       RTS                                  ;83E2FC|60      |      ;
 
         DATA8_83E2FD:
                       db $0B,$E3,$15,$E3,$46,$E3,$C4,$E3   ;83E2FD|        |      ;
                       db $32,$E4,$8C,$E4,$E7,$E4           ;83E305|        |      ;
                       INC.W $1A6E                          ;83E30B|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83ADFD                 ;83E30E|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83A058                 ;83E311|2058A0  |83A058;
                       RTS                                  ;83E314|60      |      ;
                       INC.W $1A6E                          ;83E315|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83AEEB                 ;83E318|20EBAE  |83AEEB;
                       PHB                                  ;83E31B|8B      |      ;
                       PHK                                  ;83E31C|4B      |      ;
                       PLB                                  ;83E31D|AB      |      ;
                       LDY.W #$E328                         ;83E31E|A028E3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E321|22CAA080|80A0CA;
                       PLB                                  ;83E325|AB      |      ;
                       BRA +                                ;83E326|8008    |83E330;
                       db $00,$65,$7F,$00,$08,$80,$00,$6C   ;83E328|        |      ;
 
                     + PHB                                  ;83E330|8B      |      ;
                       PHK                                  ;83E331|4B      |      ;
                       PLB                                  ;83E332|AB      |      ;
                       LDY.W #$E33D                         ;83E333|A03DE3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E336|22CAA080|80A0CA;
                       PLB                                  ;83E33A|AB      |      ;
                       BRA +                                ;83E33B|8008    |83E345;
                       db $00,$75,$7F,$00,$08,$80,$00,$7C   ;83E33D|        |      ;
 
                     + RTS                                  ;83E345|60      |      ;
                       INC.W $1A6E                          ;83E346|EE6E1A  |831A6E;
                       LDA.W #$0000                         ;83E349|A90000  |      ;
                       STA.L $7E96E5                        ;83E34C|8FE5967E|7E96E5;
                       PHB                                  ;83E350|8B      |      ;
                       PHK                                  ;83E351|4B      |      ;
                       PLB                                  ;83E352|AB      |      ;
                       LDY.W #$E35D                         ;83E353|A05DE3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E356|22CAA080|80A0CA;
                       PLB                                  ;83E35A|AB      |      ;
                       BRA +                                ;83E35B|8008    |83E365;
                       db $00,$5D,$7F,$00,$08,$80,$00,$68   ;83E35D|        |      ;
 
                     + PHB                                  ;83E365|8B      |      ;
                       PHK                                  ;83E366|4B      |      ;
                       PLB                                  ;83E367|AB      |      ;
                       LDY.W #$E372                         ;83E368|A072E3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E36B|22CAA080|80A0CA;
                       PLB                                  ;83E36F|AB      |      ;
                       BRA +                                ;83E370|8008    |83E37A;
                       db $00,$6D,$7F,$00,$08,$80,$00,$78   ;83E372|        |      ;
 
                     + JSR.W CODE_FN_8381A0                 ;83E37A|20A081  |8381A0;
                       SEP #$20                             ;83E37D|E220    |      ;
                       LDA.B #$02                           ;83E37F|A902    |      ;
                       STA.W DMA7PARAM                      ;83E381|8D7043  |834370;
                       LDA.B #$0E                           ;83E384|A90E    |      ;
                       STA.W DMA7REG                        ;83E386|8D7143  |834371;
                       LDA.B #$FF                           ;83E389|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83E38B|8D7243  |834372;
                       LDA.B #$96                           ;83E38E|A996    |      ;
                       STA.W DMA7ADDRM                      ;83E390|8D7343  |834373;
                       LDA.B #$7E                           ;83E393|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83E395|8D7443  |834374;
                       REP #$20                             ;83E398|C220    |      ;
                       SEP #$20                             ;83E39A|E220    |      ;
                       LDA.B #$02                           ;83E39C|A902    |      ;
                       STA.W DMA6PARAM                      ;83E39E|8D6043  |834360;
                       LDA.B #$12                           ;83E3A1|A912    |      ;
                       STA.W DMA6REG                        ;83E3A3|8D6143  |834361;
                       LDA.B #$FF                           ;83E3A6|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83E3A8|8D6243  |834362;
                       LDA.B #$96                           ;83E3AB|A996    |      ;
                       STA.W DMA6ADDRM                      ;83E3AD|8D6343  |834363;
                       LDA.B #$7E                           ;83E3B0|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83E3B2|8D6443  |834364;
                       REP #$20                             ;83E3B5|C220    |      ;
                       SEP #$20                             ;83E3B7|E220    |      ;
                       LDA.W $021E                          ;83E3B9|AD1E02  |83021E;
                       ORA.B #$C0                           ;83E3BC|09C0    |      ;
                       STA.W $021E                          ;83E3BE|8D1E02  |83021E;
                       REP #$20                             ;83E3C1|C220    |      ;
                       RTS                                  ;83E3C3|60      |      ;
                       LDA.L $7E96E5                        ;83E3C4|AFE5967E|7E96E5;
                       DEC A                                ;83E3C8|3A      |      ;
                       CMP.W #$FFE0                         ;83E3C9|C9E0FF  |      ;
                       BPL +                                ;83E3CC|1016    |83E3E4;
                       INC.W $1A6E                          ;83E3CE|EE6E1A  |831A6E;
                       JSR.W CODE_FN_8386C5                 ;83E3D1|20C586  |8386C5;
                       SEP #$20                             ;83E3D4|E220    |      ;
                       LDA.W $021E                          ;83E3D6|AD1E02  |83021E;
                       AND.B #$3F                           ;83E3D9|293F    |      ;
                       STA.W $021E                          ;83E3DB|8D1E02  |83021E;
                       REP #$20                             ;83E3DE|C220    |      ;
                       JSR.W CODE_FN_839565                 ;83E3E0|206595  |839565;
                       RTS                                  ;83E3E3|60      |      ;
 
                     + STA.L $7E96E5                        ;83E3E4|8FE5967E|7E96E5;
                       JSR.W CODE_FN_8381A0                 ;83E3E8|20A081  |8381A0;
                       SEP #$20                             ;83E3EB|E220    |      ;
                       LDA.B #$02                           ;83E3ED|A902    |      ;
                       STA.W DMA7PARAM                      ;83E3EF|8D7043  |834370;
                       LDA.B #$0E                           ;83E3F2|A90E    |      ;
                       STA.W DMA7REG                        ;83E3F4|8D7143  |834371;
                       LDA.B #$FF                           ;83E3F7|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83E3F9|8D7243  |834372;
                       LDA.B #$96                           ;83E3FC|A996    |      ;
                       STA.W DMA7ADDRM                      ;83E3FE|8D7343  |834373;
                       LDA.B #$7E                           ;83E401|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83E403|8D7443  |834374;
                       REP #$20                             ;83E406|C220    |      ;
                       SEP #$20                             ;83E408|E220    |      ;
                       LDA.B #$02                           ;83E40A|A902    |      ;
                       STA.W DMA6PARAM                      ;83E40C|8D6043  |834360;
                       LDA.B #$12                           ;83E40F|A912    |      ;
                       STA.W DMA6REG                        ;83E411|8D6143  |834361;
                       LDA.B #$FF                           ;83E414|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83E416|8D6243  |834362;
                       LDA.B #$96                           ;83E419|A996    |      ;
                       STA.W DMA6ADDRM                      ;83E41B|8D6343  |834363;
                       LDA.B #$7E                           ;83E41E|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83E420|8D6443  |834364;
                       REP #$20                             ;83E423|C220    |      ;
                       SEP #$20                             ;83E425|E220    |      ;
                       LDA.W $021E                          ;83E427|AD1E02  |83021E;
                       ORA.B #$C0                           ;83E42A|09C0    |      ;
                       STA.W $021E                          ;83E42C|8D1E02  |83021E;
                       REP #$20                             ;83E42F|C220    |      ;
                       RTS                                  ;83E431|60      |      ;
                       INC.W $1A6E                          ;83E432|EE6E1A  |831A6E;
                       JSR.W CODE_FN_8386E3                 ;83E435|20E386  |8386E3;
                       JSR.W CODE_FN_83AD6C                 ;83E438|206CAD  |83AD6C;
                       LDA.W #$0100                         ;83E43B|A90001  |      ;
                       STA.L $7E96E3                        ;83E43E|8FE3967E|7E96E3;
                       JSR.W CODE_FN_8381DC                 ;83E442|20DC81  |8381DC;
                       SEP #$20                             ;83E445|E220    |      ;
                       LDA.B #$02                           ;83E447|A902    |      ;
                       STA.W DMA7PARAM                      ;83E449|8D7043  |834370;
                       LDA.B #$0D                           ;83E44C|A90D    |      ;
                       STA.W DMA7REG                        ;83E44E|8D7143  |834371;
                       LDA.B #$FF                           ;83E451|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83E453|8D7243  |834372;
                       LDA.B #$96                           ;83E456|A996    |      ;
                       STA.W DMA7ADDRM                      ;83E458|8D7343  |834373;
                       LDA.B #$7E                           ;83E45B|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83E45D|8D7443  |834374;
                       REP #$20                             ;83E460|C220    |      ;
                       SEP #$20                             ;83E462|E220    |      ;
                       LDA.B #$02                           ;83E464|A902    |      ;
                       STA.W DMA6PARAM                      ;83E466|8D6043  |834360;
                       LDA.B #$11                           ;83E469|A911    |      ;
                       STA.W DMA6REG                        ;83E46B|8D6143  |834361;
                       LDA.B #$FF                           ;83E46E|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83E470|8D6243  |834362;
                       LDA.B #$96                           ;83E473|A996    |      ;
                       STA.W DMA6ADDRM                      ;83E475|8D6343  |834363;
                       LDA.B #$7E                           ;83E478|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83E47A|8D6443  |834364;
                       REP #$20                             ;83E47D|C220    |      ;
                       SEP #$20                             ;83E47F|E220    |      ;
                       LDA.W $021E                          ;83E481|AD1E02  |83021E;
                       ORA.B #$C0                           ;83E484|09C0    |      ;
                       STA.W $021E                          ;83E486|8D1E02  |83021E;
                       REP #$20                             ;83E489|C220    |      ;
                       RTS                                  ;83E48B|60      |      ;
                       LDA.L $7E96E3                        ;83E48C|AFE3967E|7E96E3;
                       DEC A                                ;83E490|3A      |      ;
                       STA.L $7E96E3                        ;83E491|8FE3967E|7E96E3;
                       BNE +                                ;83E495|D003    |83E49A;
                       INC.W $1A6E                          ;83E497|EE6E1A  |831A6E;
 
                     + JSR.W CODE_FN_8381DC                 ;83E49A|20DC81  |8381DC;
                       SEP #$20                             ;83E49D|E220    |      ;
                       LDA.B #$02                           ;83E49F|A902    |      ;
                       STA.W DMA7PARAM                      ;83E4A1|8D7043  |834370;
                       LDA.B #$0D                           ;83E4A4|A90D    |      ;
                       STA.W DMA7REG                        ;83E4A6|8D7143  |834371;
                       LDA.B #$FF                           ;83E4A9|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83E4AB|8D7243  |834372;
                       LDA.B #$96                           ;83E4AE|A996    |      ;
                       STA.W DMA7ADDRM                      ;83E4B0|8D7343  |834373;
                       LDA.B #$7E                           ;83E4B3|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83E4B5|8D7443  |834374;
                       REP #$20                             ;83E4B8|C220    |      ;
                       SEP #$20                             ;83E4BA|E220    |      ;
                       LDA.B #$02                           ;83E4BC|A902    |      ;
                       STA.W DMA6PARAM                      ;83E4BE|8D6043  |834360;
                       LDA.B #$11                           ;83E4C1|A911    |      ;
                       STA.W DMA6REG                        ;83E4C3|8D6143  |834361;
                       LDA.B #$FF                           ;83E4C6|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83E4C8|8D6243  |834362;
                       LDA.B #$96                           ;83E4CB|A996    |      ;
                       STA.W DMA6ADDRM                      ;83E4CD|8D6343  |834363;
                       LDA.B #$7E                           ;83E4D0|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83E4D2|8D6443  |834364;
                       REP #$20                             ;83E4D5|C220    |      ;
                       SEP #$20                             ;83E4D7|E220    |      ;
                       LDA.W $021E                          ;83E4D9|AD1E02  |83021E;
                       ORA.B #$C0                           ;83E4DC|09C0    |      ;
                       STA.W $021E                          ;83E4DE|8D1E02  |83021E;
                       REP #$20                             ;83E4E1|C220    |      ;
                       JSR.W CODE_FN_839573                 ;83E4E3|207395  |839573;
                       RTS                                  ;83E4E6|60      |      ;
                       LDA.W #$000B                         ;83E4E7|A90B00  |      ;
                       STA.W Game_State_State               ;83E4EA|8DA202  |8302A2;
                       JSR.W CODE_FN_8381DC                 ;83E4ED|20DC81  |8381DC;
                       SEP #$20                             ;83E4F0|E220    |      ;
                       LDA.B #$02                           ;83E4F2|A902    |      ;
                       STA.W DMA7PARAM                      ;83E4F4|8D7043  |834370;
                       LDA.B #$0D                           ;83E4F7|A90D    |      ;
                       STA.W DMA7REG                        ;83E4F9|8D7143  |834371;
                       LDA.B #$FF                           ;83E4FC|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83E4FE|8D7243  |834372;
                       LDA.B #$96                           ;83E501|A996    |      ;
                       STA.W DMA7ADDRM                      ;83E503|8D7343  |834373;
                       LDA.B #$7E                           ;83E506|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83E508|8D7443  |834374;
                       REP #$20                             ;83E50B|C220    |      ;
                       SEP #$20                             ;83E50D|E220    |      ;
                       LDA.B #$02                           ;83E50F|A902    |      ;
                       STA.W DMA6PARAM                      ;83E511|8D6043  |834360;
                       LDA.B #$11                           ;83E514|A911    |      ;
                       STA.W DMA6REG                        ;83E516|8D6143  |834361;
                       LDA.B #$FF                           ;83E519|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83E51B|8D6243  |834362;
                       LDA.B #$96                           ;83E51E|A996    |      ;
                       STA.W DMA6ADDRM                      ;83E520|8D6343  |834363;
                       LDA.B #$7E                           ;83E523|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83E525|8D6443  |834364;
                       REP #$20                             ;83E528|C220    |      ;
                       SEP #$20                             ;83E52A|E220    |      ;
                       LDA.W $021E                          ;83E52C|AD1E02  |83021E;
                       ORA.B #$C0                           ;83E52F|09C0    |      ;
                       STA.W $021E                          ;83E531|8D1E02  |83021E;
                       REP #$20                             ;83E534|C220    |      ;
                       JSR.W CODE_FN_839573                 ;83E536|207395  |839573;
                       RTS                                  ;83E539|60      |      ;
                       LDA.B $B7                            ;83E53A|A5B7    |0000B7;
                       BIT.W #$1080                         ;83E53C|898010  |      ;
                       BEQ +                                ;83E53F|F009    |83E54A;
                       LDA.W #$0003                         ;83E541|A90300  |      ;
                       STA.W $1A6E                          ;83E544|8D6E1A  |001A6E;
                       STZ.W $1A70                          ;83E547|9C701A  |001A70;
 
                     + LDA.W $1A6E                          ;83E54A|AD6E1A  |001A6E;
                       ASL A                                ;83E54D|0A      |      ;
                       TAX                                  ;83E54E|AA      |      ;
                       JSR.W (DATA8_83E556,X)               ;83E54F|FC56E5  |83E556;
                       JSR.W CODE_FN_839565                 ;83E552|206595  |839565;
                       RTS                                  ;83E555|60      |      ;
 
         DATA8_83E556:
                       db $5E,$E5,$6E,$E5,$87,$E5,$B1,$E5   ;83E556|        |      ;
                       INC.W $1A6E                          ;83E55E|EE6E1A  |001A6E;
                       LDA.W #$0020                         ;83E561|A92000  |      ;
                       STA.W $1A70                          ;83E564|8D701A  |001A70;
                       JSR.W CODE_FN_83ADFD                 ;83E567|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83A058                 ;83E56A|2058A0  |83A058;
                       RTS                                  ;83E56D|60      |      ;
                       DEC.W $1A70                          ;83E56E|CE701A  |001A70;
                       BNE +                                ;83E571|D003    |83E576;
                       INC.W $1A6E                          ;83E573|EE6E1A  |001A6E;
 
                     + LDA.W #$0001                         ;83E576|A90100  |      ;
                       STA.L $7E995F                        ;83E579|8F5F997E|7E995F;
                       JSR.W CODE_FN_839923                 ;83E57D|202399  |839923;
                       JSR.W CODE_FN_8395CD                 ;83E580|20CD95  |8395CD;
                       JSR.W CODE_FN_83A0E3                 ;83E583|20E3A0  |83A0E3;
                       RTS                                  ;83E586|60      |      ;
                       JSR.W CODE_FN_83AD97                 ;83E587|2097AD  |83AD97;
                       LDA.L $7E96E5                        ;83E58A|AFE5967E|7E96E5;
                       CMP.W #$0070                         ;83E58E|C97000  |      ;
                       BPL +                                ;83E591|1007    |83E59A;
                       INC A                                ;83E593|1A      |      ;
                       STA.L $7E96E5                        ;83E594|8FE5967E|7E96E5;
                       BRA ++                               ;83E598|8010    |83E5AA;
 
                     + LDA.W #$0070                         ;83E59A|A97000  |      ;
                       STA.L $7E96E5                        ;83E59D|8FE5967E|7E96E5;
                       LDA.W #$0020                         ;83E5A1|A92000  |      ;
                       STA.W $1A70                          ;83E5A4|8D701A  |001A70;
                       INC.W $1A6E                          ;83E5A7|EE6E1A  |001A6E;
 
                    ++ JSR.W CODE_FN_83AEE0                 ;83E5AA|20E0AE  |83AEE0;
                       JSR.W CODE_FN_83958D                 ;83E5AD|208D95  |83958D;
                       RTS                                  ;83E5B0|60      |      ;
                       DEC.W $1A70                          ;83E5B1|CE701A  |001A70;
                       BPL +                                ;83E5B4|1019    |83E5CF;
                       LDA.W #$000B                         ;83E5B6|A90B00  |      ;
                       STA.W Game_State_State               ;83E5B9|8DA202  |0002A2;
                       STZ.W $1A6E                          ;83E5BC|9C6E1A  |001A6E;
                       STZ.W $1A70                          ;83E5BF|9C701A  |001A70;
                       LDA.W #$0002                         ;83E5C2|A90200  |      ;
                       STA.L $000346                        ;83E5C5|8F460300|000346;
                       LDA.W #$0006                         ;83E5C9|A90600  |      ;
                       STA.W StageClear_LevelLo             ;83E5CC|8D3C03  |00033C;
 
                     + JSR.W CODE_FN_83AEE0                 ;83E5CF|20E0AE  |83AEE0;
                       JSR.W CODE_FN_83958D                 ;83E5D2|208D95  |83958D;
                       RTS                                  ;83E5D5|60      |      ;
 
       CODE_FN_83E5D6:
                       LDA.B $A9                            ;83E5D6|A5A9    |0000A9;
                       LSR A                                ;83E5D8|4A      |      ;
                       AND.W #$0002                         ;83E5D9|290200  |      ;
                       TAX                                  ;83E5DC|AA      |      ;
                       JSR.W (DATA8_83E5E1,X)               ;83E5DD|FCE1E5  |83E5E1;
                       RTS                                  ;83E5E0|60      |      ;
 
         DATA8_83E5E1:
                       db $E5,$E5,$EC,$E5                   ;83E5E1|        |      ;
                       JSR.W CODE_FN_83ADFD                 ;83E5E5|20FDAD  |83ADFD;
                       JSR.W CODE_FN_8398D7                 ;83E5E8|20D798  |8398D7;
                       RTS                                  ;83E5EB|60      |      ;
                       JSR.W CODE_FN_83AE6D                 ;83E5EC|206DAE  |83AE6D;
                       JSR.W CODE_FN_8398D7                 ;83E5EF|20D798  |8398D7;
                       RTS                                  ;83E5F2|60      |      ;
 
       CODE_FN_83E5F3:
                       LDA.B $B7                            ;83E5F3|A5B7    |0000B7;
                       BIT.W #$1080                         ;83E5F5|898010  |      ;
                       BEQ +                                ;83E5F8|F00B    |83E605;
                       LDA.W #$000B                         ;83E5FA|A90B00  |      ;
                       STA.W Game_State_State               ;83E5FD|8DA202  |0002A2;
                       STZ.W $1A6E                          ;83E600|9C6E1A  |001A6E;
                       BRA ++                               ;83E603|800E    |83E613;
 
                     + BIT.W #$8000                         ;83E605|890080  |      ;
                       BEQ ++                               ;83E608|F009    |83E613;
                       LDA.W #$0008                         ;83E60A|A90800  |      ;
                       STA.W Game_State_State               ;83E60D|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83E610|9C6E1A  |831A6E;
 
                    ++ JSR.W CODE_FN_83E617                 ;83E613|2017E6  |83E617;
                       RTS                                  ;83E616|60      |      ;
 
       CODE_FN_83E617:
                       LDA.L $7E9610                        ;83E617|AF10967E|7E9610;
                       DEC A                                ;83E61B|3A      |      ;
                       BEQ +                                ;83E61C|F008    |83E626;
                       db $8F,$10,$96,$7E,$20,$42,$E6,$60   ;83E61E|        |7E9610;
 
                     + LDA.B $A9                            ;83E626|A5A9    |0000A9;
                       LSR A                                ;83E628|4A      |      ;
                       AND.W #$0002                         ;83E629|290200  |      ;
                       TAX                                  ;83E62C|AA      |      ;
                       JSR.W (DATA8_83E631,X)               ;83E62D|FC31E6  |83E631;
                       RTS                                  ;83E630|60      |      ;
 
         DATA8_83E631:
                       db $35,$E6,$42,$E6                   ;83E631|        |      ;
                       JSR.W CODE_FN_83ADFD                 ;83E635|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AE4E                 ;83E638|204EAE  |83AE4E;
                       JSR.W CODE_FN_83AEB0                 ;83E63B|20B0AE  |83AEB0;
                       JSR.W CODE_FN_8398D7                 ;83E63E|20D798  |8398D7;
                       RTS                                  ;83E641|60      |      ;
                       JSR.W CODE_FN_83AE6D                 ;83E642|206DAE  |83AE6D;
                       JSR.W CODE_FN_8398D7                 ;83E645|20D798  |8398D7;
                       LDA.W StageClear_LevelLo             ;83E648|AD3C03  |83033C;
                       DEC A                                ;83E64B|3A      |      ;
                       CMP.W $0342                          ;83E64C|CD4203  |830342;
                       BEQ +                                ;83E64F|F003    |83E654;
                       db $20,$B0,$AE                       ;83E651|        |83AEB0;
 
                     + RTS                                  ;83E654|60      |      ;
                       LDA.W $1A6E                          ;83E655|AD6E1A  |831A6E;
                       ASL A                                ;83E658|0A      |      ;
                       TAX                                  ;83E659|AA      |      ;
                       JSR.W (DATA8_83E65E,X)               ;83E65A|FC5EE6  |83E65E;
                       RTS                                  ;83E65D|60      |      ;
 
         DATA8_83E65E:
                       db $FF,$E6                           ;83E65E|        |      ;
                       db $6D,$E7,$9D,$E7,$E4,$E7           ;83E660|        |009DE7;
 
       CODE_FN_83E666:
                       LDA.W #$0000                         ;83E666|A90000  |      ;
                       STA.L $7E95D8                        ;83E669|8FD8957E|7E95D8;
                       STA.L $7E95DA                        ;83E66D|8FDA957E|7E95DA;
                       STA.L $7E95DC                        ;83E671|8FDC957E|7E95DC;
                       LDA.W $0342                          ;83E675|AD4203  |830342;
                       LSR A                                ;83E678|4A      |      ;
                       STA.L $7E95E8                        ;83E679|8FE8957E|7E95E8;
                       LDA.W $0342                          ;83E67D|AD4203  |830342;
                       INC A                                ;83E680|1A      |      ;
                       AND.W #$FFFE                         ;83E681|29FEFF  |      ;
                       TAX                                  ;83E684|AA      |      ;
 
                     - DEX                                  ;83E685|CA      |      ;
                       DEX                                  ;83E686|CA      |      ;
                       BMI +                                ;83E687|3009    |83E692;
                       LDA.W #$0001                         ;83E689|A90100  |      ;
                       STA.L $7E95D8,X                      ;83E68C|9FD8957E|7E95D8;
                       BRA -                                ;83E690|80F3    |83E685;
 
                     + LDA.W #$0000                         ;83E692|A90000  |      ;
                       STA.L $7E95DE                        ;83E695|8FDE957E|7E95DE;
                       RTS                                  ;83E699|60      |      ;
 
       CODE_FN_83E69A:
                       LDA.W $0342                          ;83E69A|AD4203  |830342;
                       BRA +                                ;83E69D|8004    |83E6A3;
 
       CODE_FN_83E69F:
                       LDA.W StageClear_LevelLo             ;83E69F|AD3C03  |83033C;
                       DEC A                                ;83E6A2|3A      |      ;
 
                     + TAX                                  ;83E6A3|AA      |      ;
                       AND.W #$0001                         ;83E6A4|290100  |      ;
                       STA.L $7E96E7                        ;83E6A7|8FE7967E|7E96E7;
                       STA.L $7E96EB                        ;83E6AB|8FEB967E|7E96EB;
                       TXA                                  ;83E6AF|8A      |      ;
                       LSR A                                ;83E6B0|4A      |      ;
                       TAX                                  ;83E6B1|AA      |      ;
                       LDA.W DATA8_83E6BD,X                 ;83E6B2|BDBDE6  |83E6BD;
                       AND.W #$00FF                         ;83E6B5|29FF00  |      ;
                       STA.L $7E96F5                        ;83E6B8|8FF5967E|7E96F5;
                       RTS                                  ;83E6BC|60      |      ;
 
         DATA8_83E6BD:
                       db $00,$01,$02                       ;83E6BD|        |      ;
 
       CODE_FN_83E6C0:
                       LDA.W Character_1P                   ;83E6C0|ADBA02  |8302BA;
                       STA.B $00                            ;83E6C3|8500    |000000;
                       LDA.L $7E96F5                        ;83E6C5|AFF5967E|7E96F5;
                       ASL A                                ;83E6C9|0A      |      ;
                       CLC                                  ;83E6CA|18      |      ;
                       ADC.L $7E96E7                        ;83E6CB|6FE7967E|7E96E7;
                       STA.W Character_1P                   ;83E6CF|8DBA02  |8302BA;
                       STA.W StageClear_LevelLo             ;83E6D2|8D3C03  |83033C;
                       CMP.B $00                            ;83E6D5|C500    |000000;
                       BEQ +                                ;83E6D7|F003    |83E6DC;
                       JSR.W CODE_FN_8384F3                 ;83E6D9|20F384  |8384F3;
 
                     + INC.W StageClear_LevelLo             ;83E6DC|EE3C03  |83033C;
                       LDA.W $0340                          ;83E6DF|AD4003  |830340;
                       BNE +                                ;83E6E2|D01A    |83E6FE;
                       LDA.W $0346                          ;83E6E4|AD4603  |830346;
                       CMP.W #$0001                         ;83E6E7|C90100  |      ;
                       BNE +                                ;83E6EA|D012    |83E6FE;
                       db $A9,$01,$00,$8D,$6E,$1A,$A9,$03   ;83E6EC|        |      ;
                       db $00,$8D,$A2,$02,$A9,$06,$00,$8D   ;83E6F4|        |      ;
                       db $BA,$02                           ;83E6FC|        |      ;
 
                     + RTS                                  ;83E6FE|60      |      ;
                       JSR.W CODE_FN_83AEE0                 ;83E6FF|20E0AE  |83AEE0;
                       JSR.W CODE_FN_83E666                 ;83E702|2066E6  |83E666;
                       JSR.W CODE_FN_83E6C0                 ;83E705|20C0E6  |83E6C0;
                       LDA.L $7E95EC                        ;83E708|AFEC957E|7E95EC;
                       BEQ +                                ;83E70C|F007    |83E715;
                       LDA.W #$0003                         ;83E70E|A90300  |      ;
                       STA.L $7E95EE                        ;83E711|8FEE957E|7E95EE;
 
                     + LDX.W #$0000                         ;83E715|A20000  |      ;
                       JSR.W CODE_FN_838E7D                 ;83E718|207D8E  |838E7D;
                       LDA.L $7E96F5                        ;83E71B|AFF5967E|7E96F5;
                       CMP.W #$0003                         ;83E71F|C90300  |      ;
                       BNE +                                ;83E722|D003    |83E727;
                       db $EE,$6E,$1A                       ;83E724|        |001A6E;
 
                     + LDA.B $B7                            ;83E727|A5B7    |0000B7;
                       BIT.W #$1080                         ;83E729|898010  |      ;
                       BEQ +                                ;83E72C|F012    |83E740;
                       db $20,$CD,$84,$20,$F3,$84,$A9,$05   ;83E72E|        |8384CD;
                       db $00,$8D,$A2,$02,$9C,$6E,$1A,$4C   ;83E736|        |      ;
                       db $54,$E7                           ;83E73E|        |      ;
 
                     + BIT.W #$8000                         ;83E740|890080  |      ;
                       BEQ +                                ;83E743|F00F    |83E754;
                       JSR.W CODE_FN_8384D4                 ;83E745|20D484  |8384D4;
                       JSR.W CODE_FN_8384F3                 ;83E748|20F384  |8384F3;
                       LDA.W #$0009                         ;83E74B|A90900  |      ;
                       STA.W Game_State_State               ;83E74E|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83E751|9C6E1A  |831A6E;
 
                     + JSR.W CODE_FN_839914                 ;83E754|201499  |839914;
                       JSR.W CODE_FN_839565                 ;83E757|206595  |839565;
                       JSR.W CODE_FN_8395CD                 ;83E75A|20CD95  |8395CD;
                       JSR.W CODE_FN_83AEB0                 ;83E75D|20B0AE  |83AEB0;
                       JSR.W CODE_FN_8398D7                 ;83E760|20D798  |8398D7;
                       JSR.W CODE_FN_83ADFD                 ;83E763|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AE4E                 ;83E766|204EAE  |83AE4E;
                       JSR.W CODE_FN_83A058                 ;83E769|2058A0  |83A058;
                       RTS                                  ;83E76C|60      |      ;
                       db $20,$97,$AD,$AF,$E5,$96,$7E,$C9   ;83E76D|        |83AD97;
                       db $70,$00,$10,$0A,$18,$69,$04,$00   ;83E775|        |83E777;
                       db $8F,$E5,$96,$7E,$80,$10,$A9,$70   ;83E77D|        |7E96E5;
                       db $00,$8F,$E5,$96,$7E,$EE,$6E,$1A   ;83E785|        |      ;
                       db $A9,$06,$00,$8D,$BA,$02,$20,$E0   ;83E78D|        |      ;
                       db $AE,$20,$65,$95,$20,$8D,$95,$60   ;83E795|        |006520;
                       db $A5,$BB,$89,$00,$08,$F0,$06,$EE   ;83E79D|        |0000BB;
                       db $6E,$1A,$20,$AB,$84,$A5,$B7,$89   ;83E7A5|        |00201A;
                       db $80,$10,$F0,$1B,$20,$CD,$84,$A9   ;83E7AD|        |83E7BF;
                       db $0B,$00,$8D,$A2,$02,$9C,$6E,$1A   ;83E7B5|        |      ;
                       db $A9,$02,$00,$8D,$46,$03,$A9,$03   ;83E7BD|        |      ;
                       db $00,$8F,$16,$96,$7E,$80,$0B,$89   ;83E7C5|        |      ;
                       db $00,$80,$F0,$06,$20,$D4,$84,$EE   ;83E7CD|        |      ;
                       db $6E,$1A,$20,$E0,$AE,$20,$65,$95   ;83E7D5|        |00201A;
                       db $20,$8D,$95,$20,$37,$99,$60,$AF   ;83E7DD|        |83958D;
                       db $E5,$96,$7E,$38,$E9,$04,$00,$30   ;83E7E5|        |000096;
                       db $06,$8F,$E5,$96,$7E,$80,$1C,$A9   ;83E7ED|        |00008F;
                       db $00,$00,$8F,$E5,$96,$7E,$8D,$46   ;83E7F5|        |      ;
                       db $03,$8D,$6E,$1A,$A9,$02,$00,$8F   ;83E7FD|        |00008D;
                       db $F5,$96,$7E,$AF,$EB,$96,$7E,$8F   ;83E805|        |000096;
                       db $E7,$96,$7E,$20,$E0,$AE,$20,$65   ;83E80D|        |000096;
                       db $95,$20,$8D,$95,$60               ;83E815|        |000020;
                       LDA.W $1A6E                          ;83E81A|AD6E1A  |831A6E;
                       ASL A                                ;83E81D|0A      |      ;
                       TAX                                  ;83E81E|AA      |      ;
                       JSR.W (DATA8_83E823,X)               ;83E81F|FC23E8  |83E823;
                       RTS                                  ;83E822|60      |      ;
 
         DATA8_83E823:
                       db $31,$E8,$76,$E8,$98,$E8,$D5,$E8   ;83E823|        |      ;
                       db $12,$E9,$37,$E9,$50,$E9           ;83E82B|        |      ;
                       INC.W $1A6E                          ;83E831|EE6E1A  |831A6E;
                       LDA.W #$0000                         ;83E834|A90000  |      ;
                       JSL.L CODE_FL_80A1E0                 ;83E837|22E0A180|80A1E0;
                       PHB                                  ;83E83B|8B      |      ;
                       PHK                                  ;83E83C|4B      |      ;
                       PLB                                  ;83E83D|AB      |      ;
                       LDY.W #$E848                         ;83E83E|A048E8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E841|22CAA080|80A0CA;
                       PLB                                  ;83E845|AB      |      ;
                       BRA +                                ;83E846|8008    |83E850;
                       db $00,$28,$7E,$00,$04,$80,$C0,$6B   ;83E848|        |      ;
 
                     + PHB                                  ;83E850|8B      |      ;
                       PHK                                  ;83E851|4B      |      ;
                       PLB                                  ;83E852|AB      |      ;
                       LDY.W #$E85D                         ;83E853|A05DE8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83E856|22CAA080|80A0CA;
                       PLB                                  ;83E85A|AB      |      ;
                       BRA +                                ;83E85B|8008    |83E865;
                       db $00,$28,$7E,$00,$04,$80,$C0,$7B   ;83E85D|        |      ;
 
                     + JSR.W CODE_FN_83AEB0                 ;83E865|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83E868|A90100  |      ;
                       STA.L $7E995F                        ;83E86B|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E86F|206595  |839565;
                       JSR.W CODE_FN_83A042                 ;83E872|2042A0  |83A042;
                       RTS                                  ;83E875|60      |      ;
                       INC.W $1A6E                          ;83E876|EE6E1A  |831A6E;
                       LDY.W #$E881                         ;83E879|A081E8  |      ;
                       JSR.W CODE_FN_838BBA                 ;83E87C|20BA8B  |838BBA;
                       BRA +                                ;83E87F|8003    |83E884;
                       db $A8,$D8,$0C                       ;83E881|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83E884|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83E887|20F18B  |838BF1;
                       JSR.W CODE_FN_83AEB0                 ;83E88A|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83E88D|A90100  |      ;
                       STA.L $7E995F                        ;83E890|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E894|206595  |839565;
                       RTS                                  ;83E897|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83E898|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83E89B|20F18B  |838BF1;
                       JSR.W CODE_FN_83AEB0                 ;83E89E|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83E8A1|A90100  |      ;
                       STA.L $7E995F                        ;83E8A4|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E8A8|206595  |839565;
                       LDA.L $7E998D                        ;83E8AB|AF8D997E|7E998D;
                       BNE +                                ;83E8AF|D023    |83E8D4;
                       INC.W $1A6E                          ;83E8B1|EE6E1A  |831A6E;
                       LDY.W #$E8BF                         ;83E8B4|A0BFE8  |      ;
                       JSR.W CODE_FN_839FC2                 ;83E8B7|20C29F  |839FC2;
                       JSR.W CODE_FN_839FD8                 ;83E8BA|20D89F  |839FD8;
                       BRA ++                               ;83E8BD|8004    |83E8C3;
                       db $00,$05,$00,$07                   ;83E8BF|        |      ;
 
                    ++ JSR.W CODE_FN_83A058                 ;83E8C3|2058A0  |83A058;
                       LDY.W #$E8CE                         ;83E8C6|A0CEE8  |      ;
                       JSR.W CODE_FN_838BBA                 ;83E8C9|20BA8B  |838BBA;
                       BRA ++                               ;83E8CC|8003    |83E8D1;
                       db $68,$98,$0C                       ;83E8CE|        |      ;
 
                    ++ JSR.W CODE_FN_838BF1                 ;83E8D1|20F18B  |838BF1;
 
                     + RTS                                  ;83E8D4|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83E8D5|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83E8D8|20F18B  |838BF1;
                       JSR.W CODE_FN_83AEB0                 ;83E8DB|20B0AE  |83AEB0;
                       LDA.W #$0001                         ;83E8DE|A90100  |      ;
                       STA.L $7E995F                        ;83E8E1|8F5F997E|7E995F;
                       JSR.W CODE_FN_839565                 ;83E8E5|206595  |839565;
                       LDA.L $7E998D                        ;83E8E8|AF8D997E|7E998D;
                       BNE +                                ;83E8EC|D023    |83E911;
                       INC.W $1A6E                          ;83E8EE|EE6E1A  |831A6E;
                       LDY.W #$E8FC                         ;83E8F1|A0FCE8  |      ;
                       JSR.W CODE_FN_839FC2                 ;83E8F4|20C29F  |839FC2;
                       JSR.W CODE_FN_839FD8                 ;83E8F7|20D89F  |839FD8;
                       BRA ++                               ;83E8FA|8004    |83E900;
                       db $00,$03,$00,$05                   ;83E8FC|        |      ;
 
                    ++ JSR.W CODE_FN_83A058                 ;83E900|2058A0  |83A058;
                       LDY.W #$E90B                         ;83E903|A00BE9  |      ;
                       JSR.W CODE_FN_838BBA                 ;83E906|20BA8B  |838BBA;
                       BRA ++                               ;83E909|8003    |83E90E;
                       db $28,$58,$0C                       ;83E90B|        |      ;
 
                    ++ JSR.W CODE_FN_838BF1                 ;83E90E|20F18B  |838BF1;
 
                     + RTS                                  ;83E911|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83E912|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83E915|20F18B  |838BF1;
                       JSR.W CODE_FN_83AEB0                 ;83E918|20B0AE  |83AEB0;
                       LDA.L $7E998D                        ;83E91B|AF8D997E|7E998D;
                       BNE +                                ;83E91F|D015    |83E936;
                       INC.W $1A6E                          ;83E921|EE6E1A  |831A6E;
                       LDY.W #$E92F                         ;83E924|A02FE9  |      ;
                       JSR.W CODE_FN_839FC2                 ;83E927|20C29F  |839FC2;
                       JSR.W CODE_FN_839FD8                 ;83E92A|20D89F  |839FD8;
                       BRA ++                               ;83E92D|8004    |83E933;
                       db $00,$01,$00,$03                   ;83E92F|        |      ;
 
                    ++ JSR.W CODE_FN_83A058                 ;83E933|2058A0  |83A058;
 
                     + RTS                                  ;83E936|60      |      ;
                       INC.W $1A6E                          ;83E937|EE6E1A  |831A6E;
                       JSR.W CODE_FN_838193                 ;83E93A|209381  |838193;
                       LDY.W #$E948                         ;83E93D|A048E9  |      ;
                       JSR.W CODE_FN_839FC2                 ;83E940|20C29F  |839FC2;
                       JSR.W CODE_FN_839FD8                 ;83E943|20D89F  |839FD8;
                       BRA +                                ;83E946|8004    |83E94C;
                       db $00,$00,$40,$01                   ;83E948|        |      ;
 
                     + JSR.W CODE_FN_83A058                 ;83E94C|2058A0  |83A058;
                       RTS                                  ;83E94F|60      |      ;
                       JSR.W CODE_FN_83A083                 ;83E950|2083A0  |83A083;
                       DEC.W Game_State                     ;83E953|CEA002  |8302A0;
                       LDA.W #$0012                         ;83E956|A91200  |      ;
                       STA.W Game_State_State               ;83E959|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83E95C|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83E95F|9C701A  |831A70;
                       RTS                                  ;83E962|60      |      ;
                       db $60                               ;83E963|        |      ;
                       JSR.W CODE_FN_83849D                 ;83E964|209D84  |83849D;
                       LDY.W #$0001                         ;83E967|A00100  |      ;
                       JSL.L CODE_FL_80AF18                 ;83E96A|2218AF80|80AF18;
                       BCC +                                ;83E96E|905A    |83E9CA;
                       REP #$20                             ;83E970|C220    |      ;
                       LDA.W Character_1P                   ;83E972|ADBA02  |8302BA;
                       CMP.W #$0006                         ;83E975|C90600  |      ;
                       BEQ ++                               ;83E978|F008    |83E982;
                       LDA.W StageClear_LevelHi             ;83E97A|AD3E03  |83033E;
                       CMP.W #$0001                         ;83E97D|C90100  |      ;
                       BNE UNREACH_83E988                   ;83E980|D006    |83E988;
 
                    ++ JSL.L CODE_FL_86D871                 ;83E982|2271D886|86D871;
                       BRA ++                               ;83E986|8009    |83E991;
 
       UNREACH_83E988:
                       db $EE,$A0,$02,$A9,$00,$00,$8D,$A2   ;83E988|        |0002A0;
                       db $02                               ;83E990|        |      ;
 
                    ++ LDA.W StageClear_LevelLo             ;83E991|AD3C03  |83033C;
                       STA.L $7E94E8                        ;83E994|8FE8947E|7E94E8;
                       LDA.W $0342                          ;83E998|AD4203  |830342;
                       STA.L $7E94EA                        ;83E99B|8FEA947E|7E94EA;
                       LDA.W #$0001                         ;83E99F|A90100  |      ;
                       STA.L $7E94E6                        ;83E9A2|8FE6947E|7E94E6;
                       JSL.L CODE_FL_80A145                 ;83E9A6|2245A180|80A145;
                       LDA.W $0346                          ;83E9AA|AD4603  |830346;
                       BNE ++                               ;83E9AD|D02C    |83E9DB;
                       LDA.W $0342                          ;83E9AF|AD4203  |830342;
                       CMP.W #$0003                         ;83E9B2|C90300  |      ;
                       BNE ++                               ;83E9B5|D024    |83E9DB;
                       LDA.W StageClear_LevelHi             ;83E9B7|AD3E03  |83033E;
                       CMP.W #$0001                         ;83E9BA|C90100  |      ;
                       BNE ++                               ;83E9BD|D01C    |83E9DB;
                       LDA.W #$0001                         ;83E9BF|A90100  |      ;
                       STA.W $0340                          ;83E9C2|8D4003  |830340;
                       STA.L $7E94F6                        ;83E9C5|8FF6947E|7E94F6;
                       RTS                                  ;83E9C9|60      |      ;
 
                     + REP #$20                             ;83E9CA|C220    |      ;
                       JSR.W CODE_FN_83AEB0                 ;83E9CC|20B0AE  |83AEB0;
                       JSR.W CODE_FN_839565                 ;83E9CF|206595  |839565;
                       LDA.L $7E9616                        ;83E9D2|AF16967E|7E9616;
                       ASL A                                ;83E9D6|0A      |      ;
                       TAX                                  ;83E9D7|AA      |      ;
                       JSR.W (UNREACH_83E9DC,X)             ;83E9D8|FCDCE9  |83E9DC;
 
                    ++ RTS                                  ;83E9DB|60      |      ;
 
       UNREACH_83E9DC:
                       db $E6,$E9                           ;83E9DC|        |0000E9;
                       db $E6,$E9,$01,$EA,$A0,$EA           ;83E9DE|        |      ;
                       db $F6,$E9                           ;83E9E4|        |0000E9;
                       JSR.W CODE_FN_83ADFD                 ;83E9E6|20FDAD  |83ADFD;
                       JSR.W CODE_FN_83AE4E                 ;83E9E9|204EAE  |83AE4E;
                       JSR.W CODE_FN_8395CD                 ;83E9EC|20CD95  |8395CD;
                       JSR.W CODE_FN_8398D7                 ;83E9EF|20D798  |8398D7;
                       JSR.W CODE_FN_83A058                 ;83E9F2|2058A0  |83A058;
                       RTS                                  ;83E9F5|60      |      ;
                       db $AD,$6E,$1A,$C9,$02,$00,$10,$0B   ;83E9F6|        |001A6E;
                       db $80,$53,$60                       ;83E9FE|        |83EA53;
                       LDA.W $1A6E                          ;83EA01|AD6E1A  |831A6E;
                       CMP.W #$0005                         ;83EA04|C90500  |      ;
                       BPL +                                ;83EA07|104A    |83EA53;
                       db $20,$A0,$81,$E2,$20,$A9,$02,$8D   ;83EA09|        |8381A0;
                       db $70,$43,$A9,$0E,$8D,$71,$43,$A9   ;83EA11|        |83EA56;
                       db $FF,$8D,$72,$43,$A9,$96,$8D,$73   ;83EA19|        |43728D;
                       db $43,$A9,$7E,$8D,$74,$43,$C2,$20   ;83EA21|        |0000A9;
                       db $E2,$20,$A9,$02,$8D,$60,$43,$A9   ;83EA29|        |      ;
                       db $12,$8D,$61,$43,$A9,$FF,$8D,$62   ;83EA31|        |00008D;
                       db $43,$A9,$96,$8D,$63,$43,$A9,$7E   ;83EA39|        |0000A9;
                       db $8D,$64,$43,$C2,$20,$E2,$20,$AD   ;83EA41|        |004364;
                       db $1E,$02,$09,$C0,$8D,$1E,$02,$C2   ;83EA49|        |000902;
                       db $20,$60                           ;83EA51|        |832060;
 
                     + JSR.W CODE_FN_839573                 ;83EA53|207395  |839573;
                       JSR.W CODE_FN_8381DC                 ;83EA56|20DC81  |8381DC;
                       SEP #$20                             ;83EA59|E220    |      ;
                       LDA.B #$02                           ;83EA5B|A902    |      ;
                       STA.W DMA7PARAM                      ;83EA5D|8D7043  |834370;
                       LDA.B #$0D                           ;83EA60|A90D    |      ;
                       STA.W DMA7REG                        ;83EA62|8D7143  |834371;
                       LDA.B #$FF                           ;83EA65|A9FF    |      ;
                       STA.W DMA7ADDRL                      ;83EA67|8D7243  |834372;
                       LDA.B #$96                           ;83EA6A|A996    |      ;
                       STA.W DMA7ADDRM                      ;83EA6C|8D7343  |834373;
                       LDA.B #$7E                           ;83EA6F|A97E    |      ;
                       STA.W DMA7ADDRH                      ;83EA71|8D7443  |834374;
                       REP #$20                             ;83EA74|C220    |      ;
                       SEP #$20                             ;83EA76|E220    |      ;
                       LDA.B #$02                           ;83EA78|A902    |      ;
                       STA.W DMA6PARAM                      ;83EA7A|8D6043  |834360;
                       LDA.B #$11                           ;83EA7D|A911    |      ;
                       STA.W DMA6REG                        ;83EA7F|8D6143  |834361;
                       LDA.B #$FF                           ;83EA82|A9FF    |      ;
                       STA.W DMA6ADDRL                      ;83EA84|8D6243  |834362;
                       LDA.B #$96                           ;83EA87|A996    |      ;
                       STA.W DMA6ADDRM                      ;83EA89|8D6343  |834363;
                       LDA.B #$7E                           ;83EA8C|A97E    |      ;
                       STA.W DMA6ADDRH                      ;83EA8E|8D6443  |834364;
                       REP #$20                             ;83EA91|C220    |      ;
                       SEP #$20                             ;83EA93|E220    |      ;
                       LDA.W $021E                          ;83EA95|AD1E02  |83021E;
                       ORA.B #$C0                           ;83EA98|09C0    |      ;
                       STA.W $021E                          ;83EA9A|8D1E02  |83021E;
                       REP #$20                             ;83EA9D|C220    |      ;
                       RTS                                  ;83EA9F|60      |      ;
                       JSR.W CODE_FN_83AEE0                 ;83EAA0|20E0AE  |83AEE0;
                       JSR.W CODE_FN_83958D                 ;83EAA3|208D95  |83958D;
                       RTS                                  ;83EAA6|60      |      ;
                       LDA.W Game_State_State               ;83EAA7|ADA202  |8302A2;
                       ASL A                                ;83EAAA|0A      |      ;
                       TAX                                  ;83EAAB|AA      |      ;
                       JSR.W (DATA8_83EAB0,X)               ;83EAAC|FCB0EA  |83EAB0;
                       RTS                                  ;83EAAF|60      |      ;
 
         DATA8_83EAB0:
                       db $BE,$EA,$66,$EB,$7D,$EB           ;83EAB0|        |      ;
                       db $2F,$ED,$F2,$EE                   ;83EAB6|        |EEF2ED;
                       db $67,$EF,$43,$F0                   ;83EABA|        |      ;
                       JSR.W CODE_FN_83BE78                 ;83EABE|2078BE  |83BE78;
                       JSL.L CODE_FL_8A87A0                 ;83EAC1|22A0878A|8A87A0;
                       JSR.W CODE_FN_83BF62                 ;83EAC5|2062BF  |83BF62;
                       JSR.W CODE_FN_838353                 ;83EAC8|205383  |838353;
                       LDA.L $7E94D6                        ;83EACB|AFD6947E|7E94D6;
                       STA.L $7E961E                        ;83EACF|8F1E967E|7E961E;
                       LDA.W #$0000                         ;83EAD3|A90000  |      ;
                       STA.L Puzzle_MenuSelection           ;83EAD6|8F30957E|7E9530;
                       JSR.W CODE_FN_83AA55                 ;83EADA|2055AA  |83AA55;
                       PHB                                  ;83EADD|8B      |      ;
                       PHK                                  ;83EADE|4B      |      ;
                       PLB                                  ;83EADF|AB      |      ;
                       LDY.W #$EAEA                         ;83EAE0|A0EAEA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83EAE3|22CAA080|80A0CA;
                       PLB                                  ;83EAE7|AB      |      ;
                       BRA +                                ;83EAE8|8008    |83EAF2;
                       db $00,$BD,$7F,$00,$20,$80,$00,$20   ;83EAEA|        |      ;
 
                     + JSR.W CODE_FN_83D794                 ;83EAF2|2094D7  |83D794;
                       JSR.W CODE_FN_83B00B                 ;83EAF5|200BB0  |83B00B;
                       JSR.W CODE_FN_83A058                 ;83EAF8|2058A0  |83A058;
                       JSR.W CODE_FN_83B649                 ;83EAFB|2049B6  |83B649;
                       LDA.W Character_1P                   ;83EAFE|ADBA02  |8302BA;
                       JSR.W CODE_FN_83B0AC                 ;83EB01|20ACB0  |83B0AC;
                       JSR.W CODE_FN_83B4E5                 ;83EB04|20E5B4  |83B4E5;
                       JSR.W CODE_FN_83ECDC                 ;83EB07|20DCEC  |83ECDC;
                       STA.L $7E96E3                        ;83EB0A|8FE3967E|7E96E3;
                       JSR.W CODE_FN_83868B                 ;83EB0E|208B86  |83868B;
                       JSR.W CODE_FN_8386C5                 ;83EB11|20C586  |8386C5;
                       INC.W Game_State_State               ;83EB14|EEA202  |8302A2;
                       LDA.W #$000A                         ;83EB17|A90A00  |      ;
                       STA.W $1A6E                          ;83EB1A|8D6E1A  |831A6E;
                       LDA.W #$0000                         ;83EB1D|A90000  |      ;
                       STA.L $7E961C                        ;83EB20|8F1C967E|7E961C;
                       JSR.W CODE_FN_83ECC5                 ;83EB24|20C5EC  |83ECC5;
                       JSR.W CODE_FN_83EE7D                 ;83EB27|207DEE  |83EE7D;
                       LDA.L $7E96E7                        ;83EB2A|AFE7967E|7E96E7;
                       STA.L $7E96EB                        ;83EB2E|8FEB967E|7E96EB;
                       JSR.W CODE_FN_83EE98                 ;83EB32|2098EE  |83EE98;
                       JSR.W CODE_FN_83EB39                 ;83EB35|2039EB  |83EB39;
                       RTS                                  ;83EB38|60      |      ;
 
       CODE_FN_83EB39:
                       LDA.W #$0000                         ;83EB39|A90000  |      ;
                       STA.L $7E9618                        ;83EB3C|8F18967E|7E9618;
                       LDA.W Puzzle_LevelHi                 ;83EB40|AD4E03  |83034E;
                       DEC A                                ;83EB43|3A      |      ;
                       LDX.W #$000A                         ;83EB44|A20A00  |      ;
                       JSR.W CODE_FN_838562                 ;83EB47|206285  |838562;
                       TXA                                  ;83EB4A|8A      |      ;
                       CMP.W Character_1P                   ;83EB4B|CDBA02  |8302BA;
                       BEQ +                                ;83EB4E|F015    |83EB65;
                       LDA.W #$0001                         ;83EB50|A90100  |      ;
                       STA.L $7E9618                        ;83EB53|8F18967E|7E9618;
                       LDA.W #$0004                         ;83EB57|A90400  |      ;
                       STA.L $7E96E7                        ;83EB5A|8FE7967E|7E96E7;
                       LDA.W #$0001                         ;83EB5E|A90100  |      ;
                       STA.L $7E96F5                        ;83EB61|8FF5967E|7E96F5;
 
                     + RTS                                  ;83EB65|60      |      ;
                       LDY.W #$0001                         ;83EB66|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;83EB69|22CBAE80|80AECB;
                       BCC +                                ;83EB6D|9005    |83EB74;
                       REP #$20                             ;83EB6F|C220    |      ;
                       INC.W Game_State_State               ;83EB71|EEA202  |8302A2;
 
                     + REP #$20                             ;83EB74|C220    |      ;
                       JSR.W CODE_FN_839958                 ;83EB76|205899  |839958;
                       JSR.W CODE_FN_83B59B                 ;83EB79|209BB5  |83B59B;
                       RTS                                  ;83EB7C|60      |      ;
                       LDA.W $1A6E                          ;83EB7D|AD6E1A  |831A6E;
                       ASL A                                ;83EB80|0A      |      ;
                       TAX                                  ;83EB81|AA      |      ;
                       JSR.W (DATA8_83EB86,X)               ;83EB82|FC86EB  |83EB86;
                       RTS                                  ;83EB85|60      |      ;
 
         DATA8_83EB86:
                       db $2B,$EC,$4E,$EC,$3F,$D7,$5B,$D7   ;83EB86|        |      ;
                       db $74,$D7,$8D,$D7,$5B,$EC,$65,$EC   ;83EB8E|        |      ;
                       db $F1,$EC,$13,$ED,$A0,$EB,$C3,$EB   ;83EB96|        |      ;
                       db $0C,$EC                           ;83EB9E|        |      ;
                       LDA.L $7E9618                        ;83EBA0|AF18967E|7E9618;
                       BNE +                                ;83EBA4|D00F    |83EBB5;
                       db $EE,$A2,$02,$A9,$00,$00,$8D,$6E   ;83EBA6|        |0002A2;
                       db $1A,$8F,$73,$99,$7E,$80,$0A       ;83EBAE|        |      ;
 
                     + INC.W $1A6E                          ;83EBB5|EE6E1A  |831A6E;
                       LDA.W #$0018                         ;83EBB8|A91800  |      ;
                       STA.L $7E9987                        ;83EBBB|8F87997E|7E9987;
                       JSR.W CODE_FN_83B59B                 ;83EBBF|209BB5  |83B59B;
                       RTS                                  ;83EBC2|60      |      ;
                       LDA.L $7E9987                        ;83EBC3|AF87997E|7E9987;
                       DEC A                                ;83EBC7|3A      |      ;
                       STA.L $7E9987                        ;83EBC8|8F87997E|7E9987;
                       BNE +                                ;83EBCC|D037    |83EC05;
                       INC.W $1A6E                          ;83EBCE|EE6E1A  |831A6E;
                       LDA.W Character_1P                   ;83EBD1|ADBA02  |8302BA;
                       JSR.W CODE_FN_83B0B5                 ;83EBD4|20B5B0  |83B0B5;
                       INC.W Character_1P                   ;83EBD7|EEBA02  |8302BA;
                       LDA.W #$0001                         ;83EBDA|A90100  |      ;
                       STA.L $7E9973                        ;83EBDD|8F73997E|7E9973;
                       JSR.W CODE_FN_83ECDC                 ;83EBE1|20DCEC  |83ECDC;
                       STA.L $7E9987                        ;83EBE4|8F87997E|7E9987;
                       LDA.W #$0002                         ;83EBE8|A90200  |      ;
                       STA.L $7E9985                        ;83EBEB|8F85997E|7E9985;
                       LDA.L $7E9987                        ;83EBEF|AF87997E|7E9987;
                       AND.W #$FF00                         ;83EBF3|2900FF  |      ;
                       STA.L $7E9983                        ;83EBF6|8F83997E|7E9983;
                       LDA.W #$0000                         ;83EBFA|A90000  |      ;
                       STA.L $7E96E7                        ;83EBFD|8FE7967E|7E96E7;
                       STA.L $7E96F5                        ;83EC01|8FF5967E|7E96F5;
 
                     + JSR.W CODE_FN_839958                 ;83EC05|205899  |839958;
                       JSR.W CODE_FN_83B59B                 ;83EC08|209BB5  |83B59B;
                       RTS                                  ;83EC0B|60      |      ;
                       JSR.W CODE_FN_83B5A8                 ;83EC0C|20A8B5  |83B5A8;
                       JSR.W CODE_FN_83B59B                 ;83EC0F|209BB5  |83B59B;
                       LDA.L $7E9973                        ;83EC12|AF73997E|7E9973;
                       BNE +                                ;83EC16|D012    |83EC2A;
                       LDA.W #$0009                         ;83EC18|A90900  |      ;
                       STA.W $1A6E                          ;83EC1B|8D6E1A  |831A6E;
                       LDA.W #$0010                         ;83EC1E|A91000  |      ;
                       STA.W $1A70                          ;83EC21|8D701A  |831A70;
                       LDA.W Character_1P                   ;83EC24|ADBA02  |8302BA;
                       JSR.W CODE_FN_83B0AC                 ;83EC27|20ACB0  |83B0AC;
 
                     + RTS                                  ;83EC2A|60      |      ;
                       LDA.W #$0000                         ;83EC2B|A90000  |      ;
                       STA.L Puzzle_MenuSelection           ;83EC2E|8F30957E|7E9530;
                       LDA.L $7E94D6                        ;83EC32|AFD6947E|7E94D6;
                       BEQ +                                ;83EC36|F00E    |83EC46;
                       INC.W $1A6E                          ;83EC38|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83832B                 ;83EC3B|202B83  |83832B;
                       LDA.W #$0004                         ;83EC3E|A90400  |      ;
                       STA.L $7E943C                        ;83EC41|8F3C947E|7E943C;
                       RTS                                  ;83EC45|60      |      ;
 
                     + JSR.W CODE_FN_83D6D7                 ;83EC46|20D7D6  |83D6D7;
                       JSL.L CODE_FL_8382BA                 ;83EC49|22BA8283|8382BA;
                       RTS                                  ;83EC4D|60      |      ;
                       INC.W $1A6E                          ;83EC4E|EE6E1A  |831A6E;
                       LDA.W #$0028                         ;83EC51|A92800  |      ;
                       JSR.W CODE_FN_83A9E3                 ;83EC54|20E3A9  |83A9E3;
                       JSR.W CODE_FN_8386C5                 ;83EC57|20C586  |8386C5;
                       RTS                                  ;83EC5A|60      |      ;
                       INC.W $1A6E                          ;83EC5B|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83B00B                 ;83EC5E|200BB0  |83B00B;
                       JSR.W CODE_FN_83A058                 ;83EC61|2058A0  |83A058;
                       RTS                                  ;83EC64|60      |      ;
                       INC.W $1A6E                          ;83EC65|EE6E1A  |831A6E;
                       LDA.W #$0000                         ;83EC68|A90000  |      ;
                       STA.L $7E96E3                        ;83EC6B|8FE3967E|7E96E3;
                       LDA.W #$0001                         ;83EC6F|A90100  |      ;
                       STA.L $7E9973                        ;83EC72|8F73997E|7E9973;
                       LDA.W $0348                          ;83EC76|AD4803  |830348;
                       CMP.W #$003C                         ;83EC79|C93C00  |      ;
                       BEQ +                                ;83EC7C|F001    |83EC7F;
                       INC A                                ;83EC7E|1A      |      ;
 
                     + STA.W Puzzle_LevelHi                 ;83EC7F|8D4E03  |83034E;
                       LDA.W Puzzle_LevelHi                 ;83EC82|AD4E03  |83034E;
                       DEC A                                ;83EC85|3A      |      ;
                       LDX.W #$000A                         ;83EC86|A20A00  |      ;
                       JSR.W CODE_FN_838562                 ;83EC89|206285  |838562;
                       TXA                                  ;83EC8C|8A      |      ;
                       STA.W Character_1P                   ;83EC8D|8DBA02  |8302BA;
                       JSR.W CODE_FN_83ECC5                 ;83EC90|20C5EC  |83ECC5;
                       LDA.W #$0001                         ;83EC93|A90100  |      ;
                       STA.L $7E9973                        ;83EC96|8F73997E|7E9973;
                       JSR.W CODE_FN_83ECDC                 ;83EC9A|20DCEC  |83ECDC;
                       STA.L $7E9987                        ;83EC9D|8F87997E|7E9987;
                       LDA.W #$0008                         ;83ECA1|A90800  |      ;
                       STA.L $7E9985                        ;83ECA4|8F85997E|7E9985;
                       LDA.L $7E96E3                        ;83ECA8|AFE3967E|7E96E3;
                       CLC                                  ;83ECAC|18      |      ;
                       ADC.W #$0100                         ;83ECAD|690001  |      ;
                       AND.W #$FF00                         ;83ECB0|2900FF  |      ;
                       STA.L $7E9983                        ;83ECB3|8F83997E|7E9983;
                       JSR.W CODE_FN_83B403                 ;83ECB7|2003B4  |83B403;
                       LDA.W #$0001                         ;83ECBA|A90100  |      ;
                       STA.L $7E995F                        ;83ECBD|8F5F997E|7E995F;
                       JSR.W CODE_FN_83B59B                 ;83ECC1|209BB5  |83B59B;
                       RTS                                  ;83ECC4|60      |      ;
 
       CODE_FN_83ECC5:
                       LDA.W $0348                          ;83ECC5|AD4803  |830348;
                       LDX.W #$000A                         ;83ECC8|A20A00  |      ;
                       JSR.W CODE_FN_838562                 ;83ECCB|206285  |838562;
                       TXA                                  ;83ECCE|8A      |      ;
                       CMP.W #$0006                         ;83ECCF|C90600  |      ;
                       BMI +                                ;83ECD2|3003    |83ECD7;
                       db $A9,$05,$00                       ;83ECD4|        |      ;
 
                     + STA.L $7E961A                        ;83ECD7|8F1A967E|7E961A;
                       RTS                                  ;83ECDB|60      |      ;
 
       CODE_FN_83ECDC:
                       LDA.W Character_1P                   ;83ECDC|ADBA02  |8302BA;
                       ASL A                                ;83ECDF|0A      |      ;
                       TAX                                  ;83ECE0|AA      |      ;
                       LDA.W DATA8_83ECE5,X                 ;83ECE1|BDE5EC  |83ECE5;
                       RTS                                  ;83ECE4|60      |      ;
 
         DATA8_83ECE5:
                       db $C0,$00,$48,$01,$D0,$01,$58,$02   ;83ECE5|        |      ;
                       db $E0,$02,$68,$03                   ;83ECED|        |      ;
                       JSR.W CODE_FN_83B5A8                 ;83ECF1|20A8B5  |83B5A8;
                       JSR.W CODE_FN_83B59B                 ;83ECF4|209BB5  |83B59B;
                       LDA.L $7E9973                        ;83ECF7|AF73997E|7E9973;
                       BNE +                                ;83ECFB|D015    |83ED12;
                       INC.W $1A6E                          ;83ECFD|EE6E1A  |831A6E;
                       LDA.W #$0010                         ;83ED00|A91000  |      ;
                       STA.W $1A70                          ;83ED03|8D701A  |831A70;
                       JSR.W CODE_FN_83EE7D                 ;83ED06|207DEE  |83EE7D;
                       JSR.W CODE_FN_83EE98                 ;83ED09|2098EE  |83EE98;
                       LDA.W Character_1P                   ;83ED0C|ADBA02  |8302BA;
                       JSR.W CODE_FN_83B0AC                 ;83ED0F|20ACB0  |83B0AC;
 
                     + RTS                                  ;83ED12|60      |      ;
                       DEC.W $1A70                          ;83ED13|CE701A  |831A70;
                       BNE +                                ;83ED16|D010    |83ED28;
                       LDA.W #$0005                         ;83ED18|A90500  |      ;
                       STA.W Game_State_State               ;83ED1B|8DA202  |8302A2;
                       LDA.W #$0000                         ;83ED1E|A90000  |      ;
                       STA.W $1A6E                          ;83ED21|8D6E1A  |831A6E;
                       STA.L $7E961C                        ;83ED24|8F1C967E|7E961C;
 
                     + JSR.W CODE_FN_839958                 ;83ED28|205899  |839958;
                       JSR.W CODE_FN_83B59B                 ;83ED2B|209BB5  |83B59B;
                       RTS                                  ;83ED2E|60      |      ;
                       LDA.L $7E9973                        ;83ED2F|AF73997E|7E9973;
                       BEQ +                                ;83ED33|F01B    |83ED50;
                       db $20,$A8,$B5,$AF,$73,$99,$7E,$F0   ;83ED35|        |83B5A8;
                       db $03,$4C,$BF,$ED,$A9,$00,$00,$8F   ;83ED3D|        |00004C;
                       db $73,$99,$7E,$AD,$BA,$02,$20,$AC   ;83ED45|        |000099;
                       db $B0,$80,$6F                       ;83ED4D|        |83ECCF;
 
                     + LDA.L $7E96E7                        ;83ED50|AFE7967E|7E96E7;
                       BNE +                                ;83ED54|D00C    |83ED62;
                       db $A5,$BB,$89,$00,$02,$F0,$05,$20   ;83ED56|        |0000BB;
                       db $CC,$ED,$80,$5D                   ;83ED5E|        |0080ED;
 
                     + LDA.L $7E96E7                        ;83ED62|AFE7967E|7E96E7;
                       CMP.W #$0004                         ;83ED66|C90400  |      ;
                       BNE +                                ;83ED69|D00C    |83ED77;
                       db $A5,$BB,$89,$00,$01,$F0,$05,$20   ;83ED6B|        |0000BB;
                       db $11,$EE,$80,$48                   ;83ED73|        |0000EE;
 
                     + JSR.W CODE_FN_83EE5A                 ;83ED77|205AEE  |83EE5A;
                       JSR.W CODE_FN_83EE98                 ;83ED7A|2098EE  |83EE98;
                       LDA.L $7E95EC                        ;83ED7D|AFEC957E|7E95EC;
                       BEQ +                                ;83ED81|F007    |83ED8A;
                       LDA.W #$0002                         ;83ED83|A90200  |      ;
                       STA.L $7E95EE                        ;83ED86|8FEE957E|7E95EE;
 
                     + LDX.W #$0000                         ;83ED8A|A20000  |      ;
                       JSR.W CODE_FN_838E7D                 ;83ED8D|207D8E  |838E7D;
                       LDA.L $7E95EA                        ;83ED90|AFEA957E|7E95EA;
                       BEQ +                                ;83ED94|F003    |83ED99;
                       db $20,$DB,$84                       ;83ED96|        |8384DB;
 
                     + LDA.B $B7                            ;83ED99|A5B7    |0000B7;
                       BIT.W #$1080                         ;83ED9B|898010  |      ;
                       BEQ +                                ;83ED9E|F00B    |83EDAB;
                       db $20,$CD,$84,$A9,$05,$00,$8D,$A2   ;83EDA0|        |8384CD;
                       db $02,$80,$14                       ;83EDA8|        |      ;
 
                     + BIT.W #$8000                         ;83EDAB|890080  |      ;
                       BEQ +                                ;83EDAE|F00F    |83EDBF;
                       JSR.W CODE_FN_8384D4                 ;83EDB0|20D484  |8384D4;
                       LDA.W #$0004                         ;83EDB3|A90400  |      ;
                       STA.W Game_State_State               ;83EDB6|8DA202  |8302A2;
                       LDA.W Character_1P                   ;83EDB9|ADBA02  |8302BA;
                       JSR.W CODE_FN_83B0B5                 ;83EDBC|20B5B0  |83B0B5;
 
                     + LDA.L $7E9973                        ;83EDBF|AF73997E|7E9973;
                       BNE +                                ;83EDC3|D003    |83EDC8;
                       JSR.W CODE_FN_839958                 ;83EDC5|205899  |839958;
 
                     + JSR.W CODE_FN_83B59B                 ;83EDC8|209BB5  |83B59B;
                       RTS                                  ;83EDCB|60      |      ;
                       db $AD,$BA,$02,$F0,$3F,$3A,$8D,$BA   ;83EDCC|        |0002BA;
                       db $02,$20,$F3,$84,$20,$AB,$84,$A9   ;83EDD4|        |      ;
                       db $02,$00,$8F,$73,$99,$7E,$20,$DC   ;83EDDC|        |      ;
                       db $EC,$8F,$87,$99,$7E,$A9,$04,$00   ;83EDE4|        |00878F;
                       db $8F,$85,$99,$7E,$AF,$E3,$96,$7E   ;83EDEC|        |7E9985;
                       db $29,$00,$FF,$8F,$83,$99,$7E,$A9   ;83EDF4|        |      ;
                       db $04,$00,$8F,$E7,$96,$7E,$8F,$EB   ;83EDFC|        |000000;
                       db $96,$7E,$20,$98,$EE,$AD,$BA,$02   ;83EE04|        |00007E;
                       db $1A,$20,$B5,$B0,$60,$AD,$BA,$02   ;83EE0C|        |      ;
                       db $CF,$1A,$96,$7E,$F0,$3F,$1A,$8D   ;83EE14|        |7E961A;
                       db $BA,$02,$20,$F3,$84,$20,$AB,$84   ;83EE1C|        |      ;
                       db $A9,$01,$00,$8F,$73,$99,$7E,$20   ;83EE24|        |      ;
                       db $DC,$EC,$8F,$87,$99,$7E,$A9,$04   ;83EE2C|        |008FEC;
                       db $00,$8F,$85,$99,$7E,$AF,$87,$99   ;83EE34|        |      ;
                       db $7E,$29,$00,$FF,$8F,$83,$99,$7E   ;83EE3C|        |000029;
                       db $A9,$00,$00,$8F,$E7,$96,$7E,$8F   ;83EE44|        |      ;
                       db $EB,$96,$7E,$20,$98,$EE,$AD,$BA   ;83EE4C|        |      ;
                       db $02,$3A,$20,$B5,$B0,$60           ;83EE54|        |      ;
 
       CODE_FN_83EE5A:
                       LDA.W Character_1P                   ;83EE5A|ADBA02  |8302BA;
                       LDX.W #$000A                         ;83EE5D|A20A00  |      ;
                       JSR.W CODE_FN_8385CD                 ;83EE60|20CD85  |8385CD;
                       STA.B $02                            ;83EE63|8502    |000002;
                       LDA.L $7E96F5                        ;83EE65|AFF5967E|7E96F5;
                       LDX.W #$0005                         ;83EE69|A20500  |      ;
                       JSR.W CODE_FN_8385CD                 ;83EE6C|20CD85  |8385CD;
                       CLC                                  ;83EE6F|18      |      ;
                       ADC.B $02                            ;83EE70|6502    |000002;
                       CLC                                  ;83EE72|18      |      ;
                       ADC.L $7E96E7                        ;83EE73|6FE7967E|7E96E7;
                       INC A                                ;83EE77|1A      |      ;
                       STA.L Puzzle_LevelHi-$7E0000         ;83EE78|8F4E0300|00034E;
                       RTS                                  ;83EE7C|60      |      ;
 
       CODE_FN_83EE7D:
                       LDA.L Puzzle_LevelHi-$7E0000         ;83EE7D|AF4E0300|00034E;
                       DEC A                                ;83EE81|3A      |      ;
                       LDX.W #$000A                         ;83EE82|A20A00  |      ;
                       JSR.W CODE_FN_838562                 ;83EE85|206285  |838562;
                       LDX.W #$0005                         ;83EE88|A20500  |      ;
                       JSR.W CODE_FN_838562                 ;83EE8B|206285  |838562;
                       STA.L $7E96E7                        ;83EE8E|8FE7967E|7E96E7;
                       TXA                                  ;83EE92|8A      |      ;
                       STA.L $7E96F5                        ;83EE93|8FF5967E|7E96F5;
                       RTS                                  ;83EE97|60      |      ;
 
       CODE_FN_83EE98:
                       LDA.W Character_1P                   ;83EE98|ADBA02  |8302BA;
                       CMP.L $7E961A                        ;83EE9B|CF1A967E|7E961A;
                       BNE +                                ;83EE9F|D03E    |83EEDF;
                       LDA.W $0348                          ;83EEA1|AD4803  |830348;
                       CMP.W #$003C                         ;83EEA4|C93C00  |      ;
                       BEQ +                                ;83EEA7|F036    |83EEDF;
                       LDX.W #$000A                         ;83EEA9|A20A00  |      ;
                       JSR.W CODE_FN_838562                 ;83EEAC|206285  |838562;
                       CMP.W #$0005                         ;83EEAF|C90500  |      ;
                       BPL ++                               ;83EEB2|1014    |83EEC8;
                       STA.L $7E95D8                        ;83EEB4|8FD8957E|7E95D8;
                       LDA.W #$0000                         ;83EEB8|A90000  |      ;
                       STA.L $7E95DA                        ;83EEBB|8FDA957E|7E95DA;
                       STA.L $7E95E8                        ;83EEBF|8FE8957E|7E95E8;
                       STA.L $7E96F5                        ;83EEC3|8FF5967E|7E96F5;
                       RTS                                  ;83EEC7|60      |      ;
 
                    ++ SEC                                  ;83EEC8|38      |      ;
                       SBC.W #$0005                         ;83EEC9|E90500  |      ;
                       STA.L $7E95DA                        ;83EECC|8FDA957E|7E95DA;
                       LDA.W #$0004                         ;83EED0|A90400  |      ;
                       STA.L $7E95D8                        ;83EED3|8FD8957E|7E95D8;
                       LDA.W #$0001                         ;83EED7|A90100  |      ;
                       STA.L $7E95E8                        ;83EEDA|8FE8957E|7E95E8;
                       RTS                                  ;83EEDE|60      |      ;
 
                     + LDA.W #$0004                         ;83EEDF|A90400  |      ;
                       STA.L $7E95D8                        ;83EEE2|8FD8957E|7E95D8;
                       STA.L $7E95DA                        ;83EEE6|8FDA957E|7E95DA;
                       LDA.W #$0001                         ;83EEEA|A90100  |      ;
                       STA.L $7E95E8                        ;83EEED|8FE8957E|7E95E8;
                       RTS                                  ;83EEF1|60      |      ;
                       LDA.W $1A6E                          ;83EEF2|AD6E1A  |831A6E;
                       ASL A                                ;83EEF5|0A      |      ;
                       TAX                                  ;83EEF6|AA      |      ;
                       JSR.W (UNREACH_83EEFB,X)             ;83EEF7|FCFBEE  |83EEFB;
                       RTS                                  ;83EEFA|60      |      ;
 
       UNREACH_83EEFB:
                       db $03,$EF,$2A,$EF,$41,$EF,$57,$EF   ;83EEFB|        |0000EF;
                       INC.W $1A6E                          ;83EF03|EE6E1A  |831A6E;
                       LDA.W #$0002                         ;83EF06|A90200  |      ;
                       STA.L $7E9973                        ;83EF09|8F73997E|7E9973;
                       LDA.W #$0001                         ;83EF0D|A90100  |      ;
                       STA.L $7E9987                        ;83EF10|8F87997E|7E9987;
                       LDA.W #$0008                         ;83EF14|A90800  |      ;
                       STA.L $7E9985                        ;83EF17|8F85997E|7E9985;
                       LDA.L $7E96E3                        ;83EF1B|AFE3967E|7E96E3;
                       AND.W #$FF00                         ;83EF1F|2900FF  |      ;
                       STA.L $7E9983                        ;83EF22|8F83997E|7E9983;
                       JSR.W CODE_FN_83B59B                 ;83EF26|209BB5  |83B59B;
                       RTS                                  ;83EF29|60      |      ;
                       JSR.W CODE_FN_83B5A8                 ;83EF2A|20A8B5  |83B5A8;
                       LDA.W #$0001                         ;83EF2D|A90100  |      ;
                       STA.L $7E995F                        ;83EF30|8F5F997E|7E995F;
                       JSR.W CODE_FN_83B59B                 ;83EF34|209BB5  |83B59B;
                       LDA.L $7E9973                        ;83EF37|AF73997E|7E9973;
                       BNE +                                ;83EF3B|D003    |83EF40;
                       INC.W $1A6E                          ;83EF3D|EE6E1A  |831A6E;
 
                     + RTS                                  ;83EF40|60      |      ;
                       INC.W $1A6E                          ;83EF41|EE6E1A  |831A6E;
                       JSR.W CODE_FN_839FB6                 ;83EF44|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83EF47|2058A0  |83A058;
                       SEP #$20                             ;83EF4A|E220    |      ;
                       LDA.W $021E                          ;83EF4C|AD1E02  |83021E;
                       AND.B #$3F                           ;83EF4F|293F    |      ;
                       STA.W $021E                          ;83EF51|8D1E02  |83021E;
                       REP #$20                             ;83EF54|C220    |      ;
                       RTS                                  ;83EF56|60      |      ;
                       JSR.W CODE_FN_83A083                 ;83EF57|2083A0  |83A083;
                       DEC.W Game_State                     ;83EF5A|CEA002  |8302A0;
                       LDA.W #$0017                         ;83EF5D|A91700  |      ;
                       STA.W Game_State_State               ;83EF60|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83EF63|9C6E1A  |831A6E;
                       RTS                                  ;83EF66|60      |      ;
                       LDA.W $1A6E                          ;83EF67|AD6E1A  |831A6E;
                       ASL A                                ;83EF6A|0A      |      ;
                       TAX                                  ;83EF6B|AA      |      ;
                       JSR.W (DATA8_83EF86,X)               ;83EF6C|FC86EF  |83EF86;
                       JSR.W CODE_FN_838209                 ;83EF6F|200982  |838209;
                       LDA.W #$0001                         ;83EF72|A90100  |      ;
                       STA.L $7E995F                        ;83EF75|8F5F997E|7E995F;
                       JSR.W CODE_FN_839716                 ;83EF79|201697  |839716;
                       JSR.W CODE_FN_839958                 ;83EF7C|205899  |839958;
                       JSR.W CODE_FN_83B4EC                 ;83EF7F|20ECB4  |83B4EC;
                       JSR.W CODE_FN_83B4E5                 ;83EF82|20E5B4  |83B4E5;
                       RTS                                  ;83EF85|60      |      ;
 
         DATA8_83EF86:
                       db $8A,$EF,$98,$EF                   ;83EF86|        |      ;
                       INC.W $1A6E                          ;83EF8A|EE6E1A  |831A6E;
                       JSR.W CODE_FN_8384DB                 ;83EF8D|20DB84  |8384DB;
                       LDA.W #$0040                         ;83EF90|A94000  |      ;
                       STA.L $7E9987                        ;83EF93|8F87997E|7E9987;
                       RTS                                  ;83EF97|60      |      ;
                       LDA.L $7E9987                        ;83EF98|AF87997E|7E9987;
                       DEC A                                ;83EF9C|3A      |      ;
                       STA.L $7E9987                        ;83EF9D|8F87997E|7E9987;
                       BPL +                                ;83EFA1|1012    |83EFB5;
 
                     - LDA.W #$0000                         ;83EFA3|A90000  |      ;
                       STA.W $1A6E                          ;83EFA6|8D6E1A  |831A6E;
                       STA.L $7E961C                        ;83EFA9|8F1C967E|7E961C;
                       STA.L $7E9987                        ;83EFAD|8F87997E|7E9987;
                       INC.W Game_State_State               ;83EFB1|EEA202  |8302A2;
                       RTS                                  ;83EFB4|60      |      ;
 
                     + LDA.B $B7                            ;83EFB5|A5B7    |0000B7;
                       BIT.W #$1080                         ;83EFB7|898010  |      ;
                       BEQ +                                ;83EFBA|F011    |83EFCD;
                       LDA.W Character_1P                   ;83EFBC|ADBA02  |8302BA;
                       ASL A                                ;83EFBF|0A      |      ;
                       TAX                                  ;83EFC0|AA      |      ;
                       JSR.W (DATA8_83F02B,X)               ;83EFC1|FC2BF0  |83F02B;
                       LDA.W #$0000                         ;83EFC4|A90000  |      ;
                       STA.L $7E961C                        ;83EFC7|8F1C967E|7E961C;
                       BRA -                                ;83EFCB|80D6    |83EFA3;
 
                     + BIT.W #$8000                         ;83EFCD|890080  |      ;
                       BEQ +                                ;83EFD0|F024    |83EFF6;
                       LDA.W #$0003                         ;83EFD2|A90300  |      ;
                       STA.W Game_State_State               ;83EFD5|8DA202  |8302A2;
                       LDA.W #$0000                         ;83EFD8|A90000  |      ;
                       STA.W $1A6E                          ;83EFDB|8D6E1A  |831A6E;
                       STA.L $7E961C                        ;83EFDE|8F1C967E|7E961C;
                       STA.L $7E9987                        ;83EFE2|8F87997E|7E9987;
                       LDA.W Character_1P                   ;83EFE6|ADBA02  |8302BA;
                       ASL A                                ;83EFE9|0A      |      ;
                       TAX                                  ;83EFEA|AA      |      ;
                       JSR.W (DATA8_83F02B,X)               ;83EFEB|FC2BF0  |83F02B;
                       LDA.W #$0000                         ;83EFEE|A90000  |      ;
                       STA.L $7E961C                        ;83EFF1|8F1C967E|7E961C;
                       RTS                                  ;83EFF5|60      |      ;
 
                     + LDA.W #$92FB                         ;83EFF6|A9FB92  |      ;
                       STA.B $00                            ;83EFF9|8500    |000000;
                       LDA.W #$0000                         ;83EFFB|A90000  |      ;
                       STA.L $7E9961                        ;83EFFE|8F61997E|7E9961;
                       JSR.W CODE_FN_8385F0                 ;83F002|20F085  |8385F0;
                       LDA.L $7E9965                        ;83F005|AF65997E|7E9965;
                       BEQ +                                ;83F009|F010    |83F01B;
                       LDA.W Character_1P                   ;83F00B|ADBA02  |8302BA;
                       ASL A                                ;83F00E|0A      |      ;
                       TAX                                  ;83F00F|AA      |      ;
                       JSR.W (DATA8_83F02B,X)               ;83F010|FC2BF0  |83F02B;
                       LDA.W #$0000                         ;83F013|A90000  |      ;
                       STA.L $7E961C                        ;83F016|8F1C967E|7E961C;
                       RTS                                  ;83F01A|60      |      ;
 
                     + LDA.W Character_1P                   ;83F01B|ADBA02  |8302BA;
                       ASL A                                ;83F01E|0A      |      ;
                       TAX                                  ;83F01F|AA      |      ;
                       JSR.W (DATA8_83F037,X)               ;83F020|FC37F0  |83F037;
                       LDA.W #$0001                         ;83F023|A90100  |      ;
                       STA.L $7E961C                        ;83F026|8F1C967E|7E961C;
                       RTS                                  ;83F02A|60      |      ;
 
         DATA8_83F02B:
                       db $64,$B1,$89,$B1,$AE,$B1,$3C,$B2   ;83F02B|        |      ;
                       db $43,$B2,$C9,$B2                   ;83F033|        |      ;
 
         DATA8_83F037:
                       db $D0,$B2,$EA,$B2,$04,$B3,$1E,$B3   ;83F037|        |      ;
                       db $51,$B3,$6B,$B3                   ;83F03F|        |      ;
                       JSR.W CODE_FN_83849D                 ;83F043|209D84  |83849D;
                       LDY.W #$0001                         ;83F046|A00100  |      ;
                       JSL.L CODE_FL_80AF18                 ;83F049|2218AF80|80AF18;
                       BCC +                                ;83F04D|9016    |83F065;
                       REP #$20                             ;83F04F|C220    |      ;
                       INC.W Game_State                     ;83F051|EEA002  |8302A0;
                       LDA.W #$0000                         ;83F054|A90000  |      ;
                       STA.W Game_State_State               ;83F057|8DA202  |8302A2;
                       LDA.W #$0001                         ;83F05A|A90100  |      ;
                       STA.L $7E94D6                        ;83F05D|8FD6947E|7E94D6;
                       JSL.L CODE_FL_80A145                 ;83F061|2245A180|80A145;
 
                     + REP #$20                             ;83F065|C220    |      ;
                       JSR.W CODE_FN_838209                 ;83F067|200982  |838209;
                       LDA.W #$0001                         ;83F06A|A90100  |      ;
                       STA.L $7E995F                        ;83F06D|8F5F997E|7E995F;
                       JSR.W CODE_FN_839716                 ;83F071|201697  |839716;
                       JSR.W CODE_FN_839958                 ;83F074|205899  |839958;
                       JSR.W CODE_FN_83B4EC                 ;83F077|20ECB4  |83B4EC;
                       JSR.W CODE_FN_83B4E5                 ;83F07A|20E5B4  |83B4E5;
                       RTS                                  ;83F07D|60      |      ;
                       LDA.W Game_State_State               ;83F07E|ADA202  |8302A2;
                       ASL A                                ;83F081|0A      |      ;
                       TAX                                  ;83F082|AA      |      ;
                       JSR.W (UNREACH_83F087,X)             ;83F083|FC87F0  |83F087;
                       RTS                                  ;83F086|60      |      ;
 
       UNREACH_83F087:
                       db $6F,$D6,$85,$C0                   ;83F087|        |C085D6;
                       db $A1,$F0,$B9,$F1,$F2,$F2,$83,$F3   ;83F08B|        |      ;
                       db $A4,$F3,$12,$F5,$13,$F6           ;83F093|        |      ;
                       db $09,$F7,$61,$F7,$E5,$F8,$49,$F9   ;83F099|        |      ;
                       LDA.W $1A6E                          ;83F0A1|AD6E1A  |831A6E;
                       ASL A                                ;83F0A4|0A      |      ;
                       TAX                                  ;83F0A5|AA      |      ;
                       JSR.W (DATA8_83F0AA,X)               ;83F0A6|FCAAF0  |83F0AA;
                       RTS                                  ;83F0A9|60      |      ;
 
         DATA8_83F0AA:
                       db $D7,$D6,$2B,$D7,$3F,$D7,$5B,$D7   ;83F0AA|        |      ;
                       db $74,$D7,$8D,$D7,$BE,$F0,$05,$F1   ;83F0B2|        |      ;
                       db $48,$F1,$8E,$F1                   ;83F0BA|        |      ;
                       INC.W $1A6E                          ;83F0BE|EE6E1A  |831A6E;
                       JSL.L CODE_FL_80BB2D                 ;83F0C1|222DBB80|80BB2D;
                       db $6F,$AD,$93,$00,$20,$7E           ;83F0C5|        |      ;
                       JSR.W CODE_FN_83B65D                 ;83F0CB|205DB6  |83B65D;
                       JSR.W CODE_FN_83B664                 ;83F0CE|2064B6  |83B664;
                       JSR.W CODE_FN_83B6CA                 ;83F0D1|20CAB6  |83B6CA;
                       JSR.W CODE_FN_83B6F7                 ;83F0D4|20F7B6  |83B6F7;
                       JSR.W CODE_FN_83B73F                 ;83F0D7|203FB7  |83B73F;
                       PHB                                  ;83F0DA|8B      |      ;
                       PHK                                  ;83F0DB|4B      |      ;
                       PLB                                  ;83F0DC|AB      |      ;
                       LDY.W #$F0E7                         ;83F0DD|A0E7F0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F0E0|22CAA080|80A0CA;
                       PLB                                  ;83F0E4|AB      |      ;
                       BRA +                                ;83F0E5|8008    |83F0EF;
                       db $00,$20,$7E,$00,$01,$80,$00,$68   ;83F0E7|        |      ;
 
                     + PHB                                  ;83F0EF|8B      |      ;
                       PHK                                  ;83F0F0|4B      |      ;
                       PLB                                  ;83F0F1|AB      |      ;
                       LDY.W #$F0FC                         ;83F0F2|A0FCF0  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F0F5|22CAA080|80A0CA;
                       PLB                                  ;83F0F9|AB      |      ;
                       BRA +                                ;83F0FA|8008    |83F104;
                       db $00,$30,$7E,$40,$01,$80,$00,$78   ;83F0FC|        |      ;
 
                     + RTS                                  ;83F104|60      |      ;
                       INC.W $1A6E                          ;83F105|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83B7D0                 ;83F108|20D0B7  |83B7D0;
                       JSR.W CODE_FN_83B7A7                 ;83F10B|20A7B7  |83B7A7;
                       JSR.W CODE_FN_83B807                 ;83F10E|2007B8  |83B807;
                       JSR.W CODE_FN_83BA16                 ;83F111|2016BA  |83BA16;
                       PHB                                  ;83F114|8B      |      ;
                       PHK                                  ;83F115|4B      |      ;
                       PLB                                  ;83F116|AB      |      ;
                       LDY.W #$F121                         ;83F117|A021F1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F11A|22CAA080|80A0CA;
                       PLB                                  ;83F11E|AB      |      ;
                       BRA +                                ;83F11F|8008    |83F129;
                       db $00,$21,$7E,$C0,$02,$80,$80,$68   ;83F121|        |      ;
 
                     + PHB                                  ;83F129|8B      |      ;
                       PHK                                  ;83F12A|4B      |      ;
                       PLB                                  ;83F12B|AB      |      ;
                       LDY.W #$F136                         ;83F12C|A036F1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F12F|22CAA080|80A0CA;
                       PLB                                  ;83F133|AB      |      ;
                       BRA +                                ;83F134|8008    |83F13E;
                       db $00,$31,$7E,$00,$03,$80,$80,$78   ;83F136|        |      ;
 
                     + JSR.W CODE_FN_83A675                 ;83F13E|2075A6  |83A675;
                       JSR.W CODE_FN_8380FC                 ;83F141|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F144|20BD8A  |838ABD;
                       RTS                                  ;83F147|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F148|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F14B|20BD8A  |838ABD;
                       JSR.W CODE_FN_83B7D0                 ;83F14E|20D0B7  |83B7D0;
                       LDA.L $7E998D                        ;83F151|AF8D997E|7E998D;
                       BNE +                                ;83F155|D036    |83F18D;
                       INC.W $1A6E                          ;83F157|EE6E1A  |831A6E;
                       PHB                                  ;83F15A|8B      |      ;
                       PHK                                  ;83F15B|4B      |      ;
                       PLB                                  ;83F15C|AB      |      ;
                       LDY.W #$F167                         ;83F15D|A067F1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F160|22CAA080|80A0CA;
                       PLB                                  ;83F164|AB      |      ;
                       BRA ++                               ;83F165|8008    |83F16F;
                       db $C0,$23,$7E,$C0,$02,$80,$E0,$69   ;83F167|        |      ;
 
                    ++ PHB                                  ;83F16F|8B      |      ;
                       PHK                                  ;83F170|4B      |      ;
                       PLB                                  ;83F171|AB      |      ;
                       LDY.W #$F17C                         ;83F172|A07CF1  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F175|22CAA080|80A0CA;
                       PLB                                  ;83F179|AB      |      ;
                       BRA ++                               ;83F17A|8008    |83F184;
                       db $C0,$33,$7E,$C0,$02,$80,$E0,$79   ;83F17C|        |      ;
 
                    ++ JSR.W CODE_FN_83A681                 ;83F184|2081A6  |83A681;
                       JSR.W CODE_FN_8380FC                 ;83F187|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F18A|20BD8A  |838ABD;
 
                     + RTS                                  ;83F18D|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F18E|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F191|20BD8A  |838ABD;
                       JSR.W CODE_FN_83B7D0                 ;83F194|20D0B7  |83B7D0;
                       LDA.L $7E998D                        ;83F197|AF8D997E|7E998D;
                       BNE +                                ;83F19B|D01B    |83F1B8;
                       INC.W Game_State_State               ;83F19D|EEA202  |8302A2;
                       LDA.W #$0000                         ;83F1A0|A90000  |      ;
                       STA.W $1A6E                          ;83F1A3|8D6E1A  |831A6E;
                       STA.W $1A70                          ;83F1A6|8D701A  |831A70;
                       STA.L $7E9965                        ;83F1A9|8F65997E|7E9965;
                       STA.L $7E9967                        ;83F1AD|8F67997E|7E9967;
                       STA.L $7E9452                        ;83F1B1|8F52947E|7E9452;
                       JSR.W CODE_FN_838193                 ;83F1B5|209381  |838193;
 
                     + RTS                                  ;83F1B8|60      |      ;
                       LDA.W #$0001                         ;83F1B9|A90100  |      ;
                       STA.B $B1                            ;83F1BC|85B1    |0000B1;
                       JSR.W CODE_FN_83B807                 ;83F1BE|2007B8  |83B807;
                       JSR.W CODE_FN_83B832                 ;83F1C1|2032B8  |83B832;
                       JSR.W CODE_FN_83B7A7                 ;83F1C4|20A7B7  |83B7A7;
                       JSR.W CODE_FN_83B7D0                 ;83F1C7|20D0B7  |83B7D0;
                       JSR.W CODE_FN_83B76C                 ;83F1CA|206CB7  |83B76C;
                       JSR.W CODE_FN_83A0B8                 ;83F1CD|20B8A0  |83A0B8;
                       LDX.W #$0000                         ;83F1D0|A20000  |      ;
                       JSR.W CODE_FN_83F20D                 ;83F1D3|200DF2  |83F20D;
                       LDX.W #$0002                         ;83F1D6|A20200  |      ;
                       JSR.W CODE_FN_83F20D                 ;83F1D9|200DF2  |83F20D;
                       LDA.W $1A6E                          ;83F1DC|AD6E1A  |831A6E;
                       AND.W $1A70                          ;83F1DF|2D701A  |831A70;
                       CMP.W #$0002                         ;83F1E2|C90200  |      ;
                       BNE +                                ;83F1E5|D00C    |83F1F3;
                       STZ.W $1A6E                          ;83F1E7|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83F1EA|9C701A  |831A70;
                       LDA.W #$0005                         ;83F1ED|A90500  |      ;
                       STA.W Game_State_State               ;83F1F0|8DA202  |8302A2;
 
                     + RTS                                  ;83F1F3|60      |      ;
 
       CODE_FN_83F1F4:
                       LDA.W #$0000                         ;83F1F4|A90000  |      ;
                       STA.L $7E95EE                        ;83F1F7|8FEE957E|7E95EE;
                       LDA.W Difficulty_1P,X                ;83F1FB|BDAC02  |8302AC;
                       LDY.W #$F209                         ;83F1FE|A009F2  |      ;
                       JSR.W CODE_FN_838F98                 ;83F201|20988F  |838F98;
                       STA.W Difficulty_1P,X                ;83F204|9DAC02  |8302AC;
                       BRA +                                ;83F207|8003    |83F20C;
                       db $01,$0B,$00                       ;83F209|        |      ;
 
                     + RTS                                  ;83F20C|60      |      ;
 
       CODE_FN_83F20D:
                       LDA.B $BB,X                          ;83F20D|B5BB    |0000BB;
                       BIT.W #$0800                         ;83F20F|890008  |      ;
                       BEQ +                                ;83F212|F010    |83F224;
                       LDA.W $1A6E,X                        ;83F214|BD6E1A  |831A6E;
                       CMP.W #$0001                         ;83F217|C90100  |      ;
                       BNE ++                               ;83F21A|D007    |83F223;
                       DEC A                                ;83F21C|3A      |      ;
                       STA.W $1A6E,X                        ;83F21D|9D6E1A  |831A6E;
                       JSR.W CODE_FN_8384D4                 ;83F220|20D484  |8384D4;
 
                    ++ RTS                                  ;83F223|60      |      ;
 
                     + BIT.W #$0400                         ;83F224|890004  |      ;
                       BEQ +                                ;83F227|F00D    |83F236;
                       LDA.W $1A6E,X                        ;83F229|BD6E1A  |831A6E;
                       BNE ++                               ;83F22C|D007    |83F235;
                       INC A                                ;83F22E|1A      |      ;
                       STA.W $1A6E,X                        ;83F22F|9D6E1A  |831A6E;
                       JSR.W CODE_FN_8384CD                 ;83F232|20CD84  |8384CD;
 
                    ++ RTS                                  ;83F235|60      |      ;
 
                     + LDA.W $1A6E,X                        ;83F236|BD6E1A  |831A6E;
                       ASL A                                ;83F239|0A      |      ;
                       TXY                                  ;83F23A|9B      |      ;
                       TAX                                  ;83F23B|AA      |      ;
                       JSR.W (DATA8_83F241,X)               ;83F23C|FC41F2  |83F241;
                       BRA +                                ;83F23F|8057    |83F298;
 
         DATA8_83F241:
                       db $47,$F2,$4F,$F2,$96,$F2           ;83F241|        |      ;
                       TYX                                  ;83F247|BB      |      ;
                       JSR.W CODE_FN_83F1F4                 ;83F248|20F4F1  |83F1F4;
                       JSR.W CODE_FN_83998F                 ;83F24B|208F99  |83998F;
                       RTS                                  ;83F24E|60      |      ;
                       TYX                                  ;83F24F|BB      |      ;
                       LDA.W #$0000                         ;83F250|A90000  |      ;
                       STA.L $7E95EE                        ;83F253|8FEE957E|7E95EE;
                       LDA.W Handicap_1P                    ;83F257|ADB402  |8302B4;
                       PHA                                  ;83F25A|48      |      ;
                       LDA.W Handicap_1P,X                  ;83F25B|BDB402  |8302B4;
                       LDY.W #$F269                         ;83F25E|A069F2  |      ;
                       JSR.W CODE_FN_838FA2                 ;83F261|20A28F  |838FA2;
                       STA.W Handicap_1P,X                  ;83F264|9DB402  |8302B4;
                       BRA ++                               ;83F267|8005    |83F26E;
                       db $00,$07,$27,$0A,$64               ;83F269|        |      ;
 
                    ++ PLA                                  ;83F26E|68      |      ;
                       CMP.W Handicap_1P                    ;83F26F|CDB402  |8302B4;
                       BEQ ++                               ;83F272|F006    |83F27A;
                       LDA.W #$004C                         ;83F274|A94C00  |      ;
                       STA.W $1988                          ;83F277|8D8819  |831988;
 
                    ++ LDA.B $BB,X                          ;83F27A|B5BB    |0000BB;
                       BIT.W #$0220                         ;83F27C|892002  |      ;
                       BEQ ++                               ;83F27F|F008    |83F289;
                       LDA.W #$0002                         ;83F281|A90200  |      ;
                       STA.L $7E9969,X                      ;83F284|9F69997E|7E9969;
                       RTS                                  ;83F288|60      |      ;
 
                    ++ BIT.W #$0110                         ;83F289|891001  |      ;
                       BEQ ++                               ;83F28C|F007    |83F295;
                       LDA.W #$0001                         ;83F28E|A90100  |      ;
                       STA.L $7E9969,X                      ;83F291|9F69997E|7E9969;
 
                    ++ RTS                                  ;83F295|60      |      ;
                       TYX                                  ;83F296|BB      |      ;
                       RTS                                  ;83F297|60      |      ;
 
                     + LDA.B $B7,X                          ;83F298|B5B7    |0000B7;
                       BIT.W #$1080                         ;83F29A|898010  |      ;
                       BEQ +                                ;83F29D|F018    |83F2B7;
                       LDA.W $1A6E,X                        ;83F29F|BD6E1A  |831A6E;
                       ASL A                                ;83F2A2|0A      |      ;
                       TXY                                  ;83F2A3|9B      |      ;
                       TAX                                  ;83F2A4|AA      |      ;
                       JSR.W (DATA8_83F2A9,X)               ;83F2A5|FCA9F2  |83F2A9;
                       RTS                                  ;83F2A8|60      |      ;
 
         DATA8_83F2A9:
                       db $AF,$F2,$AF,$F2                   ;83F2A9|        |      ;
                       db $B6,$F2                           ;83F2AD|        |0000F2;
                       TYX                                  ;83F2AF|BB      |      ;
                       INC.W $1A6E,X                        ;83F2B0|FE6E1A  |831A6E;
                       JSR.W CODE_FN_8384CD                 ;83F2B3|20CD84  |8384CD;
                       RTS                                  ;83F2B6|60      |      ;
 
                     + BIT.W #$8000                         ;83F2B7|890080  |      ;
                       BEQ +                                ;83F2BA|F00C    |83F2C8;
                       LDA.W $1A6E,X                        ;83F2BC|BD6E1A  |831A6E;
                       ASL A                                ;83F2BF|0A      |      ;
                       TXY                                  ;83F2C0|9B      |      ;
                       TAX                                  ;83F2C1|AA      |      ;
                       JSR.W (DATA8_83F2C9,X)               ;83F2C2|FCC9F2  |83F2C9;
                       JSR.W CODE_FN_8384D4                 ;83F2C5|20D484  |8384D4;
 
                     + RTS                                  ;83F2C8|60      |      ;
 
         DATA8_83F2C9:
                       db $CF,$F2                           ;83F2C9|        |      ;
                       db $ED,$F2,$ED,$F2                   ;83F2CB|        |00EDF2;
                       LDA.L $7E9458                        ;83F2CF|AF58947E|7E9458;
                       BNE UNREACH_83F2E0                   ;83F2D3|D00B    |83F2E0;
                       LDA.L $7E945A                        ;83F2D5|AF5A947E|7E945A;
                       BNE UNREACH_83F2E0                   ;83F2D9|D005    |83F2E0;
                       INC.W Game_State_State               ;83F2DB|EEA202  |8302A2;
                       BRA +                                ;83F2DE|8006    |83F2E6;
 
       UNREACH_83F2E0:
                       db $A9,$0B,$00,$8D,$A2,$02           ;83F2E0|        |      ;
 
                     + STZ.W $1A6E                          ;83F2E6|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83F2E9|9C701A  |831A70;
                       RTS                                  ;83F2EC|60      |      ;
                       db $BB,$DE,$6E,$1A,$60               ;83F2ED|        |      ;
                       LDA.W $1A6E                          ;83F2F2|AD6E1A  |831A6E;
                       ASL A                                ;83F2F5|0A      |      ;
                       TAX                                  ;83F2F6|AA      |      ;
                       JSR.W (DATA8_83F2FB,X)               ;83F2F7|FCFBF2  |83F2FB;
                       RTS                                  ;83F2FA|60      |      ;
 
         DATA8_83F2FB:
                       db $03,$F3,$13,$F3,$38,$F3,$54,$F3   ;83F2FB|        |      ;
                       INC.W $1A6E                          ;83F303|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83A77D                 ;83F306|207DA7  |83A77D;
                       JSR.W CODE_FN_8380FC                 ;83F309|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F30C|20F18B  |838BF1;
                       JSR.W CODE_FN_83B7D0                 ;83F30F|20D0B7  |83B7D0;
                       RTS                                  ;83F312|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F313|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F316|20F18B  |838BF1;
                       JSR.W CODE_FN_83B7D0                 ;83F319|20D0B7  |83B7D0;
                       LDA.L $7E998D                        ;83F31C|AF8D997E|7E998D;
                       BNE +                                ;83F320|D015    |83F337;
                       INC.W $1A6E                          ;83F322|EE6E1A  |831A6E;
                       LDX.W #$03C0                         ;83F325|A2C003  |      ;
                       JSR.W CODE_FN_839FEE                 ;83F328|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A771                 ;83F32B|2071A7  |83A771;
                       JSR.W CODE_FN_8380FC                 ;83F32E|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F331|20F18B  |838BF1;
                       JSR.W CODE_FN_83A058                 ;83F334|2058A0  |83A058;
 
                     + RTS                                  ;83F337|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F338|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F33B|20F18B  |838BF1;
                       JSR.W CODE_FN_83B7D0                 ;83F33E|20D0B7  |83B7D0;
                       LDA.L $7E998D                        ;83F341|AF8D997E|7E998D;
                       BNE +                                ;83F345|D00C    |83F353;
                       INC.W $1A6E                          ;83F347|EE6E1A  |831A6E;
                       LDX.W #$0100                         ;83F34A|A20001  |      ;
                       JSR.W CODE_FN_839FEE                 ;83F34D|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A058                 ;83F350|2058A0  |83A058;
 
                     + RTS                                  ;83F353|60      |      ;
                       STZ.W $1A6E                          ;83F354|9C6E1A  |831A6E;
                       DEC.W Game_State                     ;83F357|CEA002  |8302A0;
                       LDA.W #$000D                         ;83F35A|A90D00  |      ;
                       STA.W Game_State_State               ;83F35D|8DA202  |8302A2;
                       JSR.W CODE_FN_838193                 ;83F360|209381  |838193;
                       JSR.W CODE_FN_839FB6                 ;83F363|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83F366|2058A0  |83A058;
                       LDA.W $02A8                          ;83F369|ADA802  |8302A8;
                       CMP.W #$0002                         ;83F36C|C90200  |      ;
                       BNE +                                ;83F36F|D011    |83F382;
                       SEP #$20                             ;83F371|E220    |      ;
                       LDA.B #$17                           ;83F373|A917    |      ;
                       STA.W $01E2                          ;83F375|8DE201  |8301E2;
                       LDA.W $01E3                          ;83F378|ADE301  |8301E3;
                       ORA.B #$04                           ;83F37B|0904    |      ;
                       STA.W $01E3                          ;83F37D|8DE301  |8301E3;
                       REP #$20                             ;83F380|C220    |      ;
 
                     + RTS                                  ;83F382|60      |      ;
                       LDA.W $1A6E                          ;83F383|AD6E1A  |831A6E;
                       ASL A                                ;83F386|0A      |      ;
                       TAX                                  ;83F387|AA      |      ;
                       JSR.W (DATA8_83F38C,X)               ;83F388|FC8CF3  |83F38C;
                       RTS                                  ;83F38B|60      |      ;
 
         DATA8_83F38C:
                       db $03,$F3,$13,$F3,$38,$F3,$94,$F3   ;83F38C|        |      ;
                       STZ.W $1A6E                          ;83F394|9C6E1A  |831A6E;
                       LDA.W #$0006                         ;83F397|A90600  |      ;
                       STA.W Game_State_State               ;83F39A|8DA202  |8302A2;
                       JSR.W CODE_FN_839FB6                 ;83F39D|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83F3A0|2058A0  |83A058;
                       RTS                                  ;83F3A3|60      |      ;
                       LDA.W $1A6E                          ;83F3A4|AD6E1A  |831A6E;
                       ASL A                                ;83F3A7|0A      |      ;
                       TAX                                  ;83F3A8|AA      |      ;
                       JSR.W (DATA8_83F3C1,X)               ;83F3A9|FCC1F3  |83F3C1;
                       LDA.L BossChars_Available            ;83F3AC|AFD2947E|7E94D2;
                       BEQ +                                ;83F3B0|F00E    |83F3C0;
                       db $A9,$03,$00,$8F,$DC,$95,$7E,$A9   ;83F3B2|        |      ;
                       db $02,$00,$8F,$E8,$95,$7E           ;83F3BA|        |      ;
 
                     + RTS                                  ;83F3C0|60      |      ;
 
         DATA8_83F3C1:
                       db $C9,$F3,$21,$F4,$61,$F4,$A6,$F4   ;83F3C1|        |      ;
                       INC.W $1A6E                          ;83F3C9|EE6E1A  |831A6E;
                       JSL.L CODE_FL_80BB2D                 ;83F3CC|222DBB80|80BB2D;
                       db $36,$AA,$93,$00,$20,$7E           ;83F3D0|        |      ;
                       JSR.W CODE_FN_83BA41                 ;83F3D6|2041BA  |83BA41;
                       JSR.W CODE_FN_83BA9F                 ;83F3D9|209FBA  |83BA9F;
                       PHB                                  ;83F3DC|8B      |      ;
                       PHK                                  ;83F3DD|4B      |      ;
                       PLB                                  ;83F3DE|AB      |      ;
                       LDY.W #$F3E9                         ;83F3DF|A0E9F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F3E2|22CAA080|80A0CA;
                       PLB                                  ;83F3E6|AB      |      ;
                       BRA +                                ;83F3E7|8008    |83F3F1;
                       db $40,$20,$7E,$C0,$03,$80,$20,$68   ;83F3E9|        |      ;
 
                     + PHB                                  ;83F3F1|8B      |      ;
                       PHK                                  ;83F3F2|4B      |      ;
                       PLB                                  ;83F3F3|AB      |      ;
                       LDY.W #$F3FE                         ;83F3F4|A0FEF3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F3F7|22CAA080|80A0CA;
                       PLB                                  ;83F3FB|AB      |      ;
                       BRA +                                ;83F3FC|8008    |83F406;
                       db $40,$30,$7E,$C0,$03,$80,$20,$78   ;83F3FE|        |      ;
 
                     + JSR.W CODE_FN_83AA41                 ;83F406|2041AA  |83AA41;
                       LDY.W #$F411                         ;83F409|A011F4  |      ;
                       JSR.W CODE_FN_838A8A                 ;83F40C|208A8A  |838A8A;
                       BRA +                                ;83F40F|8003    |83F414;
                       db $10,$78,$08                       ;83F411|        |      ;
 
                     + JSR.W CODE_FN_838ABD                 ;83F414|20BD8A  |838ABD;
                       JSR.W CODE_FN_8380FC                 ;83F417|20FC80  |8380FC;
                       JSR.W CODE_FN_83971D                 ;83F41A|201D97  |83971D;
                       JSR.W CODE_FN_839763                 ;83F41D|206397  |839763;
                       RTS                                  ;83F420|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F421|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F424|20BD8A  |838ABD;
                       JSR.W CODE_FN_83971D                 ;83F427|201D97  |83971D;
                       LDA.L $7E998D                        ;83F42A|AF8D997E|7E998D;
                       BNE +                                ;83F42E|D030    |83F460;
                       INC.W $1A6E                          ;83F430|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83BA4E                 ;83F433|204EBA  |83BA4E;
                       PHB                                  ;83F436|8B      |      ;
                       PHK                                  ;83F437|4B      |      ;
                       PLB                                  ;83F438|AB      |      ;
                       LDY.W #$F443                         ;83F439|A043F4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F43C|22CAA080|80A0CA;
                       PLB                                  ;83F440|AB      |      ;
                       BRA ++                               ;83F441|8008    |83F44B;
                       db $00,$24,$7E,$C0,$00,$80,$00,$6A   ;83F443|        |      ;
 
                    ++ PHB                                  ;83F44B|8B      |      ;
                       PHK                                  ;83F44C|4B      |      ;
                       PLB                                  ;83F44D|AB      |      ;
                       LDY.W #$F458                         ;83F44E|A058F4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F451|22CAA080|80A0CA;
                       PLB                                  ;83F455|AB      |      ;
                       BRA +                                ;83F456|8008    |83F460;
                       db $40,$34,$7E,$C0,$00,$80,$20,$7A   ;83F458|        |      ;
 
                     + RTS                                  ;83F460|60      |      ;
                       INC.W $1A6E                          ;83F461|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83BA58                 ;83F464|2058BA  |83BA58;
                       PHB                                  ;83F467|8B      |      ;
                       PHK                                  ;83F468|4B      |      ;
                       PLB                                  ;83F469|AB      |      ;
                       LDY.W #$F474                         ;83F46A|A074F4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F46D|22CAA080|80A0CA;
                       PLB                                  ;83F471|AB      |      ;
                       BRA +                                ;83F472|8008    |83F47C;
                       db $C0,$24,$7E,$40,$02,$80,$60,$6A   ;83F474|        |      ;
 
                     + PHB                                  ;83F47C|8B      |      ;
                       PHK                                  ;83F47D|4B      |      ;
                       PLB                                  ;83F47E|AB      |      ;
                       LDY.W #$F489                         ;83F47F|A089F4  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F482|22CAA080|80A0CA;
                       PLB                                  ;83F486|AB      |      ;
                       BRA +                                ;83F487|8008    |83F491;
                       db $C0,$34,$7E,$40,$02,$80,$60,$7A   ;83F489|        |      ;
 
                     + LDY.W #$F499                         ;83F491|A099F4  |      ;
                       JSR.W CODE_FN_838A8A                 ;83F494|208A8A  |838A8A;
                       BRA +                                ;83F497|8003    |83F49C;
                       db $A0,$D8,$08                       ;83F499|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83F49C|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F49F|20BD8A  |838ABD;
                       JSR.W CODE_FN_83971D                 ;83F4A2|201D97  |83971D;
                       RTS                                  ;83F4A5|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F4A6|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F4A9|20BD8A  |838ABD;
                       JSR.W CODE_FN_83971D                 ;83F4AC|201D97  |83971D;
                       LDA.L $7E998D                        ;83F4AF|AF8D997E|7E998D;
                       BNE +                                ;83F4B3|D05C    |83F511;
                       JSR.W CODE_FN_838193                 ;83F4B5|209381  |838193;
                       LDX.W #$0000                         ;83F4B8|A20000  |      ;
                       JSR.W CODE_FN_83F578                 ;83F4BB|2078F5  |83F578;
                       LDX.W #$0002                         ;83F4BE|A20200  |      ;
                       JSR.W CODE_FN_83F578                 ;83F4C1|2078F5  |83F578;
                       LDA.L $7E96E7                        ;83F4C4|AFE7967E|7E96E7;
                       STA.L $7E96EB                        ;83F4C8|8FEB967E|7E96EB;
                       LDA.L $7E96E9                        ;83F4CC|AFE9967E|7E96E9;
                       STA.L $7E96ED                        ;83F4D0|8FED967E|7E96ED;
                       LDA.W #$0003                         ;83F4D4|A90300  |      ;
                       STA.L $7E95D8                        ;83F4D7|8FD8957E|7E95D8;
                       LDA.W #$0004                         ;83F4DB|A90400  |      ;
                       STA.L $7E95DA                        ;83F4DE|8FDA957E|7E95DA;
                       LDA.W #$0000                         ;83F4E2|A90000  |      ;
                       STA.L $7E95DC                        ;83F4E5|8FDC957E|7E95DC;
                       LDA.L BossChars_Available            ;83F4E9|AFD2947E|7E94D2;
                       BEQ ++                               ;83F4ED|F007    |83F4F6;
                       db $A9,$00,$00,$8F,$DC,$95,$7E       ;83F4EF|        |      ;
 
                    ++ LDA.W #$0001                         ;83F4F6|A90100  |      ;
                       STA.L $7E95E8                        ;83F4F9|8FE8957E|7E95E8;
                       STZ.W $1A6E                          ;83F4FD|9C6E1A  |831A6E;
                       INC.W Game_State_State               ;83F500|EEA202  |8302A2;
                       LDA.W #$0000                         ;83F503|A90000  |      ;
                       STA.L $7E9610                        ;83F506|8F10967E|7E9610;
                       STA.L $7E9612                        ;83F50A|8F12967E|7E9612;
                       JSR.W CODE_FN_83F578                 ;83F50E|2078F5  |83F578;
 
                     + RTS                                  ;83F511|60      |      ;
                       LDX.W #$0000                         ;83F512|A20000  |      ;
                       JSR.W CODE_FN_83F5AD                 ;83F515|20ADF5  |83F5AD;
                       LDX.W #$0002                         ;83F518|A20200  |      ;
                       JSR.W CODE_FN_83F5AD                 ;83F51B|20ADF5  |83F5AD;
                       JSR.W CODE_FN_83F5A0                 ;83F51E|20A0F5  |83F5A0;
                       LDX.W #$0000                         ;83F521|A20000  |      ;
                       JSR.W CODE_FN_83F552                 ;83F524|2052F5  |83F552;
                       LDX.W #$0002                         ;83F527|A20200  |      ;
                       JSR.W CODE_FN_83F552                 ;83F52A|2052F5  |83F552;
                       JSR.W CODE_FN_83971D                 ;83F52D|201D97  |83971D;
                       JSR.W CODE_FN_83BA65                 ;83F530|2065BA  |83BA65;
                       JSR.W CODE_FN_839763                 ;83F533|206397  |839763;
                       JSR.W CODE_FN_83A058                 ;83F536|2058A0  |83A058;
                       LDA.L $7E9610                        ;83F539|AF10967E|7E9610;
                       BEQ +                                ;83F53D|F012    |83F551;
                       LDA.L $7E9612                        ;83F53F|AF12967E|7E9612;
                       BEQ +                                ;83F543|F00C    |83F551;
                       LDA.W #$0009                         ;83F545|A90900  |      ;
                       STA.W Game_State_State               ;83F548|8DA202  |8302A2;
                       LDA.W #$0050                         ;83F54B|A95000  |      ;
                       STA.W $1A6E                          ;83F54E|8D6E1A  |831A6E;
 
                     + RTS                                  ;83F551|60      |      ;
 
       CODE_FN_83F552:
                       LDA.L $7E96F5,X                      ;83F552|BFF5967E|7E96F5;
                       CMP.W #$0001                         ;83F556|C90100  |      ;
                       BNE +                                ;83F559|D00E    |83F569;
                       LDA.L $7E96E7,X                      ;83F55B|BFE7967E|7E96E7;
                       CMP.W #$0004                         ;83F55F|C90400  |      ;
                       BNE +                                ;83F562|D005    |83F569;
                       LDA.W #$000C                         ;83F564|A90C00  |      ;
                       BRA ++                               ;83F567|800B    |83F574;
 
                     + LDA.L $7E96F5,X                      ;83F569|BFF5967E|7E96F5;
                       ASL A                                ;83F56D|0A      |      ;
                       ASL A                                ;83F56E|0A      |      ;
                       CLC                                  ;83F56F|18      |      ;
                       ADC.L $7E96E7,X                      ;83F570|7FE7967E|7E96E7;
 
                    ++ STA.W Character_1P,X                 ;83F574|9DBA02  |8302BA;
                       RTS                                  ;83F577|60      |      ;
 
       CODE_FN_83F578:
                       LDA.W Character_1P,X                 ;83F578|BDBA02  |8302BA;
                       CMP.W #$000C                         ;83F57B|C90C00  |      ;
                       BNE +                                ;83F57E|D00F    |83F58F;
                       db $A9,$04,$00,$9F,$E7,$96,$7E,$A9   ;83F580|        |      ;
                       db $01,$00,$9F,$F5,$96,$7E,$60       ;83F588|        |000000;
 
                     + AND.W #$0003                         ;83F58F|290300  |      ;
                       STA.L $7E96E7,X                      ;83F592|9FE7967E|7E96E7;
                       LDA.W Character_1P,X                 ;83F596|BDBA02  |8302BA;
                       LSR A                                ;83F599|4A      |      ;
                       LSR A                                ;83F59A|4A      |      ;
                       STA.L $7E96F5,X                      ;83F59B|9FF5967E|7E96F5;
                       RTS                                  ;83F59F|60      |      ;
 
       CODE_FN_83F5A0:
                       LDX.W #$0000                         ;83F5A0|A20000  |      ;
                       JSR.W CODE_FN_8399BD                 ;83F5A3|20BD99  |8399BD;
                       LDX.W #$0002                         ;83F5A6|A20200  |      ;
                       JSR.W CODE_FN_8399BD                 ;83F5A9|20BD99  |8399BD;
                       RTS                                  ;83F5AC|60      |      ;
 
       CODE_FN_83F5AD:
                       LDA.B $BB                            ;83F5AD|A5BB    |0000BB;
                       AND.B $BD                            ;83F5AF|25BD    |0000BD;
                       CMP.W #$0030                         ;83F5B1|C93000  |      ;
                       BNE +                                ;83F5B4|D015    |83F5CB;
                       LDA.W #$0001                         ;83F5B6|A90100  |      ;
                       STA.L BossChars_Available            ;83F5B9|8FD2947E|7E94D2;
                       LDA.W #$0003                         ;83F5BD|A90300  |      ;
                       STA.L $7E95DC                        ;83F5C0|8FDC957E|7E95DC;
                       LDA.W #$0002                         ;83F5C4|A90200  |      ;
                       STA.L $7E95E8                        ;83F5C7|8FE8957E|7E95E8;
 
                     + LDA.L $7E9610,X                      ;83F5CB|BF10967E|7E9610;
                       BEQ +                                ;83F5CF|F012    |83F5E3;
                       LDA.B $BB,X                          ;83F5D1|B5BB    |0000BB;
                       BIT.W #$8000                         ;83F5D3|890080  |      ;
                       BEQ ++                               ;83F5D6|F00A    |83F5E2;
                       JSR.W CODE_FN_8384D4                 ;83F5D8|20D484  |8384D4;
                       LDA.W #$0000                         ;83F5DB|A90000  |      ;
                       STA.L $7E9610,X                      ;83F5DE|9F10967E|7E9610;
 
                    ++ RTS                                  ;83F5E2|60      |      ;
 
                     + JSR.W CODE_FN_838E7D                 ;83F5E3|207D8E  |838E7D;
                       LDA.L $7E95EA                        ;83F5E6|AFEA957E|7E95EA;
                       BEQ +                                ;83F5EA|F003    |83F5EF;
                       JSR.W CODE_FN_83853B                 ;83F5EC|203B85  |83853B;
 
                     + LDA.B $B7,X                          ;83F5EF|B5B7    |0000B7;
                       BIT.W #$1080                         ;83F5F1|898010  |      ;
                       BEQ +                                ;83F5F4|F00E    |83F604;
                       JSR.W CODE_FN_8384CD                 ;83F5F6|20CD84  |8384CD;
                       LDA.W #$0010                         ;83F5F9|A91000  |      ;
                       STA.L $7E9610,X                      ;83F5FC|9F10967E|7E9610;
                       JSR.W CODE_FN_838547                 ;83F600|204785  |838547;
                       RTS                                  ;83F603|60      |      ;
 
                     + BIT.W #$8000                         ;83F604|890080  |      ;
                       BEQ +                                ;83F607|F009    |83F612;
                       JSR.W CODE_FN_8384D4                 ;83F609|20D484  |8384D4;
                       LDA.W #$0008                         ;83F60C|A90800  |      ;
                       STA.W Game_State_State               ;83F60F|8DA202  |0002A2;
 
                     + RTS                                  ;83F612|60      |      ;
                       LDA.W $1A6E                          ;83F613|AD6E1A  |001A6E;
                       ASL A                                ;83F616|0A      |      ;
                       TAX                                  ;83F617|AA      |      ;
                       JSR.W (DATA8_83F61C,X)               ;83F618|FC1CF6  |83F61C;
                       RTS                                  ;83F61B|60      |      ;
 
         DATA8_83F61C:
                       db $28,$F6,$50,$F6,$85,$F6,$B1,$F6   ;83F61C|        |      ;
                       db $D0,$F6,$F3,$F6                   ;83F624|        |      ;
                       INC.W $1A6E                          ;83F628|EE6E1A  |001A6E;
                       LDY.W #$F633                         ;83F62B|A033F6  |      ;
                       JSR.W CODE_FN_838BBA                 ;83F62E|20BA8B  |838BBA;
                       BRA +                                ;83F631|8003    |83F636;
                       db $A0,$D8,$0C                       ;83F633|        |      ;
 
                     + JSR.W CODE_FN_838BF1                 ;83F636|20F18B  |838BF1;
                       LDA.W #$0001                         ;83F639|A90100  |      ;
                       STA.L $7E995F                        ;83F63C|8F5F997E|7E995F;
                       JSR.W CODE_FN_839763                 ;83F640|206397  |839763;
                       JSR.W CODE_FN_83971D                 ;83F643|201D97  |83971D;
                       JSR.W CODE_FN_83BA9F                 ;83F646|209FBA  |83BA9F;
                       JSR.W CODE_FN_839763                 ;83F649|206397  |839763;
                       JSR.W CODE_FN_83A058                 ;83F64C|2058A0  |83A058;
                       RTS                                  ;83F64F|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F650|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F653|20F18B  |838BF1;
                       LDA.W #$0001                         ;83F656|A90100  |      ;
                       STA.L $7E995F                        ;83F659|8F5F997E|7E995F;
                       JSR.W CODE_FN_83971D                 ;83F65D|201D97  |83971D;
                       LDA.L $7E998D                        ;83F660|AF8D997E|7E998D;
                       BNE +                                ;83F664|D01E    |83F684;
                       INC.W $1A6E                          ;83F666|EE6E1A  |001A6E;
                       LDY.W #$F671                         ;83F669|A071F6  |      ;
                       JSR.W CODE_FN_839FC2                 ;83F66C|20C29F  |839FC2;
                       BRA ++                               ;83F66F|8004    |83F675;
                       db $C0,$04,$00,$07                   ;83F671|        |      ;
 
                    ++ LDY.W #$F67D                         ;83F675|A07DF6  |      ;
                       JSR.W CODE_FN_839FD8                 ;83F678|20D89F  |839FD8;
                       BRA ++                               ;83F67B|8004    |83F681;
                       db $00,$05,$00,$07                   ;83F67D|        |      ;
 
                    ++ JSR.W CODE_FN_83A058                 ;83F681|2058A0  |83A058;
 
                     + RTS                                  ;83F684|60      |      ;
                       INC.W $1A6E                          ;83F685|EE6E1A  |001A6E;
                       JSR.W CODE_FN_8380FC                 ;83F688|20FC80  |8380FC;
                       LDA.W #$0001                         ;83F68B|A90100  |      ;
                       STA.L $7E995F                        ;83F68E|8F5F997E|7E995F;
                       JSR.W CODE_FN_83971D                 ;83F692|201D97  |83971D;
                       LDY.W #$F69D                         ;83F695|A09DF6  |      ;
                       JSR.W CODE_FN_839FC2                 ;83F698|20C29F  |839FC2;
                       BRA +                                ;83F69B|8004    |83F6A1;
                       db $00,$04,$C0,$04                   ;83F69D|        |      ;
 
                     + LDY.W #$F6A9                         ;83F6A1|A0A9F6  |      ;
                       JSR.W CODE_FN_839FD8                 ;83F6A4|20D89F  |839FD8;
                       BRA +                                ;83F6A7|8004    |83F6AD;
                       db $40,$04,$00,$05                   ;83F6A9|        |      ;
 
                     + JSR.W CODE_FN_83A058                 ;83F6AD|2058A0  |83A058;
                       RTS                                  ;83F6B0|60      |      ;
                       INC.W $1A6E                          ;83F6B1|EE6E1A  |001A6E;
                       LDY.W #$F6BC                         ;83F6B4|A0BCF6  |      ;
                       JSR.W CODE_FN_838BBA                 ;83F6B7|20BA8B  |838BBA;
                       BRA +                                ;83F6BA|8003    |83F6BF;
                       db $10,$78,$0C                       ;83F6BC|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83F6BF|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F6C2|20F18B  |838BF1;
                       LDA.W #$0001                         ;83F6C5|A90100  |      ;
                       STA.L $7E995F                        ;83F6C8|8F5F997E|7E995F;
                       JSR.W CODE_FN_83971D                 ;83F6CC|201D97  |83971D;
                       RTS                                  ;83F6CF|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F6D0|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83F6D3|20F18B  |838BF1;
                       LDA.W #$0001                         ;83F6D6|A90100  |      ;
                       STA.L $7E995F                        ;83F6D9|8F5F997E|7E995F;
                       JSR.W CODE_FN_83971D                 ;83F6DD|201D97  |83971D;
                       LDA.L $7E998D                        ;83F6E0|AF8D997E|7E998D;
                       BNE +                                ;83F6E4|D00C    |83F6F2;
                       INC.W $1A6E                          ;83F6E6|EE6E1A  |001A6E;
                       LDX.W #$0040                         ;83F6E9|A24000  |      ;
                       JSR.W CODE_FN_839FEE                 ;83F6EC|20EE9F  |839FEE;
                       JSR.W CODE_FN_83A058                 ;83F6EF|2058A0  |83A058;
 
                     + RTS                                  ;83F6F2|60      |      ;
                       JSR.W CODE_FN_838193                 ;83F6F3|209381  |838193;
                       LDA.W #$0002                         ;83F6F6|A90200  |      ;
                       STA.W Game_State_State               ;83F6F9|8DA202  |0002A2;
                       LDA.W #$0001                         ;83F6FC|A90100  |      ;
                       STA.W $1A6E                          ;83F6FF|8D6E1A  |001A6E;
                       JSR.W CODE_FN_839FB6                 ;83F702|20B69F  |839FB6;
                       JSR.W CODE_FN_83A058                 ;83F705|2058A0  |83A058;
                       RTS                                  ;83F708|60      |      ;
                       LDA.L $7E95D4                        ;83F709|AFD4957E|7E95D4;
                       BIT.W #$1080                         ;83F70D|898010  |      ;
                       BNE +                                ;83F710|D019    |83F72B;
                       LDX.W #$0000                         ;83F712|A20000  |      ;
                       LDA.B $B7                            ;83F715|A5B7    |0000B7;
                       BIT.W #$8000                         ;83F717|890080  |      ;
                       BNE UNREACH_83F741                   ;83F71A|D025    |83F741;
                       LDX.W #$0002                         ;83F71C|A20200  |      ;
                       LDA.B $B9                            ;83F71F|A5B9    |0000B9;
                       BIT.W #$8000                         ;83F721|890080  |      ;
                       BNE UNREACH_83F741                   ;83F724|D01B    |83F741;
                       DEC.W $1A6E                          ;83F726|CE6E1A  |831A6E;
                       BNE ++                               ;83F729|D029    |83F754;
 
                     + LDA.W #$000A                         ;83F72B|A90A00  |      ;
                       STA.W Game_State_State               ;83F72E|8DA202  |8302A2;
                       STZ.W $1A6E                          ;83F731|9C6E1A  |831A6E;
                       LDA.W #$0001                         ;83F734|A90100  |      ;
                       STA.L $7E9610                        ;83F737|8F10967E|7E9610;
                       STA.L $7E9612                        ;83F73B|8F12967E|7E9612;
                       BRA ++                               ;83F73F|8013    |83F754;
 
       UNREACH_83F741:
                       db $20,$D4,$84,$A9,$07,$00,$8D,$A2   ;83F741|        |8384D4;
                       db $02,$A9,$00,$00,$8D,$6E,$1A,$9F   ;83F749|        |      ;
                       db $10,$96,$7E                       ;83F751|        |83F6E9;
 
                    ++ JSR.W CODE_FN_83F5A0                 ;83F754|20A0F5  |83F5A0;
                       JSR.W CODE_FN_839763                 ;83F757|206397  |839763;
                       JSR.W CODE_FN_83971D                 ;83F75A|201D97  |83971D;
                       JSR.W CODE_FN_83A058                 ;83F75D|2058A0  |83A058;
                       RTS                                  ;83F760|60      |      ;
                       JSR.W CODE_FN_83F5A0                 ;83F761|20A0F5  |83F5A0;
                       JSR.W CODE_FN_83BE0E                 ;83F764|200EBE  |83BE0E;
                       JSR.W CODE_FN_839763                 ;83F767|206397  |839763;
                       JSR.W CODE_FN_83971D                 ;83F76A|201D97  |83971D;
                       JSR.W CODE_FN_83A058                 ;83F76D|2058A0  |83A058;
                       RTS                                  ;83F770|60      |      ;
                       LDA.W Game_State_State               ;83F771|ADA202  |8302A2;
                       ASL A                                ;83F774|0A      |      ;
                       TAX                                  ;83F775|AA      |      ;
                       JSR.W (DATA8_83F77A,X)               ;83F776|FC7AF7  |83F77A;
                       RTS                                  ;83F779|60      |      ;
 
         DATA8_83F77A:
                       db $6F,$D6,$85,$C0,$94,$F7,$B2,$F8   ;83F77A|        |      ;
                       db $14,$FA,$F4,$FA,$A4,$F3,$12,$F5   ;83F782|        |      ;
                       db $13,$F6                           ;83F78A|        |0000F6;
                       db $09,$F7,$61,$F7,$E5,$F8,$49,$F9   ;83F78C|        |      ;
                       LDA.W $1A6E                          ;83F794|AD6E1A  |831A6E;
                       ASL A                                ;83F797|0A      |      ;
                       TAX                                  ;83F798|AA      |      ;
                       JSR.W (DATA8_83F79D,X)               ;83F799|FC9DF7  |83F79D;
                       RTS                                  ;83F79C|60      |      ;
 
         DATA8_83F79D:
                       db $D7,$D6,$B1,$F7,$3F,$D7,$5B,$D7   ;83F79D|        |      ;
                       db $74,$D7,$8D,$D7,$BB,$F7,$FC,$F7   ;83F7A5|        |      ;
                       db $41,$F8,$8F,$F8                   ;83F7AD|        |      ;
                       INC.W $1A6E                          ;83F7B1|EE6E1A  |831A6E;
                       LDA.W #$0020                         ;83F7B4|A92000  |      ;
                       JSR.W CODE_FN_83A9C7                 ;83F7B7|20C7A9  |83A9C7;
                       RTS                                  ;83F7BA|60      |      ;
                       INC.W $1A6E                          ;83F7BB|EE6E1A  |831A6E;
                       JSL.L CODE_FL_80BB2D                 ;83F7BE|222DBB80|80BB2D;
                       db $31,$A8,$93,$00,$20,$7E           ;83F7C2|        |      ;
                       JSR.W CODE_FN_83BAB0                 ;83F7C8|20B0BA  |83BAB0;
                       JSR.W CODE_FN_83BAB7                 ;83F7CB|20B7BA  |83BAB7;
                       JSR.W CODE_FN_83BAC4                 ;83F7CE|20C4BA  |83BAC4;
                       PHB                                  ;83F7D1|8B      |      ;
                       PHK                                  ;83F7D2|4B      |      ;
                       PLB                                  ;83F7D3|AB      |      ;
                       LDY.W #$F7DE                         ;83F7D4|A0DEF7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F7D7|22CAA080|80A0CA;
                       PLB                                  ;83F7DB|AB      |      ;
                       BRA +                                ;83F7DC|8008    |83F7E6;
                       db $80,$20,$7E,$C0,$00,$80,$40,$68   ;83F7DE|        |      ;
 
                     + PHB                                  ;83F7E6|8B      |      ;
                       PHK                                  ;83F7E7|4B      |      ;
                       PLB                                  ;83F7E8|AB      |      ;
                       LDY.W #$F7F3                         ;83F7E9|A0F3F7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F7EC|22CAA080|80A0CA;
                       PLB                                  ;83F7F0|AB      |      ;
                       BRA +                                ;83F7F1|8008    |83F7FB;
                       db $C0,$30,$7E,$C0,$00,$80,$60,$78   ;83F7F3|        |      ;
 
                     + RTS                                  ;83F7FB|60      |      ;
                       INC.W $1A6E                          ;83F7FC|EE6E1A  |831A6E;
                       JSR.W CODE_FN_83BB3F                 ;83F7FF|203FBB  |83BB3F;
                       JSR.W CODE_FN_83BB68                 ;83F802|2068BB  |83BB68;
                       PHB                                  ;83F805|8B      |      ;
                       PHK                                  ;83F806|4B      |      ;
                       PLB                                  ;83F807|AB      |      ;
                       LDY.W #$F812                         ;83F808|A012F8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F80B|22CAA080|80A0CA;
                       PLB                                  ;83F80F|AB      |      ;
                       BRA +                                ;83F810|8008    |83F81A;
                       db $40,$21,$7E,$00,$02,$80,$A0,$68   ;83F812|        |      ;
 
                     + PHB                                  ;83F81A|8B      |      ;
                       PHK                                  ;83F81B|4B      |      ;
                       PLB                                  ;83F81C|AB      |      ;
                       LDY.W #$F827                         ;83F81D|A027F8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F820|22CAA080|80A0CA;
                       PLB                                  ;83F824|AB      |      ;
                       BRA +                                ;83F825|8008    |83F82F;
                       db $40,$31,$7E,$00,$02,$80,$A0,$78   ;83F827|        |      ;
 
                     + LDY.W #$F837                         ;83F82F|A037F8  |      ;
                       JSR.W CODE_FN_838A8A                 ;83F832|208A8A  |838A8A;
                       BRA +                                ;83F835|8003    |83F83A;
                       db $30,$60,$08                       ;83F837|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83F83A|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F83D|20BD8A  |838ABD;
                       RTS                                  ;83F840|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F841|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F844|20BD8A  |838ABD;
                       JSR.W CODE_FN_83BB26                 ;83F847|2026BB  |83BB26;
                       LDA.L $7E998D                        ;83F84A|AF8D997E|7E998D;
                       BNE +                                ;83F84E|D03E    |83F88E;
                       INC.W $1A6E                          ;83F850|EE6E1A  |831A6E;
                       PHB                                  ;83F853|8B      |      ;
                       PHK                                  ;83F854|4B      |      ;
                       PLB                                  ;83F855|AB      |      ;
                       LDY.W #$F860                         ;83F856|A060F8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F859|22CAA080|80A0CA;
                       PLB                                  ;83F85D|AB      |      ;
                       BRA ++                               ;83F85E|8008    |83F868;
                       db $40,$23,$7E,$00,$02,$80,$A0,$69   ;83F860|        |      ;
 
                    ++ PHB                                  ;83F868|8B      |      ;
                       PHK                                  ;83F869|4B      |      ;
                       PLB                                  ;83F86A|AB      |      ;
                       LDY.W #$F875                         ;83F86B|A075F8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;83F86E|22CAA080|80A0CA;
                       PLB                                  ;83F872|AB      |      ;
                       BRA ++                               ;83F873|8008    |83F87D;
                       db $40,$33,$7E,$00,$02,$80,$A0,$79   ;83F875|        |      ;
 
                    ++ LDY.W #$F885                         ;83F87D|A085F8  |      ;
                       JSR.W CODE_FN_838A8A                 ;83F880|208A8A  |838A8A;
                       BRA ++                               ;83F883|8003    |83F888;
                       db $70,$A0,$08                       ;83F885|        |      ;
 
                    ++ JSR.W CODE_FN_8380FC                 ;83F888|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F88B|20BD8A  |838ABD;
 
                     + RTS                                  ;83F88E|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83F88F|20FC80  |8380FC;
                       JSR.W CODE_FN_838ABD                 ;83F892|20BD8A  |838ABD;
                       JSR.W CODE_FN_83BB26                 ;83F895|2026BB  |83BB26;
                       LDA.L $7E998D                        ;83F898|AF8D997E|7E998D;
                       BNE +                                ;83F89C|D013    |83F8B1;
                       JSR.W CODE_FN_838193                 ;83F89E|209381  |838193;
                       INC.W Game_State_State               ;83F8A1|EEA202  |8302A2;
                       LDA.W #$0000                         ;83F8A4|A90000  |      ;
                       STA.W $1A6E                          ;83F8A7|8D6E1A  |831A6E;
                       STA.W $1A70                          ;83F8AA|8D701A  |831A70;
                       STA.L $7E9452                        ;83F8AD|8F52947E|7E9452;
 
                     + RTS                                  ;83F8B1|60      |      ;
                       LDA.W #$0001                         ;83F8B2|A90100  |      ;
                       STA.B $B1                            ;83F8B5|85B1    |0000B1;
                       JSR.W CODE_FN_83BB26                 ;83F8B7|2026BB  |83BB26;
                       JSR.W CODE_FN_83BB01                 ;83F8BA|2001BB  |83BB01;
                       JSR.W CODE_FN_83BB3F                 ;83F8BD|203FBB  |83BB3F;
                       JSR.W CODE_FN_83A058                 ;83F8C0|2058A0  |83A058;
                       LDX.W #$0000                         ;83F8C3|A20000  |      ;
                       JSR.W CODE_FN_83F9CF                 ;83F8C6|20CFF9  |83F9CF;
                       LDX.W #$0002                         ;83F8C9|A20200  |      ;
                       JSR.W CODE_FN_83F9CF                 ;83F8CC|20CFF9  |83F9CF;
                       LDA.W $1A6E                          ;83F8CF|AD6E1A  |831A6E;
                       AND.W $1A70                          ;83F8D2|2D701A  |831A70;
                       BEQ +                                ;83F8D5|F00D    |83F8E4;
                       STZ.W $1A6E                          ;83F8D7|9C6E1A  |831A6E;
                       STZ.W $1A70                          ;83F8DA|9C701A  |831A70;
                       LDA.W #$0005                         ;83F8DD|A90500  |      ;
                       STA.W Game_State_State               ;83F8E0|8DA202  |8302A2;
                       RTS                                  ;83F8E3|60      |      ;
 
                     + RTS                                  ;83F8E4|60      |      ;
                       SEP #$20                             ;83F8E5|E220    |      ;
                       LDA.B #$07                           ;83F8E7|A907    |      ;
                       STA.W $01E2                          ;83F8E9|8DE201  |8301E2;
                       LDA.W $01E3                          ;83F8EC|ADE301  |8301E3;
                       AND.B #$FB                           ;83F8EF|29FB    |      ;
                       STA.W $01E3                          ;83F8F1|8DE301  |8301E3;
                       REP #$20                             ;83F8F4|C220    |      ;
                       LDA.W #$0000                         ;83F8F6|A90000  |      ;
                       JSL.L CODE_FL_80A1CF                 ;83F8F9|22CFA180|80A1CF;
                       LDA.W #$0000                         ;83F8FD|A90000  |      ;
                       JSL.L CODE_FL_80A1F1                 ;83F900|22F1A180|80A1F1;
                       LDA.W #$000F                         ;83F904|A90F00  |      ;
                       STA.B $00                            ;83F907|8500    |000000;
                       LDX.W #$0000                         ;83F909|A20000  |      ;
                       STX.B $02                            ;83F90C|8602    |000002;
                       STX.B $04                            ;83F90E|8604    |000004;
 
                     - LDY.W #$0030                         ;83F910|A03000  |      ;
 
                    -- LDX.B $02                            ;83F913|A602    |000002;
                       LDA.L $7E421C,X                      ;83F915|BF1C427E|7E421C;
                       LDX.B $04                            ;83F919|A604    |000004;
                       STA.L $7E2148,X                      ;83F91B|9F48217E|7E2148;
                       LDX.B $02                            ;83F91F|A602    |000002;
                       INX                                  ;83F921|E8      |      ;
                       INX                                  ;83F922|E8      |      ;
                       STX.B $02                            ;83F923|8602    |000002;
                       LDX.B $04                            ;83F925|A604    |000004;
                       INX                                  ;83F927|E8      |      ;
                       INX                                  ;83F928|E8      |      ;
                       STX.B $04                            ;83F929|8604    |000004;
                       DEY                                  ;83F92B|88      |      ;
                       DEY                                  ;83F92C|88      |      ;
                       BNE --                               ;83F92D|D0E4    |83F913;
                       LDA.B $04                            ;83F92F|A504    |000004;
                       CLC                                  ;83F931|18      |      ;
                       ADC.W #$0010                         ;83F932|691000  |      ;
                       STA.B $04                            ;83F935|8504    |000004;
                       DEC.B $00                            ;83F937|C600    |000000;
                       BNE -                                ;83F939|D0D5    |83F910;
                       JSR.W CODE_FN_83A058                 ;83F93B|2058A0  |83A058;
                       LDA.W #$0001                         ;83F93E|A90100  |      ;
                       STA.L $7EF1E0                        ;83F941|8FE0F17E|7EF1E0;
                       INC.W Game_State_State               ;83F945|EEA202  |8302A2;
                       RTS                                  ;83F948|60      |      ;
                       REP #$30                             ;83F949|C230    |      ;
                       LDA.B $B7                            ;83F94B|A5B7    |0000B7;
                       ORA.B $B9                            ;83F94D|05B9    |0000B9;
                       AND.W #$0300                         ;83F94F|290003  |      ;
                       BEQ +                                ;83F952|F011    |83F965;
                       LDA.W #$0001                         ;83F954|A90100  |      ;
                       STA.W $1988                          ;83F957|8D8819  |831988;
                       LDA.L $7EF1E0                        ;83F95A|AFE0F17E|7EF1E0;
                       EOR.W #$0001                         ;83F95E|490100  |      ;
                       STA.L $7EF1E0                        ;83F961|8FE0F17E|7EF1E0;
 
                     + LDA.B $B7                            ;83F965|A5B7    |0000B7;
                       ORA.B $B9                            ;83F967|05B9    |0000B9;
                       AND.W #$9080                         ;83F969|298090  |      ;
                       BEQ +                                ;83F96C|F03C    |83F9AA;
                       LDA.L $7EF1E0                        ;83F96E|AFE0F17E|7EF1E0;
                       BNE ++                               ;83F972|D00E    |83F982;
                       LDA.W #$0004                         ;83F974|A90400  |      ;
                       STA.W Game_State_State               ;83F977|8DA202  |8302A2;
                       LDA.W #$0005                         ;83F97A|A90500  |      ;
                       STA.W $1988                          ;83F97D|8D8819  |831988;
                       BRA +                                ;83F980|8028    |83F9AA;
 
                    ++ LDA.W #$0004                         ;83F982|A90400  |      ;
                       STA.W $1988                          ;83F985|8D8819  |831988;
                       LDA.W #$0002                         ;83F988|A90200  |      ;
                       STA.W Game_State_State               ;83F98B|8DA202  |8302A2;
                       SEP #$20                             ;83F98E|E220    |      ;
                       LDA.B #$17                           ;83F990|A917    |      ;
                       STA.W $01E2                          ;83F992|8DE201  |8301E2;
                       LDA.W $01E3                          ;83F995|ADE301  |8301E3;
                       ORA.B #$04                           ;83F998|0904    |      ;
                       STA.W $01E3                          ;83F99A|8DE301  |8301E3;
                       REP #$20                             ;83F99D|C220    |      ;
                       LDA.W #$0000                         ;83F99F|A90000  |      ;
                       JSL.L CODE_FL_80A1CF                 ;83F9A2|22CFA180|80A1CF;
                       JSR.W CODE_FN_83A058                 ;83F9A6|2058A0  |83A058;
                       RTS                                  ;83F9A9|60      |      ;
 
                     + JSR.W CODE_FN_83F9B1                 ;83F9AA|20B1F9  |83F9B1;
                       JSR.W CODE_FN_83A058                 ;83F9AD|2058A0  |83A058;
                       RTS                                  ;83F9B0|60      |      ;
 
       CODE_FN_83F9B1:
                       LDA.L $7EF1E0                        ;83F9B1|AFE0F17E|7EF1E0;
                       ASL A                                ;83F9B5|0A      |      ;
                       ASL A                                ;83F9B6|0A      |      ;
                       TAX                                  ;83F9B7|AA      |      ;
                       LDA.W DATA8_83F9C7,X                 ;83F9B8|BDC7F9  |83F9C7;
                       STA.L $7E2454                        ;83F9BB|8F54247E|7E2454;
                       LDA.W DATA8_83F9C9,X                 ;83F9BF|BDC9F9  |83F9C9;
                       STA.L $7E2462                        ;83F9C2|8F62247E|7E2462;
                       RTS                                  ;83F9C6|60      |      ;
 
         DATA8_83F9C7:
                       db $A0,$07                           ;83F9C7|        |      ;
 
         DATA8_83F9C9:
                       db $9D,$07,$9D,$07,$A0,$07           ;83F9C9|        |      ;
 
       CODE_FN_83F9CF:
                       LDA.W $1A6E,X                        ;83F9CF|BD6E1A  |831A6E;
                       BNE +                                ;83F9D2|D014    |83F9E8;
                       JSR.W CODE_FN_83F1F4                 ;83F9D4|20F4F1  |83F1F4;
                       JSR.W CODE_FN_839995                 ;83F9D7|209599  |839995;
                       LDA.B $B7,X                          ;83F9DA|B5B7    |0000B7;
                       BIT.W #$1080                         ;83F9DC|898010  |      ;
                       BEQ +                                ;83F9DF|F007    |83F9E8;
                       JSR.W CODE_FN_8384CD                 ;83F9E1|20CD84  |8384CD;
                       INC.W $1A6E,X                        ;83F9E4|FE6E1A  |831A6E;
                       RTS                                  ;83F9E7|60      |      ;
 
                     + LDA.B $BB,X                          ;83F9E8|B5BB    |0000BB;
                       BIT.W #$8000                         ;83F9EA|890080  |      ;
                       BEQ +                                ;83F9ED|F024    |83FA13;
                       JSR.W CODE_FN_8384D4                 ;83F9EF|20D484  |8384D4;
                       LDA.W $1A6E,X                        ;83F9F2|BD6E1A  |831A6E;
                       BEQ ++                               ;83F9F5|F005    |83F9FC;
                       DEC A                                ;83F9F7|3A      |      ;
                       STA.W $1A6E,X                        ;83F9F8|9D6E1A  |831A6E;
                       RTS                                  ;83F9FB|60      |      ;
 
                    ++ LDA.L $7E9458                        ;83F9FC|AF58947E|7E9458;
                       BNE ++                               ;83FA00|D00B    |83FA0D;
                       LDA.L $7E945A                        ;83FA02|AF5A947E|7E945A;
                       BNE ++                               ;83FA06|D005    |83FA0D;
                       INC.W Game_State_State               ;83FA08|EEA202  |8302A2;
                       BRA +                                ;83FA0B|8006    |83FA13;
 
                    ++ LDA.W #$000B                         ;83FA0D|A90B00  |      ;
                       STA.W Game_State_State               ;83FA10|8DA202  |8302A2;
 
                     + RTS                                  ;83FA13|60      |      ;
                       LDA.W $1A6E                          ;83FA14|AD6E1A  |831A6E;
                       ASL A                                ;83FA17|0A      |      ;
                       TAX                                  ;83FA18|AA      |      ;
                       JSR.W (DATA8_83FA1D,X)               ;83FA19|FC1DFA  |83FA1D;
                       RTS                                  ;83FA1C|60      |      ;
 
         DATA8_83FA1D:
                       db $25,$FA,$40,$FA,$7F,$FA,$B0,$FA   ;83FA1D|        |      ;
                       INC.W $1A6E                          ;83FA25|EE6E1A  |831A6E;
                       STZ.W $1A70                          ;83FA28|9C701A  |831A70;
                       LDY.W #$FA33                         ;83FA2B|A033FA  |      ;
                       JSR.W CODE_FN_838BBA                 ;83FA2E|20BA8B  |838BBA;
                       BRA +                                ;83FA31|8003    |83FA36;
                       db $70,$A0,$0C                       ;83FA33|        |      ;
 
                     + JSR.W CODE_FN_8380FC                 ;83FA36|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83FA39|20F18B  |838BF1;
                       JSR.W CODE_FN_83BB26                 ;83FA3C|2026BB  |83BB26;
                       RTS                                  ;83FA3F|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83FA40|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83FA43|20F18B  |838BF1;
                       JSR.W CODE_FN_83BB26                 ;83FA46|2026BB  |83BB26;
                       LDA.L $7E998D                        ;83FA49|AF8D997E|7E998D;
                       BNE +                                ;83FA4D|D02F    |83FA7E;
                       INC.W $1A6E                          ;83FA4F|EE6E1A  |831A6E;
                       LDY.W #$FA5A                         ;83FA52|A05AFA  |      ;
                       JSR.W CODE_FN_839FC2                 ;83FA55|20C29F  |839FC2;
                       BRA ++                               ;83FA58|8004    |83FA5E;
                       db $40,$03,$40,$05                   ;83FA5A|        |      ;
 
                    ++ LDY.W #$FA66                         ;83FA5E|A066FA  |      ;
                       JSR.W CODE_FN_839FD8                 ;83FA61|20D89F  |839FD8;
                       BRA ++                               ;83FA64|8004    |83FA6A;
                       db $40,$03,$40,$05                   ;83FA66|        |      ;
 
                    ++ JSR.W CODE_FN_83A058                 ;83FA6A|2058A0  |83A058;
                       LDY.W #$FA75                         ;83FA6D|A075FA  |      ;
                       JSR.W CODE_FN_838BBA                 ;83FA70|20BA8B  |838BBA;
                       BRA ++                               ;83FA73|8003    |83FA78;
                       db $30,$60,$0C                       ;83FA75|        |      ;
 
                    ++ JSR.W CODE_FN_8380FC                 ;83FA78|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83FA7B|20F18B  |838BF1;
 
                     + RTS                                  ;83FA7E|60      |      ;
                       JSR.W CODE_FN_8380FC                 ;83FA7F|20FC80  |8380FC;
                       JSR.W CODE_FN_838BF1                 ;83FA82|20F18B  |838BF1;
                       JSR.W CODE_FN_83BB26                 ;83FA85|2026BB  |83BB26;
                       LDA.L $7E998D                        ;83FA88|AF8D997E|7E998D;
                       BNE +                                ;83FA8C|D021    |83FAAF;
                       INC.W $1A6E                          ;83FA8E|EE6E1A  |831A6E;
                       LDY.W #$FA99                         ;83FA91|A099FA  |      ;
                       JSR.W CODE_FN_839FC2                 ;83FA94|20C29F  |839FC2;
                       BRA ++                               ;83FA97|8004    |83FA9D;
                       db $40,$01,$40,$03                   ;83FA99|        |      ;
 
                    ++ LDY.W #$FAA5                         ;83FA9D|A0A5FA  |      ;
                       JSR.W CODE_FN_839FD8                 ;83FAA0|20D89F  |839FD8;
                       BRA ++                               ;83FAA3|8004    |83FAA9;
                       db $40,$01,$40,$03                   ;83FAA5|        |      ;
 
                    ++ JSR.W CODE_FN_83BAB0                 ;83FAA9|20B0BA  |83BAB0;
                       JSR.W CODE_FN_83A058                 ;83FAAC|2058A0  |83A058;
 
                     + RTS                                  ;83FAAF|60      |      ;
                       JSR.W CODE_FN_838193                 ;83FAB0|209381  |838193;
                       STZ.W $1A6E                          ;83FAB3|9C6E1A  |831A6E;
                       LDY.W #$FABE                         ;83FAB6|A0BEFA  |      ;
                       JSR.W CODE_FN_839FC2                 ;83FAB9|20C29F  |839FC2;
                       BRA +                                ;83FABC|8004    |83FAC2;
                       db $80,$00,$40,$01                   ;83FABE|        |      ;
 
                     + LDY.W #$FACA                         ;83FAC2|A0CAFA  |      ;
                       JSR.W CODE_FN_839FD8                 ;83FAC5|20D89F  |839FD8;
                       BRA +                                ;83FAC8|8004    |83FACE;
                       db $80,$00,$80,$01                   ;83FACA|        |      ;
 
                     + JSR.W CODE_FN_83A058                 ;83FACE|2058A0  |83A058;
                       DEC.W Game_State                     ;83FAD1|CEA002  |8302A0;
                       LDA.W #$000D                         ;83FAD4|A90D00  |      ;
                       STA.W Game_State_State               ;83FAD7|8DA202  |8302A2;
                       LDA.W $02A8                          ;83FADA|ADA802  |8302A8;
                       CMP.W #$0002                         ;83FADD|C90200  |      ;
                       BNE +                                ;83FAE0|D011    |83FAF3;
                       SEP #$20                             ;83FAE2|E220    |      ;
                       LDA.B #$17                           ;83FAE4|A917    |      ;
                       STA.W $01E2                          ;83FAE6|8DE201  |8301E2;
                       LDA.W $01E3                          ;83FAE9|ADE301  |8301E3;
                       ORA.B #$04                           ;83FAEC|0904    |      ;
                       STA.W $01E3                          ;83FAEE|8DE301  |8301E3;
                       REP #$20                             ;83FAF1|C220    |      ;
 
                     + RTS                                  ;83FAF3|60      |      ;
                       LDA.W $1A6E                          ;83FAF4|AD6E1A  |831A6E;
                       ASL A                                ;83FAF7|0A      |      ;
                       TAX                                  ;83FAF8|AA      |      ;
                       JSR.W (DATA8_83FAFD,X)               ;83FAF9|FCFDFA  |83FAFD;
                       RTS                                  ;83FAFC|60      |      ;
 
         DATA8_83FAFD:
                       db $25,$FA,$40,$FA,$7F,$FA,$05,$FB   ;83FAFD|        |      ;
                       JSR.W CODE_FN_838193                 ;83FB05|209381  |838193;
                       STZ.W $1A6E                          ;83FB08|9C6E1A  |831A6E;
                       LDY.W #$FB13                         ;83FB0B|A013FB  |      ;
                       JSR.W CODE_FN_839FC2                 ;83FB0E|20C29F  |839FC2;
                       BRA +                                ;83FB11|8004    |83FB17;
                       db $80,$00,$40,$01                   ;83FB13|        |      ;
 
                     + LDY.W #$FB1F                         ;83FB17|A01FFB  |      ;
                       JSR.W CODE_FN_839FD8                 ;83FB1A|20D89F  |839FD8;
                       BRA +                                ;83FB1D|8004    |83FB23;
                       db $80,$00,$80,$01                   ;83FB1F|        |      ;
 
                     + JSR.W CODE_FN_83A058                 ;83FB23|2058A0  |83A058;
                       LDA.W #$0006                         ;83FB26|A90600  |      ;
                       STA.W Game_State_State               ;83FB29|8DA202  |8302A2;
                       RTS                                  ;83FB2C|60      |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FB9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FBFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FC9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FCFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FD9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FDFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FE9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FECD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FED5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FEFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FF9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;83FFF5|        |      ;
                       db $00,$00,$00                       ;83FFFD|        |      ;
