 
                       ORG $8B8000
 
 
       CODE_JL_8B8000:
                       SEI                                  ;8B8000|78      |      ;
                       PHK                                  ;8B8001|4B      |      ;
                       PLB                                  ;8B8002|AB      |      ;
                       LDX.W #$1FFF                         ;8B8003|A2FF1F  |      ;
                       TXS                                  ;8B8006|9A      |      ;
                       LDA.W #$0000                         ;8B8007|A90000  |      ;
                       TCD                                  ;8B800A|5B      |      ;
                       SEP #$30                             ;8B800B|E230    |      ;
                       LDA.B #$81                           ;8B800D|A981    |      ;
                       STA.W NMITIMEN                       ;8B800F|8D0042  |8B4200;
                       STZ.W HDMAEN                         ;8B8012|9C0C42  |8B420C;
                       LDA.B #$80                           ;8B8015|A980    |      ;
                       STA.W $01B6                          ;8B8017|8DB601  |8B01B6;
                       STA.W INIDISP                        ;8B801A|8D0021  |8B2100;
                       REP #$30                             ;8B801D|C230    |      ;
                       JSL.L CODE_FL_809115                 ;8B801F|22159180|809115;
                       JSL.L CODE_FL_809086                 ;8B8023|22869080|809086;
                       LDA.W #$0000                         ;8B8027|A90000  |      ;
                       STA.L $7EDC50                        ;8B802A|8F50DC7E|7EDC50;
                       STA.L $7EE042                        ;8B802E|8F42E07E|7EE042;
                       STZ.B $A5                            ;8B8032|64A5    |0000A5;
                       LDA.W #$0001                         ;8B8034|A90100  |      ;
                       STA.B $A3                            ;8B8037|85A3    |0000A3;
                       JML.L CODE_JP_80A6F0                 ;8B8039|5CF0A680|80A6F0;
                       PHP                                  ;8B803D|08      |      ;
                       REP #$30                             ;8B803E|C230    |      ;
                       SEP #$20                             ;8B8040|E220    |      ;
                       LDA.B #$81                           ;8B8042|A981    |      ;
                       STA.L NMITIMEN                       ;8B8044|8F004200|004200;
                       LDA.B #$80                           ;8B8048|A980    |      ;
                       STA.L $0001B6                        ;8B804A|8FB60100|0001B6;
                       REP #$20                             ;8B804E|C220    |      ;
                       JSL.L CODE_FL_80A145                 ;8B8050|2245A180|80A145;
                       JSL.L CODE_FL_809115                 ;8B8054|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8B8058|22F79C80|809CF7;
                       JSL.L CODE_FL_8B94D6                 ;8B805C|22D6948B|8B94D6;
                       JSL.L CODE_FL_8B94F1                 ;8B8060|22F1948B|8B94F1;
                       LDA.W #$0004                         ;8B8064|A90400  |      ;
                       STA.L $7ED216                        ;8B8067|8F16D27E|7ED216;
                       LDA.W #$0000                         ;8B806B|A90000  |      ;
                       STA.L $7ED218                        ;8B806E|8F18D27E|7ED218;
                       LDA.W #$4000                         ;8B8072|A90040  |      ;
                       STA.L $7ED1E4                        ;8B8075|8FE4D17E|7ED1E4;
                       LDA.W #$FFFF                         ;8B8079|A9FFFF  |      ;
                       STA.L $7ED1E2                        ;8B807C|8FE2D17E|7ED1E2;
                       LDA.W #$000C                         ;8B8080|A90C00  |      ;
                       STA.L $7ED21A                        ;8B8083|8F1AD27E|7ED21A;
                       LDA.W #$0000                         ;8B8087|A90000  |      ;
                       STA.L $7E9450                        ;8B808A|8F50947E|7E9450;
                       JSR.W CODE_FN_8B809C                 ;8B808E|209C80  |8B809C;
                       LDA.L Game_State-$7E0000             ;8B8091|AFA00200|0002A0;
                       INC A                                ;8B8095|1A      |      ;
                       STA.L Game_State-$7E0000             ;8B8096|8FA00200|0002A0;
                       PLP                                  ;8B809A|28      |      ;
                       RTL                                  ;8B809B|6B      |      ;
 
       CODE_FN_8B809C:
                       LDA.L $001A82                        ;8B809C|AF821A00|001A82;
                       BEQ +                                ;8B80A0|F012    |8B80B4;
                       JSL.L CODE_FL_86F1CE                 ;8B80A2|22CEF186|86F1CE;
                       SEP #$20                             ;8B80A6|E220    |      ;
                       LDA.B #$02                           ;8B80A8|A902    |      ;
                       STA.L $7ED1F2                        ;8B80AA|8FF2D17E|7ED1F2;
                       REP #$20                             ;8B80AE|C220    |      ;
                       JSL.L CODE_FL_8BBA2A                 ;8B80B0|222ABA8B|8BBA2A;
 
                     + RTS                                  ;8B80B4|60      |      ;
 
       CODE_FL_8B80B5:
                       PHP                                  ;8B80B5|08      |      ;
                       PHB                                  ;8B80B6|8B      |      ;
                       PHK                                  ;8B80B7|4B      |      ;
                       PLB                                  ;8B80B8|AB      |      ;
                       LDA.W #$0000                         ;8B80B9|A90000  |      ;
                       STA.L $7ED1E2                        ;8B80BC|8FE2D17E|7ED1E2;
                       LDA.W #$0004                         ;8B80C0|A90400  |      ;
                       STA.L $7ED216                        ;8B80C3|8F16D27E|7ED216;
                       LDA.W #$0000                         ;8B80C7|A90000  |      ;
                       STA.L $7ED218                        ;8B80CA|8F18D27E|7ED218;
                       SEP #$20                             ;8B80CE|E220    |      ;
                       LDA.B #$02                           ;8B80D0|A902    |      ;
                       STA.L $7ED1F2                        ;8B80D2|8FF2D17E|7ED1F2;
                       REP #$20                             ;8B80D6|C220    |      ;
                       JSL.L CODE_FL_8BBA2A                 ;8B80D8|222ABA8B|8BBA2A;
                       PLB                                  ;8B80DC|AB      |      ;
                       PLP                                  ;8B80DD|28      |      ;
                       RTL                                  ;8B80DE|6B      |      ;
                       PHP                                  ;8B80DF|08      |      ;
                       REP #$30                             ;8B80E0|C230    |      ;
                       PHB                                  ;8B80E2|8B      |      ;
                       PEA.W $7E00                          ;8B80E3|F4007E  |807E00;
                       PLB                                  ;8B80E6|AB      |      ;
                       PLB                                  ;8B80E7|AB      |      ;
                       LDA.W $D1E0                          ;8B80E8|ADE0D1  |7ED1E0;
                       ASL A                                ;8B80EB|0A      |      ;
                       TAX                                  ;8B80EC|AA      |      ;
                       JSR.W (DATA8_8B80F3,X)               ;8B80ED|FCF380  |8B80F3;
                       PLB                                  ;8B80F0|AB      |      ;
                       PLP                                  ;8B80F1|28      |      ;
                       RTL                                  ;8B80F2|6B      |      ;
 
         DATA8_8B80F3:
                       db $02,$81,$34,$81,$3B,$81,$10,$81   ;8B80F3|        |      ;
                       db $1E,$81,$C3,$8C,$87,$A8           ;8B80FB|        |      ;
                       db $60                               ;8B8101|        |      ;
                       SEP #$20                             ;8B8102|E220    |      ;
                       LDA.B #$80                           ;8B8104|A980    |      ;
                       STA.L $0001B6                        ;8B8106|8FB60100|0001B6;
                       REP #$20                             ;8B810A|C220    |      ;
                       INC.W $D1E0                          ;8B810C|EEE0D1  |7ED1E0;
                       RTS                                  ;8B810F|60      |      ;
                       SEP #$20                             ;8B8110|E220    |      ;
                       LDA.B #$00                           ;8B8112|A900    |      ;
                       STA.L $0001B6                        ;8B8114|8FB60100|0001B6;
                       REP #$20                             ;8B8118|C220    |      ;
                       INC.W $D1E0                          ;8B811A|EEE0D1  |7ED1E0;
                       RTS                                  ;8B811D|60      |      ;
                       SEP #$20                             ;8B811E|E220    |      ;
                       LDA.B #$00                           ;8B8120|A900    |      ;
                       STA.L $7ED24E                        ;8B8122|8F4ED27E|7ED24E;
                       STA.L $7ED25C                        ;8B8126|8F5CD27E|7ED25C;
                       REP #$20                             ;8B812A|C220    |      ;
                       JSL.L CODE_FL_809105                 ;8B812C|22059180|809105;
                       INC.W $D1E0                          ;8B8130|EEE0D1  |7ED1E0;
                       RTS                                  ;8B8133|60      |      ;
                       INC.W $D1E0                          ;8B8134|EEE0D1  |7ED1E0;
                       JML.L CODE_JL_8B8000                 ;8B8137|5C00808B|8B8000;
                       LDA.W #$0081                         ;8B813B|A98100  |      ;
                       STA.W $4200                          ;8B813E|8D0042  |7E4200;
                       JSL.L CODE_FL_80A145                 ;8B8141|2245A180|80A145;
                       JSL.L CODE_FL_809115                 ;8B8145|22159180|809115;
                       JSL.L CODE_FL_8B94F1                 ;8B8149|22F1948B|8B94F1;
                       JSL.L CODE_FL_8B93B4                 ;8B814D|22B4938B|8B93B4;
                       LDA.W #$0003                         ;8B8151|A90300  |      ;
                       STA.L $0000B1                        ;8B8154|8FB10000|0000B1;
                       LDA.L $7ED1E4                        ;8B8158|AFE4D17E|7ED1E4;
                       AND.W #$FBFF                         ;8B815C|29FFFB  |      ;
                       STA.L $7ED1E4                        ;8B815F|8FE4D17E|7ED1E4;
                       LDA.L $7ED1E4                        ;8B8163|AFE4D17E|7ED1E4;
                       BIT.W #$4000                         ;8B8167|890040  |      ;
                       BEQ +                                ;8B816A|F020    |8B818C;
                       LDA.L $001A82                        ;8B816C|AF821A00|001A82;
                       BNE +                                ;8B8170|D01A    |8B818C;
                       LDA.L $7ED1E2                        ;8B8172|AFE2D17E|7ED1E2;
                       CMP.W #$0000                         ;8B8176|C90000  |      ;
                       BMI ++                               ;8B8179|3005    |8B8180;
                       CMP.W #$000C                         ;8B817B|C90C00  |      ;
                       BMI +++                              ;8B817E|3005    |8B8185;
 
                    ++ LDA.W #$0000                         ;8B8180|A90000  |      ;
                       BRA ++                               ;8B8183|8001    |8B8186;
 
                   +++ INC A                                ;8B8185|1A      |      ;
 
                    ++ STA.L $7ED1E2                        ;8B8186|8FE2D17E|7ED1E2;
                       BRA ++                               ;8B818A|8027    |8B81B3;
 
                     + LDA.L $0000B3                        ;8B818C|AFB30000|0000B3;
                       AND.W #$FFF0                         ;8B8190|29F0FF  |      ;
                       CMP.W #$4040                         ;8B8193|C94040  |      ;
                       BEQ ++                               ;8B8196|F01B    |8B81B3;
                       LDA.L $001A82                        ;8B8198|AF821A00|001A82;
                       BNE ++                               ;8B819C|D015    |8B81B3;
                       LDA.L $7ED1E2                        ;8B819E|AFE2D17E|7ED1E2;
                       TAX                                  ;8B81A2|AA      |      ;
                       LDA.L DATA8_8B8524,X                 ;8B81A3|BF24858B|8B8524;
                       AND.W #$00FF                         ;8B81A7|29FF00  |      ;
                       BNE ++                               ;8B81AA|D007    |8B81B3;
                       LDA.W #$0006                         ;8B81AC|A90600  |      ;
                       STA.W CODE_00D1E0                    ;8B81AF|8DE0D1  |00D1E0;
                       RTS                                  ;8B81B2|60      |      ;
 
                    ++ JSL.L CODE_FL_8B81DD                 ;8B81B3|22DD818B|8B81DD;
                       JSL.L CODE_FL_8B8531                 ;8B81B7|2231858B|8B8531;
                       JSL.L CODE_FL_8B87B8                 ;8B81BB|22B8878B|8B87B8;
                       JSL.L CODE_FL_8B8901                 ;8B81BF|2201898B|8B8901;
                       JSL.L CODE_FL_8B8B7C                 ;8B81C3|227C8B8B|8B8B7C;
                       LDA.W #$FFFA                         ;8B81C7|A9FAFF  |      ;
                       STA.L $7ED272                        ;8B81CA|8F72D27E|7ED272;
                       JSL.L CODE_FL_8B92C2                 ;8B81CE|22C2928B|8B92C2;
                       LDA.W #$0000                         ;8B81D2|A90000  |      ;
                       STA.L $001A82                        ;8B81D5|8F821A00|001A82;
                       INC.W $D1E0                          ;8B81D9|EEE0D1  |7ED1E0;
                       RTS                                  ;8B81DC|60      |      ;
 
       CODE_FL_8B81DD:
                       LDA.W #$0000                         ;8B81DD|A90000  |      ;
                       LDY.W #$3000                         ;8B81E0|A00030  |      ;
                       LDX.W #$0000                         ;8B81E3|A20000  |      ;
 
                     - STA.L $7F9160,X                      ;8B81E6|9F60917F|7F9160;
                       INX                                  ;8B81EA|E8      |      ;
                       DEY                                  ;8B81EB|88      |      ;
                       INX                                  ;8B81EC|E8      |      ;
                       DEY                                  ;8B81ED|88      |      ;
                       BNE -                                ;8B81EE|D0F6    |8B81E6;
                       PHB                                  ;8B81F0|8B      |      ;
                       PHK                                  ;8B81F1|4B      |      ;
                       PLB                                  ;8B81F2|AB      |      ;
                       LDY.W #$81FD                         ;8B81F3|A0FD81  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B81F6|22CAA080|80A0CA;
                       PLB                                  ;8B81FA|AB      |      ;
                       BRA +                                ;8B81FB|8008    |8B8205;
                       db $60,$91,$7F,$00,$30,$80,$00,$68   ;8B81FD|        |      ;
 
                     + JSL.L CODE_FL_80A1CF                 ;8B8205|22CFA180|80A1CF;
                       JSL.L CODE_FL_80A1E0                 ;8B8209|22E0A180|80A1E0;
                       JSL.L CODE_FL_80A1F1                 ;8B820D|22F1A180|80A1F1;
                       LDA.L $7ED1E2                        ;8B8211|AFE2D17E|7ED1E2;
                       BEQ +                                ;8B8215|F003    |8B821A;
                       JMP.W CODE_JP_8B82C3                 ;8B8217|4CC382  |8B82C3;
 
                     + LDA.L $7ED1E4                        ;8B821A|AFE4D17E|7ED1E4;
                       BIT.W #$4000                         ;8B821E|890040  |      ;
                       BNE +                                ;8B8221|D003    |8B8226;
                       db $4C,$C3,$82                       ;8B8223|        |8B82C3;
 
                     + LDA.L $001A82                        ;8B8226|AF821A00|001A82;
                       BEQ +                                ;8B822A|F003    |8B822F;
                       db $4C,$C3,$82                       ;8B822C|        |8B82C3;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B822F|222DBB80|80BB2D;
                       db $F7,$FE,$92,$F6,$88,$7E           ;8B8233|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8239|222DBB80|80BB2D;
                       db $8E,$81,$93,$00,$41,$7F           ;8B823D|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8243|222DBB80|80BB2D;
                       db $AD,$B4,$91,$60,$91,$7F           ;8B8247|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B824D|222DBB80|80BB2D;
                       db $BB,$C0,$91,$60,$B1,$7F           ;8B8251|        |      ;
                       PHB                                  ;8B8257|8B      |      ;
                       PHK                                  ;8B8258|4B      |      ;
                       PLB                                  ;8B8259|AB      |      ;
                       LDY.W #$8264                         ;8B825A|A06482  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B825D|22CAA080|80A0CA;
                       PLB                                  ;8B8261|AB      |      ;
                       BRA +                                ;8B8262|8008    |8B826C;
                       db $60,$91,$7F,$00,$80,$80,$00,$20   ;8B8264|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B826C|222DBB80|80BB2D;
                       db $81,$82,$93,$80,$50,$7F           ;8B8270|        |      ;
                       LDX.W #$5080                         ;8B8276|A28050  |      ;
                       JSL.L CODE_FL_8B9E45                 ;8B8279|22459E8B|8B9E45;
                       JSL.L CODE_FL_80BB2D                 ;8B827D|222DBB80|80BB2D;
                       db $8D,$FD,$92,$80,$58,$7F           ;8B8281|        |      ;
                       LDX.W #$5880                         ;8B8287|A28058  |      ;
                       JSL.L CODE_FL_8B9E45                 ;8B828A|22459E8B|8B9E45;
                       JSL.L CODE_FL_80BB2D                 ;8B828E|222DBB80|80BB2D;
                       db $B0,$80,$93,$00,$20,$7E           ;8B8292|        |      ;
                       JSL.L CODE_FL_8B9E81                 ;8B8298|22819E8B|8B9E81;
                       LDA.L $001A80                        ;8B829C|AF801A00|001A80;
                       JSL.L CODE_FL_8B955D                 ;8B82A0|225D958B|8B955D;
                       PHB                                  ;8B82A4|8B      |      ;
                       PHK                                  ;8B82A5|4B      |      ;
                       PLB                                  ;8B82A6|AB      |      ;
                       LDY.W #$82B1                         ;8B82A7|A0B182  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B82AA|22CAA080|80A0CA;
                       PLB                                  ;8B82AE|AB      |      ;
                       BRA +                                ;8B82AF|8008    |8B82B9;
                       db $C0,$23,$7E,$40,$04,$80,$E0,$79   ;8B82B1|        |      ;
 
                     + LDA.W #$0000                         ;8B82B9|A90000  |      ;
                       STA.L $7ED25E                        ;8B82BC|8F5ED27E|7ED25E;
                       JMP.W CODE_JP_8B8385                 ;8B82C0|4C8583  |8B8385;
 
       CODE_JP_8B82C3:
                       JSL.L CODE_FL_80BB2D                 ;8B82C3|222DBB80|80BB2D;
                       db $D5,$FB,$92,$F6,$88,$7E           ;8B82C7|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B82CD|222DBB80|80BB2D;
                       db $AD,$B4,$91,$60,$91,$7F           ;8B82D1|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B82D7|222DBB80|80BB2D;
                       db $BB,$C0,$91,$60,$B1,$7F           ;8B82DB|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B82E1|222DBB80|80BB2D;
                       db $8E,$81,$93,$60,$A1,$7F           ;8B82E5|        |      ;
                       PHB                                  ;8B82EB|8B      |      ;
                       PHK                                  ;8B82EC|4B      |      ;
                       PLB                                  ;8B82ED|AB      |      ;
                       LDY.W #$82F8                         ;8B82EE|A0F882  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B82F1|22CAA080|80A0CA;
                       PLB                                  ;8B82F5|AB      |      ;
                       BRA +                                ;8B82F6|8008    |8B8300;
                       db $60,$91,$7F,$00,$80,$80,$00,$20   ;8B82F8|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8300|222DBB80|80BB2D;
                       db $81,$82,$93,$80,$50,$7F           ;8B8304|        |      ;
                       LDX.W #$5080                         ;8B830A|A28050  |      ;
                       JSL.L CODE_FL_8B9E45                 ;8B830D|22459E8B|8B9E45;
                       LDY.W #$0440                         ;8B8311|A04004  |      ;
                       LDX.W #$0000                         ;8B8314|A20000  |      ;
 
                     - LDA.L $7F5440,X                      ;8B8317|BF40547F|7F5440;
                       STA.L $7E2BC0,X                      ;8B831B|9FC02B7E|7E2BC0;
                       INX                                  ;8B831F|E8      |      ;
                       DEY                                  ;8B8320|88      |      ;
                       INX                                  ;8B8321|E8      |      ;
                       DEY                                  ;8B8322|88      |      ;
                       BNE -                                ;8B8323|D0F2    |8B8317;
                       LDA.W #$241F                         ;8B8325|A91F24  |      ;
                       STA.L $7E2D98                        ;8B8328|8F982D7E|7E2D98;
                       PHB                                  ;8B832C|8B      |      ;
                       PHK                                  ;8B832D|4B      |      ;
                       PLB                                  ;8B832E|AB      |      ;
                       LDY.W #$8339                         ;8B832F|A03983  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8332|22CAA080|80A0CA;
                       PLB                                  ;8B8336|AB      |      ;
                       BRA +                                ;8B8337|8008    |8B8341;
                       db $C0,$2B,$7E,$40,$04,$80,$E0,$7D   ;8B8339|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8341|222DBB80|80BB2D;
                       db $8D,$FD,$92,$80,$58,$7F           ;8B8345|        |      ;
                       LDX.W #$5880                         ;8B834B|A28058  |      ;
                       JSL.L CODE_FL_8B9E45                 ;8B834E|22459E8B|8B9E45;
                       LDY.W #$0440                         ;8B8352|A04004  |      ;
                       LDX.W #$0000                         ;8B8355|A20000  |      ;
 
                     - LDA.L $7F5C40,X                      ;8B8358|BF405C7F|7F5C40;
                       STA.L $7E23C0,X                      ;8B835C|9FC0237E|7E23C0;
                       INX                                  ;8B8360|E8      |      ;
                       DEY                                  ;8B8361|88      |      ;
                       INX                                  ;8B8362|E8      |      ;
                       DEY                                  ;8B8363|88      |      ;
                       BNE -                                ;8B8364|D0F2    |8B8358;
                       PHB                                  ;8B8366|8B      |      ;
                       PHK                                  ;8B8367|4B      |      ;
                       PLB                                  ;8B8368|AB      |      ;
                       LDY.W #$8373                         ;8B8369|A07383  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B836C|22CAA080|80A0CA;
                       PLB                                  ;8B8370|AB      |      ;
                       BRA +                                ;8B8371|8008    |8B837B;
                       db $C0,$23,$7E,$40,$04,$80,$E0,$79   ;8B8373|        |      ;
 
                     + LDA.W #$0100                         ;8B837B|A90001  |      ;
                       STA.L $7ED25E                        ;8B837E|8F5ED27E|7ED25E;
                       JMP.W CODE_JP_8B8385                 ;8B8382|4C8583  |8B8385;
 
       CODE_JP_8B8385:
                       LDA.W $1A80                          ;8B8385|AD801A  |7E1A80;
                       JSL.L CODE_FL_8B950C                 ;8B8388|220C958B|8B950C;
                       JSL.L CODE_FL_80BB2D                 ;8B838C|222DBB80|80BB2D;
                       db $D5,$FB,$92,$80,$60,$7F           ;8B8390|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8396|222DBB80|80BB2D;
                       db $69,$EB,$91,$60,$91,$7F           ;8B839A|        |      ;
                       PHB                                  ;8B83A0|8B      |      ;
                       PHK                                  ;8B83A1|4B      |      ;
                       PLB                                  ;8B83A2|AB      |      ;
                       LDY.W #$83AD                         ;8B83A3|A0AD83  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B83A6|22CAA080|80A0CA;
                       PLB                                  ;8B83AA|AB      |      ;
                       BRA +                                ;8B83AB|8008    |8B83B5;
                       db $60,$91,$7F,$00,$1A,$80,$00,$00   ;8B83AD|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B83B5|222DBB80|80BB2D;
                       db $D2,$84,$92,$60,$91,$7F           ;8B83B9|        |      ;
                       PHB                                  ;8B83BF|8B      |      ;
                       PHK                                  ;8B83C0|4B      |      ;
                       PLB                                  ;8B83C1|AB      |      ;
                       LDY.W #$83CC                         ;8B83C2|A0CC83  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B83C5|22CAA080|80A0CA;
                       PLB                                  ;8B83C9|AB      |      ;
                       BRA +                                ;8B83CA|8008    |8B83D4;
                       db $60,$91,$7F,$00,$20,$80,$00,$10   ;8B83CC|        |      ;
 
                     + LDY.W #$0A00                         ;8B83D4|A0000A  |      ;
                       LDX.W #$0000                         ;8B83D7|A20000  |      ;
 
                     - LDA.L $7F9160,X                      ;8B83DA|BF60917F|7F9160;
                       STA.L $7F2D00,X                      ;8B83DE|9F002D7F|7F2D00;
                       INX                                  ;8B83E2|E8      |      ;
                       DEY                                  ;8B83E3|88      |      ;
                       INX                                  ;8B83E4|E8      |      ;
                       DEY                                  ;8B83E5|88      |      ;
                       BNE -                                ;8B83E6|D0F2    |8B83DA;
                       JSL.L CODE_FL_80BB2D                 ;8B83E8|222DBB80|80BB2D;
                       db $02,$B9,$92,$00,$37,$7F           ;8B83EC|        |      ;
                       PHB                                  ;8B83F2|8B      |      ;
                       PHK                                  ;8B83F3|4B      |      ;
                       PLB                                  ;8B83F4|AB      |      ;
                       LDY.W #$83FF                         ;8B83F5|A0FF83  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B83F8|22CAA080|80A0CA;
                       PLB                                  ;8B83FC|AB      |      ;
                       BRA +                                ;8B83FD|8008    |8B8407;
                       db $00,$37,$7F,$00,$0A,$80,$00,$10   ;8B83FF|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8407|222DBB80|80BB2D;
                       db $30,$98,$92,$60,$91,$7F           ;8B840B|        |      ;
                       PHB                                  ;8B8411|8B      |      ;
                       PHK                                  ;8B8412|4B      |      ;
                       PLB                                  ;8B8413|AB      |      ;
                       LDY.W #$841E                         ;8B8414|A01E84  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8417|22CAA080|80A0CA;
                       PLB                                  ;8B841B|AB      |      ;
                       BRA +                                ;8B841C|8008    |8B8426;
                       RTS                                  ;8B841E|60      |      ;
 
                       STA.B ($7F),Y                        ;8B841F|917F    |00007F;
                       BRK #$03                             ;8B8421|0003    |      ;
                       db $80,$00,$60                       ;8B8423|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8426|222DBB80|80BB2D;
                       TDC                                  ;8B842A|7B      |      ;
                       XCE                                  ;8B842B|FB      |      ;
                       db $91,$60,$91,$7F                   ;8B842C|        |      ;
                       JSL.L CODE_FL_8B9E9E                 ;8B8430|229E9E8B|8B9E9E;
                       PHB                                  ;8B8434|8B      |      ;
                       PHK                                  ;8B8435|4B      |      ;
                       PLB                                  ;8B8436|AB      |      ;
                       LDY.W #$8441                         ;8B8437|A04184  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B843A|22CAA080|80A0CA;
                       PLB                                  ;8B843E|AB      |      ;
                       BRA +                                ;8B843F|8008    |8B8449;
                       db $60,$91,$7F,$00,$08,$80,$00,$6C   ;8B8441|        |      ;
 
                     + JSL.L CODE_FL_8B8BED                 ;8B8449|22ED8B8B|8B8BED;
                       JSL.L CODE_FL_8B8C70                 ;8B844D|22708C8B|8B8C70;
                       LDA.L $7ED39F                        ;8B8451|AF9FD37E|7ED39F;
                       STA.L $7ED3A3                        ;8B8455|8FA3D37E|7ED3A3;
                       JSL.L CODE_FL_8B8E02                 ;8B8459|22028E8B|8B8E02;
                       LDA.W $D3A1                          ;8B845D|ADA1D3  |7ED3A1;
                       JSL.L CODE_FL_8B9107                 ;8B8460|2207918B|8B9107;
                       LDA.W #$D366                         ;8B8464|A966D3  |      ;
                       STA.B $96                            ;8B8467|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8469|2250A489|89A450;
                       LDA.L $001A82                        ;8B846D|AF821A00|001A82;
                       BNE +                                ;8B8471|D02F    |8B84A2;
                       LDA.L $7ED1E4                        ;8B8473|AFE4D17E|7ED1E4;
                       BIT.W #$2000                         ;8B8477|890020  |      ;
                       BNE ++                               ;8B847A|D011    |8B848D;
                       BIT.W #$4000                         ;8B847C|890040  |      ;
                       BNE +++                              ;8B847F|D015    |8B8496;
                       LDA.L $7ED1E2                        ;8B8481|AFE2D17E|7ED1E2;
                       JSL.L CODE_FL_89A663                 ;8B8485|2263A689|89A663;
                       db $D6,$84                           ;8B8489|        |      ;
                       BRA ++++                             ;8B848B|8021    |8B84AE;
 
                    ++ JSL.L CODE_FL_89A62C                 ;8B848D|222CA689|89A62C;
                       db $34,$AE,$8B                       ;8B8491|        |      ;
                       BRA ++++                             ;8B8494|8018    |8B84AE;
 
                   +++ LDA.L $7ED1E2                        ;8B8496|AFE2D17E|7ED1E2;
                       JSL.L CODE_FL_89A663                 ;8B849A|2263A689|89A663;
                       db $AF,$84                           ;8B849E|        |      ;
                       BRA ++++                             ;8B84A0|800C    |8B84AE;
 
                     + LDA.L $7ED1E2                        ;8B84A2|AFE2D17E|7ED1E2;
                       JSL.L CODE_FL_89A663                 ;8B84A6|2263A689|89A663;
                       db $FD,$84                           ;8B84AA|        |      ;
                       BRA ++++                             ;8B84AC|8000    |8B84AE;
 
                  ++++ RTL                                  ;8B84AE|6B      |      ;
                       db $11,$AA,$8B,$53,$AB,$8B,$53,$AB   ;8B84AF|        |      ;
                       db $8B,$53,$AB,$8B,$53,$AB,$8B,$53   ;8B84B7|        |      ;
                       db $AB,$8B,$53,$AB,$8B,$53,$AB,$8B   ;8B84BF|        |      ;
                       db $28,$AD,$8B,$53,$AF,$8B,$53,$AF   ;8B84C7|        |      ;
                       db $8B,$53,$AF,$8B,$56,$B1,$8B       ;8B84CF|        |      ;
                       db $38,$AC,$8B                       ;8B84D6|        |      ;
                       db $38,$AC,$8B,$38,$AC,$8B,$38,$AC   ;8B84D9|        |      ;
                       db $8B,$38,$AC,$8B,$38,$AC,$8B,$38   ;8B84E1|        |      ;
                       db $AC,$8B,$38,$AC,$8B               ;8B84E9|        |      ;
                       db $CA,$B3,$8B,$CA,$B3,$8B,$CA,$B3   ;8B84EE|        |      ;
                       db $8B                               ;8B84F6|        |      ;
                       db $C0,$B3,$8B                       ;8B84F7|        |      ;
                       db $38,$AC,$8B,$A3,$AC,$8B,$A3,$AC   ;8B84FA|        |      ;
                       db $8B,$A3,$AC,$8B,$A3,$AC,$8B,$A3   ;8B8502|        |      ;
                       db $AC,$8B,$A3,$AC,$8B,$A3,$AC,$8B   ;8B850A|        |00A38B;
                       db $A3,$AC,$8B,$1B,$B3,$8B,$1B,$B3   ;8B8512|        |0000AC;
                       db $8B,$1B,$B3,$8B                   ;8B851A|        |      ;
                       db $1B,$B3,$8B                       ;8B851E|        |      ;
                       db $A3,$AC,$8B                       ;8B8521|        |0000AC;
 
         DATA8_8B8524:
                       db $00,$00                           ;8B8524|        |      ;
                       db $00,$00,$00,$00,$00,$00           ;8B8526|        |      ;
                       db $01,$01                           ;8B852C|        |      ;
                       db $01                               ;8B852E|        |000001;
                       db $01,$00                           ;8B852F|        |      ;
 
       CODE_FL_8B8531:
                       LDA.L $7ED1E4                        ;8B8531|AFE4D17E|7ED1E4;
                       BIT.W #$8000                         ;8B8535|890080  |      ;
                       BEQ +                                ;8B8538|F003    |8B853D;
                       JMP.W CODE_JP_8B87B7                 ;8B853A|4CB787  |8B87B7;
 
                     + LDA.L $7ED1E2                        ;8B853D|AFE2D17E|7ED1E2;
                       BNE +                                ;8B8541|D01A    |8B855D;
                       JSL.L CODE_FL_80BB2D                 ;8B8543|222DBB80|80BB2D;
                       db $70,$EC,$92,$F6,$86,$7E           ;8B8547|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B854D|222DBB80|80BB2D;
                       db $2D,$EA,$92,$1C,$4C,$7E           ;8B8551|        |      ;
                       JSL.L CODE_FL_8B9277                 ;8B8557|2277928B|8B9277;
                       BRA ++                               ;8B855B|801A    |8B8577;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B855D|222DBB80|80BB2D;
                       db $80,$EA,$92,$F6,$86,$7E           ;8B8561|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8567|222DBB80|80BB2D;
                       db $06,$EA,$92,$1C,$4C,$7E           ;8B856B|        |      ;
                       JSL.L CODE_FL_8B9277                 ;8B8571|2277928B|8B9277;
                       BRA ++                               ;8B8575|8000    |8B8577;
 
                    ++ JSL.L CODE_FL_80BB2D                 ;8B8577|222DBB80|80BB2D;
                       db $70,$EC,$92,$80,$84,$7F           ;8B857B|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8581|222DBB80|80BB2D;
                       db $80,$EA,$92,$80,$86,$7F           ;8B8585|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B858B|222DBB80|80BB2D;
                       db $2D,$EA,$92,$80,$88,$7F           ;8B858F|        |      ;
                       PHB                                  ;8B8595|8B      |      ;
                       PEA.W $7F00                          ;8B8596|F4007F  |7E7F00;
                       PLB                                  ;8B8599|AB      |      ;
                       PLB                                  ;8B859A|AB      |      ;
                       LDX.W #$8880                         ;8B859B|A28088  |      ;
                       JSL.L CODE_FL_8B9A3D                 ;8B859E|223D9A8B|8B9A3D;
                       PLB                                  ;8B85A2|AB      |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B85A3|222DBB80|80BB2D;
                       db $06,$EA,$92,$80,$8C,$7F           ;8B85A7|        |      ;
                       PHB                                  ;8B85AD|8B      |      ;
                       PEA.W $7F00                          ;8B85AE|F4007F  |7E7F00;
                       PLB                                  ;8B85B1|AB      |      ;
                       PLB                                  ;8B85B2|AB      |      ;
                       LDX.W #$8C80                         ;8B85B3|A2808C  |      ;
                       JSL.L CODE_FL_8B9A3D                 ;8B85B6|223D9A8B|8B9A3D;
                       PLB                                  ;8B85BA|AB      |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B85BB|222DBB80|80BB2D;
                       db $7A,$99,$92,$60,$91,$7F           ;8B85BF|        |      ;
                       PHB                                  ;8B85C5|8B      |      ;
                       PHK                                  ;8B85C6|4B      |      ;
                       PLB                                  ;8B85C7|AB      |      ;
                       LDY.W #$85D2                         ;8B85C8|A0D285  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B85CB|22CAA080|80A0CA;
                       PLB                                  ;8B85CF|AB      |      ;
                       BRA +                                ;8B85D0|8008    |8B85DA;
                       db $60,$91,$7F,$00,$20,$80,$00,$50   ;8B85D2|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B85DA|222DBB80|80BB2D;
                       db $05,$AA,$92,$60,$91,$7F           ;8B85DE|        |      ;
                       PHB                                  ;8B85E4|8B      |      ;
                       PHK                                  ;8B85E5|4B      |      ;
                       PLB                                  ;8B85E6|AB      |      ;
                       LDY.W #$85F1                         ;8B85E7|A0F185  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B85EA|22CAA080|80A0CA;
                       PLB                                  ;8B85EE|AB      |      ;
                       BRA +                                ;8B85EF|8008    |8B85F9;
                       db $60,$91,$7F,$00,$08,$80,$00,$3C   ;8B85F1|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B85F9|222DBB80|80BB2D;
                       db $67,$AC,$92,$60,$91,$7F           ;8B85FD|        |      ;
                       PHB                                  ;8B8603|8B      |      ;
                       PHK                                  ;8B8604|4B      |      ;
                       PLB                                  ;8B8605|AB      |      ;
                       LDY.W #$8610                         ;8B8606|A01086  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8609|22CAA080|80A0CA;
                       PLB                                  ;8B860D|AB      |      ;
                       BRA +                                ;8B860E|8008    |8B8618;
                       db $60,$91,$7F,$00,$06,$80,$00,$0D   ;8B8610|        |      ;
 
                     + JSL.L CODE_FL_8BA590                 ;8B8618|2290A58B|8BA590;
                       JSL.L CODE_FL_80BB2D                 ;8B861C|222DBB80|80BB2D;
                       db $F8,$EE,$92,$00,$28,$7E           ;8B8620|        |      ;
                       JSL.L CODE_FL_8BA318                 ;8B8626|2218A38B|8BA318;
                       JSL.L CODE_FL_8BA371                 ;8B862A|2271A38B|8BA371;
                       LDA.L $7ED1E2                        ;8B862E|AFE2D17E|7ED1E2;
                       BNE +                                ;8B8632|D011    |8B8645;
                       LDA.L $7ED1E4                        ;8B8634|AFE4D17E|7ED1E4;
                       BIT.W #$4000                         ;8B8638|890040  |      ;
                       BEQ +                                ;8B863B|F008    |8B8645;
                       LDA.L $001A82                        ;8B863D|AF821A00|001A82;
                       BNE +                                ;8B8641|D002    |8B8645;
                       BRA ++                               ;8B8643|8004    |8B8649;
 
                     + JSL.L CODE_FL_8BA391                 ;8B8645|2291A38B|8BA391;
 
                    ++ PHB                                  ;8B8649|8B      |      ;
                       PHK                                  ;8B864A|4B      |      ;
                       PLB                                  ;8B864B|AB      |      ;
                       LDY.W #$8656                         ;8B864C|A05686  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B864F|22CAA080|80A0CA;
                       PLB                                  ;8B8653|AB      |      ;
                       BRA +                                ;8B8654|8008    |8B865E;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8B8656|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B865E|222DBB80|80BB2D;
                       db $BA,$EE,$92,$80,$90,$7F           ;8B8662|        |      ;
                       LDA.L $7ED39F                        ;8B8668|AF9FD37E|7ED39F;
                       JSL.L CODE_FL_8BA5C6                 ;8B866C|22C6A58B|8BA5C6;
                       JSL.L CODE_FL_80BB2D                 ;8B8670|222DBB80|80BB2D;
                       db $41,$EE,$92,$00,$30,$7E           ;8B8674|        |      ;
                       PHB                                  ;8B867A|8B      |      ;
                       PHK                                  ;8B867B|4B      |      ;
                       PLB                                  ;8B867C|AB      |      ;
                       LDY.W #$8687                         ;8B867D|A08786  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8680|22CAA080|80A0CA;
                       PLB                                  ;8B8684|AB      |      ;
                       BRA +                                ;8B8685|8008    |8B868F;
                       db $00,$30,$7E,$00,$08,$80,$00,$68   ;8B8687|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B868F|222DBB80|80BB2D;
                       db $A7,$83,$93,$3B,$53,$7E           ;8B8693|        |      ;
                       LDA.W #$7E00                         ;8B8699|A9007E  |      ;
                       STA.W $19BD                          ;8B869C|8DBD19  |7E19BD;
                       LDA.W #$533B                         ;8B869F|A93B53  |      ;
                       STA.W $19BC                          ;8B86A2|8DBC19  |7E19BC;
                       JSL.L CODE_FL_899DE6                 ;8B86A5|22E69D89|899DE6;
                       JSL.L CODE_FL_899E12                 ;8B86A9|22129E89|899E12;
                       JSL.L CODE_FL_80BB2D                 ;8B86AD|222DBB80|80BB2D;
                       db $D3,$BE,$92,$60,$91,$7F           ;8B86B1|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B86B7|222DBB80|80BB2D;
                       db $2E,$ED,$92,$80,$62,$7F           ;8B86BB|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B86C1|222DBB80|80BB2D;
                       db $B3,$E7,$92,$60,$D9,$7F           ;8B86C5|        |      ;
                       REP #$30                             ;8B86CB|C230    |      ;
                       LDA.W #$7E00                         ;8B86CD|A9007E  |      ;
                       STA.B $97                            ;8B86D0|8597    |000097;
                       LDA.W #$D32F                         ;8B86D2|A92FD3  |      ;
                       STA.B $96                            ;8B86D5|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B86D7|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B86DB|222CA689|89A62C;
                       db $9A,$C5,$8B                       ;8B86DF|        |      ;
                       LDA.W #$D3AD                         ;8B86E2|A9ADD3  |      ;
                       STA.B $96                            ;8B86E5|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B86E7|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B86EB|222CA689|89A62C;
                       db $8A,$D3,$8B                       ;8B86EF|        |      ;
                       LDA.W #$0012                         ;8B86F2|A91200  |      ;
 
                     - JSL.L CODE_FL_8BD586                 ;8B86F5|2286D58B|8BD586;
                       DEC A                                ;8B86F9|3A      |      ;
                       DEC A                                ;8B86FA|3A      |      ;
                       BPL -                                ;8B86FB|10F8    |8B86F5;
                       LDA.W #$003B                         ;8B86FD|A93B00  |      ;
                       LDX.W #$0004                         ;8B8700|A20400  |      ;
 
                     - JSL.L CODE_FL_8BD67E                 ;8B8703|227ED68B|8BD67E;
                       INC A                                ;8B8707|1A      |      ;
                       AND.W #$003F                         ;8B8708|293F00  |      ;
                       DEX                                  ;8B870B|CA      |      ;
                       BNE -                                ;8B870C|D0F5    |8B8703;
                       LDA.L $7ED1E2                        ;8B870E|AFE2D17E|7ED1E2;
                       BEQ +                                ;8B8712|F011    |8B8725;
                       LDA.W #$001B                         ;8B8714|A91B00  |      ;
                       LDX.W #$0005                         ;8B8717|A20500  |      ;
 
                     - JSL.L CODE_FL_8BD67E                 ;8B871A|227ED68B|8BD67E;
                       INC A                                ;8B871E|1A      |      ;
                       AND.W #$003F                         ;8B871F|293F00  |      ;
                       DEX                                  ;8B8722|CA      |      ;
                       BNE -                                ;8B8723|D0F5    |8B871A;
 
                     + JSR.W CODE_FN_8BA1E7                 ;8B8725|20E7A1  |8BA1E7;
                       LDA.L $7ED39F                        ;8B8728|AF9FD37E|7ED39F;
                       LDX.W #$0000                         ;8B872C|A20000  |      ;
                       JSL.L CODE_FL_8B9B5C                 ;8B872F|225C9B8B|8B9B5C;
                       JSL.L CODE_FL_8B9DA2                 ;8B8733|22A29D8B|8B9DA2;
                       JSL.L CODE_FL_8B9BC2                 ;8B8737|22C29B8B|8B9BC2;
                       JSL.L CODE_FL_8B9A6A                 ;8B873B|226A9A8B|8B9A6A;
                       JSL.L CODE_FL_8B95FA                 ;8B873F|22FA958B|8B95FA;
                       JSL.L CODE_FL_8B9AF7                 ;8B8743|22F79A8B|8B9AF7;
                       LDA.L $7ED3A1                        ;8B8747|AFA1D37E|7ED3A1;
                       LDX.W #$0001                         ;8B874B|A20100  |      ;
                       JSL.L CODE_FL_8B9B5C                 ;8B874E|225C9B8B|8B9B5C;
                       JSL.L CODE_FL_8B9DC2                 ;8B8752|22C29D8B|8B9DC2;
                       JSL.L CODE_FL_8B9BC2                 ;8B8756|22C29B8B|8B9BC2;
                       JSL.L CODE_FL_8B9A6A                 ;8B875A|226A9A8B|8B9A6A;
                       JSL.L CODE_FL_8B9808                 ;8B875E|2208988B|8B9808;
                       JSL.L CODE_FL_8B9AF7                 ;8B8762|22F79A8B|8B9AF7;
                       LDA.W #$0000                         ;8B8766|A90000  |      ;
                       STA.W $D348                          ;8B8769|8D48D3  |7ED348;
                       STA.W $D34A                          ;8B876C|8D4AD3  |7ED34A;
                       LDA.W #$0000                         ;8B876F|A90000  |      ;
                       STA.W $D34C                          ;8B8772|8D4CD3  |7ED34C;
                       STA.W $D34E                          ;8B8775|8D4ED3  |7ED34E;
                       STA.W $D350                          ;8B8778|8D50D3  |7ED350;
                       LDA.W #$0000                         ;8B877B|A90000  |      ;
                       STA.W $D352                          ;8B877E|8D52D3  |7ED352;
                       LDA.W #$0080                         ;8B8781|A98000  |      ;
                       STA.W $D354                          ;8B8784|8D54D3  |7ED354;
                       LDA.W #$0800                         ;8B8787|A90008  |      ;
                       STA.W $D356                          ;8B878A|8D56D3  |7ED356;
                       LDA.L $7ED1E2                        ;8B878D|AFE2D17E|7ED1E2;
                       BEQ +                                ;8B8791|F00C    |8B879F;
                       LDA.W #$00D0                         ;8B8793|A9D000  |      ;
                       STA.W $D5E1                          ;8B8796|8DE1D5  |7ED5E1;
                       LDA.W #$003B                         ;8B8799|A93B00  |      ;
                       STA.W $D5ED                          ;8B879C|8DEDD5  |7ED5ED;
 
                     + LDA.W #$0000                         ;8B879F|A90000  |      ;
                       STA.W $D5E3                          ;8B87A2|8DE3D5  |7ED5E3;
                       LDA.W #$003C                         ;8B87A5|A93C00  |      ;
                       STA.W $D5EF                          ;8B87A8|8DEFD5  |7ED5EF;
                       LDA.W #$01D0                         ;8B87AB|A9D001  |      ;
                       STA.W $D5E5                          ;8B87AE|8DE5D5  |7ED5E5;
                       LDA.W #$003B                         ;8B87B1|A93B00  |      ;
                       STA.W $D5F1                          ;8B87B4|8DF1D5  |7ED5F1;
 
       CODE_JP_8B87B7:
                       RTL                                  ;8B87B7|6B      |      ;
 
       CODE_FL_8B87B8:
                       PHB                                  ;8B87B8|8B      |      ;
                       PEA.W $7E00                          ;8B87B9|F4007E  |7E7E00;
                       PLB                                  ;8B87BC|AB      |      ;
                       PLB                                  ;8B87BD|AB      |      ;
                       LDA.L $7ED1E4                        ;8B87BE|AFE4D17E|7ED1E4;
                       BIT.W #$8000                         ;8B87C2|890080  |      ;
                       BNE +                                ;8B87C5|D003    |8B87CA;
                       JMP.W CODE_JP_8B88FF                 ;8B87C7|4CFF88  |8B88FF;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B87CA|222DBB80|80BB2D;
                       db $70,$EC,$92,$60,$91,$7F           ;8B87CE|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B87D4|222DBB80|80BB2D;
                       db $3D,$EB,$92,$F6,$86,$7E           ;8B87D8|        |      ;
                       LDY.W #$001E                         ;8B87DE|A01E00  |      ;
                       LDX.W #$0000                         ;8B87E1|A20000  |      ;
 
                     - LDA.L $7F9282,X                      ;8B87E4|BF82927F|7F9282;
                       STA.L $7E8818,X                      ;8B87E8|9F18887E|7E8818;
                       INX                                  ;8B87EC|E8      |      ;
                       DEY                                  ;8B87ED|88      |      ;
                       INX                                  ;8B87EE|E8      |      ;
                       DEY                                  ;8B87EF|88      |      ;
                       BNE -                                ;8B87F0|D0F2    |8B87E4;
                       JSL.L CODE_FL_80BB2D                 ;8B87F2|222DBB80|80BB2D;
                       db $D5,$AF,$92,$60,$91,$7F           ;8B87F6|        |      ;
                       PHB                                  ;8B87FC|8B      |      ;
                       PHK                                  ;8B87FD|4B      |      ;
                       PLB                                  ;8B87FE|AB      |      ;
                       LDY.W #$8809                         ;8B87FF|A00988  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8802|22CAA080|80A0CA;
                       PLB                                  ;8B8806|AB      |      ;
                       BRA +                                ;8B8807|8008    |8B8811;
                       db $60,$91,$7F,$00,$10,$80,$00,$38   ;8B8809|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8811|222DBB80|80BB2D;
                       db $E5,$E6,$95,$60,$91,$7F           ;8B8815|        |      ;
                       PHB                                  ;8B881B|8B      |      ;
                       PHK                                  ;8B881C|4B      |      ;
                       PLB                                  ;8B881D|AB      |      ;
                       LDY.W #$8828                         ;8B881E|A02888  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8821|22CAA080|80A0CA;
                       PLB                                  ;8B8825|AB      |      ;
                       BRA +                                ;8B8826|8008    |8B8830;
                       db $60,$91,$7F,$00,$20,$80,$00,$50   ;8B8828|        |      ;
 
                     + JSL.L CODE_FL_8BA5AB                 ;8B8830|22ABA58B|8BA5AB;
                       JSL.L CODE_FL_80BB2D                 ;8B8834|222DBB80|80BB2D;
                       db $BE,$F4,$92,$00,$28,$7E           ;8B8838|        |      ;
                       JSL.L CODE_FL_8BA340                 ;8B883E|2240A38B|8BA340;
                       JSL.L CODE_FL_8BA3B9                 ;8B8842|22B9A38B|8BA3B9;
                       PHB                                  ;8B8846|8B      |      ;
                       PHK                                  ;8B8847|4B      |      ;
                       PLB                                  ;8B8848|AB      |      ;
                       LDY.W #$8853                         ;8B8849|A05388  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B884C|22CAA080|80A0CA;
                       PLB                                  ;8B8850|AB      |      ;
                       BRA +                                ;8B8851|8008    |8B885B;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8B8853|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B885B|222DBB80|80BB2D;
                       db $8C,$F3,$92,$60,$91,$7F           ;8B885F|        |      ;
                       LDX.W #$9160                         ;8B8865|A26091  |      ;
                       JSL.L CODE_FL_8B9E63                 ;8B8868|22639E8B|8B9E63;
                       LDX.W #$9960                         ;8B886C|A26099  |      ;
                       JSL.L CODE_FL_8B9E63                 ;8B886F|22639E8B|8B9E63;
                       PHB                                  ;8B8873|8B      |      ;
                       PHK                                  ;8B8874|4B      |      ;
                       PLB                                  ;8B8875|AB      |      ;
                       LDY.W #$8880                         ;8B8876|A08088  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8879|22CAA080|80A0CA;
                       PLB                                  ;8B887D|AB      |      ;
                       BRA +                                ;8B887E|8008    |8B8888;
                       db $60,$91,$7F,$00,$08,$80,$00,$70   ;8B8880|        |      ;
 
                     + PHB                                  ;8B8888|8B      |      ;
                       PHK                                  ;8B8889|4B      |      ;
                       PLB                                  ;8B888A|AB      |      ;
                       LDY.W #$8895                         ;8B888B|A09588  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B888E|22CAA080|80A0CA;
                       PLB                                  ;8B8892|AB      |      ;
                       BRA +                                ;8B8893|8008    |8B889D;
                       db $60,$99,$7F,$00,$08,$80,$00,$74   ;8B8895|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B889D|222DBB80|80BB2D;
                       db $40,$F5,$92,$00,$30,$7E           ;8B88A1|        |      ;
                       PHB                                  ;8B88A7|8B      |      ;
                       PHK                                  ;8B88A8|4B      |      ;
                       PLB                                  ;8B88A9|AB      |      ;
                       LDY.W #$88B4                         ;8B88AA|A0B488  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B88AD|22CAA080|80A0CA;
                       PLB                                  ;8B88B1|AB      |      ;
                       BRA +                                ;8B88B2|8008    |8B88BC;
                       db $00,$30,$7E,$00,$08,$80,$00,$68   ;8B88B4|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B88BC|222DBB80|80BB2D;
                       db $D7,$E9,$92,$1C,$4C,$7E           ;8B88C0|        |      ;
                       JSL.L CODE_FL_8B9277                 ;8B88C6|2277928B|8B9277;
                       REP #$30                             ;8B88CA|C230    |      ;
                       LDA.W #$7E00                         ;8B88CC|A9007E  |      ;
                       STA.B $97                            ;8B88CF|8597    |000097;
                       LDA.W #$D32F                         ;8B88D1|A92FD3  |      ;
                       STA.B $96                            ;8B88D4|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B88D6|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B88DA|222CA689|89A62C;
                       db $9A,$C5,$8B                       ;8B88DE|        |      ;
                       JSR.W CODE_FN_8BA1E7                 ;8B88E1|20E7A1  |8BA1E7;
                       LDA.W #$0000                         ;8B88E4|A90000  |      ;
                       STA.W $D348                          ;8B88E7|8D48D3  |7ED348;
                       STA.W $D34A                          ;8B88EA|8D4AD3  |7ED34A;
                       STA.W $D34C                          ;8B88ED|8D4CD3  |7ED34C;
                       STA.W $D34E                          ;8B88F0|8D4ED3  |7ED34E;
                       STA.W $D350                          ;8B88F3|8D50D3  |7ED350;
                       STA.W $D352                          ;8B88F6|8D52D3  |7ED352;
                       STA.W $D354                          ;8B88F9|8D54D3  |7ED354;
                       STA.W $D356                          ;8B88FC|8D56D3  |7ED356;
 
       CODE_JP_8B88FF:
                       PLB                                  ;8B88FF|AB      |      ;
                       RTL                                  ;8B8900|6B      |      ;
 
       CODE_FL_8B8901:
                       LDA.L $7ED1E2                        ;8B8901|AFE2D17E|7ED1E2;
                       ASL A                                ;8B8905|0A      |      ;
                       TAX                                  ;8B8906|AA      |      ;
                       LDA.L $001A82                        ;8B8907|AF821A00|001A82;
                       BNE +                                ;8B890B|D00D    |8B891A;
                       LDA.L $7ED1E4                        ;8B890D|AFE4D17E|7ED1E4;
                       BIT.W #$4000                         ;8B8911|890040  |      ;
                       BEQ +                                ;8B8914|F004    |8B891A;
                       JSR.W (DATA8_8B891E,X)               ;8B8916|FC1E89  |8B891E;
                       RTL                                  ;8B8919|6B      |      ;
 
                     + JSR.W (UNREACH_8B8938,X)             ;8B891A|FC3889  |8B8938;
                       RTL                                  ;8B891D|6B      |      ;
 
         DATA8_8B891E:
                       db $52,$89,$52,$89,$52,$89,$52,$89   ;8B891E|        |      ;
                       db $52,$89,$52,$89,$52,$89,$52,$89   ;8B8926|        |      ;
                       db $65,$8A,$70,$8A,$9A,$8A,$C4,$8A   ;8B892E|        |      ;
                       db $81,$89                           ;8B8936|        |      ;
 
       UNREACH_8B8938:
                       db $52,$89                           ;8B8938|        |000089;
                       db $52,$89,$52,$89,$52,$89,$52,$89   ;8B893A|        |      ;
                       db $52,$89,$52,$89,$52,$89,$65,$8A   ;8B8942|        |      ;
                       db $70,$8A,$9A,$8A                   ;8B894A|        |8B88D6;
                       db $23,$8B                           ;8B894E|        |      ;
                       db $81,$89                           ;8B8950|        |000089;
                       RTS                                  ;8B8952|60      |      ;
 
       CODE_FN_8B8953:
                       JSL.L CODE_FL_80BB2D                 ;8B8953|222DBB80|80BB2D;
                       db $1F,$9D,$93,$00,$28,$7E           ;8B8957|        |      ;
                       PHB                                  ;8B895D|8B      |      ;
                       PHK                                  ;8B895E|4B      |      ;
                       PLB                                  ;8B895F|AB      |      ;
                       LDY.W #$896A                         ;8B8960|A06A89  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8963|22CAA080|80A0CA;
                       PLB                                  ;8B8967|AB      |      ;
                       BRA +                                ;8B8968|8008    |8B8972;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8B896A|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8972|222DBB80|80BB2D;
                       db $E7,$9A,$93,$1C,$4C,$7E           ;8B8976|        |      ;
                       JSL.L CODE_FL_8B9277                 ;8B897C|2277928B|8B9277;
                       RTS                                  ;8B8980|60      |      ;
                       JSR.W CODE_FN_8B8953                 ;8B8981|205389  |8B8953;
                       JSR.W CODE_FN_8B8A3E                 ;8B8984|203E8A  |8B8A3E;
                       JSL.L CODE_FL_80BB2D                 ;8B8987|222DBB80|80BB2D;
                       db $EC,$86,$93,$60,$91,$7F           ;8B898B|        |      ;
                       PHB                                  ;8B8991|8B      |      ;
                       PHK                                  ;8B8992|4B      |      ;
                       PLB                                  ;8B8993|AB      |      ;
                       LDY.W #$899E                         ;8B8994|A09E89  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8997|22CAA080|80A0CA;
                       PLB                                  ;8B899B|AB      |      ;
                       BRA +                                ;8B899C|8008    |8B89A6;
                       db $60,$91,$7F,$C0,$03,$80,$00,$09   ;8B899E|        |      ;
 
                     + SEP #$20                             ;8B89A6|E220    |      ;
                       LDA.B #$00                           ;8B89A8|A900    |      ;
                       LDX.W #$4FFF                         ;8B89AA|A2FF4F  |      ;
 
                     - STA.L $7F9160,X                      ;8B89AD|9F60917F|7F9160;
                       DEX                                  ;8B89B1|CA      |      ;
                       BNE -                                ;8B89B2|D0F9    |8B89AD;
                       REP #$20                             ;8B89B4|C220    |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B89B6|222DBB80|80BB2D;
                       db $70,$EC,$92,$60,$C1,$7F           ;8B89BA|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B89C0|222DBB80|80BB2D;
                       db $2D,$EA,$92,$80,$88,$7F           ;8B89C4|        |      ;
                       PHB                                  ;8B89CA|8B      |      ;
                       PEA.W $7F00                          ;8B89CB|F4007F  |007F00;
                       PLB                                  ;8B89CE|AB      |      ;
                       PLB                                  ;8B89CF|AB      |      ;
                       LDX.W #$8880                         ;8B89D0|A28088  |      ;
                       JSL.L CODE_FL_8B9A3D                 ;8B89D3|223D9A8B|8B9A3D;
                       PLB                                  ;8B89D7|AB      |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B89D8|222DBB80|80BB2D;
                       db $F8,$EE,$92,$60,$91,$7F           ;8B89DC|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B89E2|222DBB80|80BB2D;
                       db $3B,$F1,$92,$60,$99,$7F           ;8B89E6|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B89EC|222DBB80|80BB2D;
                       db $7A,$99,$92,$60,$A1,$7F           ;8B89F0|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B89F6|222DBB80|80BB2D;
                       db $37,$89,$93,$20,$E1,$7F           ;8B89FA|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8A00|222DBB80|80BB2D;
                       db $29,$91,$8E,$20,$C3,$7F           ;8B8A04|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8A0A|222DBB80|80BB2D;
                       db $CA,$FE,$8D,$60,$C3,$7F           ;8B8A0E|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8A14|222DBB80|80BB2D;
                       db $2C,$8F,$93,$3B,$53,$7E           ;8B8A18|        |      ;
                       LDA.W #$7E00                         ;8B8A1E|A9007E  |      ;
                       STA.W $19BD                          ;8B8A21|8DBD19  |0019BD;
                       LDA.W #$533B                         ;8B8A24|A93B53  |      ;
                       STA.W $19BC                          ;8B8A27|8DBC19  |0019BC;
                       JSL.L CODE_FL_899DE6                 ;8B8A2A|22E69D89|899DE6;
                       JSL.L CODE_FL_899E12                 ;8B8A2E|22129E89|899E12;
                       LDA.W #$0000                         ;8B8A32|A90000  |      ;
                       STA.L $0019C1                        ;8B8A35|8FC11900|0019C1;
                       STA.L $001A01                        ;8B8A39|8F011A00|001A01;
                       RTS                                  ;8B8A3D|60      |      ;
 
       CODE_FN_8B8A3E:
                       LDA.W #$0000                         ;8B8A3E|A90000  |      ;
                       LDY.W #$0200                         ;8B8A41|A00002  |      ;
                       LDX.W #$0000                         ;8B8A44|A20000  |      ;
 
                     - STA.L $7F8680,X                      ;8B8A47|9F80867F|7F8680;
                       INX                                  ;8B8A4B|E8      |      ;
                       DEY                                  ;8B8A4C|88      |      ;
                       INX                                  ;8B8A4D|E8      |      ;
                       DEY                                  ;8B8A4E|88      |      ;
                       BNE -                                ;8B8A4F|D0F6    |8B8A47;
                       LDA.W #$0000                         ;8B8A51|A90000  |      ;
                       LDY.W #$0400                         ;8B8A54|A00004  |      ;
                       LDX.W #$0000                         ;8B8A57|A20000  |      ;
 
                     - STA.L $7F8C80,X                      ;8B8A5A|9F808C7F|7F8C80;
                       INX                                  ;8B8A5E|E8      |      ;
                       DEY                                  ;8B8A5F|88      |      ;
                       INX                                  ;8B8A60|E8      |      ;
                       DEY                                  ;8B8A61|88      |      ;
                       BNE -                                ;8B8A62|D0F6    |8B8A5A;
                       RTS                                  ;8B8A64|60      |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8A65|222DBB80|80BB2D;
                       db $A9,$93,$93,$00,$41,$7F           ;8B8A69|        |      ;
                       RTS                                  ;8B8A6F|60      |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8A70|222DBB80|80BB2D;
                       db $A9,$93,$93,$60,$91,$7F           ;8B8A74|        |      ;
                       PHB                                  ;8B8A7A|8B      |      ;
                       PHK                                  ;8B8A7B|4B      |      ;
                       PLB                                  ;8B8A7C|AB      |      ;
                       LDY.W #$8A87                         ;8B8A7D|A0878A  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8A80|22CAA080|80A0CA;
                       PLB                                  ;8B8A84|AB      |      ;
                       BRA +                                ;8B8A85|8008    |8B8A8F;
                       db $60,$91,$7F,$00,$06,$80,$00,$0D   ;8B8A87|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8A8F|222DBB80|80BB2D;
                       db $34,$97,$93,$00,$41,$7F           ;8B8A93|        |      ;
                       RTS                                  ;8B8A99|60      |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8A9A|222DBB80|80BB2D;
                       db $34,$97,$93,$60,$91,$7F           ;8B8A9E|        |      ;
                       PHB                                  ;8B8AA4|8B      |      ;
                       PHK                                  ;8B8AA5|4B      |      ;
                       PLB                                  ;8B8AA6|AB      |      ;
                       LDY.W #$8AB1                         ;8B8AA7|A0B18A  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8AAA|22CAA080|80A0CA;
                       PLB                                  ;8B8AAE|AB      |      ;
                       BRA +                                ;8B8AAF|8008    |8B8AB9;
                       db $60,$91,$7F,$00,$06,$80,$00,$0D   ;8B8AB1|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8AB9|222DBB80|80BB2D;
                       db $61,$91,$93,$00,$41,$7F           ;8B8ABD|        |      ;
                       RTS                                  ;8B8AC3|60      |      ;
                       LDA.W #$0000                         ;8B8AC4|A90000  |      ;
                       LDY.W #$0040                         ;8B8AC7|A04000  |      ;
                       LDX.W #$0000                         ;8B8ACA|A20000  |      ;
 
                     - STA.L $7E8776,X                      ;8B8ACD|9F76877E|7E8776;
                       INX                                  ;8B8AD1|E8      |      ;
                       DEY                                  ;8B8AD2|88      |      ;
                       INX                                  ;8B8AD3|E8      |      ;
                       DEY                                  ;8B8AD4|88      |      ;
                       BNE -                                ;8B8AD5|D0F6    |8B8ACD;
                       JSL.L CODE_FL_80BB2D                 ;8B8AD7|222DBB80|80BB2D;
                       db $3D,$EB,$92,$80,$84,$7F           ;8B8ADB|        |      ;
                       LDA.W #$0000                         ;8B8AE1|A90000  |      ;
                       LDY.W #$0200                         ;8B8AE4|A00002  |      ;
                       LDX.W #$0000                         ;8B8AE7|A20000  |      ;
 
                     - STA.L $7F8680,X                      ;8B8AEA|9F80867F|7F8680;
                       INX                                  ;8B8AEE|E8      |      ;
                       DEY                                  ;8B8AEF|88      |      ;
                       INX                                  ;8B8AF0|E8      |      ;
                       DEY                                  ;8B8AF1|88      |      ;
                       BNE -                                ;8B8AF2|D0F6    |8B8AEA;
                       JSL.L CODE_FL_80BB2D                 ;8B8AF4|222DBB80|80BB2D;
                       db $E7,$9A,$93,$80,$88,$7F           ;8B8AF8|        |      ;
                       PHB                                  ;8B8AFE|8B      |      ;
                       PEA.W $7F00                          ;8B8AFF|F4007F  |007F00;
                       PLB                                  ;8B8B02|AB      |      ;
                       PLB                                  ;8B8B03|AB      |      ;
                       LDX.W #$8880                         ;8B8B04|A28088  |      ;
                       JSL.L CODE_FL_8B9A3D                 ;8B8B07|223D9A8B|8B9A3D;
                       PLB                                  ;8B8B0B|AB      |      ;
                       LDA.W #$0000                         ;8B8B0C|A90000  |      ;
                       LDY.W #$0400                         ;8B8B0F|A00004  |      ;
                       LDX.W #$0000                         ;8B8B12|A20000  |      ;
 
                     - STA.L $7F8C80,X                      ;8B8B15|9F808C7F|7F8C80;
                       INX                                  ;8B8B19|E8      |      ;
                       DEY                                  ;8B8B1A|88      |      ;
                       INX                                  ;8B8B1B|E8      |      ;
                       DEY                                  ;8B8B1C|88      |      ;
                       BNE -                                ;8B8B1D|D0F6    |8B8B15;
                       JSR.W CODE_FN_8B8B4A                 ;8B8B1F|204A8B  |8B8B4A;
                       RTS                                  ;8B8B22|60      |      ;
                       JSR.W CODE_FN_8B8B4A                 ;8B8B23|204A8B  |8B8B4A;
                       PHB                                  ;8B8B26|8B      |      ;
                       PHK                                  ;8B8B27|4B      |      ;
                       PLB                                  ;8B8B28|AB      |      ;
                       LDY.W #$8B33                         ;8B8B29|A0338B  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8B2C|22CAA080|80A0CA;
                       PLB                                  ;8B8B30|AB      |      ;
                       BRA +                                ;8B8B31|8008    |8B8B3B;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8B8B33|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8B3B|222DBB80|80BB2D;
                       db $E7,$9A,$93,$1C,$4C,$7E           ;8B8B3F|        |      ;
                       JSL.L CODE_FL_8B9277                 ;8B8B45|2277928B|8B9277;
                       RTS                                  ;8B8B49|60      |      ;
 
       CODE_FN_8B8B4A:
                       JSL.L CODE_FL_80BB2D                 ;8B8B4A|222DBB80|80BB2D;
                       db $61,$91,$93,$60,$91,$7F           ;8B8B4E|        |      ;
                       PHB                                  ;8B8B54|8B      |      ;
                       PHK                                  ;8B8B55|4B      |      ;
                       PLB                                  ;8B8B56|AB      |      ;
                       LDY.W #$8B61                         ;8B8B57|A0618B  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8B5A|22CAA080|80A0CA;
                       PLB                                  ;8B8B5E|AB      |      ;
                       BRA +                                ;8B8B5F|8008    |8B8B69;
                       db $60,$91,$7F,$00,$06,$80,$00,$0D   ;8B8B61|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8B8B69|222DBB80|80BB2D;
                       db $C5,$9B,$93,$00,$28,$7E           ;8B8B6D|        |      ;
                       JSL.L CODE_FL_8BA340                 ;8B8B73|2240A38B|8BA340;
                       JSL.L CODE_FL_8BA3B9                 ;8B8B77|22B9A38B|8BA3B9;
                       RTS                                  ;8B8B7B|60      |      ;
 
       CODE_FL_8B8B7C:
                       LDA.W #$0022                         ;8B8B7C|A92200  |      ;
                       STA.W $199C                          ;8B8B7F|8D9C19  |7E199C;
                       JSL.L CODE_FL_8091B2                 ;8B8B82|22B29180|8091B2;
                       LDA.W #$0021                         ;8B8B86|A92100  |      ;
                       STA.W $199C                          ;8B8B89|8D9C19  |7E199C;
                       JSL.L CODE_FL_8091B2                 ;8B8B8C|22B29180|8091B2;
                       LDA.L $7ED1E2                        ;8B8B90|AFE2D17E|7ED1E2;
                       ASL A                                ;8B8B94|0A      |      ;
                       TAX                                  ;8B8B95|AA      |      ;
                       JMP.W (DATA8_8B8BD3,X)               ;8B8B96|7CD38B  |8B8BD3;
                       LDA.L $7ED1E4                        ;8B8B99|AFE4D17E|7ED1E4;
                       BIT.W #$8000                         ;8B8B9D|890080  |      ;
                       BNE +                                ;8B8BA0|D00C    |8B8BAE;
                       LDA.W #$0005                         ;8B8BA2|A90500  |      ;
                       STA.W $199C                          ;8B8BA5|8D9C19  |7E199C;
                       JSL.L CODE_FL_8091B2                 ;8B8BA8|22B29180|8091B2;
                       BRA ++                               ;8B8BAC|8024    |8B8BD2;
 
                     + LDA.W #$0006                         ;8B8BAE|A90600  |      ;
                       STA.W $199C                          ;8B8BB1|8D9C19  |7E199C;
                       JSL.L CODE_FL_8091B2                 ;8B8BB4|22B29180|8091B2;
                       BRA ++                               ;8B8BB8|8018    |8B8BD2;
                       LDA.W #$0014                         ;8B8BBA|A91400  |      ;
                       STA.W $199C                          ;8B8BBD|8D9C19  |00199C;
                       JSL.L CODE_FL_8091B2                 ;8B8BC0|22B29180|8091B2;
                       BRA ++                               ;8B8BC4|800C    |8B8BD2;
                       LDA.W #$0001                         ;8B8BC6|A90100  |      ;
                       STA.W $199C                          ;8B8BC9|8D9C19  |00199C;
                       JSL.L CODE_FL_8091B2                 ;8B8BCC|22B29180|8091B2;
                       BRA ++                               ;8B8BD0|8000    |8B8BD2;
 
                    ++ RTL                                  ;8B8BD2|6B      |      ;
 
         DATA8_8B8BD3:
                       db $99,$8B,$99,$8B,$99,$8B,$99,$8B   ;8B8BD3|        |      ;
                       db $99,$8B,$99,$8B,$99,$8B,$99,$8B   ;8B8BDB|        |      ;
                       db $99,$8B,$AE,$8B,$AE,$8B,$BA,$8B   ;8B8BE3|        |      ;
                       db $C6,$8B                           ;8B8BEB|        |      ;
 
       CODE_FL_8B8BED:
                       LDA.L $7ED1E2                        ;8B8BED|AFE2D17E|7ED1E2;
                       ASL A                                ;8B8BF1|0A      |      ;
                       TAX                                  ;8B8BF2|AA      |      ;
                       LDA.L DATA8_8B8C3C,X                 ;8B8BF3|BF3C8C8B|8B8C3C;
                       AND.W #$00FF                         ;8B8BF7|29FF00  |      ;
                       STA.L $7ED39F                        ;8B8BFA|8F9FD37E|7ED39F;
                       LDA.L DATA8_8B8C3D,X                 ;8B8BFE|BF3D8C8B|8B8C3D;
                       AND.W #$00FF                         ;8B8C02|29FF00  |      ;
                       STA.L $7ED3A1                        ;8B8C05|8FA1D37E|7ED3A1;
                       LDA.L $7ED39F                        ;8B8C09|AF9FD37E|7ED39F;
                       ASL A                                ;8B8C0D|0A      |      ;
                       TAX                                  ;8B8C0E|AA      |      ;
                       LDA.L DATA8_8B8C56,X                 ;8B8C0F|BF568C8B|8B8C56;
                       ORA.L $7ED3A5                        ;8B8C13|0FA5D37E|7ED3A5;
                       STA.L $7ED3A5                        ;8B8C17|8FA5D37E|7ED3A5;
                       LDA.L $7ED3A1                        ;8B8C1B|AFA1D37E|7ED3A1;
                       ASL A                                ;8B8C1F|0A      |      ;
                       TAX                                  ;8B8C20|AA      |      ;
                       LDA.L DATA8_8B8C56,X                 ;8B8C21|BF568C8B|8B8C56;
                       ORA.L $7ED3A7                        ;8B8C25|0FA7D37E|7ED3A7;
                       STA.L $7ED3A7                        ;8B8C29|8FA7D37E|7ED3A7;
                       LDA.W #$006F                         ;8B8C2D|A96F00  |      ;
                       STA.L $7ED3A9                        ;8B8C30|8FA9D37E|7ED3A9;
                       LDA.W #$0071                         ;8B8C34|A97100  |      ;
                       STA.L $7ED3AB                        ;8B8C37|8FABD37E|7ED3AB;
                       RTL                                  ;8B8C3B|6B      |      ;
 
         DATA8_8B8C3C:
                       db $0C                               ;8B8C3C|        |      ;
 
         DATA8_8B8C3D:
                       db $00,$00,$01,$01,$02,$02,$03,$03   ;8B8C3D|        |      ;
                       db $04,$04,$05,$05,$06,$06,$07,$07   ;8B8C45|        |      ;
                       db $08,$08,$09,$09,$0A,$0A,$0B,$0B   ;8B8C4D|        |      ;
                       db $0B                               ;8B8C55|        |      ;
 
         DATA8_8B8C56:
                       db $00,$C0,$00,$00,$00,$80,$00,$00   ;8B8C56|        |      ;
                       db $00,$80,$00,$80,$00,$C0,$00,$80   ;8B8C5E|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8B8C66|        |      ;
                       db $00,$00                           ;8B8C6E|        |      ;
 
       CODE_FL_8B8C70:
                       LDA.L $7ED3A1                        ;8B8C70|AFA1D37E|7ED3A1;
                       CMP.W #$0008                         ;8B8C74|C90800  |      ;
                       BNE +                                ;8B8C77|D00F    |8B8C88;
                       LDA.L $001A82                        ;8B8C79|AF821A00|001A82;
                       BNE ++                               ;8B8C7D|D038    |8B8CB7;
                       LDA.L $7ED1E4                        ;8B8C7F|AFE4D17E|7ED1E4;
                       BIT.W #$4000                         ;8B8C83|890040  |      ;
                       BEQ ++                               ;8B8C86|F02F    |8B8CB7;
 
                     + LDA.L $7ED3A1                        ;8B8C88|AFA1D37E|7ED3A1;
                       ASL A                                ;8B8C8C|0A      |      ;
                       TAX                                  ;8B8C8D|AA      |      ;
                       JMP.W (DATA8_8B8C91,X)               ;8B8C8E|7C918C  |8B8C91;
 
         DATA8_8B8C91:
                       db $AB,$8C,$AB,$8C,$AB,$8C,$AB,$8C   ;8B8C91|        |      ;
                       db $AB,$8C,$AB,$8C,$AB,$8C,$AB,$8C   ;8B8C99|        |      ;
                       db $AB,$8C,$B7,$8C,$B7,$8C,$B7,$8C   ;8B8CA1|        |      ;
                       db $AB,$8C                           ;8B8CA9|        |      ;
                       LDA.L $7ED1E4                        ;8B8CAB|AFE4D17E|7ED1E4;
                       AND.W #$7FFF                         ;8B8CAF|29FF7F  |      ;
                       STA.L $7ED1E4                        ;8B8CB2|8FE4D17E|7ED1E4;
                       RTL                                  ;8B8CB6|6B      |      ;
 
                    ++ LDA.L $7ED1E4                        ;8B8CB7|AFE4D17E|7ED1E4;
                       ORA.W #$8000                         ;8B8CBB|090080  |      ;
                       STA.L $7ED1E4                        ;8B8CBE|8FE4D17E|7ED1E4;
                       RTL                                  ;8B8CC2|6B      |      ;
                       JSL.L CODE_FL_8B92C2                 ;8B8CC3|22C2928B|8B92C2;
                       JSR.W CODE_FN_8B9261                 ;8B8CC7|206192  |8B9261;
                       JSR.W CODE_FN_8B9248                 ;8B8CCA|204892  |8B9248;
                       JSR.W CODE_FN_8B9EBB                 ;8B8CCD|20BB9E  |8B9EBB;
                       JSR.W CODE_FN_8B91F4                 ;8B8CD0|20F491  |8B91F4;
                       LDA.W $D274                          ;8B8CD3|AD74D2  |7ED274;
                       BIT.W #$0400                         ;8B8CD6|890004  |      ;
                       BEQ +                                ;8B8CD9|F004    |8B8CDF;
                       JSL.L CODE_FL_8BEE8B                 ;8B8CDB|228BEE8B|8BEE8B;
 
                     + LDA.W $D274                          ;8B8CDF|AD74D2  |7ED274;
                       BIT.W #$1000                         ;8B8CE2|890010  |      ;
                       BEQ +                                ;8B8CE5|F004    |8B8CEB;
                       JSL.L CODE_FL_8BEB7D                 ;8B8CE7|227DEB8B|8BEB7D;
 
                     + LDA.W #$7E00                         ;8B8CEB|A9007E  |      ;
                       STA.B $97                            ;8B8CEE|8597    |000097;
                       LDA.W #$D379                         ;8B8CF0|A979D3  |      ;
                       STA.B $96                            ;8B8CF3|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8CF5|2266A389|89A366;
                       LDA.W #$D38A                         ;8B8CF9|A98AD3  |      ;
                       STA.B $96                            ;8B8CFC|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8CFE|2266A389|89A366;
                       LDA.W #$D366                         ;8B8D02|A966D3  |      ;
                       STA.B $96                            ;8B8D05|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8D07|2266A389|89A366;
                       JSL.L CODE_FL_8BA736                 ;8B8D0B|2236A78B|8BA736;
                       JSL.L CODE_FL_8BA6AC                 ;8B8D0F|22ACA68B|8BA6AC;
                       JSL.L CODE_FL_8BA64F                 ;8B8D13|224FA68B|8BA64F;
                       JSL.L CODE_FL_8B8F14                 ;8B8D17|22148F8B|8B8F14;
                       JSL.L CODE_FL_8B9185                 ;8B8D1B|2285918B|8B9185;
                       JSR.W CODE_FN_8BA0E2                 ;8B8D1F|20E2A0  |8BA0E2;
                       LDA.W #$D32F                         ;8B8D22|A92FD3  |      ;
                       STA.B $96                            ;8B8D25|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8D27|2266A389|89A366;
                       JSL.L CODE_FL_8BE93B                 ;8B8D2B|223BE98B|8BE93B;
                       JSR.W CODE_FN_8BA13D                 ;8B8D2F|203DA1  |8BA13D;
                       LDA.W #$D3AD                         ;8B8D32|A9ADD3  |      ;
                       STA.B $96                            ;8B8D35|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8D37|2266A389|89A366;
                       JSL.L CODE_FL_8B8D84                 ;8B8D3B|22848D8B|8B8D84;
                       LDA.W $D1E4                          ;8B8D3F|ADE4D1  |7ED1E4;
                       BIT.W #$8000                         ;8B8D42|890080  |      ;
                       BNE +                                ;8B8D45|D025    |8B8D6C;
                       LDA.W #$7E00                         ;8B8D47|A9007E  |      ;
                       STA.W $19BD                          ;8B8D4A|8DBD19  |7E19BD;
                       LDA.W #$533B                         ;8B8D4D|A93B53  |      ;
                       STA.W $19BC                          ;8B8D50|8DBC19  |7E19BC;
                       JSL.L CODE_FL_899E69                 ;8B8D53|22699E89|899E69;
                       PHB                                  ;8B8D57|8B      |      ;
                       PHK                                  ;8B8D58|4B      |      ;
                       PLB                                  ;8B8D59|AB      |      ;
                       LDY.W #$8D64                         ;8B8D5A|A0648D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B8D5D|22CAA080|80A0CA;
                       PLB                                  ;8B8D61|AB      |      ;
                       BRA +                                ;8B8D62|8008    |8B8D6C;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8B8D64|        |      ;
 
                     + PHB                                  ;8B8D6C|8B      |      ;
                       PHK                                  ;8B8D6D|4B      |      ;
                       PLB                                  ;8B8D6E|AB      |      ;
                       LDY.W #$8D79                         ;8B8D6F|A0798D  |      ;
                       JSL.L CODE_FL_80A07F                 ;8B8D72|227FA080|80A07F;
                       PLB                                  ;8B8D76|AB      |      ;
                       BRA +                                ;8B8D77|8006    |8B8D7F;
                       db $F6,$86,$7E,$00,$02,$00           ;8B8D79|        |      ;
 
                     + JSL.L CODE_FL_8BA7E3                 ;8B8D7F|22E3A78B|8BA7E3;
                       RTS                                  ;8B8D83|60      |      ;
 
       CODE_FL_8B8D84:
                       LDA.W $D1E4                          ;8B8D84|ADE4D1  |7ED1E4;
                       BIT.W #$8000                         ;8B8D87|890080  |      ;
                       BNE +                                ;8B8D8A|D075    |8B8E01;
                       LDA.W #$CFFF                         ;8B8D8C|A9FFCF  |      ;
                       STA.B $D8                            ;8B8D8F|85D8    |0000D8;
                       LDA.W #$2000                         ;8B8D91|A90020  |      ;
                       STA.B $DA                            ;8B8D94|85DA    |0000DA;
                       LDA.W #$8900                         ;8B8D96|A90089  |      ;
                       STA.B $D6                            ;8B8D99|85D6    |0000D6;
                       LDA.W #$8900                         ;8B8D9B|A90089  |      ;
                       STA.B $D5                            ;8B8D9E|85D5    |0000D5;
                       LDX.W #$0004                         ;8B8DA0|A20400  |      ;
 
                     - LDA.W $D5ED,X                        ;8B8DA3|BDEDD5  |7ED5ED;
                       BEQ ++                               ;8B8DA6|F055    |8B8DFD;
                       STA.B $D3                            ;8B8DA8|85D3    |0000D3;
                       LDA.W $D5E1,X                        ;8B8DAA|BDE1D5  |7ED5E1;
                       LSR A                                ;8B8DAD|4A      |      ;
                       EOR.W #$FFFF                         ;8B8DAE|49FFFF  |      ;
                       INC A                                ;8B8DB1|1A      |      ;
                       CLC                                  ;8B8DB2|18      |      ;
                       ADC.W #$0007                         ;8B8DB3|690700  |      ;
                       STA.W $D5E7,X                        ;8B8DB6|9DE7D5  |7ED5E7;
                       LDA.W $D5ED,X                        ;8B8DB9|BDEDD5  |7ED5ED;
                       CMP.W #$003C                         ;8B8DBC|C93C00  |      ;
                       BNE +++                              ;8B8DBF|D00A    |8B8DCB;
                       LDA.W $D5E7,X                        ;8B8DC1|BDE7D5  |7ED5E7;
                       CLC                                  ;8B8DC4|18      |      ;
                       ADC.W #$0004                         ;8B8DC5|690400  |      ;
                       STA.W $D5E7,X                        ;8B8DC8|9DE7D5  |7ED5E7;
 
                   +++ LDA.W $D5E1,X                        ;8B8DCB|BDE1D5  |7ED5E1;
                       SEC                                  ;8B8DCE|38      |      ;
                       SBC.L $7ED250                        ;8B8DCF|EF50D27E|7ED250;
                       STA.B $CF                            ;8B8DD3|85CF    |0000CF;
                       CLC                                  ;8B8DD5|18      |      ;
                       ADC.W #$0012                         ;8B8DD6|691200  |      ;
                       AND.W #$01FF                         ;8B8DD9|29FF01  |      ;
                       CMP.W #$0124                         ;8B8DDC|C92401  |      ;
                       BCS ++                               ;8B8DDF|B01C    |8B8DFD;
                       LDA.W $D5E7,X                        ;8B8DE1|BDE7D5  |7ED5E7;
                       SEC                                  ;8B8DE4|38      |      ;
                       SBC.L $7ED252                        ;8B8DE5|EF52D27E|7ED252;
                       STA.B $D1                            ;8B8DE9|85D1    |0000D1;
                       CLC                                  ;8B8DEB|18      |      ;
                       ADC.W #$000C                         ;8B8DEC|690C00  |      ;
                       AND.W #$00FF                         ;8B8DEF|29FF00  |      ;
                       CMP.W #$008C                         ;8B8DF2|C98C00  |      ;
                       BCS ++                               ;8B8DF5|B006    |8B8DFD;
                       PHX                                  ;8B8DF7|DA      |      ;
                       JSL.L CODE_FL_80BC55                 ;8B8DF8|2255BC80|80BC55;
                       PLX                                  ;8B8DFC|FA      |      ;
 
                    ++ DEX                                  ;8B8DFD|CA      |      ;
                       DEX                                  ;8B8DFE|CA      |      ;
                       BPL -                                ;8B8DFF|10A2    |8B8DA3;
 
                     + RTL                                  ;8B8E01|6B      |      ;
 
       CODE_FL_8B8E02:
                       PHP                                  ;8B8E02|08      |      ;
                       REP #$30                             ;8B8E03|C230    |      ;
                       JSL.L CODE_FL_80BB2D                 ;8B8E05|222DBB80|80BB2D;
                       db $20,$A2,$93,$1C,$39,$7E           ;8B8E09|        |      ;
                       LDX.W #$391C                         ;8B8E0F|A21C39  |      ;
                       JSL.L CODE_FL_8B9E27                 ;8B8E12|22279E8B|8B9E27;
                       LDA.W #$D400                         ;8B8E16|A900D4  |      ;
                       STA.B $96                            ;8B8E19|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E1B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E1F|222CA689|89A62C;
                       db $4A,$DB,$8B                       ;8B8E23|        |      ;
                       LDA.W #$D411                         ;8B8E26|A911D4  |      ;
                       STA.B $96                            ;8B8E29|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E2B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E2F|222CA689|89A62C;
                       db $61,$DA,$8B                       ;8B8E33|        |      ;
                       LDA.W #$D422                         ;8B8E36|A922D4  |      ;
                       STA.B $96                            ;8B8E39|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E3B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E3F|222CA689|89A62C;
                       db $80,$DB,$8B                       ;8B8E43|        |      ;
                       LDA.W #$D433                         ;8B8E46|A933D4  |      ;
                       STA.B $96                            ;8B8E49|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E4B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E4F|222CA689|89A62C;
                       db $96,$DB,$8B                       ;8B8E53|        |      ;
                       LDA.W #$D444                         ;8B8E56|A944D4  |      ;
                       STA.B $96                            ;8B8E59|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E5B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E5F|222CA689|89A62C;
                       db $77,$DA,$8B                       ;8B8E63|        |      ;
                       LDA.W #$D455                         ;8B8E66|A955D4  |      ;
                       STA.B $96                            ;8B8E69|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E6B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E6F|222CA689|89A62C;
                       db $60,$DB,$8B                       ;8B8E73|        |      ;
                       LDA.W #$D466                         ;8B8E76|A966D4  |      ;
                       STA.B $96                            ;8B8E79|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E7B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E7F|222CA689|89A62C;
                       db $AC,$DB,$8B                       ;8B8E83|        |      ;
                       LDA.W #$D477                         ;8B8E86|A977D4  |      ;
                       STA.B $96                            ;8B8E89|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E8B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E8F|222CA689|89A62C;
                       db $8D,$DA,$8B                       ;8B8E93|        |      ;
                       LDA.W #$D488                         ;8B8E96|A988D4  |      ;
                       STA.B $96                            ;8B8E99|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B8E9B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8B8E9F|222CA689|89A62C;
                       db $2A,$DB,$8B                       ;8B8EA3|        |      ;
                       LDA.W #$FFFF                         ;8B8EA6|A9FFFF  |      ;
                       STA.L $7ED499                        ;8B8EA9|8F99D47E|7ED499;
                       STA.L $7ED49B                        ;8B8EAD|8F9BD47E|7ED49B;
                       STA.L $7ED49D                        ;8B8EB1|8F9DD47E|7ED49D;
                       STA.L $7ED49F                        ;8B8EB5|8F9FD47E|7ED49F;
                       STA.L $7ED4A1                        ;8B8EB9|8FA1D47E|7ED4A1;
                       STA.L $7ED4A3                        ;8B8EBD|8FA3D47E|7ED4A3;
                       STA.L $7ED4A5                        ;8B8EC1|8FA5D47E|7ED4A5;
                       STA.L $7ED4A7                        ;8B8EC5|8FA7D47E|7ED4A7;
                       STA.L $7ED4A9                        ;8B8EC9|8FA9D47E|7ED4A9;
                       STA.L $7ED4AB                        ;8B8ECD|8FABD47E|7ED4AB;
                       STA.L $7ED4AD                        ;8B8ED1|8FADD47E|7ED4AD;
                       STA.L $7ED4AF                        ;8B8ED5|8FAFD47E|7ED4AF;
                       STA.L $7ED4B1                        ;8B8ED9|8FB1D47E|7ED4B1;
                       LDA.L $001A82                        ;8B8EDD|AF821A00|001A82;
                       BNE +                                ;8B8EE1|D018    |8B8EFB;
                       LDA.L $7ED1E4                        ;8B8EE3|AFE4D17E|7ED1E4;
                       BIT.W #$4000                         ;8B8EE7|890040  |      ;
                       BEQ +                                ;8B8EEA|F00F    |8B8EFB;
                       LDA.L $7ED39F                        ;8B8EEC|AF9FD37E|7ED39F;
                       TAX                                  ;8B8EF0|AA      |      ;
                       SEP #$20                             ;8B8EF1|E220    |      ;
                       LDA.B #$02                           ;8B8EF3|A902    |      ;
                       STA.L $7ED1E6,X                      ;8B8EF5|9FE6D17E|7ED1E6;
                       REP #$20                             ;8B8EF9|C220    |      ;
 
                     + SEP #$30                             ;8B8EFB|E230    |      ;
                       LDX.B #$0F                           ;8B8EFD|A20F    |      ;
 
                     - LDA.L $7ED1E6,X                      ;8B8EFF|BFE6D17E|7ED1E6;
                       CMP.B #$03                           ;8B8F03|C903    |      ;
                       BCC +                                ;8B8F05|9006    |8B8F0D;
                       LDA.B #$02                           ;8B8F07|A902    |      ;
                       STA.L $7ED1E6,X                      ;8B8F09|9FE6D17E|7ED1E6;
 
                     + DEX                                  ;8B8F0D|CA      |      ;
                       BPL -                                ;8B8F0E|10EF    |8B8EFF;
                       REP #$30                             ;8B8F10|C230    |      ;
                       PLP                                  ;8B8F12|28      |      ;
                       RTL                                  ;8B8F13|6B      |      ;
 
       CODE_FL_8B8F14:
                       PHP                                  ;8B8F14|08      |      ;
                       REP #$30                             ;8B8F15|C230    |      ;
                       PHB                                  ;8B8F17|8B      |      ;
                       PEA.W $7E00                          ;8B8F18|F4007E  |7E7E00;
                       PLB                                  ;8B8F1B|AB      |      ;
                       PLB                                  ;8B8F1C|AB      |      ;
                       LDA.L $7ED3FE                        ;8B8F1D|AFFED37E|7ED3FE;
                       BNE +                                ;8B8F21|D003    |8B8F26;
                       JMP.W CODE_JP_8B90E0                 ;8B8F23|4CE090  |8B90E0;
 
                     + LDA.L $7ED1EA                        ;8B8F26|AFEAD17E|7ED1EA;
                       AND.W #$00FF                         ;8B8F2A|29FF00  |      ;
                       CMP.W #$0002                         ;8B8F2D|C90200  |      ;
                       BCC +                                ;8B8F30|9009    |8B8F3B;
                       LDA.W #$D411                         ;8B8F32|A911D4  |      ;
                       STA.B $96                            ;8B8F35|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8F37|2266A389|89A366;
 
                     + LDA.L $7ED1E7                        ;8B8F3B|AFE7D17E|7ED1E7;
                       AND.W #$00FF                         ;8B8F3F|29FF00  |      ;
                       CMP.W #$0002                         ;8B8F42|C90200  |      ;
                       BCC +                                ;8B8F45|9009    |8B8F50;
                       LDA.W #$D444                         ;8B8F47|A944D4  |      ;
                       STA.B $96                            ;8B8F4A|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8F4C|2266A389|89A366;
 
                     + LDA.L $7ED1ED                        ;8B8F50|AFEDD17E|7ED1ED;
                       AND.W #$00FF                         ;8B8F54|29FF00  |      ;
                       CMP.W #$0002                         ;8B8F57|C90200  |      ;
                       BCC +                                ;8B8F5A|9009    |8B8F65;
                       LDA.W #$D477                         ;8B8F5C|A977D4  |      ;
                       STA.B $96                            ;8B8F5F|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8F61|2266A389|89A366;
 
                     + LDA.L $7ED1F2                        ;8B8F65|AFF2D17E|7ED1F2;
                       AND.W #$00FF                         ;8B8F69|29FF00  |      ;
                       CMP.W #$0002                         ;8B8F6C|C90200  |      ;
                       BCC +                                ;8B8F6F|9021    |8B8F92;
                       LDA.W #$D488                         ;8B8F71|A988D4  |      ;
                       STA.B $96                            ;8B8F74|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8F76|2266A389|89A366;
                       LDA.W $D48B                          ;8B8F7A|AD8BD4  |7ED48B;
                       CMP.W $D4B1                          ;8B8F7D|CDB1D4  |7ED4B1;
                       BEQ +                                ;8B8F80|F010    |8B8F92;
                       STA.W $D4B1                          ;8B8F82|8DB1D4  |7ED4B1;
                       LDA.W #$0000                         ;8B8F85|A90000  |      ;
                       LDX.W #$0470                         ;8B8F88|A27004  |      ;
                       LDY.W $D48B                          ;8B8F8B|AC8BD4  |7ED48B;
                       JSL.L CODE_FL_86D5FB                 ;8B8F8E|22FBD586|86D5FB;
 
                     + LDA.L $7ED1E6                        ;8B8F92|AFE6D17E|7ED1E6;
                       AND.W #$00FF                         ;8B8F96|29FF00  |      ;
                       CMP.W #$0002                         ;8B8F99|C90200  |      ;
                       BCC +                                ;8B8F9C|9021    |8B8FBF;
                       LDA.W #$D400                         ;8B8F9E|A900D4  |      ;
                       STA.B $96                            ;8B8FA1|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8FA3|2266A389|89A366;
                       LDA.W $D403                          ;8B8FA7|AD03D4  |7ED403;
                       CMP.W $D499                          ;8B8FAA|CD99D4  |7ED499;
                       BEQ +                                ;8B8FAD|F010    |8B8FBF;
                       STA.W $D499                          ;8B8FAF|8D99D4  |7ED499;
                       LDA.W #$0001                         ;8B8FB2|A90100  |      ;
                       LDX.W #$0448                         ;8B8FB5|A24804  |      ;
                       LDY.W $D403                          ;8B8FB8|AC03D4  |7ED403;
                       JSL.L CODE_FL_86D5FB                 ;8B8FBB|22FBD586|86D5FB;
 
                     + LDA.L $7ED1E8                        ;8B8FBF|AFE8D17E|7ED1E8;
                       AND.W #$00FF                         ;8B8FC3|29FF00  |      ;
                       CMP.W #$0002                         ;8B8FC6|C90200  |      ;
                       BCC +                                ;8B8FC9|9021    |8B8FEC;
                       LDA.W #$D422                         ;8B8FCB|A922D4  |      ;
                       STA.B $96                            ;8B8FCE|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8FD0|2266A389|89A366;
                       LDA.W $D425                          ;8B8FD4|AD25D4  |7ED425;
                       CMP.W $D49D                          ;8B8FD7|CD9DD4  |7ED49D;
                       BEQ +                                ;8B8FDA|F010    |8B8FEC;
                       STA.W $D49D                          ;8B8FDC|8D9DD4  |7ED49D;
                       LDA.W #$0002                         ;8B8FDF|A90200  |      ;
                       LDX.W #$045C                         ;8B8FE2|A25C04  |      ;
                       LDY.W $D425                          ;8B8FE5|AC25D4  |7ED425;
                       JSL.L CODE_FL_86D5FB                 ;8B8FE8|22FBD586|86D5FB;
 
                     + LDA.L $7ED1EB                        ;8B8FEC|AFEBD17E|7ED1EB;
                       AND.W #$00FF                         ;8B8FF0|29FF00  |      ;
                       CMP.W #$0002                         ;8B8FF3|C90200  |      ;
                       BCC +                                ;8B8FF6|9021    |8B9019;
                       LDA.W #$D455                         ;8B8FF8|A955D4  |      ;
                       STA.B $96                            ;8B8FFB|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B8FFD|2266A389|89A366;
                       LDA.W $D458                          ;8B9001|AD58D4  |7ED458;
                       CMP.W $D4A3                          ;8B9004|CDA3D4  |7ED4A3;
                       BEQ +                                ;8B9007|F010    |8B9019;
                       STA.W $D4A3                          ;8B9009|8DA3D4  |7ED4A3;
                       LDA.W #$0003                         ;8B900C|A90300  |      ;
                       LDX.W #$0592                         ;8B900F|A29205  |      ;
                       LDY.W $D458                          ;8B9012|AC58D4  |7ED458;
                       JSL.L CODE_FL_86D5FB                 ;8B9015|22FBD586|86D5FB;
 
                     + LDA.L $7ED1E9                        ;8B9019|AFE9D17E|7ED1E9;
                       AND.W #$00FF                         ;8B901D|29FF00  |      ;
                       CMP.W #$0002                         ;8B9020|C90200  |      ;
                       BCC +                                ;8B9023|9021    |8B9046;
                       LDA.W #$D433                         ;8B9025|A933D4  |      ;
                       STA.B $96                            ;8B9028|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B902A|2266A389|89A366;
                       LDA.W $D436                          ;8B902E|AD36D4  |7ED436;
                       CMP.W $D49F                          ;8B9031|CD9FD4  |7ED49F;
                       BEQ +                                ;8B9034|F010    |8B9046;
                       STA.W $D49F                          ;8B9036|8D9FD4  |7ED49F;
                       LDA.W #$0004                         ;8B9039|A90400  |      ;
                       LDX.W #$0466                         ;8B903C|A26604  |      ;
                       LDY.W $D436                          ;8B903F|AC36D4  |7ED436;
                       JSL.L CODE_FL_86D5FB                 ;8B9042|22FBD586|86D5FB;
 
                     + LDA.L $7ED1EC                        ;8B9046|AFECD17E|7ED1EC;
                       AND.W #$00FF                         ;8B904A|29FF00  |      ;
                       CMP.W #$0002                         ;8B904D|C90200  |      ;
                       BCC +                                ;8B9050|9021    |8B9073;
                       LDA.W #$D466                         ;8B9052|A966D4  |      ;
                       STA.B $96                            ;8B9055|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B9057|2266A389|89A366;
                       LDA.W $D469                          ;8B905B|AD69D4  |7ED469;
                       CMP.W $D4A5                          ;8B905E|CDA5D4  |7ED4A5;
                       BEQ +                                ;8B9061|F010    |8B9073;
                       STA.W $D4A5                          ;8B9063|8DA5D4  |7ED4A5;
                       LDA.W #$0005                         ;8B9066|A90500  |      ;
                       LDX.W #$059C                         ;8B9069|A29C05  |      ;
                       LDY.W $D469                          ;8B906C|AC69D4  |7ED469;
                       JSL.L CODE_FL_86D5FB                 ;8B906F|22FBD586|86D5FB;
 
                     + LDA.W #$8100                         ;8B9073|A90081  |      ;
                       STA.B $D6                            ;8B9076|85D6    |0000D6;
                       LDA.W #$8000                         ;8B9078|A90080  |      ;
                       STA.B $D5                            ;8B907B|85D5    |0000D5;
                       LDA.L $7ED1EA                        ;8B907D|AFEAD17E|7ED1EA;
                       AND.W #$00FF                         ;8B9081|29FF00  |      ;
                       BEQ +                                ;8B9084|F011    |8B9097;
                       LDA.W #$0020                         ;8B9086|A92000  |      ;
                       STA.B $CF                            ;8B9089|85CF    |0000CF;
                       LDA.W #$00B0                         ;8B908B|A9B000  |      ;
                       STA.B $D1                            ;8B908E|85D1    |0000D1;
                       LDA.L $7ED414                        ;8B9090|AF14D47E|7ED414;
                       JSR.W CODE_FN_8B90E3                 ;8B9094|20E390  |8B90E3;
 
                     + LDA.L $7ED1E7                        ;8B9097|AFE7D17E|7ED1E7;
                       AND.W #$00FF                         ;8B909B|29FF00  |      ;
                       BEQ +                                ;8B909E|F011    |8B90B1;
                       LDA.W #$0048                         ;8B90A0|A94800  |      ;
                       STA.B $CF                            ;8B90A3|85CF    |0000CF;
                       LDA.W #$0088                         ;8B90A5|A98800  |      ;
                       STA.B $D1                            ;8B90A8|85D1    |0000D1;
                       LDA.L $7ED447                        ;8B90AA|AF47D47E|7ED447;
                       JSR.W CODE_FN_8B90E3                 ;8B90AE|20E390  |8B90E3;
 
                     + LDA.L $7ED1ED                        ;8B90B1|AFEDD17E|7ED1ED;
                       AND.W #$00FF                         ;8B90B5|29FF00  |      ;
                       BEQ +                                ;8B90B8|F011    |8B90CB;
                       LDA.W #$0098                         ;8B90BA|A99800  |      ;
                       STA.B $CF                            ;8B90BD|85CF    |0000CF;
                       LDA.W #$00B0                         ;8B90BF|A9B000  |      ;
                       STA.B $D1                            ;8B90C2|85D1    |0000D1;
                       LDA.L $7ED47A                        ;8B90C4|AF7AD47E|7ED47A;
                       JSR.W CODE_FN_8B90E3                 ;8B90C8|20E390  |8B90E3;
 
                     + PHB                                  ;8B90CB|8B      |      ;
                       PHK                                  ;8B90CC|4B      |      ;
                       PLB                                  ;8B90CD|AB      |      ;
                       LDY.W #$90D8                         ;8B90CE|A0D890  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B90D1|22CAA080|80A0CA;
                       PLB                                  ;8B90D5|AB      |      ;
                       BRA CODE_JP_8B90E0                   ;8B90D6|8008    |8B90E0;
                       db $08,$24,$7E,$5C,$02,$80,$04,$7A   ;8B90D8|        |      ;
 
       CODE_JP_8B90E0:
                       PLB                                  ;8B90E0|AB      |      ;
                       PLP                                  ;8B90E1|28      |      ;
                       RTL                                  ;8B90E2|6B      |      ;
 
       CODE_FN_8B90E3:
                       STA.B $D3                            ;8B90E3|85D3    |0000D3;
                       LDA.B $CF                            ;8B90E5|A5CF    |0000CF;
                       SEC                                  ;8B90E7|38      |      ;
                       SBC.L $7ED25E                        ;8B90E8|EF5ED27E|7ED25E;
                       STA.B $CF                            ;8B90EC|85CF    |0000CF;
                       LDA.B $D1                            ;8B90EE|A5D1    |0000D1;
                       SEC                                  ;8B90F0|38      |      ;
                       SBC.L $7ED260                        ;8B90F1|EF60D27E|7ED260;
                       DEC A                                ;8B90F5|3A      |      ;
                       STA.B $D1                            ;8B90F6|85D1    |0000D1;
                       LDA.W #$CFFF                         ;8B90F8|A9FFCF  |      ;
                       STA.B $D8                            ;8B90FB|85D8    |0000D8;
                       LDA.W #$3000                         ;8B90FD|A90030  |      ;
                       STA.B $DA                            ;8B9100|85DA    |0000DA;
                       JSL.L CODE_FL_80BC55                 ;8B9102|2255BC80|80BC55;
                       RTS                                  ;8B9106|60      |      ;
 
       CODE_FL_8B9107:
                       PHP                                  ;8B9107|08      |      ;
                       REP #$30                             ;8B9108|C230    |      ;
                       PHB                                  ;8B910A|8B      |      ;
                       PEA.W $7E00                          ;8B910B|F4007E  |8B7E00;
                       PLB                                  ;8B910E|AB      |      ;
                       PLB                                  ;8B910F|AB      |      ;
                       LDX.B $96                            ;8B9110|A696    |000096;
                       PHX                                  ;8B9112|DA      |      ;
                       LDX.B $97                            ;8B9113|A697    |000097;
                       PHX                                  ;8B9115|DA      |      ;
                       STA.W $D4B5                          ;8B9116|8DB5D4  |7ED4B5;
                       LDA.W #$D4B9                         ;8B9119|A9B9D4  |      ;
                       STA.B $96                            ;8B911C|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8B911E|2250A489|89A450;
                       LDA.W $D4B5                          ;8B9122|ADB5D4  |7ED4B5;
                       JSL.L CODE_FL_89A663                 ;8B9125|2263A689|89A663;
                       db $51,$91                           ;8B9129|        |      ;
                       LDA.W #$0000                         ;8B912B|A90000  |      ;
                       STA.W $D4B3                          ;8B912E|8DB3D4  |7ED4B3;
                       LDX.W $D4B5                          ;8B9131|AEB5D4  |7ED4B5;
                       LDA.L DATA8_8B9178,X                 ;8B9134|BF78918B|8B9178;
                       BIT.W #$0080                         ;8B9138|898000  |      ;
                       BNE +                                ;8B913B|D005    |8B9142;
                       AND.W #$007F                         ;8B913D|297F00  |      ;
                       BRA ++                               ;8B9140|8003    |8B9145;
 
                     + ORA.W #$FF80                         ;8B9142|0980FF  |      ;
 
                    ++ STA.W $D4B7                          ;8B9145|8DB7D4  |7ED4B7;
                       PLX                                  ;8B9148|FA      |      ;
                       STX.B $97                            ;8B9149|8697    |000097;
                       PLX                                  ;8B914B|FA      |      ;
                       STX.B $96                            ;8B914C|8696    |000096;
                       PLB                                  ;8B914E|AB      |      ;
                       PLP                                  ;8B914F|28      |      ;
                       RTL                                  ;8B9150|6B      |      ;
                       db $4A,$DB,$8B,$77,$DA,$8B,$80,$DB   ;8B9151|        |      ;
                       db $8B,$96,$DB,$8B,$61,$DA,$8B,$60   ;8B9159|        |      ;
                       db $DB,$8B,$AC,$DB,$8B,$8D,$DA,$8B   ;8B9161|        |      ;
                       db $A3,$DA,$8B,$CC,$DB,$8B,$B8,$DA   ;8B9169|        |      ;
                       db $8B,$D8,$DA,$8B,$2A,$DB,$8B       ;8B9171|        |      ;
 
         DATA8_8B9178:
                       db $01,$FF,$02,$04,$FF,$03,$05,$FF   ;8B9178|        |      ;
                       db $FF,$06,$FF,$FF,$00               ;8B9180|        |      ;
 
       CODE_FL_8B9185:
                       LDA.W $D4B3                          ;8B9185|ADB3D4  |7ED4B3;
                       BEQ +                                ;8B9188|F069    |8B91F3;
                       LDA.W #$D4B9                         ;8B918A|A9B9D4  |      ;
                       STA.B $96                            ;8B918D|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8B918F|2266A389|89A366;
                       LDA.W $D4B7                          ;8B9193|ADB7D4  |7ED4B7;
                       BPL ++                               ;8B9196|1037    |8B91CF;
                       LDA.W #$0138                         ;8B9198|A93801  |      ;
                       STA.B $CF                            ;8B919B|85CF    |0000CF;
                       LDA.W #$00A0                         ;8B919D|A9A000  |      ;
                       STA.B $D1                            ;8B91A0|85D1    |0000D1;
                       LDA.L $7ED4B5                        ;8B91A2|AFB5D47E|7ED4B5;
                       CMP.W #$000B                         ;8B91A6|C90B00  |      ;
                       BNE +++                              ;8B91A9|D012    |8B91BD;
                       LDA.L $7ED87B                        ;8B91AB|AF7BD87E|7ED87B;
                       BEQ +++                              ;8B91AF|F00C    |8B91BD;
                       LDA.W #$8900                         ;8B91B1|A90089  |      ;
                       STA.B $D6                            ;8B91B4|85D6    |0000D6;
                       LDA.W #$8900                         ;8B91B6|A90089  |      ;
                       STA.B $D5                            ;8B91B9|85D5    |0000D5;
                       BRA ++++                             ;8B91BB|800A    |8B91C7;
 
                   +++ LDA.W #$8100                         ;8B91BD|A90081  |      ;
                       STA.B $D6                            ;8B91C0|85D6    |0000D6;
                       LDA.W #$8000                         ;8B91C2|A90080  |      ;
                       STA.B $D5                            ;8B91C5|85D5    |0000D5;
 
                  ++++ LDA.W $D4BC                          ;8B91C7|ADBCD4  |7ED4BC;
                       JSR.W CODE_FN_8B90E3                 ;8B91CA|20E390  |8B90E3;
                       BRA +++                              ;8B91CD|800F    |8B91DE;
 
                    ++ LDA.W $D4B7                          ;8B91CF|ADB7D4  |7ED4B7;
                       LDX.W #$0D0E                         ;8B91D2|A20E0D  |      ;
                       LDY.W $D4BC                          ;8B91D5|ACBCD4  |7ED4BC;
                       JSL.L CODE_FL_86D5FB                 ;8B91D8|22FBD586|86D5FB;
                       BRA +++                              ;8B91DC|8000    |8B91DE;
 
                   +++ PHB                                  ;8B91DE|8B      |      ;
                       PHK                                  ;8B91DF|4B      |      ;
                       PLB                                  ;8B91E0|AB      |      ;
                       LDY.W #$91EB                         ;8B91E1|A0EB91  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B91E4|22CAA080|80A0CA;
                       PLB                                  ;8B91E8|AB      |      ;
                       BRA +                                ;8B91E9|8008    |8B91F3;
                       db $0E,$2D,$7E,$C8,$00,$80,$87,$7E   ;8B91EB|        |      ;
 
                     + RTL                                  ;8B91F3|6B      |      ;
 
       CODE_FN_8B91F4:
                       PHP                                  ;8B91F4|08      |      ;
                       REP #$20                             ;8B91F5|C220    |      ;
                       LDA.L $7ED1E4                        ;8B91F7|AFE4D17E|7ED1E4;
                       BIT.W #$0400                         ;8B91FB|890004  |      ;
                       BNE +                                ;8B91FE|D046    |8B9246;
                       LDA.W $D344                          ;8B9200|AD44D3  |7ED344;
                       STA.W $D250                          ;8B9203|8D50D2  |7ED250;
                       LSR A                                ;8B9206|4A      |      ;
                       EOR.W #$FFFF                         ;8B9207|49FFFF  |      ;
                       INC A                                ;8B920A|1A      |      ;
                       CLC                                  ;8B920B|18      |      ;
                       ADC.W #$0078                         ;8B920C|697800  |      ;
                       STA.W $D252                          ;8B920F|8D52D2  |7ED252;
                       STA.W $D346                          ;8B9212|8D46D3  |7ED346;
                       LDA.W $D1E4                          ;8B9215|ADE4D1  |7ED1E4;
                       BIT.W #$8000                         ;8B9218|890080  |      ;
                       BEQ ++                               ;8B921B|F00A    |8B9227;
                       LDA.W $D252                          ;8B921D|AD52D2  |7ED252;
                       CLC                                  ;8B9220|18      |      ;
                       ADC.W #$0010                         ;8B9221|691000  |      ;
                       STA.W $D252                          ;8B9224|8D52D2  |7ED252;
 
                    ++ LDA.W $D250                          ;8B9227|AD50D2  |7ED250;
                       SEC                                  ;8B922A|38      |      ;
                       SBC.W $D348                          ;8B922B|ED48D3  |7ED348;
                       STA.W $D250                          ;8B922E|8D50D2  |7ED250;
                       LDA.W $D252                          ;8B9231|AD52D2  |7ED252;
                       SEC                                  ;8B9234|38      |      ;
                       SBC.W $D34A                          ;8B9235|ED4AD3  |7ED34A;
                       STA.W $D252                          ;8B9238|8D52D2  |7ED252;
                       LDA.W $D252                          ;8B923B|AD52D2  |7ED252;
                       SEC                                  ;8B923E|38      |      ;
                       SBC.L $7ED272                        ;8B923F|EF72D27E|7ED272;
                       STA.W $D252                          ;8B9243|8D52D2  |7ED252;
 
                     + PLP                                  ;8B9246|28      |      ;
                       RTS                                  ;8B9247|60      |      ;
 
       CODE_FN_8B9248:
                       PHP                                  ;8B9248|08      |      ;
                       REP #$20                             ;8B9249|C220    |      ;
                       LDA.B $A9                            ;8B924B|A5A9    |0000A9;
                       BIT.W #$0001                         ;8B924D|890100  |      ;
                       BNE +                                ;8B9250|D003    |8B9255;
                       DEC.W $D264                          ;8B9252|CE64D2  |7ED264;
 
                     + LDA.B $A9                            ;8B9255|A5A9    |0000A9;
                       BIT.W #$0001                         ;8B9257|890100  |      ;
                       BNE +                                ;8B925A|D003    |8B925F;
                       INC.W $D262                          ;8B925C|EE62D2  |7ED262;
 
                     + PLP                                  ;8B925F|28      |      ;
                       RTS                                  ;8B9260|60      |      ;
 
       CODE_FN_8B9261:
                       PHP                                  ;8B9261|08      |      ;
                       SEP #$20                             ;8B9262|E220    |      ;
                       LDA.B #$80                           ;8B9264|A980    |      ;
                       STA.L $00021E                        ;8B9266|8F1E0200|00021E;
                       LDA.L $7ED272                        ;8B926A|AF72D27E|7ED272;
                       CLC                                  ;8B926E|18      |      ;
                       ADC.B #$0F                           ;8B926F|690F    |      ;
                       STA.L $000209                        ;8B9271|8F090200|000209;
                       PLP                                  ;8B9275|28      |      ;
                       RTS                                  ;8B9276|60      |      ;
 
       CODE_FL_8B9277:
                       PHP                                  ;8B9277|08      |      ;
                       PHB                                  ;8B9278|8B      |      ;
                       REP #$30                             ;8B9279|C230    |      ;
                       PHK                                  ;8B927B|4B      |      ;
                       PLB                                  ;8B927C|AB      |      ;
                       JSL.L CODE_FL_8B9A16                 ;8B927D|22169A8B|8B9A16;
                       SEP #$20                             ;8B9281|E220    |      ;
                       LDA.B #$43                           ;8B9283|A943    |      ;
                       STA.W DMA7PARAM                      ;8B9285|8D7043  |8B4370;
                       LDA.B #$21                           ;8B9288|A921    |      ;
                       STA.W DMA7REG                        ;8B928A|8D7143  |8B4371;
                       LDA.B #$09                           ;8B928D|A909    |      ;
                       STA.W DMA7ADDRL                      ;8B928F|8D7243  |8B4372;
                       LDA.B #$02                           ;8B9292|A902    |      ;
                       STA.W DMA7ADDRM                      ;8B9294|8D7343  |8B4373;
                       LDA.B #$00                           ;8B9297|A900    |      ;
                       STA.W DMA7ADDRH                      ;8B9299|8D7443  |8B4374;
                       LDA.B #$7E                           ;8B929C|A97E    |      ;
                       STA.W HDMA7BANK                      ;8B929E|8D7743  |8B4377;
                       REP #$20                             ;8B92A1|C220    |      ;
                       JSL.L CODE_FL_80B38F                 ;8B92A3|228FB380|80B38F;
                       SEP #$20                             ;8B92A7|E220    |      ;
                       LDX.W #$0006                         ;8B92A9|A20600  |      ;
 
                     - LDA.W DATA8_8B92BB,X                 ;8B92AC|BDBB92  |8B92BB;
                       STA.L $000209,X                      ;8B92AF|9F090200|000209;
                       DEX                                  ;8B92B3|CA      |      ;
                       BPL -                                ;8B92B4|10F6    |8B92AC;
                       REP #$20                             ;8B92B6|C220    |      ;
                       PLB                                  ;8B92B8|AB      |      ;
                       PLP                                  ;8B92B9|28      |      ;
                       RTL                                  ;8B92BA|6B      |      ;
 
         DATA8_8B92BB:
                       db $0F,$1C,$4C,$F8,$58,$4C,$00       ;8B92BB|        |      ;
 
       CODE_FL_8B92C2:
                       PHP                                  ;8B92C2|08      |      ;
                       SEP #$30                             ;8B92C3|E230    |      ;
                       LDA.L $7ED24E                        ;8B92C5|AF4ED27E|7ED24E;
                       STA.L $7ED220                        ;8B92C9|8F20D27E|7ED220;
                       LDA.L $7ED25C                        ;8B92CD|AF5CD27E|7ED25C;
                       STA.L $7ED230                        ;8B92D1|8F30D27E|7ED230;
                       BIT.B #$80                           ;8B92D5|8980    |      ;
                       BNE +                                ;8B92D7|D019    |8B92F2;
                       AND.B #$0F                           ;8B92D9|290F    |      ;
                       TAX                                  ;8B92DB|AA      |      ;
                       LDA.L DATA8_8B92E2,X                 ;8B92DC|BFE2928B|8B92E2;
                       BRA +                                ;8B92E0|8010    |8B92F2;
 
         DATA8_8B92E2:
                       db $00,$00,$01,$02,$03,$04,$05,$06   ;8B92E2|        |      ;
                       db $07,$07,$08,$08,$09,$09,$0A,$0A   ;8B92EA|        |      ;
 
                     + STA.L $7ED22E                        ;8B92F2|8F2ED27E|7ED22E;
                       REP #$30                             ;8B92F6|C230    |      ;
                       LDA.L $7ED250                        ;8B92F8|AF50D27E|7ED250;
                       STA.L $7ED222                        ;8B92FC|8F22D27E|7ED222;
                       LDA.L $7ED252                        ;8B9300|AF52D27E|7ED252;
                       STA.L $7ED224                        ;8B9304|8F24D27E|7ED224;
                       LDA.L $7ED254                        ;8B9308|AF54D27E|7ED254;
                       STA.L $7ED226                        ;8B930C|8F26D27E|7ED226;
                       LDA.L $7ED256                        ;8B9310|AF56D27E|7ED256;
                       SEC                                  ;8B9314|38      |      ;
                       SBC.L $7ED272                        ;8B9315|EF72D27E|7ED272;
                       STA.L $7ED228                        ;8B9319|8F28D27E|7ED228;
                       LDA.L $7ED258                        ;8B931D|AF58D27E|7ED258;
                       STA.L $7ED22A                        ;8B9321|8F2AD27E|7ED22A;
                       LDA.L $7ED25A                        ;8B9325|AF5AD27E|7ED25A;
                       SEC                                  ;8B9329|38      |      ;
                       SBC.L $7ED272                        ;8B932A|EF72D27E|7ED272;
                       STA.L $7ED22C                        ;8B932E|8F2CD27E|7ED22C;
                       LDA.L $7ED25E                        ;8B9332|AF5ED27E|7ED25E;
                       STA.L $7ED232                        ;8B9336|8F32D27E|7ED232;
                       LDA.L $7ED260                        ;8B933A|AF60D27E|7ED260;
                       STA.L $7ED234                        ;8B933E|8F34D27E|7ED234;
                       LDA.L $7ED262                        ;8B9342|AF62D27E|7ED262;
                       STA.L $7ED236                        ;8B9346|8F36D27E|7ED236;
                       LDA.L $7ED264                        ;8B934A|AF64D27E|7ED264;
                       STA.L $7ED238                        ;8B934E|8F38D27E|7ED238;
                       LDA.L $7ED266                        ;8B9352|AF66D27E|7ED266;
                       STA.L $7ED23A                        ;8B9356|8F3AD27E|7ED23A;
                       LDA.L $7ED268                        ;8B935A|AF68D27E|7ED268;
                       STA.L $7ED23C                        ;8B935E|8F3CD27E|7ED23C;
                       LDA.L $7ED272                        ;8B9362|AF72D27E|7ED272;
                       CLC                                  ;8B9366|18      |      ;
                       ADC.W #$000F                         ;8B9367|690F00  |      ;
                       STA.L $7ED246                        ;8B936A|8F46D27E|7ED246;
                       LDA.L $7ED272                        ;8B936E|AF72D27E|7ED272;
                       CLC                                  ;8B9372|18      |      ;
                       ADC.W #$0077                         ;8B9373|697700  |      ;
                       STA.L $7ED248                        ;8B9376|8F48D27E|7ED248;
                       LDA.L $7ED272                        ;8B937A|AF72D27E|7ED272;
                       CLC                                  ;8B937E|18      |      ;
                       ADC.W #$007D                         ;8B937F|697D00  |      ;
                       STA.L $7ED24A                        ;8B9382|8F4AD27E|7ED24A;
                       LDA.L $7ED272                        ;8B9386|AF72D27E|7ED272;
                       CLC                                  ;8B938A|18      |      ;
                       ADC.W #$0081                         ;8B938B|698100  |      ;
                       STA.L $7ED24C                        ;8B938E|8F4CD27E|7ED24C;
                       LDA.L $7ED26A                        ;8B9392|AF6AD27E|7ED26A;
                       STA.L $7ED23E                        ;8B9396|8F3ED27E|7ED23E;
                       LDA.L $7ED26C                        ;8B939A|AF6CD27E|7ED26C;
                       STA.L $7ED240                        ;8B939E|8F40D27E|7ED240;
                       LDA.L $7ED26E                        ;8B93A2|AF6ED27E|7ED26E;
                       STA.L $7ED242                        ;8B93A6|8F42D27E|7ED242;
                       LDA.L $7ED270                        ;8B93AA|AF70D27E|7ED270;
                       STA.L $7ED244                        ;8B93AE|8F44D27E|7ED244;
                       PLP                                  ;8B93B2|28      |      ;
                       RTL                                  ;8B93B3|6B      |      ;
 
       CODE_FL_8B93B4:
                       PHP                                  ;8B93B4|08      |      ;
                       PHB                                  ;8B93B5|8B      |      ;
                       SEP #$30                             ;8B93B6|E230    |      ;
                       PEA.W $8000                          ;8B93B8|F40080  |7E8000;
                       PLB                                  ;8B93BB|AB      |      ;
                       PLB                                  ;8B93BC|AB      |      ;
                       LDA.B #$80                           ;8B93BD|A980    |      ;
                       STA.W $01B6                          ;8B93BF|8DB601  |8001B6;
                       LDA.B #$00                           ;8B93C2|A900    |      ;
                       STA.W $01B7                          ;8B93C4|8DB701  |8001B7;
                       LDA.B #$09                           ;8B93C7|A909    |      ;
                       STA.W $01BA                          ;8B93C9|8DBA01  |8001BA;
                       LDA.B #$00                           ;8B93CC|A900    |      ;
                       STA.W $01BB                          ;8B93CE|8DBB01  |8001BB;
                       LDA.B #$71                           ;8B93D1|A971    |      ;
                       STA.W $01BC                          ;8B93D3|8DBC01  |8001BC;
                       LDA.B #$79                           ;8B93D6|A979    |      ;
                       STA.W $01BD                          ;8B93D8|8DBD01  |8001BD;
                       LDA.B #$68                           ;8B93DB|A968    |      ;
                       STA.W $01BE                          ;8B93DD|8DBE01  |8001BE;
                       STA.W $01BF                          ;8B93E0|8DBF01  |8001BF;
                       LDA.B #$22                           ;8B93E3|A922    |      ;
                       STA.W $01C0                          ;8B93E5|8DC001  |8001C0;
                       LDA.B #$66                           ;8B93E8|A966    |      ;
                       STA.W $01C1                          ;8B93EA|8DC101  |8001C1;
                       REP #$20                             ;8B93ED|C220    |      ;
                       STZ.W $01CB                          ;8B93EF|9CCB01  |8001CB;
                       STZ.W $01CD                          ;8B93F2|9CCD01  |8001CD;
                       STZ.W $01CF                          ;8B93F5|9CCF01  |8001CF;
                       STZ.W $01D1                          ;8B93F8|9CD101  |8001D1;
                       STZ.W $01D3                          ;8B93FB|9CD301  |8001D3;
                       STZ.W $01D5                          ;8B93FE|9CD501  |8001D5;
                       STZ.W $01D7                          ;8B9401|9CD701  |8001D7;
                       STZ.W $01D9                          ;8B9404|9CD901  |8001D9;
                       SEP #$20                             ;8B9407|E220    |      ;
                       STZ.W BG1HOFS                        ;8B9409|9C0D21  |80210D;
                       STZ.W BG1HOFS                        ;8B940C|9C0D21  |80210D;
                       STZ.W _BG1VOFS                       ;8B940F|9C0E21  |80210E;
                       STZ.W _BG1VOFS                       ;8B9412|9C0E21  |80210E;
                       STZ.W BG2HOFS                        ;8B9415|9C0F21  |80210F;
                       STZ.W BG2HOFS                        ;8B9418|9C0F21  |80210F;
                       STZ.W BG2VOFS                        ;8B941B|9C1021  |802110;
                       STZ.W BG2VOFS                        ;8B941E|9C1021  |802110;
                       STZ.W BG3HOFS                        ;8B9421|9C1121  |802111;
                       STZ.W BG3HOFS                        ;8B9424|9C1121  |802111;
                       STZ.W BG3VOFS                        ;8B9427|9C1221  |802112;
                       STZ.W BG3VOFS                        ;8B942A|9C1221  |802112;
                       STZ.W BG4HOFS                        ;8B942D|9C1321  |802113;
                       STZ.W BG4HOFS                        ;8B9430|9C1321  |802113;
                       STZ.W BG4VOFS                        ;8B9433|9C1421  |802114;
                       STZ.W BG4VOFS                        ;8B9436|9C1421  |802114;
                       STZ.W VMAINC                         ;8B9439|9C1521  |802115;
                       STZ.W $01C2                          ;8B943C|9CC201  |8001C2;
                       STZ.W $01C3                          ;8B943F|9CC301  |8001C3;
                       STZ.W $01C4                          ;8B9442|9CC401  |8001C4;
                       STZ.W $01C5                          ;8B9445|9CC501  |8001C5;
                       STZ.W $01C6                          ;8B9448|9CC601  |8001C6;
                       STZ.W $01C7                          ;8B944B|9CC701  |8001C7;
                       STZ.W $01C8                          ;8B944E|9CC801  |8001C8;
                       STZ.W $01C9                          ;8B9451|9CC901  |8001C9;
                       STZ.W $01CA                          ;8B9454|9CCA01  |8001CA;
                       STZ.W $01DB                          ;8B9457|9CDB01  |8001DB;
                       STZ.W $01DC                          ;8B945A|9CDC01  |8001DC;
                       STZ.W $01DD                          ;8B945D|9CDD01  |8001DD;
                       STZ.W $01DE                          ;8B9460|9CDE01  |8001DE;
                       STZ.W $01DF                          ;8B9463|9CDF01  |8001DF;
                       STZ.W $01E0                          ;8B9466|9CE001  |8001E0;
                       STZ.W $01E1                          ;8B9469|9CE101  |8001E1;
                       LDA.B #$13                           ;8B946C|A913    |      ;
                       STA.W $01E2                          ;8B946E|8DE201  |8001E2;
                       STZ.W $01E4                          ;8B9471|9CE401  |8001E4;
                       LDA.B #$00                           ;8B9474|A900    |      ;
                       STA.W $01E3                          ;8B9476|8DE301  |8001E3;
                       STZ.W $01E5                          ;8B9479|9CE501  |8001E5;
                       STZ.W CGADD                          ;8B947C|9C2121  |802121;
                       STZ.W CGSWSEL                        ;8B947F|9C3021  |802130;
                       STZ.W $01E6                          ;8B9482|9CE601  |8001E6;
                       STZ.W CGADSUB                        ;8B9485|9C3121  |802131;
                       STZ.W $01E7                          ;8B9488|9CE701  |8001E7;
                       STZ.W $01E8                          ;8B948B|9CE801  |8001E8;
                       STZ.W $01E9                          ;8B948E|9CE901  |8001E9;
                       STZ.W $01EA                          ;8B9491|9CEA01  |8001EA;
                       LDA.B #$E0                           ;8B9494|A9E0    |      ;
                       STA.W COLDATA                        ;8B9496|8D3221  |802132;
                       LDA.B #$00                           ;8B9499|A900    |      ;
                       STA.W $01EB                          ;8B949B|8DEB01  |8001EB;
                       LDA.B #$81                           ;8B949E|A981    |      ;
                       STA.W $01EC                          ;8B94A0|8DEC01  |8001EC;
                       JSL.L CODE_FL_80A145                 ;8B94A3|2245A180|80A145;
                       LDA.B #$30                           ;8B94A7|A930    |      ;
                       STA.W $01DB                          ;8B94A9|8DDB01  |8001DB;
                       LDA.B #$A0                           ;8B94AC|A9A0    |      ;
                       STA.W $01E6                          ;8B94AE|8DE601  |8001E6;
                       LDA.B #$08                           ;8B94B1|A908    |      ;
                       STA.W $01DC                          ;8B94B3|8DDC01  |8001DC;
                       LDA.B #$F7                           ;8B94B6|A9F7    |      ;
                       STA.W $01DD                          ;8B94B8|8DDD01  |8001DD;
                       LDA.B #$13                           ;8B94BB|A913    |      ;
                       STA.L $7ED26A                        ;8B94BD|8F6AD27E|7ED26A;
                       LDA.B #$00                           ;8B94C1|A900    |      ;
                       STA.L $7ED26C                        ;8B94C3|8F6CD27E|7ED26C;
                       LDA.B #$A0                           ;8B94C7|A9A0    |      ;
                       STA.L $7ED26E                        ;8B94C9|8F6ED27E|7ED26E;
                       LDA.B #$00                           ;8B94CD|A900    |      ;
                       STA.L $7ED270                        ;8B94CF|8F70D27E|7ED270;
                       PLB                                  ;8B94D3|AB      |      ;
                       PLP                                  ;8B94D4|28      |      ;
                       RTL                                  ;8B94D5|6B      |      ;
 
       CODE_FL_8B94D6:
                       PHP                                  ;8B94D6|08      |      ;
                       REP #$30                             ;8B94D7|C230    |      ;
                       PHB                                  ;8B94D9|8B      |      ;
                       PHX                                  ;8B94DA|DA      |      ;
                       PEA.W $7E00                          ;8B94DB|F4007E  |807E00;
                       PLB                                  ;8B94DE|AB      |      ;
                       PLB                                  ;8B94DF|AB      |      ;
                       SEP #$20                             ;8B94E0|E220    |      ;
                       LDX.W #$003F                         ;8B94E2|A23F00  |      ;
 
                     - STZ.W $D1E0,X                        ;8B94E5|9EE0D1  |7ED1E0;
                       DEX                                  ;8B94E8|CA      |      ;
                       BPL -                                ;8B94E9|10FA    |8B94E5;
                       REP #$30                             ;8B94EB|C230    |      ;
                       PLX                                  ;8B94ED|FA      |      ;
                       PLB                                  ;8B94EE|AB      |      ;
                       PLP                                  ;8B94EF|28      |      ;
                       RTL                                  ;8B94F0|6B      |      ;
 
       CODE_FL_8B94F1:
                       PHP                                  ;8B94F1|08      |      ;
                       REP #$30                             ;8B94F2|C230    |      ;
                       PHB                                  ;8B94F4|8B      |      ;
                       PHX                                  ;8B94F5|DA      |      ;
                       PEA.W $7E00                          ;8B94F6|F4007E  |897E00;
                       PLB                                  ;8B94F9|AB      |      ;
                       PLB                                  ;8B94FA|AB      |      ;
                       SEP #$20                             ;8B94FB|E220    |      ;
                       LDX.W #$06FF                         ;8B94FD|A2FF06  |      ;
 
                     - STZ.W $D220,X                        ;8B9500|9E20D2  |7ED220;
                       DEX                                  ;8B9503|CA      |      ;
                       BPL -                                ;8B9504|10FA    |8B9500;
                       REP #$30                             ;8B9506|C230    |      ;
                       PLX                                  ;8B9508|FA      |      ;
                       PLB                                  ;8B9509|AB      |      ;
                       PLP                                  ;8B950A|28      |      ;
                       RTL                                  ;8B950B|6B      |      ;
 
       CODE_FL_8B950C:
                       PHP                                  ;8B950C|08      |      ;
                       PHB                                  ;8B950D|8B      |      ;
                       SEP #$30                             ;8B950E|E230    |      ;
                       PHK                                  ;8B9510|4B      |      ;
                       PLB                                  ;8B9511|AB      |      ;
                       AND.B #$03                           ;8B9512|2903    |      ;
                       TAY                                  ;8B9514|A8      |      ;
                       LDX.W DATA8_8B9539,Y                 ;8B9515|BE3995  |8B9539;
                       REP #$20                             ;8B9518|C220    |      ;
                       LDA.W DATA8_8B953D,X                 ;8B951A|BD3D95  |8B953D;
                       STA.L $7E89D8                        ;8B951D|8FD8897E|7E89D8;
                       LDA.W DATA8_8B953F,X                 ;8B9521|BD3F95  |8B953F;
                       STA.L $7E89DA                        ;8B9524|8FDA897E|7E89DA;
                       LDA.W DATA8_8B9541,X                 ;8B9528|BD4195  |8B9541;
                       STA.L $7E89DC                        ;8B952B|8FDC897E|7E89DC;
                       LDA.W DATA8_8B9543,X                 ;8B952F|BD4395  |8B9543;
                       STA.L $7E89DE                        ;8B9532|8FDE897E|7E89DE;
                       PLB                                  ;8B9536|AB      |      ;
                       PLP                                  ;8B9537|28      |      ;
                       RTL                                  ;8B9538|6B      |      ;
 
         DATA8_8B9539:
                       db $00,$08,$10,$18                   ;8B9539|        |      ;
 
         DATA8_8B953D:
                       db $6F,$7E                           ;8B953D|        |      ;
 
         DATA8_8B953F:
                       db $2C,$7E                           ;8B953F|        |      ;
 
         DATA8_8B9541:
                       db $E8,$6D                           ;8B9541|        |      ;
 
         DATA8_8B9543:
                       db $A5,$61,$7B,$2E,$1B,$22,$DB,$1D   ;8B9543|        |      ;
                       db $9A,$21,$BD,$6D,$7B,$65,$38,$59   ;8B954B|        |      ;
                       db $F6,$50,$1F,$00,$18,$00,$10,$00   ;8B9553|        |      ;
                       db $08,$00                           ;8B955B|        |      ;
 
       CODE_FL_8B955D:
                       PHP                                  ;8B955D|08      |      ;
                       PHB                                  ;8B955E|8B      |      ;
                       REP #$30                             ;8B955F|C230    |      ;
                       PEA.W $7E00                          ;8B9561|F4007E  |8B7E00;
                       PLB                                  ;8B9564|AB      |      ;
                       PLB                                  ;8B9565|AB      |      ;
                       AND.W #$0003                         ;8B9566|290300  |      ;
                       ASL A                                ;8B9569|0A      |      ;
                       TAX                                  ;8B956A|AA      |      ;
                       JMP.W (DATA8_8B956E,X)               ;8B956B|7C6E95  |8B956E;
 
         DATA8_8B956E:
                       db $76,$95,$8B,$95,$A0,$95,$A0,$95   ;8B956E|        |      ;
                       LDY.W #$054C                         ;8B9576|A04C05  |      ;
                       JSR.W CODE_FN_8B95B8                 ;8B9579|20B895  |8B95B8;
                       LDY.W #$055A                         ;8B957C|A05A05  |      ;
                       JSR.W CODE_FN_8B95D9                 ;8B957F|20D995  |8B95D9;
                       LDY.W #$0568                         ;8B9582|A06805  |      ;
                       JSR.W CODE_FN_8B95D9                 ;8B9585|20D995  |8B95D9;
                       JMP.W CODE_JP_8B95B5                 ;8B9588|4CB595  |8B95B5;
                       LDY.W #$054C                         ;8B958B|A04C05  |      ;
                       JSR.W CODE_FN_8B95D9                 ;8B958E|20D995  |8B95D9;
                       LDY.W #$055A                         ;8B9591|A05A05  |      ;
                       JSR.W CODE_FN_8B95B8                 ;8B9594|20B895  |8B95B8;
                       LDY.W #$0568                         ;8B9597|A06805  |      ;
                       JSR.W CODE_FN_8B95D9                 ;8B959A|20D995  |8B95D9;
                       JMP.W CODE_JP_8B95B5                 ;8B959D|4CB595  |8B95B5;
                       LDY.W #$054C                         ;8B95A0|A04C05  |      ;
                       JSR.W CODE_FN_8B95D9                 ;8B95A3|20D995  |8B95D9;
                       LDY.W #$055A                         ;8B95A6|A05A05  |      ;
                       JSR.W CODE_FN_8B95D9                 ;8B95A9|20D995  |8B95D9;
                       LDY.W #$0568                         ;8B95AC|A06805  |      ;
                       JSR.W CODE_FN_8B95B8                 ;8B95AF|20B895  |8B95B8;
                       JMP.W CODE_JP_8B95B5                 ;8B95B2|4CB595  |8B95B5;
 
       CODE_JP_8B95B5:
                       PLB                                  ;8B95B5|AB      |      ;
                       PLP                                  ;8B95B6|28      |      ;
                       RTL                                  ;8B95B7|6B      |      ;
 
       CODE_FN_8B95B8:
                       LDX.W #$0006                         ;8B95B8|A20600  |      ;
 
                     - LDA.W $2000,Y                        ;8B95BB|B90020  |7E2000;
                       AND.W #$E3FF                         ;8B95BE|29FFE3  |      ;
                       ORA.W #$0400                         ;8B95C1|090004  |      ;
                       STA.W $2000,Y                        ;8B95C4|990020  |7E2000;
                       LDA.W $2040,Y                        ;8B95C7|B94020  |7E2040;
                       AND.W #$E3FF                         ;8B95CA|29FFE3  |      ;
                       ORA.W #$0400                         ;8B95CD|090004  |      ;
                       STA.W $2040,Y                        ;8B95D0|994020  |7E2040;
                       INY                                  ;8B95D3|C8      |      ;
                       INY                                  ;8B95D4|C8      |      ;
                       DEX                                  ;8B95D5|CA      |      ;
                       BNE -                                ;8B95D6|D0E3    |8B95BB;
                       RTS                                  ;8B95D8|60      |      ;
 
       CODE_FN_8B95D9:
                       LDX.W #$0006                         ;8B95D9|A20600  |      ;
 
                     - LDA.W $2000,Y                        ;8B95DC|B90020  |7E2000;
                       AND.W #$E3FF                         ;8B95DF|29FFE3  |      ;
                       ORA.W #$0800                         ;8B95E2|090008  |      ;
                       STA.W $2000,Y                        ;8B95E5|990020  |7E2000;
                       LDA.W $2040,Y                        ;8B95E8|B94020  |7E2040;
                       AND.W #$E3FF                         ;8B95EB|29FFE3  |      ;
                       ORA.W #$0800                         ;8B95EE|090008  |      ;
                       STA.W $2040,Y                        ;8B95F1|994020  |7E2040;
                       INY                                  ;8B95F4|C8      |      ;
                       INY                                  ;8B95F5|C8      |      ;
                       DEX                                  ;8B95F6|CA      |      ;
                       BNE -                                ;8B95F7|D0E3    |8B95DC;
                       RTS                                  ;8B95F9|60      |      ;
 
       CODE_FL_8B95FA:
                       PHP                                  ;8B95FA|08      |      ;
                       REP #$30                             ;8B95FB|C230    |      ;
                       PHA                                  ;8B95FD|48      |      ;
                       PHX                                  ;8B95FE|DA      |      ;
                       PHY                                  ;8B95FF|5A      |      ;
                       PHB                                  ;8B9600|8B      |      ;
                       PHK                                  ;8B9601|4B      |      ;
                       PLB                                  ;8B9602|AB      |      ;
                       LDY.W #$960D                         ;8B9603|A00D96  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9606|22CAA080|80A0CA;
                       PLB                                  ;8B960A|AB      |      ;
                       BRA +                                ;8B960B|8008    |8B9615;
                       db $80,$74,$7F,$14,$00,$80,$4B,$72   ;8B960D|        |      ;
 
                     + PHB                                  ;8B9615|8B      |      ;
                       PHK                                  ;8B9616|4B      |      ;
                       PLB                                  ;8B9617|AB      |      ;
                       LDY.W #$9622                         ;8B9618|A02296  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B961B|22CAA080|80A0CA;
                       PLB                                  ;8B961F|AB      |      ;
                       BRA +                                ;8B9620|8008    |8B962A;
                       db $C0,$74,$7F,$14,$00,$80,$6B,$72   ;8B9622|        |      ;
 
                     + PHB                                  ;8B962A|8B      |      ;
                       PHK                                  ;8B962B|4B      |      ;
                       PLB                                  ;8B962C|AB      |      ;
                       LDY.W #$9637                         ;8B962D|A03796  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9630|22CAA080|80A0CA;
                       PLB                                  ;8B9634|AB      |      ;
                       BRA +                                ;8B9635|8008    |8B963F;
                       db $00,$75,$7F,$14,$00,$80,$8B,$72   ;8B9637|        |      ;
 
                     + PHB                                  ;8B963F|8B      |      ;
                       PHK                                  ;8B9640|4B      |      ;
                       PLB                                  ;8B9641|AB      |      ;
                       LDY.W #$964C                         ;8B9642|A04C96  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9645|22CAA080|80A0CA;
                       PLB                                  ;8B9649|AB      |      ;
                       BRA +                                ;8B964A|8008    |8B9654;
                       db $40,$75,$7F,$14,$00,$80,$AB,$72   ;8B964C|        |      ;
 
                     + PHB                                  ;8B9654|8B      |      ;
                       PHK                                  ;8B9655|4B      |      ;
                       PLB                                  ;8B9656|AB      |      ;
                       LDY.W #$9661                         ;8B9657|A06196  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B965A|22CAA080|80A0CA;
                       PLB                                  ;8B965E|AB      |      ;
                       BRA +                                ;8B965F|8008    |8B9669;
                       db $80,$75,$7F,$14,$00,$80,$CB,$72   ;8B9661|        |      ;
 
                     + PHB                                  ;8B9669|8B      |      ;
                       PHK                                  ;8B966A|4B      |      ;
                       PLB                                  ;8B966B|AB      |      ;
                       LDY.W #$9676                         ;8B966C|A07696  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B966F|22CAA080|80A0CA;
                       PLB                                  ;8B9673|AB      |      ;
                       BRA +                                ;8B9674|8008    |8B967E;
                       db $C0,$75,$7F,$14,$00,$80,$EB,$72   ;8B9676|        |      ;
 
                     + PHB                                  ;8B967E|8B      |      ;
                       PHK                                  ;8B967F|4B      |      ;
                       PLB                                  ;8B9680|AB      |      ;
                       LDY.W #$968B                         ;8B9681|A08B96  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9684|22CAA080|80A0CA;
                       PLB                                  ;8B9688|AB      |      ;
                       BRA +                                ;8B9689|8008    |8B9693;
                       db $00,$76,$7F,$14,$00,$80,$0B,$73   ;8B968B|        |      ;
 
                     + PHB                                  ;8B9693|8B      |      ;
                       PHK                                  ;8B9694|4B      |      ;
                       PLB                                  ;8B9695|AB      |      ;
                       LDY.W #$96A0                         ;8B9696|A0A096  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9699|22CAA080|80A0CA;
                       PLB                                  ;8B969D|AB      |      ;
                       BRA +                                ;8B969E|8008    |8B96A8;
                       db $40,$76,$7F,$14,$00,$80,$2B,$73   ;8B96A0|        |      ;
 
                     + PHB                                  ;8B96A8|8B      |      ;
                       PHK                                  ;8B96A9|4B      |      ;
                       PLB                                  ;8B96AA|AB      |      ;
                       LDY.W #$96B5                         ;8B96AB|A0B596  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B96AE|22CAA080|80A0CA;
                       PLB                                  ;8B96B2|AB      |      ;
                       BRA +                                ;8B96B3|8008    |8B96BD;
                       db $80,$76,$7F,$14,$00,$80,$4B,$73   ;8B96B5|        |      ;
 
                     + PHB                                  ;8B96BD|8B      |      ;
                       PHK                                  ;8B96BE|4B      |      ;
                       PLB                                  ;8B96BF|AB      |      ;
                       LDY.W #$96CA                         ;8B96C0|A0CA96  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B96C3|22CAA080|80A0CA;
                       PLB                                  ;8B96C7|AB      |      ;
                       BRA +                                ;8B96C8|8008    |8B96D2;
                       db $C0,$76,$7F,$14,$00,$80,$6B,$73   ;8B96CA|        |      ;
 
                     + PHB                                  ;8B96D2|8B      |      ;
                       PHK                                  ;8B96D3|4B      |      ;
                       PLB                                  ;8B96D4|AB      |      ;
                       LDY.W #$96DF                         ;8B96D5|A0DF96  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B96D8|22CAA080|80A0CA;
                       PLB                                  ;8B96DC|AB      |      ;
                       BRA +                                ;8B96DD|8008    |8B96E7;
                       db $00,$77,$7F,$14,$00,$80,$8B,$73   ;8B96DF|        |      ;
 
                     + PHB                                  ;8B96E7|8B      |      ;
                       PHK                                  ;8B96E8|4B      |      ;
                       PLB                                  ;8B96E9|AB      |      ;
                       LDY.W #$96F4                         ;8B96EA|A0F496  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B96ED|22CAA080|80A0CA;
                       PLB                                  ;8B96F1|AB      |      ;
                       BRA +                                ;8B96F2|8008    |8B96FC;
                       db $40,$77,$7F,$14,$00,$80,$AB,$73   ;8B96F4|        |      ;
 
                     + PLY                                  ;8B96FC|7A      |      ;
                       PLX                                  ;8B96FD|FA      |      ;
                       PLA                                  ;8B96FE|68      |      ;
                       PLP                                  ;8B96FF|28      |      ;
                       RTL                                  ;8B9700|6B      |      ;
 
       CODE_FL_8B9701:
                       PHP                                  ;8B9701|08      |      ;
                       REP #$30                             ;8B9702|C230    |      ;
                       PHA                                  ;8B9704|48      |      ;
                       PHX                                  ;8B9705|DA      |      ;
                       PHY                                  ;8B9706|5A      |      ;
                       PHB                                  ;8B9707|8B      |      ;
                       PHK                                  ;8B9708|4B      |      ;
                       PLB                                  ;8B9709|AB      |      ;
                       LDY.W #$9714                         ;8B970A|A01497  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B970D|22CAA080|80A0CA;
                       PLB                                  ;8B9711|AB      |      ;
                       BRA +                                ;8B9712|8008    |8B971C;
                       db $94,$74,$7F,$14,$00,$80,$4B,$72   ;8B9714|        |      ;
 
                     + PHB                                  ;8B971C|8B      |      ;
                       PHK                                  ;8B971D|4B      |      ;
                       PLB                                  ;8B971E|AB      |      ;
                       LDY.W #$9729                         ;8B971F|A02997  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9722|22CAA080|80A0CA;
                       PLB                                  ;8B9726|AB      |      ;
                       BRA +                                ;8B9727|8008    |8B9731;
                       db $D4,$74,$7F,$14,$00,$80,$6B,$72   ;8B9729|        |      ;
 
                     + PHB                                  ;8B9731|8B      |      ;
                       PHK                                  ;8B9732|4B      |      ;
                       PLB                                  ;8B9733|AB      |      ;
                       LDY.W #$973E                         ;8B9734|A03E97  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9737|22CAA080|80A0CA;
                       PLB                                  ;8B973B|AB      |      ;
                       BRA +                                ;8B973C|8008    |8B9746;
                       db $14,$75,$7F,$14,$00,$80,$8B,$72   ;8B973E|        |      ;
 
                     + PHB                                  ;8B9746|8B      |      ;
                       PHK                                  ;8B9747|4B      |      ;
                       PLB                                  ;8B9748|AB      |      ;
                       LDY.W #$9753                         ;8B9749|A05397  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B974C|22CAA080|80A0CA;
                       PLB                                  ;8B9750|AB      |      ;
                       BRA +                                ;8B9751|8008    |8B975B;
                       db $54,$75,$7F,$14,$00,$80,$AB,$72   ;8B9753|        |      ;
 
                     + PHB                                  ;8B975B|8B      |      ;
                       PHK                                  ;8B975C|4B      |      ;
                       PLB                                  ;8B975D|AB      |      ;
                       LDY.W #$9768                         ;8B975E|A06897  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9761|22CAA080|80A0CA;
                       PLB                                  ;8B9765|AB      |      ;
                       BRA +                                ;8B9766|8008    |8B9770;
                       db $94,$75,$7F,$14,$00,$80,$CB,$72   ;8B9768|        |      ;
 
                     + PHB                                  ;8B9770|8B      |      ;
                       PHK                                  ;8B9771|4B      |      ;
                       PLB                                  ;8B9772|AB      |      ;
                       LDY.W #$977D                         ;8B9773|A07D97  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9776|22CAA080|80A0CA;
                       PLB                                  ;8B977A|AB      |      ;
                       BRA +                                ;8B977B|8008    |8B9785;
                       db $D4,$75,$7F,$14,$00,$80,$EB,$72   ;8B977D|        |      ;
 
                     + PHB                                  ;8B9785|8B      |      ;
                       PHK                                  ;8B9786|4B      |      ;
                       PLB                                  ;8B9787|AB      |      ;
                       LDY.W #$9792                         ;8B9788|A09297  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B978B|22CAA080|80A0CA;
                       PLB                                  ;8B978F|AB      |      ;
                       BRA +                                ;8B9790|8008    |8B979A;
                       db $14,$76,$7F,$14,$00,$80,$0B,$73   ;8B9792|        |      ;
 
                     + PHB                                  ;8B979A|8B      |      ;
                       PHK                                  ;8B979B|4B      |      ;
                       PLB                                  ;8B979C|AB      |      ;
                       LDY.W #$97A7                         ;8B979D|A0A797  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B97A0|22CAA080|80A0CA;
                       PLB                                  ;8B97A4|AB      |      ;
                       BRA +                                ;8B97A5|8008    |8B97AF;
                       db $54,$76,$7F,$14,$00,$80,$2B,$73   ;8B97A7|        |      ;
 
                     + PHB                                  ;8B97AF|8B      |      ;
                       PHK                                  ;8B97B0|4B      |      ;
                       PLB                                  ;8B97B1|AB      |      ;
                       LDY.W #$97BC                         ;8B97B2|A0BC97  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B97B5|22CAA080|80A0CA;
                       PLB                                  ;8B97B9|AB      |      ;
                       BRA +                                ;8B97BA|8008    |8B97C4;
                       db $94,$76,$7F,$14,$00,$80,$4B,$73   ;8B97BC|        |      ;
 
                     + PHB                                  ;8B97C4|8B      |      ;
                       PHK                                  ;8B97C5|4B      |      ;
                       PLB                                  ;8B97C6|AB      |      ;
                       LDY.W #$97D1                         ;8B97C7|A0D197  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B97CA|22CAA080|80A0CA;
                       PLB                                  ;8B97CE|AB      |      ;
                       BRA +                                ;8B97CF|8008    |8B97D9;
                       db $D4,$76,$7F,$14,$00,$80,$6B,$73   ;8B97D1|        |      ;
 
                     + PHB                                  ;8B97D9|8B      |      ;
                       PHK                                  ;8B97DA|4B      |      ;
                       PLB                                  ;8B97DB|AB      |      ;
                       LDY.W #$97E6                         ;8B97DC|A0E697  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B97DF|22CAA080|80A0CA;
                       PLB                                  ;8B97E3|AB      |      ;
                       BRA +                                ;8B97E4|8008    |8B97EE;
                       db $14,$77,$7F,$14,$00,$80,$8B,$73   ;8B97E6|        |      ;
 
                     + PHB                                  ;8B97EE|8B      |      ;
                       PHK                                  ;8B97EF|4B      |      ;
                       PLB                                  ;8B97F0|AB      |      ;
                       LDY.W #$97FB                         ;8B97F1|A0FB97  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B97F4|22CAA080|80A0CA;
                       PLB                                  ;8B97F8|AB      |      ;
                       BRA +                                ;8B97F9|8008    |8B9803;
                       db $54,$77,$7F,$14,$00,$80,$AB,$73   ;8B97FB|        |      ;
 
                     + PLY                                  ;8B9803|7A      |      ;
                       PLX                                  ;8B9804|FA      |      ;
                       PLA                                  ;8B9805|68      |      ;
                       PLP                                  ;8B9806|28      |      ;
                       RTL                                  ;8B9807|6B      |      ;
 
       CODE_FL_8B9808:
                       PHP                                  ;8B9808|08      |      ;
                       REP #$30                             ;8B9809|C230    |      ;
                       PHA                                  ;8B980B|48      |      ;
                       PHX                                  ;8B980C|DA      |      ;
                       PHY                                  ;8B980D|5A      |      ;
                       PHB                                  ;8B980E|8B      |      ;
                       PHK                                  ;8B980F|4B      |      ;
                       PLB                                  ;8B9810|AB      |      ;
                       LDY.W #$981B                         ;8B9811|A01B98  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9814|22CAA080|80A0CA;
                       PLB                                  ;8B9818|AB      |      ;
                       BRA +                                ;8B9819|8008    |8B9823;
                       db $80,$7C,$7F,$14,$00,$80,$4B,$74   ;8B981B|        |      ;
 
                     + PHB                                  ;8B9823|8B      |      ;
                       PHK                                  ;8B9824|4B      |      ;
                       PLB                                  ;8B9825|AB      |      ;
                       LDY.W #$9830                         ;8B9826|A03098  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9829|22CAA080|80A0CA;
                       PLB                                  ;8B982D|AB      |      ;
                       BRA +                                ;8B982E|8008    |8B9838;
                       db $C0,$7C,$7F,$14,$00,$80,$6B,$74   ;8B9830|        |      ;
 
                     + PHB                                  ;8B9838|8B      |      ;
                       PHK                                  ;8B9839|4B      |      ;
                       PLB                                  ;8B983A|AB      |      ;
                       LDY.W #$9845                         ;8B983B|A04598  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B983E|22CAA080|80A0CA;
                       PLB                                  ;8B9842|AB      |      ;
                       BRA +                                ;8B9843|8008    |8B984D;
                       db $00,$7D,$7F,$14,$00,$80,$8B,$74   ;8B9845|        |      ;
 
                     + PHB                                  ;8B984D|8B      |      ;
                       PHK                                  ;8B984E|4B      |      ;
                       PLB                                  ;8B984F|AB      |      ;
                       LDY.W #$985A                         ;8B9850|A05A98  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9853|22CAA080|80A0CA;
                       PLB                                  ;8B9857|AB      |      ;
                       BRA +                                ;8B9858|8008    |8B9862;
                       db $40,$7D,$7F,$14,$00,$80,$AB,$74   ;8B985A|        |      ;
 
                     + PHB                                  ;8B9862|8B      |      ;
                       PHK                                  ;8B9863|4B      |      ;
                       PLB                                  ;8B9864|AB      |      ;
                       LDY.W #$986F                         ;8B9865|A06F98  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9868|22CAA080|80A0CA;
                       PLB                                  ;8B986C|AB      |      ;
                       BRA +                                ;8B986D|8008    |8B9877;
                       db $80,$7D,$7F,$14,$00,$80,$CB,$74   ;8B986F|        |      ;
 
                     + PHB                                  ;8B9877|8B      |      ;
                       PHK                                  ;8B9878|4B      |      ;
                       PLB                                  ;8B9879|AB      |      ;
                       LDY.W #$9884                         ;8B987A|A08498  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B987D|22CAA080|80A0CA;
                       PLB                                  ;8B9881|AB      |      ;
                       BRA +                                ;8B9882|8008    |8B988C;
                       db $C0,$7D,$7F,$14,$00,$80,$EB,$74   ;8B9884|        |      ;
 
                     + PHB                                  ;8B988C|8B      |      ;
                       PHK                                  ;8B988D|4B      |      ;
                       PLB                                  ;8B988E|AB      |      ;
                       LDY.W #$9899                         ;8B988F|A09998  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9892|22CAA080|80A0CA;
                       PLB                                  ;8B9896|AB      |      ;
                       BRA +                                ;8B9897|8008    |8B98A1;
                       db $00,$7E,$7F,$14,$00,$80,$0B,$75   ;8B9899|        |      ;
 
                     + PHB                                  ;8B98A1|8B      |      ;
                       PHK                                  ;8B98A2|4B      |      ;
                       PLB                                  ;8B98A3|AB      |      ;
                       LDY.W #$98AE                         ;8B98A4|A0AE98  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B98A7|22CAA080|80A0CA;
                       PLB                                  ;8B98AB|AB      |      ;
                       BRA +                                ;8B98AC|8008    |8B98B6;
                       db $40,$7E,$7F,$14,$00,$80,$2B,$75   ;8B98AE|        |      ;
 
                     + PHB                                  ;8B98B6|8B      |      ;
                       PHK                                  ;8B98B7|4B      |      ;
                       PLB                                  ;8B98B8|AB      |      ;
                       LDY.W #$98C3                         ;8B98B9|A0C398  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B98BC|22CAA080|80A0CA;
                       PLB                                  ;8B98C0|AB      |      ;
                       BRA +                                ;8B98C1|8008    |8B98CB;
                       db $80,$7E,$7F,$14,$00,$80,$4B,$75   ;8B98C3|        |      ;
 
                     + PHB                                  ;8B98CB|8B      |      ;
                       PHK                                  ;8B98CC|4B      |      ;
                       PLB                                  ;8B98CD|AB      |      ;
                       LDY.W #$98D8                         ;8B98CE|A0D898  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B98D1|22CAA080|80A0CA;
                       PLB                                  ;8B98D5|AB      |      ;
                       BRA +                                ;8B98D6|8008    |8B98E0;
                       db $C0,$7E,$7F,$14,$00,$80,$6B,$75   ;8B98D8|        |      ;
 
                     + PHB                                  ;8B98E0|8B      |      ;
                       PHK                                  ;8B98E1|4B      |      ;
                       PLB                                  ;8B98E2|AB      |      ;
                       LDY.W #$98ED                         ;8B98E3|A0ED98  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B98E6|22CAA080|80A0CA;
                       PLB                                  ;8B98EA|AB      |      ;
                       BRA +                                ;8B98EB|8008    |8B98F5;
                       db $00,$7F,$7F,$14,$00,$80,$8B,$75   ;8B98ED|        |      ;
 
                     + PHB                                  ;8B98F5|8B      |      ;
                       PHK                                  ;8B98F6|4B      |      ;
                       PLB                                  ;8B98F7|AB      |      ;
                       LDY.W #$9902                         ;8B98F8|A00299  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B98FB|22CAA080|80A0CA;
                       PLB                                  ;8B98FF|AB      |      ;
                       BRA +                                ;8B9900|8008    |8B990A;
                       db $40,$7F,$7F,$14,$00,$80,$AB,$75   ;8B9902|        |      ;
 
                     + PLY                                  ;8B990A|7A      |      ;
                       PLX                                  ;8B990B|FA      |      ;
                       PLA                                  ;8B990C|68      |      ;
                       PLP                                  ;8B990D|28      |      ;
                       RTL                                  ;8B990E|6B      |      ;
 
       CODE_FL_8B990F:
                       PHP                                  ;8B990F|08      |      ;
                       REP #$30                             ;8B9910|C230    |      ;
                       PHA                                  ;8B9912|48      |      ;
                       PHX                                  ;8B9913|DA      |      ;
                       PHY                                  ;8B9914|5A      |      ;
                       PHB                                  ;8B9915|8B      |      ;
                       PHK                                  ;8B9916|4B      |      ;
                       PLB                                  ;8B9917|AB      |      ;
                       LDY.W #$9922                         ;8B9918|A02299  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B991B|22CAA080|80A0CA;
                       PLB                                  ;8B991F|AB      |      ;
                       BRA +                                ;8B9920|8008    |8B992A;
                       db $94,$7C,$7F,$14,$00,$80,$4B,$74   ;8B9922|        |      ;
 
                     + PHB                                  ;8B992A|8B      |      ;
                       PHK                                  ;8B992B|4B      |      ;
                       PLB                                  ;8B992C|AB      |      ;
                       LDY.W #$9937                         ;8B992D|A03799  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9930|22CAA080|80A0CA;
                       PLB                                  ;8B9934|AB      |      ;
                       BRA +                                ;8B9935|8008    |8B993F;
                       db $D4,$7C,$7F,$14,$00,$80,$6B,$74   ;8B9937|        |      ;
 
                     + PHB                                  ;8B993F|8B      |      ;
                       PHK                                  ;8B9940|4B      |      ;
                       PLB                                  ;8B9941|AB      |      ;
                       LDY.W #$994C                         ;8B9942|A04C99  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9945|22CAA080|80A0CA;
                       PLB                                  ;8B9949|AB      |      ;
                       BRA +                                ;8B994A|8008    |8B9954;
                       db $14,$7D,$7F,$14,$00,$80,$8B,$74   ;8B994C|        |      ;
 
                     + PHB                                  ;8B9954|8B      |      ;
                       PHK                                  ;8B9955|4B      |      ;
                       PLB                                  ;8B9956|AB      |      ;
                       LDY.W #$9961                         ;8B9957|A06199  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B995A|22CAA080|80A0CA;
                       PLB                                  ;8B995E|AB      |      ;
                       BRA +                                ;8B995F|8008    |8B9969;
                       db $54,$7D,$7F,$14,$00,$80,$AB,$74   ;8B9961|        |      ;
 
                     + PHB                                  ;8B9969|8B      |      ;
                       PHK                                  ;8B996A|4B      |      ;
                       PLB                                  ;8B996B|AB      |      ;
                       LDY.W #$9976                         ;8B996C|A07699  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B996F|22CAA080|80A0CA;
                       PLB                                  ;8B9973|AB      |      ;
                       BRA +                                ;8B9974|8008    |8B997E;
                       db $94,$7D,$7F,$14,$00,$80,$CB,$74   ;8B9976|        |      ;
 
                     + PHB                                  ;8B997E|8B      |      ;
                       PHK                                  ;8B997F|4B      |      ;
                       PLB                                  ;8B9980|AB      |      ;
                       LDY.W #$998B                         ;8B9981|A08B99  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9984|22CAA080|80A0CA;
                       PLB                                  ;8B9988|AB      |      ;
                       BRA +                                ;8B9989|8008    |8B9993;
                       db $D4,$7D,$7F,$14,$00,$80,$EB,$74   ;8B998B|        |      ;
 
                     + PHB                                  ;8B9993|8B      |      ;
                       PHK                                  ;8B9994|4B      |      ;
                       PLB                                  ;8B9995|AB      |      ;
                       LDY.W #$99A0                         ;8B9996|A0A099  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9999|22CAA080|80A0CA;
                       PLB                                  ;8B999D|AB      |      ;
                       BRA +                                ;8B999E|8008    |8B99A8;
                       db $14,$7E,$7F,$14,$00,$80,$0B,$75   ;8B99A0|        |      ;
 
                     + PHB                                  ;8B99A8|8B      |      ;
                       PHK                                  ;8B99A9|4B      |      ;
                       PLB                                  ;8B99AA|AB      |      ;
                       LDY.W #$99B5                         ;8B99AB|A0B599  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B99AE|22CAA080|80A0CA;
                       PLB                                  ;8B99B2|AB      |      ;
                       BRA +                                ;8B99B3|8008    |8B99BD;
                       db $54,$7E,$7F,$14,$00,$80,$2B,$75   ;8B99B5|        |      ;
 
                     + PHB                                  ;8B99BD|8B      |      ;
                       PHK                                  ;8B99BE|4B      |      ;
                       PLB                                  ;8B99BF|AB      |      ;
                       LDY.W #$99CA                         ;8B99C0|A0CA99  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B99C3|22CAA080|80A0CA;
                       PLB                                  ;8B99C7|AB      |      ;
                       BRA +                                ;8B99C8|8008    |8B99D2;
                       db $94,$7E,$7F,$14,$00,$80,$4B,$75   ;8B99CA|        |      ;
 
                     + PHB                                  ;8B99D2|8B      |      ;
                       PHK                                  ;8B99D3|4B      |      ;
                       PLB                                  ;8B99D4|AB      |      ;
                       LDY.W #$99DF                         ;8B99D5|A0DF99  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B99D8|22CAA080|80A0CA;
                       PLB                                  ;8B99DC|AB      |      ;
                       BRA +                                ;8B99DD|8008    |8B99E7;
                       db $D4,$7E,$7F,$14,$00,$80,$6B,$75   ;8B99DF|        |      ;
 
                     + PHB                                  ;8B99E7|8B      |      ;
                       PHK                                  ;8B99E8|4B      |      ;
                       PLB                                  ;8B99E9|AB      |      ;
                       LDY.W #$99F4                         ;8B99EA|A0F499  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B99ED|22CAA080|80A0CA;
                       PLB                                  ;8B99F1|AB      |      ;
                       BRA +                                ;8B99F2|8008    |8B99FC;
                       db $14,$7F,$7F,$14,$00,$80,$8B,$75   ;8B99F4|        |      ;
 
                     + PHB                                  ;8B99FC|8B      |      ;
                       PHK                                  ;8B99FD|4B      |      ;
                       PLB                                  ;8B99FE|AB      |      ;
                       LDY.W #$9A09                         ;8B99FF|A0099A  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9A02|22CAA080|80A0CA;
                       PLB                                  ;8B9A06|AB      |      ;
                       BRA +                                ;8B9A07|8008    |8B9A11;
                       db $54,$7F,$7F,$14,$00,$80,$AB,$75   ;8B9A09|        |      ;
 
                     + PLY                                  ;8B9A11|7A      |      ;
                       PLX                                  ;8B9A12|FA      |      ;
                       PLA                                  ;8B9A13|68      |      ;
                       PLP                                  ;8B9A14|28      |      ;
                       RTL                                  ;8B9A15|6B      |      ;
 
       CODE_FL_8B9A16:
                       PHP                                  ;8B9A16|08      |      ;
                       PHB                                  ;8B9A17|8B      |      ;
                       REP #$30                             ;8B9A18|C230    |      ;
                       PHX                                  ;8B9A1A|DA      |      ;
                       PHY                                  ;8B9A1B|5A      |      ;
                       PEA.W $7E00                          ;8B9A1C|F4007E  |8B7E00;
                       PLB                                  ;8B9A1F|AB      |      ;
                       PLB                                  ;8B9A20|AB      |      ;
                       LDX.W #$03FC                         ;8B9A21|A2FC03  |      ;
                       LDY.W #$0200                         ;8B9A24|A00002  |      ;
 
                     - LDA.W $4C1C,Y                        ;8B9A27|B91C4C  |7E4C1C;
                       STA.W $4C1E,X                        ;8B9A2A|9D1E4C  |7E4C1E;
                       STZ.W $4C1C,X                        ;8B9A2D|9E1C4C  |7E4C1C;
                       DEY                                  ;8B9A30|88      |      ;
                       DEY                                  ;8B9A31|88      |      ;
                       DEX                                  ;8B9A32|CA      |      ;
                       DEX                                  ;8B9A33|CA      |      ;
                       DEX                                  ;8B9A34|CA      |      ;
                       DEX                                  ;8B9A35|CA      |      ;
                       BPL -                                ;8B9A36|10EF    |8B9A27;
                       PLY                                  ;8B9A38|7A      |      ;
                       PLX                                  ;8B9A39|FA      |      ;
                       PLB                                  ;8B9A3A|AB      |      ;
                       PLP                                  ;8B9A3B|28      |      ;
                       RTL                                  ;8B9A3C|6B      |      ;
 
       CODE_FL_8B9A3D:
                       PHP                                  ;8B9A3D|08      |      ;
                       PHB                                  ;8B9A3E|8B      |      ;
                       REP #$30                             ;8B9A3F|C230    |      ;
                       PHX                                  ;8B9A41|DA      |      ;
                       PHY                                  ;8B9A42|5A      |      ;
                       TXA                                  ;8B9A43|8A      |      ;
                       CLC                                  ;8B9A44|18      |      ;
                       ADC.W #$0200                         ;8B9A45|690002  |      ;
                       TAY                                  ;8B9A48|A8      |      ;
                       CLC                                  ;8B9A49|18      |      ;
                       ADC.W #$01FC                         ;8B9A4A|69FC01  |      ;
                       TAX                                  ;8B9A4D|AA      |      ;
                       LDA.W #$0100                         ;8B9A4E|A90001  |      ;
 
                     - PHA                                  ;8B9A51|48      |      ;
                       LDA.W $0000,Y                        ;8B9A52|B90000  |7F0000;
                       STA.W $0002,X                        ;8B9A55|9D0200  |7F0002;
                       STZ.W $0000,X                        ;8B9A58|9E0000  |7F0000;
                       DEY                                  ;8B9A5B|88      |      ;
                       DEY                                  ;8B9A5C|88      |      ;
                       DEX                                  ;8B9A5D|CA      |      ;
                       DEX                                  ;8B9A5E|CA      |      ;
                       DEX                                  ;8B9A5F|CA      |      ;
                       DEX                                  ;8B9A60|CA      |      ;
                       PLA                                  ;8B9A61|68      |      ;
                       DEC A                                ;8B9A62|3A      |      ;
                       BNE -                                ;8B9A63|D0EC    |8B9A51;
                       PLY                                  ;8B9A65|7A      |      ;
                       PLX                                  ;8B9A66|FA      |      ;
                       PLB                                  ;8B9A67|AB      |      ;
                       PLP                                  ;8B9A68|28      |      ;
                       RTL                                  ;8B9A69|6B      |      ;
 
       CODE_FL_8B9A6A:
                       PHP                                  ;8B9A6A|08      |      ;
                       REP #$30                             ;8B9A6B|C230    |      ;
                       PHB                                  ;8B9A6D|8B      |      ;
                       PHA                                  ;8B9A6E|48      |      ;
                       PHX                                  ;8B9A6F|DA      |      ;
                       PHY                                  ;8B9A70|5A      |      ;
                       PHK                                  ;8B9A71|4B      |      ;
                       PLB                                  ;8B9A72|AB      |      ;
                       STA.B $00                            ;8B9A73|8500    |000000;
                       CPX.W #$0000                         ;8B9A75|E00000  |      ;
                       BNE +                                ;8B9A78|D028    |8B9AA2;
                       JSL.L CODE_FL_80BB61                 ;8B9A7A|2261BB80|80BB61;
                       db $00,$00,$00,$D0,$9A,$8B,$80,$74   ;8B9A7E|        |      ;
                       db $7F                               ;8B9A86|        |      ;
                       LDX.W #$02E6                         ;8B9A87|A2E602  |      ;
 
                     - LDA.L $7F7480,X                      ;8B9A8A|BF80747F|7F7480;
                       CLC                                  ;8B9A8E|18      |      ;
                       ADC.W #$0140                         ;8B9A8F|694001  |      ;
                       AND.W #$C3FF                         ;8B9A92|29FFC3  |      ;
                       ORA.W #$0800                         ;8B9A95|090008  |      ;
                       STA.L $7F7480,X                      ;8B9A98|9F80747F|7F7480;
                       DEX                                  ;8B9A9C|CA      |      ;
                       DEX                                  ;8B9A9D|CA      |      ;
                       BPL -                                ;8B9A9E|10EA    |8B9A8A;
                       BRA ++                               ;8B9AA0|8028    |8B9ACA;
 
                     + JSL.L CODE_FL_80BB61                 ;8B9AA2|2261BB80|80BB61;
                       db $00,$00,$00,$D0,$9A,$8B,$80,$7C   ;8B9AA6|        |      ;
                       db $7F                               ;8B9AAE|        |      ;
                       LDX.W #$02E6                         ;8B9AAF|A2E602  |      ;
 
                     - LDA.L $7F7C80,X                      ;8B9AB2|BF807C7F|7F7C80;
                       CLC                                  ;8B9AB6|18      |      ;
                       ADC.W #$0180                         ;8B9AB7|698001  |      ;
                       AND.W #$C3FF                         ;8B9ABA|29FFC3  |      ;
                       ORA.W #$0C00                         ;8B9ABD|09000C  |      ;
                       STA.L $7F7C80,X                      ;8B9AC0|9F807C7F|7F7C80;
                       DEX                                  ;8B9AC4|CA      |      ;
                       DEX                                  ;8B9AC5|CA      |      ;
                       BPL -                                ;8B9AC6|10EA    |8B9AB2;
                       BRA ++                               ;8B9AC8|8000    |8B9ACA;
 
                    ++ PLY                                  ;8B9ACA|7A      |      ;
                       PLX                                  ;8B9ACB|FA      |      ;
                       PLA                                  ;8B9ACC|68      |      ;
                       PLB                                  ;8B9ACD|AB      |      ;
                       PLP                                  ;8B9ACE|28      |      ;
                       RTL                                  ;8B9ACF|6B      |      ;
                       db $E6,$F7,$92,$3F,$F7,$92,$E8,$F8   ;8B9AD0|        |      ;
                       db $92,$A4,$F5,$92,$AA,$F9,$92,$4F   ;8B9AD8|        |      ;
                       db $F6,$92,$22,$FB,$92,$5C,$FA,$92   ;8B9AE0|        |      ;
                       db $5C,$FA,$92                       ;8B9AE8|        |      ;
                       db $5C,$FA,$92,$5C,$FA,$92,$5C,$FA   ;8B9AEB|        |5C92FA;
                       db $92                               ;8B9AF3|        |000020;
                       db $20,$9B,$93                       ;8B9AF4|        |      ;
 
       CODE_FL_8B9AF7:
                       PHP                                  ;8B9AF7|08      |      ;
                       REP #$30                             ;8B9AF8|C230    |      ;
                       PHB                                  ;8B9AFA|8B      |      ;
                       PHA                                  ;8B9AFB|48      |      ;
                       PHX                                  ;8B9AFC|DA      |      ;
                       PHY                                  ;8B9AFD|5A      |      ;
                       PHK                                  ;8B9AFE|4B      |      ;
                       PLB                                  ;8B9AFF|AB      |      ;
                       ASL A                                ;8B9B00|0A      |      ;
                       TAY                                  ;8B9B01|A8      |      ;
                       LDA.W DATA8_8B9B42,Y                 ;8B9B02|B9429B  |8B9B42;
                       TAY                                  ;8B9B05|A8      |      ;
                       PEA.W $7F00                          ;8B9B06|F4007F  |8B7F00;
                       PLB                                  ;8B9B09|AB      |      ;
                       PLB                                  ;8B9B0A|AB      |      ;
                       CPX.W #$0000                         ;8B9B0B|E00000  |      ;
                       BNE +                                ;8B9B0E|D016    |8B9B26;
                       LDX.W #$001C                         ;8B9B10|A21C00  |      ;
 
                     - LDA.W $6282,Y                        ;8B9B13|B98262  |7F6282;
                       STA.L $7E8738,X                      ;8B9B16|9F38877E|7E8738;
                       STA.L $7E8898,X                      ;8B9B1A|9F98887E|7E8898;
                       DEY                                  ;8B9B1E|88      |      ;
                       DEY                                  ;8B9B1F|88      |      ;
                       DEX                                  ;8B9B20|CA      |      ;
                       DEX                                  ;8B9B21|CA      |      ;
                       BPL -                                ;8B9B22|10EF    |8B9B13;
                       BRA ++                               ;8B9B24|8016    |8B9B3C;
 
                     + LDX.W #$001C                         ;8B9B26|A21C00  |      ;
 
                     - LDA.W $6282,Y                        ;8B9B29|B98262  |7F6282;
                       STA.L $7E8758,X                      ;8B9B2C|9F58877E|7E8758;
                       STA.L $7E88B8,X                      ;8B9B30|9FB8887E|7E88B8;
                       DEY                                  ;8B9B34|88      |      ;
                       DEY                                  ;8B9B35|88      |      ;
                       DEX                                  ;8B9B36|CA      |      ;
                       DEX                                  ;8B9B37|CA      |      ;
                       BPL -                                ;8B9B38|10EF    |8B9B29;
                       BRA ++                               ;8B9B3A|8000    |8B9B3C;
 
                    ++ PLY                                  ;8B9B3C|7A      |      ;
                       PLX                                  ;8B9B3D|FA      |      ;
                       PLA                                  ;8B9B3E|68      |      ;
                       PLB                                  ;8B9B3F|AB      |      ;
                       PLP                                  ;8B9B40|28      |      ;
                       RTL                                  ;8B9B41|6B      |      ;
 
         DATA8_8B9B42:
                       db $3C,$00,$5C,$00,$7C,$00,$9C,$00   ;8B9B42|        |      ;
                       db $BC,$00,$DC,$00,$FC,$00,$1C,$01   ;8B9B4A|        |      ;
                       db $1C,$01                           ;8B9B52|        |      ;
                       db $1C,$01,$1C,$01,$1C,$01           ;8B9B54|        |001C01;
                       db $1C,$00                           ;8B9B5A|        |      ;
 
       CODE_FL_8B9B5C:
                       PHP                                  ;8B9B5C|08      |      ;
                       REP #$30                             ;8B9B5D|C230    |      ;
                       PHB                                  ;8B9B5F|8B      |      ;
                       PHA                                  ;8B9B60|48      |      ;
                       PHX                                  ;8B9B61|DA      |      ;
                       PHY                                  ;8B9B62|5A      |      ;
                       CPX.W #$0000                         ;8B9B63|E00000  |      ;
                       BNE +                                ;8B9B66|D01D    |8B9B85;
                       ASL A                                ;8B9B68|0A      |      ;
                       TAX                                  ;8B9B69|AA      |      ;
                       LDA.L DATA8_8B9BA8,X                 ;8B9B6A|BFA89B8B|8B9BA8;
                       TAX                                  ;8B9B6E|AA      |      ;
                       LDY.W #$07FE                         ;8B9B6F|A0FE07  |      ;
                       PEA.W $7F00                          ;8B9B72|F4007F  |7E7F00;
                       PLB                                  ;8B9B75|AB      |      ;
                       PLB                                  ;8B9B76|AB      |      ;
 
                     - LDA.W $9160,X                        ;8B9B77|BD6091  |7F9160;
                       STA.W $6480,Y                        ;8B9B7A|998064  |7F6480;
                       DEX                                  ;8B9B7D|CA      |      ;
                       DEX                                  ;8B9B7E|CA      |      ;
                       DEY                                  ;8B9B7F|88      |      ;
                       DEY                                  ;8B9B80|88      |      ;
                       BPL -                                ;8B9B81|10F4    |8B9B77;
                       BRA ++                               ;8B9B83|801D    |8B9BA2;
 
                     + ASL A                                ;8B9B85|0A      |      ;
                       TAX                                  ;8B9B86|AA      |      ;
                       LDA.L DATA8_8B9BA8,X                 ;8B9B87|BFA89B8B|8B9BA8;
                       TAX                                  ;8B9B8B|AA      |      ;
                       LDY.W #$07FE                         ;8B9B8C|A0FE07  |      ;
                       PEA.W $7F00                          ;8B9B8F|F4007F  |7E7F00;
                       PLB                                  ;8B9B92|AB      |      ;
                       PLB                                  ;8B9B93|AB      |      ;
 
                     - LDA.W $9160,X                        ;8B9B94|BD6091  |7F9160;
                       STA.W $6C80,Y                        ;8B9B97|99806C  |7F6C80;
                       DEX                                  ;8B9B9A|CA      |      ;
                       DEX                                  ;8B9B9B|CA      |      ;
                       DEY                                  ;8B9B9C|88      |      ;
                       DEY                                  ;8B9B9D|88      |      ;
                       BPL -                                ;8B9B9E|10F4    |8B9B94;
                       BRA ++                               ;8B9BA0|8000    |8B9BA2;
 
                    ++ PLY                                  ;8B9BA2|7A      |      ;
                       PLX                                  ;8B9BA3|FA      |      ;
                       PLA                                  ;8B9BA4|68      |      ;
                       PLB                                  ;8B9BA5|AB      |      ;
                       PLP                                  ;8B9BA6|28      |      ;
                       RTL                                  ;8B9BA7|6B      |      ;
 
         DATA8_8B9BA8:
                       db $FE,$0F,$FE,$17,$FE,$1F,$FE,$27   ;8B9BA8|        |      ;
                       db $FE,$2F,$FE,$37,$FE,$3F,$FE,$47   ;8B9BB0|        |      ;
                       db $FE,$47                           ;8B9BB8|        |      ;
                       db $FE,$47,$FE,$47,$FE,$47           ;8B9BBA|        |00FE47;
                       db $FE,$07                           ;8B9BC0|        |      ;
 
       CODE_FL_8B9BC2:
                       PHP                                  ;8B9BC2|08      |      ;
                       REP #$30                             ;8B9BC3|C230    |      ;
                       PHB                                  ;8B9BC5|8B      |      ;
                       PHA                                  ;8B9BC6|48      |      ;
                       PHX                                  ;8B9BC7|DA      |      ;
                       PHY                                  ;8B9BC8|5A      |      ;
                       CPX.W #$0000                         ;8B9BC9|E00000  |      ;
                       BNE +                                ;8B9BCC|D007    |8B9BD5;
                       ASL A                                ;8B9BCE|0A      |      ;
                       TAX                                  ;8B9BCF|AA      |      ;
                       JSR.W (DATA8_8B9BE2,X)               ;8B9BD0|FCE29B  |8B9BE2;
                       BRA ++                               ;8B9BD3|8007    |8B9BDC;
 
                     + ASL A                                ;8B9BD5|0A      |      ;
                       TAX                                  ;8B9BD6|AA      |      ;
                       JSR.W (DATA8_8B9BFC,X)               ;8B9BD7|FCFC9B  |8B9BFC;
                       BRA ++                               ;8B9BDA|8000    |8B9BDC;
 
                    ++ PLY                                  ;8B9BDC|7A      |      ;
                       PLX                                  ;8B9BDD|FA      |      ;
                       PLA                                  ;8B9BDE|68      |      ;
                       PLB                                  ;8B9BDF|AB      |      ;
                       PLP                                  ;8B9BE0|28      |      ;
                       RTL                                  ;8B9BE1|6B      |      ;
 
         DATA8_8B9BE2:
                       db $2C,$9C,$42,$9C,$58,$9C,$6E,$9C   ;8B9BE2|        |      ;
                       db $84,$9C,$9A,$9C,$B0,$9C,$C6,$9C   ;8B9BEA|        |      ;
                       db $16,$9C,$16,$9C,$16,$9C,$16,$9C   ;8B9BF2|        |00009C;
                       db $16,$9C                           ;8B9BFA|        |      ;
 
         DATA8_8B9BFC:
                       db $F2,$9C,$08,$9D,$1E,$9D,$34,$9D   ;8B9BFC|        |      ;
                       db $4A,$9D,$60,$9D,$76,$9D,$8C,$9D   ;8B9C04|        |      ;
                       db $DC,$9C                           ;8B9C0C|        |      ;
                       db $DC,$9C,$DC,$9C,$DC,$9C,$DC,$9C   ;8B9C0E|        |00DC9C;
                       PHB                                  ;8B9C16|8B      |      ;
                       PHK                                  ;8B9C17|4B      |      ;
                       PLB                                  ;8B9C18|AB      |      ;
                       LDY.W #$9C23                         ;8B9C19|A0239C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9C1C|22CAA080|80A0CA;
                       PLB                                  ;8B9C20|AB      |      ;
                       BRA +                                ;8B9C21|8008    |8B9C2B;
                       db $60,$D9,$7F,$00,$04,$80,$00,$07   ;8B9C23|        |      ;
 
                     + RTS                                  ;8B9C2B|60      |      ;
                       PHB                                  ;8B9C2C|8B      |      ;
                       PHK                                  ;8B9C2D|4B      |      ;
                       PLB                                  ;8B9C2E|AB      |      ;
                       LDY.W #$9C39                         ;8B9C2F|A0399C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9C32|22CAA080|80A0CA;
                       PLB                                  ;8B9C36|AB      |      ;
                       BRA +                                ;8B9C37|8008    |8B9C41;
                       db $60,$DD,$7F,$00,$04,$80,$00,$07   ;8B9C39|        |      ;
 
                     + RTS                                  ;8B9C41|60      |      ;
                       PHB                                  ;8B9C42|8B      |      ;
                       PHK                                  ;8B9C43|4B      |      ;
                       PLB                                  ;8B9C44|AB      |      ;
                       LDY.W #$9C4F                         ;8B9C45|A04F9C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9C48|22CAA080|80A0CA;
                       PLB                                  ;8B9C4C|AB      |      ;
                       BRA +                                ;8B9C4D|8008    |8B9C57;
                       db $60,$E1,$7F,$00,$04,$80,$00,$07   ;8B9C4F|        |      ;
 
                     + RTS                                  ;8B9C57|60      |      ;
                       PHB                                  ;8B9C58|8B      |      ;
                       PHK                                  ;8B9C59|4B      |      ;
                       PLB                                  ;8B9C5A|AB      |      ;
                       LDY.W #$9C65                         ;8B9C5B|A0659C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9C5E|22CAA080|80A0CA;
                       PLB                                  ;8B9C62|AB      |      ;
                       BRA +                                ;8B9C63|8008    |8B9C6D;
                       db $60,$E5,$7F,$00,$04,$80,$00,$07   ;8B9C65|        |      ;
 
                     + RTS                                  ;8B9C6D|60      |      ;
                       PHB                                  ;8B9C6E|8B      |      ;
                       PHK                                  ;8B9C6F|4B      |      ;
                       PLB                                  ;8B9C70|AB      |      ;
                       LDY.W #$9C7B                         ;8B9C71|A07B9C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9C74|22CAA080|80A0CA;
                       PLB                                  ;8B9C78|AB      |      ;
                       BRA +                                ;8B9C79|8008    |8B9C83;
                       db $60,$E9,$7F,$00,$04,$80,$00,$07   ;8B9C7B|        |      ;
 
                     + RTS                                  ;8B9C83|60      |      ;
                       PHB                                  ;8B9C84|8B      |      ;
                       PHK                                  ;8B9C85|4B      |      ;
                       PLB                                  ;8B9C86|AB      |      ;
                       LDY.W #$9C91                         ;8B9C87|A0919C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9C8A|22CAA080|80A0CA;
                       PLB                                  ;8B9C8E|AB      |      ;
                       BRA +                                ;8B9C8F|8008    |8B9C99;
                       db $60,$ED,$7F,$00,$04,$80,$00,$07   ;8B9C91|        |      ;
 
                     + RTS                                  ;8B9C99|60      |      ;
                       PHB                                  ;8B9C9A|8B      |      ;
                       PHK                                  ;8B9C9B|4B      |      ;
                       PLB                                  ;8B9C9C|AB      |      ;
                       LDY.W #$9CA7                         ;8B9C9D|A0A79C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9CA0|22CAA080|80A0CA;
                       PLB                                  ;8B9CA4|AB      |      ;
                       BRA +                                ;8B9CA5|8008    |8B9CAF;
                       db $60,$F1,$7F,$00,$04,$80,$00,$07   ;8B9CA7|        |      ;
 
                     + RTS                                  ;8B9CAF|60      |      ;
                       PHB                                  ;8B9CB0|8B      |      ;
                       PHK                                  ;8B9CB1|4B      |      ;
                       PLB                                  ;8B9CB2|AB      |      ;
                       LDY.W #$9CBD                         ;8B9CB3|A0BD9C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9CB6|22CAA080|80A0CA;
                       PLB                                  ;8B9CBA|AB      |      ;
                       BRA +                                ;8B9CBB|8008    |8B9CC5;
                       db $60,$F5,$7F,$00,$04,$80,$00,$07   ;8B9CBD|        |      ;
 
                     + RTS                                  ;8B9CC5|60      |      ;
                       PHB                                  ;8B9CC6|8B      |      ;
                       PHK                                  ;8B9CC7|4B      |      ;
                       PLB                                  ;8B9CC8|AB      |      ;
                       LDY.W #$9CD3                         ;8B9CC9|A0D39C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9CCC|22CAA080|80A0CA;
                       PLB                                  ;8B9CD0|AB      |      ;
                       BRA +                                ;8B9CD1|8008    |8B9CDB;
                       db $60,$F9,$7F,$00,$04,$80,$00,$07   ;8B9CD3|        |      ;
 
                     + RTS                                  ;8B9CDB|60      |      ;
                       PHB                                  ;8B9CDC|8B      |      ;
                       PHK                                  ;8B9CDD|4B      |      ;
                       PLB                                  ;8B9CDE|AB      |      ;
                       LDY.W #$9CE9                         ;8B9CDF|A0E99C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9CE2|22CAA080|80A0CA;
                       PLB                                  ;8B9CE6|AB      |      ;
                       BRA +                                ;8B9CE7|8008    |8B9CF1;
                       db $60,$D9,$7F,$00,$04,$80,$00,$09   ;8B9CE9|        |      ;
 
                     + RTS                                  ;8B9CF1|60      |      ;
                       PHB                                  ;8B9CF2|8B      |      ;
                       PHK                                  ;8B9CF3|4B      |      ;
                       PLB                                  ;8B9CF4|AB      |      ;
                       LDY.W #$9CFF                         ;8B9CF5|A0FF9C  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9CF8|22CAA080|80A0CA;
                       PLB                                  ;8B9CFC|AB      |      ;
                       BRA +                                ;8B9CFD|8008    |8B9D07;
                       db $60,$DD,$7F,$00,$04,$80,$00,$09   ;8B9CFF|        |      ;
 
                     + RTS                                  ;8B9D07|60      |      ;
                       PHB                                  ;8B9D08|8B      |      ;
                       PHK                                  ;8B9D09|4B      |      ;
                       PLB                                  ;8B9D0A|AB      |      ;
                       LDY.W #$9D15                         ;8B9D0B|A0159D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D0E|22CAA080|80A0CA;
                       PLB                                  ;8B9D12|AB      |      ;
                       BRA +                                ;8B9D13|8008    |8B9D1D;
                       db $60,$E1,$7F,$00,$04,$80,$00,$09   ;8B9D15|        |      ;
 
                     + RTS                                  ;8B9D1D|60      |      ;
                       PHB                                  ;8B9D1E|8B      |      ;
                       PHK                                  ;8B9D1F|4B      |      ;
                       PLB                                  ;8B9D20|AB      |      ;
                       LDY.W #$9D2B                         ;8B9D21|A02B9D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D24|22CAA080|80A0CA;
                       PLB                                  ;8B9D28|AB      |      ;
                       BRA +                                ;8B9D29|8008    |8B9D33;
                       db $60,$E5,$7F,$00,$04,$80,$00,$09   ;8B9D2B|        |      ;
 
                     + RTS                                  ;8B9D33|60      |      ;
                       PHB                                  ;8B9D34|8B      |      ;
                       PHK                                  ;8B9D35|4B      |      ;
                       PLB                                  ;8B9D36|AB      |      ;
                       LDY.W #$9D41                         ;8B9D37|A0419D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D3A|22CAA080|80A0CA;
                       PLB                                  ;8B9D3E|AB      |      ;
                       BRA +                                ;8B9D3F|8008    |8B9D49;
                       db $60,$E9,$7F,$00,$04,$80,$00,$09   ;8B9D41|        |      ;
 
                     + RTS                                  ;8B9D49|60      |      ;
                       PHB                                  ;8B9D4A|8B      |      ;
                       PHK                                  ;8B9D4B|4B      |      ;
                       PLB                                  ;8B9D4C|AB      |      ;
                       LDY.W #$9D57                         ;8B9D4D|A0579D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D50|22CAA080|80A0CA;
                       PLB                                  ;8B9D54|AB      |      ;
                       BRA +                                ;8B9D55|8008    |8B9D5F;
                       db $60,$ED,$7F,$00,$04,$80,$00,$09   ;8B9D57|        |      ;
 
                     + RTS                                  ;8B9D5F|60      |      ;
                       PHB                                  ;8B9D60|8B      |      ;
                       PHK                                  ;8B9D61|4B      |      ;
                       PLB                                  ;8B9D62|AB      |      ;
                       LDY.W #$9D6D                         ;8B9D63|A06D9D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D66|22CAA080|80A0CA;
                       PLB                                  ;8B9D6A|AB      |      ;
                       BRA +                                ;8B9D6B|8008    |8B9D75;
                       db $60,$F1,$7F,$00,$04,$80,$00,$09   ;8B9D6D|        |      ;
 
                     + RTS                                  ;8B9D75|60      |      ;
                       PHB                                  ;8B9D76|8B      |      ;
                       PHK                                  ;8B9D77|4B      |      ;
                       PLB                                  ;8B9D78|AB      |      ;
                       LDY.W #$9D83                         ;8B9D79|A0839D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D7C|22CAA080|80A0CA;
                       PLB                                  ;8B9D80|AB      |      ;
                       BRA +                                ;8B9D81|8008    |8B9D8B;
                       db $60,$F5,$7F,$00,$04,$80,$00,$09   ;8B9D83|        |      ;
 
                     + RTS                                  ;8B9D8B|60      |      ;
                       PHB                                  ;8B9D8C|8B      |      ;
                       PHK                                  ;8B9D8D|4B      |      ;
                       PLB                                  ;8B9D8E|AB      |      ;
                       LDY.W #$9D99                         ;8B9D8F|A0999D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9D92|22CAA080|80A0CA;
                       PLB                                  ;8B9D96|AB      |      ;
                       BRA +                                ;8B9D97|8008    |8B9DA1;
                       db $60,$F9,$7F,$00,$04,$80,$00,$09   ;8B9D99|        |      ;
 
                     + RTS                                  ;8B9DA1|60      |      ;
 
       CODE_FL_8B9DA2:
                       PHP                                  ;8B9DA2|08      |      ;
                       REP #$30                             ;8B9DA3|C230    |      ;
                       PHA                                  ;8B9DA5|48      |      ;
                       PHX                                  ;8B9DA6|DA      |      ;
                       PHY                                  ;8B9DA7|5A      |      ;
                       PHB                                  ;8B9DA8|8B      |      ;
                       PHK                                  ;8B9DA9|4B      |      ;
                       PLB                                  ;8B9DAA|AB      |      ;
                       LDY.W #$9DB5                         ;8B9DAB|A0B59D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9DAE|22CAA080|80A0CA;
                       PLB                                  ;8B9DB2|AB      |      ;
                       BRA +                                ;8B9DB3|8008    |8B9DBD;
                       db $80,$64,$7F,$00,$08,$80,$00,$34   ;8B9DB5|        |      ;
 
                     + PLY                                  ;8B9DBD|7A      |      ;
                       PLX                                  ;8B9DBE|FA      |      ;
                       PLA                                  ;8B9DBF|68      |      ;
                       PLP                                  ;8B9DC0|28      |      ;
                       RTL                                  ;8B9DC1|6B      |      ;
 
       CODE_FL_8B9DC2:
                       PHP                                  ;8B9DC2|08      |      ;
                       REP #$30                             ;8B9DC3|C230    |      ;
                       PHA                                  ;8B9DC5|48      |      ;
                       PHX                                  ;8B9DC6|DA      |      ;
                       PHY                                  ;8B9DC7|5A      |      ;
                       PHB                                  ;8B9DC8|8B      |      ;
                       PHK                                  ;8B9DC9|4B      |      ;
                       PLB                                  ;8B9DCA|AB      |      ;
                       LDY.W #$9DD5                         ;8B9DCB|A0D59D  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8B9DCE|22CAA080|80A0CA;
                       PLB                                  ;8B9DD2|AB      |      ;
                       BRA +                                ;8B9DD3|8008    |8B9DDD;
                       db $80,$6C,$7F,$00,$08,$80,$00,$38   ;8B9DD5|        |      ;
 
                     + PLY                                  ;8B9DDD|7A      |      ;
                       PLX                                  ;8B9DDE|FA      |      ;
                       PLA                                  ;8B9DDF|68      |      ;
                       PLP                                  ;8B9DE0|28      |      ;
                       RTL                                  ;8B9DE1|6B      |      ;
 
       CODE_FN_8B9DE2:
                       PHP                                  ;8B9DE2|08      |      ;
                       REP #$20                             ;8B9DE3|C220    |      ;
                       LDA.B $BB                            ;8B9DE5|A5BB    |0000BB;
                       BIT.W #$0800                         ;8B9DE7|890008  |      ;
                       BEQ +                                ;8B9DEA|F009    |8B9DF5;
                       LDA.L $7ED34A                        ;8B9DEC|AF4AD37E|7ED34A;
                       DEC A                                ;8B9DF0|3A      |      ;
                       STA.L $7ED34A                        ;8B9DF1|8F4AD37E|7ED34A;
 
                     + LDA.B $BB                            ;8B9DF5|A5BB    |0000BB;
                       BIT.W #$0400                         ;8B9DF7|890004  |      ;
                       BEQ +                                ;8B9DFA|F009    |8B9E05;
                       LDA.L $7ED34A                        ;8B9DFC|AF4AD37E|7ED34A;
                       INC A                                ;8B9E00|1A      |      ;
                       STA.L $7ED34A                        ;8B9E01|8F4AD37E|7ED34A;
 
                     + LDA.B $BB                            ;8B9E05|A5BB    |0000BB;
                       BIT.W #$0200                         ;8B9E07|890002  |      ;
                       BEQ +                                ;8B9E0A|F009    |8B9E15;
                       LDA.L $7ED348                        ;8B9E0C|AF48D37E|7ED348;
                       DEC A                                ;8B9E10|3A      |      ;
                       STA.L $7ED348                        ;8B9E11|8F48D37E|7ED348;
 
                     + LDA.B $BB                            ;8B9E15|A5BB    |0000BB;
                       BIT.W #$0100                         ;8B9E17|890001  |      ;
                       BEQ +                                ;8B9E1A|F009    |8B9E25;
                       LDA.L $7ED348                        ;8B9E1C|AF48D37E|7ED348;
                       INC A                                ;8B9E20|1A      |      ;
                       STA.L $7ED348                        ;8B9E21|8F48D37E|7ED348;
 
                     + PLP                                  ;8B9E25|28      |      ;
                       RTS                                  ;8B9E26|60      |      ;
 
       CODE_FL_8B9E27:
                       PHP                                  ;8B9E27|08      |      ;
                       REP #$30                             ;8B9E28|C230    |      ;
                       PHA                                  ;8B9E2A|48      |      ;
                       PHX                                  ;8B9E2B|DA      |      ;
                       PHY                                  ;8B9E2C|5A      |      ;
                       LDY.W #$0400                         ;8B9E2D|A00004  |      ;
 
                     - LDA.L $7E0000,X                      ;8B9E30|BF00007E|7E0000;
                       ORA.W #$2000                         ;8B9E34|090020  |      ;
                       STA.L $7E0000,X                      ;8B9E37|9F00007E|7E0000;
                       INX                                  ;8B9E3B|E8      |      ;
                       INX                                  ;8B9E3C|E8      |      ;
                       DEY                                  ;8B9E3D|88      |      ;
                       BPL -                                ;8B9E3E|10F0    |8B9E30;
                       PLY                                  ;8B9E40|7A      |      ;
                       PLX                                  ;8B9E41|FA      |      ;
                       PLA                                  ;8B9E42|68      |      ;
                       PLP                                  ;8B9E43|28      |      ;
                       RTL                                  ;8B9E44|6B      |      ;
 
       CODE_FL_8B9E45:
                       PHP                                  ;8B9E45|08      |      ;
                       REP #$30                             ;8B9E46|C230    |      ;
                       PHA                                  ;8B9E48|48      |      ;
                       PHX                                  ;8B9E49|DA      |      ;
                       PHY                                  ;8B9E4A|5A      |      ;
                       LDY.W #$0400                         ;8B9E4B|A00004  |      ;
 
                     - LDA.L $7F0000,X                      ;8B9E4E|BF00007F|7F0000;
                       ORA.W #$2000                         ;8B9E52|090020  |      ;
                       STA.L $7F0000,X                      ;8B9E55|9F00007F|7F0000;
                       INX                                  ;8B9E59|E8      |      ;
                       INX                                  ;8B9E5A|E8      |      ;
                       DEY                                  ;8B9E5B|88      |      ;
                       BPL -                                ;8B9E5C|10F0    |8B9E4E;
                       PLY                                  ;8B9E5E|7A      |      ;
                       PLX                                  ;8B9E5F|FA      |      ;
                       PLA                                  ;8B9E60|68      |      ;
                       PLP                                  ;8B9E61|28      |      ;
                       RTL                                  ;8B9E62|6B      |      ;
 
       CODE_FL_8B9E63:
                       PHP                                  ;8B9E63|08      |      ;
                       REP #$30                             ;8B9E64|C230    |      ;
                       PHA                                  ;8B9E66|48      |      ;
                       PHX                                  ;8B9E67|DA      |      ;
                       PHY                                  ;8B9E68|5A      |      ;
                       LDY.W #$0400                         ;8B9E69|A00004  |      ;
 
                     - LDA.L $7F0000,X                      ;8B9E6C|BF00007F|7F0000;
                       AND.W #$DFFF                         ;8B9E70|29FFDF  |      ;
                       STA.L $7F0000,X                      ;8B9E73|9F00007F|7F0000;
                       INX                                  ;8B9E77|E8      |      ;
                       INX                                  ;8B9E78|E8      |      ;
                       DEY                                  ;8B9E79|88      |      ;
                       BPL -                                ;8B9E7A|10F0    |8B9E6C;
                       PLY                                  ;8B9E7C|7A      |      ;
                       PLX                                  ;8B9E7D|FA      |      ;
                       PLA                                  ;8B9E7E|68      |      ;
                       PLP                                  ;8B9E7F|28      |      ;
                       RTL                                  ;8B9E80|6B      |      ;
 
       CODE_FL_8B9E81:
                       PHP                                  ;8B9E81|08      |      ;
                       REP #$30                             ;8B9E82|C230    |      ;
                       PHA                                  ;8B9E84|48      |      ;
                       PHX                                  ;8B9E85|DA      |      ;
                       PHY                                  ;8B9E86|5A      |      ;
                       LDX.W #$07FE                         ;8B9E87|A2FE07  |      ;
 
                     - LDA.L $7E2000,X                      ;8B9E8A|BF00207E|7E2000;
                       ORA.W #$2000                         ;8B9E8E|090020  |      ;
                       STA.L $7E2000,X                      ;8B9E91|9F00207E|7E2000;
                       DEX                                  ;8B9E95|CA      |      ;
                       DEX                                  ;8B9E96|CA      |      ;
                       BPL -                                ;8B9E97|10F1    |8B9E8A;
                       PLY                                  ;8B9E99|7A      |      ;
                       PLX                                  ;8B9E9A|FA      |      ;
                       PLA                                  ;8B9E9B|68      |      ;
                       PLP                                  ;8B9E9C|28      |      ;
                       RTL                                  ;8B9E9D|6B      |      ;
 
       CODE_FL_8B9E9E:
                       PHP                                  ;8B9E9E|08      |      ;
                       REP #$30                             ;8B9E9F|C230    |      ;
                       PHA                                  ;8B9EA1|48      |      ;
                       PHX                                  ;8B9EA2|DA      |      ;
                       PHY                                  ;8B9EA3|5A      |      ;
                       LDX.W #$07FE                         ;8B9EA4|A2FE07  |      ;
 
                     - LDA.L $7F9160,X                      ;8B9EA7|BF60917F|7F9160;
                       ORA.W #$2000                         ;8B9EAB|090020  |      ;
                       STA.L $7F9160,X                      ;8B9EAE|9F60917F|7F9160;
                       DEX                                  ;8B9EB2|CA      |      ;
                       DEX                                  ;8B9EB3|CA      |      ;
                       BPL -                                ;8B9EB4|10F1    |8B9EA7;
                       PLY                                  ;8B9EB6|7A      |      ;
                       PLX                                  ;8B9EB7|FA      |      ;
                       PLA                                  ;8B9EB8|68      |      ;
                       PLP                                  ;8B9EB9|28      |      ;
                       RTL                                  ;8B9EBA|6B      |      ;
 
       CODE_FN_8B9EBB:
                       PHP                                  ;8B9EBB|08      |      ;
                       REP #$30                             ;8B9EBC|C230    |      ;
                       PHB                                  ;8B9EBE|8B      |      ;
                       PHK                                  ;8B9EBF|4B      |      ;
                       PLB                                  ;8B9EC0|AB      |      ;
                       LDA.B $B3                            ;8B9EC1|A5B3    |0000B3;
                       BIT.W #$2000                         ;8B9EC3|890020  |      ;
                       BEQ +                                ;8B9EC6|F006    |8B9ECE;
                       JSR.W CODE_FN_8B9DE2                 ;8B9EC8|20E29D  |8B9DE2;
                       JMP.W CODE_JP_8B9F3E                 ;8B9ECB|4C3E9F  |8B9F3E;
 
                     + LDA.L $7ED350                        ;8B9ECE|AF50D37E|7ED350;
                       ORA.L $7ED34E                        ;8B9ED2|0F4ED37E|7ED34E;
                       BEQ +                                ;8B9ED6|F02E    |8B9F06;
                       db $AF,$51,$D3,$7E,$29,$FF,$00,$0A   ;8B9ED8|        |7ED351;
                       db $85,$02,$AF,$4D,$D3,$7E,$29,$7F   ;8B9EE0|        |000002;
                       db $00,$0A,$AA,$BF,$E2,$9F,$8B,$20   ;8B9EE8|        |      ;
                       db $41,$9F,$8F,$48,$D3,$7E,$AF,$4C   ;8B9EF0|        |00009F;
                       db $D3,$7E,$18,$6F,$4E,$D3,$7E,$29   ;8B9EF8|        |00007E;
                       db $FF,$7F,$8F,$4C,$D3,$7E           ;8B9F00|        |4C8F7F;
 
                     + LDA.L $7ED356                        ;8B9F06|AF56D37E|7ED356;
                       ORA.L $7ED354                        ;8B9F0A|0F54D37E|7ED354;
                       BEQ CODE_JP_8B9F3E                   ;8B9F0E|F02E    |8B9F3E;
                       LDA.L $7ED357                        ;8B9F10|AF57D37E|7ED357;
                       AND.W #$00FF                         ;8B9F14|29FF00  |      ;
                       ASL A                                ;8B9F17|0A      |      ;
                       STA.B $02                            ;8B9F18|8502    |000002;
                       LDA.L $7ED353                        ;8B9F1A|AF53D37E|7ED353;
                       AND.W #$007F                         ;8B9F1E|297F00  |      ;
                       ASL A                                ;8B9F21|0A      |      ;
                       TAX                                  ;8B9F22|AA      |      ;
                       LDA.L DATA8_8B9FE2,X                 ;8B9F23|BFE29F8B|8B9FE2;
                       JSR.W CODE_FN_8B9F41                 ;8B9F27|20419F  |8B9F41;
                       STA.L $7ED34A                        ;8B9F2A|8F4AD37E|7ED34A;
                       LDA.L $7ED352                        ;8B9F2E|AF52D37E|7ED352;
                       CLC                                  ;8B9F32|18      |      ;
                       ADC.L $7ED354                        ;8B9F33|6F54D37E|7ED354;
                       AND.W #$7FFF                         ;8B9F37|29FF7F  |      ;
                       STA.L $7ED352                        ;8B9F3A|8F52D37E|7ED352;
 
       CODE_JP_8B9F3E:
                       PLB                                  ;8B9F3E|AB      |      ;
                       PLP                                  ;8B9F3F|28      |      ;
                       RTS                                  ;8B9F40|60      |      ;
 
       CODE_FN_8B9F41:
                       BMI +                                ;8B9F41|300C    |8B9F4F;
                       STA.B $00                            ;8B9F43|8500    |000000;
                       LDX.B $02                            ;8B9F45|A602    |000002;
                       JSR.W (UNREACH_8B9F63,X)             ;8B9F47|FC639F  |8B9F63;
                       LSR A                                ;8B9F4A|4A      |      ;
                       LSR A                                ;8B9F4B|4A      |      ;
                       LSR A                                ;8B9F4C|4A      |      ;
                       LSR A                                ;8B9F4D|4A      |      ;
                       RTS                                  ;8B9F4E|60      |      ;
 
                     + EOR.W #$FFFF                         ;8B9F4F|49FFFF  |      ;
                       INC A                                ;8B9F52|1A      |      ;
                       STA.B $00                            ;8B9F53|8500    |000000;
                       LDX.B $02                            ;8B9F55|A602    |000002;
                       JSR.W (UNREACH_8B9F63,X)             ;8B9F57|FC639F  |8B9F63;
                       LSR A                                ;8B9F5A|4A      |      ;
                       LSR A                                ;8B9F5B|4A      |      ;
                       LSR A                                ;8B9F5C|4A      |      ;
                       LSR A                                ;8B9F5D|4A      |      ;
                       EOR.W #$FFFF                         ;8B9F5E|49FFFF  |      ;
                       INC A                                ;8B9F61|1A      |      ;
                       RTS                                  ;8B9F62|60      |      ;
 
       UNREACH_8B9F63:
                       db $85,$9F,$89,$9F,$8A,$9F,$8E,$9F   ;8B9F63|        |00009F;
                       db $8B,$9F,$93,$9F,$99,$9F,$9F,$9F   ;8B9F6B|        |      ;
                       db $8C,$9F                           ;8B9F73|        |      ;
                       db $A7,$9F,$AE,$9F,$B5,$9F,$BE,$9F   ;8B9F75|        |00009F;
                       db $C5,$9F,$CE,$9F,$D7,$9F,$8D,$9F   ;8B9F7D|        |00009F;
                       db $A9,$00,$00,$60,$4A,$4A,$4A       ;8B9F85|        |      ;
                       LSR A                                ;8B9F8C|4A      |      ;
                       RTS                                  ;8B9F8D|60      |      ;
                       db $0A,$65,$00,$80,$F6,$0A,$0A,$65   ;8B9F8E|        |      ;
                       db $00,$80,$F0,$0A,$65,$00,$0A,$80   ;8B9F96|        |      ;
                       db $EA,$0A,$65,$00,$0A,$65,$00,$80   ;8B9F9E|        |      ;
                       db $E2,$0A,$0A,$0A,$65,$00,$80,$DB   ;8B9FA6|        |      ;
                       db $0A,$0A,$65,$00,$0A,$80,$D4,$0A   ;8B9FAE|        |      ;
                       db $0A,$65,$00,$0A,$65,$00,$80,$CB   ;8B9FB6|        |      ;
                       db $0A,$65,$00,$0A,$0A,$80,$C4,$0A   ;8B9FBE|        |      ;
                       db $65,$00,$0A,$0A,$65,$00,$80,$BB   ;8B9FC6|        |000000;
                       db $0A,$65,$00,$0A,$65,$00,$0A,$80   ;8B9FCE|        |      ;
                       db $B2,$0A,$65,$00,$0A,$65,$00,$0A   ;8B9FD6|        |00000A;
                       db $65,$00,$80,$A7                   ;8B9FDE|        |000000;
 
         DATA8_8B9FE2:
                       db $00,$00,$0C,$00,$19,$00,$25,$00   ;8B9FE2|        |      ;
                       db $32,$00,$3E,$00,$4A,$00,$56,$00   ;8B9FEA|        |      ;
                       db $62,$00,$6D,$00,$78,$00,$83,$00   ;8B9FF2|        |      ;
                       db $8E,$00,$98,$00,$A2,$00,$AC,$00   ;8B9FFA|        |      ;
                       db $B5,$00,$BE,$00,$C6,$00,$CE,$00   ;8BA002|        |      ;
                       db $D5,$00,$DC,$00,$E2,$00,$E7,$00   ;8BA00A|        |      ;
                       db $EC,$00,$F1,$00,$F5,$00,$F8,$00   ;8BA012|        |      ;
                       db $FB,$00,$FD,$00,$FE,$00,$FF,$00   ;8BA01A|        |      ;
                       db $FF,$00,$FF,$00,$FE,$00,$FD,$00   ;8BA022|        |      ;
                       db $FB,$00,$F8,$00,$F5,$00,$F1,$00   ;8BA02A|        |      ;
                       db $EC,$00,$E7,$00,$E2,$00,$DC,$00   ;8BA032|        |      ;
                       db $D5,$00,$CE,$00,$C6,$00,$BE,$00   ;8BA03A|        |      ;
                       db $B5,$00,$AC,$00,$A2,$00,$98,$00   ;8BA042|        |      ;
                       db $8E,$00,$83,$00,$78,$00,$6D,$00   ;8BA04A|        |      ;
                       db $62,$00,$56,$00,$4A,$00,$3E,$00   ;8BA052|        |      ;
                       db $32,$00,$25,$00,$19,$00,$0C,$00   ;8BA05A|        |      ;
                       db $00,$00,$F4,$FF,$E7,$FF,$DB,$FF   ;8BA062|        |      ;
                       db $CE,$FF,$C2,$FF,$B6,$FF,$AA,$FF   ;8BA06A|        |      ;
                       db $9E,$FF,$93,$FF,$88,$FF,$7D,$FF   ;8BA072|        |      ;
                       db $72,$FF,$68,$FF,$5E,$FF,$54,$FF   ;8BA07A|        |      ;
                       db $4B,$FF,$42,$FF,$3A,$FF,$32,$FF   ;8BA082|        |      ;
                       db $2B,$FF,$24,$FF,$1E,$FF,$19,$FF   ;8BA08A|        |      ;
                       db $14,$FF,$0F,$FF,$0B,$FF,$08,$FF   ;8BA092|        |      ;
                       db $05,$FF,$03,$FF,$02,$FF,$01,$FF   ;8BA09A|        |      ;
                       db $01,$FF,$01,$FF,$02,$FF,$03,$FF   ;8BA0A2|        |      ;
                       db $05,$FF,$08,$FF,$0B,$FF,$0F,$FF   ;8BA0AA|        |      ;
                       db $14,$FF,$19,$FF,$1E,$FF,$24,$FF   ;8BA0B2|        |      ;
                       db $2B,$FF,$32,$FF,$3A,$FF,$42,$FF   ;8BA0BA|        |      ;
                       db $4B,$FF,$54,$FF,$5E,$FF,$68,$FF   ;8BA0C2|        |      ;
                       db $72,$FF,$7D,$FF,$88,$FF,$93,$FF   ;8BA0CA|        |      ;
                       db $9E,$FF,$AA,$FF,$B6,$FF,$C2,$FF   ;8BA0D2|        |      ;
                       db $CE,$FF,$DB,$FF,$E7,$FF,$F4,$FF   ;8BA0DA|        |      ;
 
       CODE_FN_8BA0E2:
                       LDA.L $7ED39F                        ;8BA0E2|AF9FD37E|7ED39F;
                       ASL A                                ;8BA0E6|0A      |      ;
                       TAX                                  ;8BA0E7|AA      |      ;
                       JSR.W (DATA8_8BA0F5,X)               ;8BA0E8|FCF5A0  |8BA0F5;
                       LDA.L $7ED3A1                        ;8BA0EB|AFA1D37E|7ED3A1;
                       ASL A                                ;8BA0EF|0A      |      ;
                       TAX                                  ;8BA0F0|AA      |      ;
                       JSR.W (DATA8_8BA10F,X)               ;8BA0F1|FC0FA1  |8BA10F;
                       RTS                                  ;8BA0F4|60      |      ;
 
         DATA8_8BA0F5:
                       db $3C,$A1,$29,$A1,$3C,$A1,$2D,$A1   ;8BA0F5|        |      ;
                       db $3C,$A1,$3C,$A1,$3C,$A1,$3C,$A1   ;8BA0FD|        |      ;
                       db $31,$A1,$31,$A1,$31,$A1,$3B,$A1   ;8BA105|        |      ;
                       db $3C,$A1                           ;8BA10D|        |      ;
 
         DATA8_8BA10F:
                       db $3C,$A1,$29,$A1,$3C,$A1,$2D,$A1   ;8BA10F|        |      ;
                       db $3C,$A1,$3C,$A1,$3C,$A1,$3C,$A1   ;8BA117|        |      ;
                       db $31,$A1,$3C,$A1,$3C,$A1,$3B,$A1   ;8BA11F|        |      ;
                       db $3C,$A1                           ;8BA127|        |0020A1;
                       JSR.W CODE_FN_8BDCAE                 ;8BA129|20AEDC  |8BDCAE;
                       RTS                                  ;8BA12C|60      |      ;
                       JSR.W CODE_FN_8BDE43                 ;8BA12D|2043DE  |8BDE43;
                       RTS                                  ;8BA130|60      |      ;
                       LDA.W #$D5CA                         ;8BA131|A9CAD5  |      ;
                       STA.B $96                            ;8BA134|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA136|2266A389|89A366;
                       RTS                                  ;8BA13A|60      |      ;
                       RTS                                  ;8BA13B|60      |      ;
                       RTS                                  ;8BA13C|60      |      ;
 
       CODE_FN_8BA13D:
                       LDA.L $7ED39F                        ;8BA13D|AF9FD37E|7ED39F;
                       ASL A                                ;8BA141|0A      |      ;
                       TAX                                  ;8BA142|AA      |      ;
                       JSR.W (DATA8_8BA150,X)               ;8BA143|FC50A1  |8BA150;
                       LDA.L $7ED3A1                        ;8BA146|AFA1D37E|7ED3A1;
                       ASL A                                ;8BA14A|0A      |      ;
                       TAX                                  ;8BA14B|AA      |      ;
                       JSR.W (DATA8_8BA150,X)               ;8BA14C|FC50A1  |8BA150;
                       RTS                                  ;8BA14F|60      |      ;
 
         DATA8_8BA150:
                       db $74,$A1,$E6,$A1,$E6,$A1,$87,$A1   ;8BA150|        |      ;
                       db $CD,$A1,$D1,$A1,$E2,$A1,$D5,$A1   ;8BA158|        |      ;
                       db $E6,$A1,$E6,$A1,$E6,$A1,$E6,$A1   ;8BA160|        |      ;
                       db $6A,$A1                           ;8BA168|        |      ;
                       LDA.W #$D4CE                         ;8BA16A|A9CED4  |      ;
                       STA.B $96                            ;8BA16D|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA16F|2266A389|89A366;
                       RTS                                  ;8BA173|60      |      ;
                       LDA.W #$D4E3                         ;8BA174|A9E3D4  |      ;
                       STA.B $96                            ;8BA177|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA179|2266A389|89A366;
                       LDA.W #$D4F4                         ;8BA17D|A9F4D4  |      ;
                       STA.B $96                            ;8BA180|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA182|2266A389|89A366;
                       RTS                                  ;8BA186|60      |      ;
                       LDA.W #$0024                         ;8BA187|A92400  |      ;
                       STA.L $7ED511                        ;8BA18A|8F11D57E|7ED511;
                       LDA.W #$000C                         ;8BA18E|A90C00  |      ;
                       STA.L $7ED513                        ;8BA191|8F13D57E|7ED513;
                       LDA.W #$D517                         ;8BA195|A917D5  |      ;
                       STA.B $96                            ;8BA198|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA19A|2266A389|89A366;
                       LDA.W #$0012                         ;8BA19E|A91200  |      ;
                       STA.L $7ED511                        ;8BA1A1|8F11D57E|7ED511;
                       LDA.W #$003A                         ;8BA1A5|A93A00  |      ;
                       STA.L $7ED513                        ;8BA1A8|8F13D57E|7ED513;
                       LDA.W #$D528                         ;8BA1AC|A928D5  |      ;
                       STA.B $96                            ;8BA1AF|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA1B1|2266A389|89A366;
                       LDA.W #$0038                         ;8BA1B5|A93800  |      ;
                       STA.L $7ED511                        ;8BA1B8|8F11D57E|7ED511;
                       LDA.W #$0041                         ;8BA1BC|A94100  |      ;
                       STA.L $7ED513                        ;8BA1BF|8F13D57E|7ED513;
                       LDA.W #$D539                         ;8BA1C3|A939D5  |      ;
                       STA.B $96                            ;8BA1C6|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BA1C8|2266A389|89A366;
                       RTS                                  ;8BA1CC|60      |      ;
                       JSR.W CODE_FN_8BDFF3                 ;8BA1CD|20F3DF  |8BDFF3;
                       RTS                                  ;8BA1D0|60      |      ;
                       JSR.W CODE_FN_8BE113                 ;8BA1D1|2013E1  |8BE113;
                       RTS                                  ;8BA1D4|60      |      ;
                       LDA.L $7ED1E4                        ;8BA1D5|AFE4D17E|7ED1E4;
                       BIT.W #$8000                         ;8BA1D9|890080  |      ;
                       BNE +                                ;8BA1DC|D003    |8BA1E1;
                       JSR.W CODE_FN_8BE27A                 ;8BA1DE|207AE2  |8BE27A;
 
                     + RTS                                  ;8BA1E1|60      |      ;
                       JSR.W CODE_FN_8BE473                 ;8BA1E2|2073E4  |8BE473;
                       RTS                                  ;8BA1E5|60      |      ;
                       RTS                                  ;8BA1E6|60      |      ;
 
       CODE_FN_8BA1E7:
                       LDA.W #$0050                         ;8BA1E7|A95000  |      ;
                       STA.B $00                            ;8BA1EA|8500    |000000;
                       LDA.W #$008F                         ;8BA1EC|A98F00  |      ;
                       STA.B $02                            ;8BA1EF|8502    |000002;
                       LDA.L $7ED39F                        ;8BA1F1|AF9FD37E|7ED39F;
                       ASL A                                ;8BA1F5|0A      |      ;
                       TAX                                  ;8BA1F6|AA      |      ;
                       JSR.W (DATA8_8BA20E,X)               ;8BA1F7|FC0EA2  |8BA20E;
                       LDA.W #$0150                         ;8BA1FA|A95001  |      ;
                       STA.B $00                            ;8BA1FD|8500    |000000;
                       LDA.W #$000F                         ;8BA1FF|A90F00  |      ;
                       STA.B $02                            ;8BA202|8502    |000002;
                       LDA.L $7ED3A1                        ;8BA204|AFA1D37E|7ED3A1;
                       ASL A                                ;8BA208|0A      |      ;
                       TAX                                  ;8BA209|AA      |      ;
                       JSR.W (DATA8_8BA20E,X)               ;8BA20A|FC0EA2  |8BA20E;
                       RTS                                  ;8BA20D|60      |      ;
 
         DATA8_8BA20E:
                       db $45,$A2,$72,$A2,$C3,$A2,$82,$A2   ;8BA20E|        |      ;
                       db $8F,$A2,$9C,$A2,$B6,$A2,$A9,$A2   ;8BA216|        |      ;
                       db $C3,$A2,$C3,$A2,$C3,$A2,$C3,$A2   ;8BA21E|        |      ;
                       db $28,$A2                           ;8BA226|        |      ;
                       LDA.B $00                            ;8BA228|A500    |000000;
                       STA.L $7ED4CA                        ;8BA22A|8FCAD47E|7ED4CA;
                       LDA.B $02                            ;8BA22E|A502    |000002;
                       STA.L $7ED4CC                        ;8BA230|8FCCD47E|7ED4CC;
                       LDA.W #$D4CE                         ;8BA234|A9CED4  |      ;
                       STA.B $96                            ;8BA237|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BA239|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BA23D|222CA689|89A62C;
                       db $ED,$DB,$8B                       ;8BA241|        |      ;
                       RTS                                  ;8BA244|60      |      ;
                       LDA.B $00                            ;8BA245|A500    |000000;
                       STA.L $7ED4DF                        ;8BA247|8FDFD47E|7ED4DF;
                       LDA.B $02                            ;8BA24B|A502    |000002;
                       STA.L $7ED4E1                        ;8BA24D|8FE1D47E|7ED4E1;
                       LDA.W #$D4E3                         ;8BA251|A9E3D4  |      ;
                       STA.B $96                            ;8BA254|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BA256|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BA25A|222CA689|89A62C;
                       db $47,$DC,$8B                       ;8BA25E|        |      ;
                       LDA.W #$D4F4                         ;8BA261|A9F4D4  |      ;
                       STA.B $96                            ;8BA264|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BA266|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BA26A|222CA689|89A62C;
                       db $78,$DC,$8B                       ;8BA26E|        |      ;
                       RTS                                  ;8BA271|60      |      ;
                       LDA.B $00                            ;8BA272|A500    |000000;
                       STA.L $7ED54A                        ;8BA274|8F4AD57E|7ED54A;
                       LDA.B $02                            ;8BA278|A502    |000002;
                       STA.L $7ED54C                        ;8BA27A|8F4CD57E|7ED54C;
                       JSR.W CODE_FN_8BDDE9                 ;8BA27E|20E9DD  |8BDDE9;
                       RTS                                  ;8BA281|60      |      ;
                       LDA.B $00                            ;8BA282|A500    |000000;
                       STA.L $7ED50D                        ;8BA284|8F0DD57E|7ED50D;
                       LDA.B $02                            ;8BA288|A502    |000002;
                       STA.L $7ED50F                        ;8BA28A|8F0FD57E|7ED50F;
                       RTS                                  ;8BA28E|60      |      ;
                       LDA.B $00                            ;8BA28F|A500    |000000;
                       STA.L $7ED505                        ;8BA291|8F05D57E|7ED505;
                       LDA.B $02                            ;8BA295|A502    |000002;
                       STA.L $7ED507                        ;8BA297|8F07D57E|7ED507;
                       RTS                                  ;8BA29B|60      |      ;
                       LDA.B $00                            ;8BA29C|A500    |000000;
                       STA.L $7ED5AE                        ;8BA29E|8FAED57E|7ED5AE;
                       LDA.B $02                            ;8BA2A2|A502    |000002;
                       STA.L $7ED5B0                        ;8BA2A4|8FB0D57E|7ED5B0;
                       RTS                                  ;8BA2A8|60      |      ;
                       LDA.B $00                            ;8BA2A9|A500    |000000;
                       STA.L $7ED5BE                        ;8BA2AB|8FBED57E|7ED5BE;
                       LDA.B $02                            ;8BA2AF|A502    |000002;
                       STA.L $7ED5C0                        ;8BA2B1|8FC0D57E|7ED5C0;
                       RTS                                  ;8BA2B5|60      |      ;
                       LDA.B $00                            ;8BA2B6|A500    |000000;
                       STA.L $7ED5B8                        ;8BA2B8|8FB8D57E|7ED5B8;
                       LDA.B $02                            ;8BA2BC|A502    |000002;
                       STA.L $7ED5BA                        ;8BA2BE|8FBAD57E|7ED5BA;
                       RTS                                  ;8BA2C2|60      |      ;
                       RTS                                  ;8BA2C3|60      |      ;
 
       CODE_FL_8BA2C4:
                       LDA.L $7ED5E3                        ;8BA2C4|AFE3D57E|7ED5E3;
                       CMP.W #$0060                         ;8BA2C8|C96000  |      ;
                       BEQ +                                ;8BA2CB|F01F    |8BA2EC;
                       INC A                                ;8BA2CD|1A      |      ;
                       STA.L $7ED5E3                        ;8BA2CE|8FE3D57E|7ED5E3;
                       LDA.L $7ED5E3                        ;8BA2D2|AFE3D57E|7ED5E3;
                       DEC A                                ;8BA2D6|3A      |      ;
                       CLC                                  ;8BA2D7|18      |      ;
                       ADC.W #$FFF8                         ;8BA2D8|69F8FF  |      ;
                       BIT.W #$0007                         ;8BA2DB|890700  |      ;
                       BNE ++                               ;8BA2DE|D00A    |8BA2EA;
                       LSR A                                ;8BA2E0|4A      |      ;
                       LSR A                                ;8BA2E1|4A      |      ;
                       LSR A                                ;8BA2E2|4A      |      ;
                       AND.W #$003F                         ;8BA2E3|293F00  |      ;
                       JSL.L CODE_FL_8BD67E                 ;8BA2E6|227ED68B|8BD67E;
 
                    ++ SEC                                  ;8BA2EA|38      |      ;
                       RTL                                  ;8BA2EB|6B      |      ;
 
                     + CLC                                  ;8BA2EC|18      |      ;
                       RTL                                  ;8BA2ED|6B      |      ;
 
       CODE_FL_8BA2EE:
                       LDA.L $7ED5E1                        ;8BA2EE|AFE1D57E|7ED5E1;
                       CMP.W #$00A0                         ;8BA2F2|C9A000  |      ;
                       BEQ +                                ;8BA2F5|F01F    |8BA316;
                       DEC A                                ;8BA2F7|3A      |      ;
                       STA.L $7ED5E1                        ;8BA2F8|8FE1D57E|7ED5E1;
                       LDA.L $7ED5E1                        ;8BA2FC|AFE1D57E|7ED5E1;
                       INC A                                ;8BA300|1A      |      ;
                       CLC                                  ;8BA301|18      |      ;
                       ADC.W #$0000                         ;8BA302|690000  |      ;
                       BIT.W #$0007                         ;8BA305|890700  |      ;
                       BNE ++                               ;8BA308|D00A    |8BA314;
                       LSR A                                ;8BA30A|4A      |      ;
                       LSR A                                ;8BA30B|4A      |      ;
                       LSR A                                ;8BA30C|4A      |      ;
                       AND.W #$003F                         ;8BA30D|293F00  |      ;
                       JSL.L CODE_FL_8BD67E                 ;8BA310|227ED68B|8BD67E;
 
                    ++ SEC                                  ;8BA314|38      |      ;
                       RTL                                  ;8BA315|6B      |      ;
 
                     + CLC                                  ;8BA316|18      |      ;
                       RTL                                  ;8BA317|6B      |      ;
 
       CODE_FL_8BA318:
                       LDX.W #$0016                         ;8BA318|A21600  |      ;
 
                     - LDA.L DATA8_8BA328,X                 ;8BA31B|BF28A38B|8BA328;
                       STA.L $7E2BA6,X                      ;8BA31F|9FA62B7E|7E2BA6;
                       DEX                                  ;8BA323|CA      |      ;
                       DEX                                  ;8BA324|CA      |      ;
                       BPL -                                ;8BA325|10F4    |8BA31B;
                       RTL                                  ;8BA327|6B      |      ;
 
         DATA8_8BA328:
                       db $EB,$33,$EC,$33,$ED,$33,$EE,$33   ;8BA328|        |      ;
                       db $EF,$33,$F0,$33,$F1,$33,$F2,$33   ;8BA330|        |      ;
                       db $F3,$33,$F4,$33,$F5,$33,$F6,$33   ;8BA338|        |      ;
 
       CODE_FL_8BA340:
                       LDA.L $7ED1E4                        ;8BA340|AFE4D17E|7ED1E4;
                       BIT.W #$0800                         ;8BA344|890008  |      ;
                       BNE +                                ;8BA347|D00F    |8BA358;
                       LDX.W #$0016                         ;8BA349|A21600  |      ;
 
                     - LDA.L DATA8_8BA359,X                 ;8BA34C|BF59A38B|8BA359;
                       STA.L $7E2BA6,X                      ;8BA350|9FA62B7E|7E2BA6;
                       DEX                                  ;8BA354|CA      |      ;
                       DEX                                  ;8BA355|CA      |      ;
                       BPL -                                ;8BA356|10F4    |8BA34C;
 
                     + RTL                                  ;8BA358|6B      |      ;
 
         DATA8_8BA359:
                       db $F4,$2F,$F5,$2F,$F6,$2F,$F7,$2F   ;8BA359|        |      ;
                       db $F8,$2F,$F9,$2F,$FA,$2F,$FB,$2F   ;8BA361|        |      ;
                       db $FC,$2F,$FD,$2F,$FE,$2F,$FF,$2F   ;8BA369|        |      ;
 
       CODE_FL_8BA371:
                       JSL.L CODE_FL_80BB2D                 ;8BA371|222DBB80|80BB2D;
                       db $AB,$9A,$93,$60,$91,$7F           ;8BA375|        |      ;
                       PHB                                  ;8BA37B|8B      |      ;
                       PHK                                  ;8BA37C|4B      |      ;
                       PLB                                  ;8BA37D|AB      |      ;
                       LDY.W #$A388                         ;8BA37E|A088A3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BA381|22CAA080|80A0CA;
                       PLB                                  ;8BA385|AB      |      ;
                       BRA +                                ;8BA386|8008    |8BA390;
                       db $60,$91,$7F,$A0,$01,$80,$00,$4F   ;8BA388|        |      ;
 
                     + RTL                                  ;8BA390|6B      |      ;
 
       CODE_FL_8BA391:
                       PHP                                  ;8BA391|08      |      ;
                       REP #$30                             ;8BA392|C230    |      ;
                       PHB                                  ;8BA394|8B      |      ;
                       JSL.L CODE_FL_84ADBC                 ;8BA395|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BA399|        |      ;
                       JSL.L CODE_FL_84ADF2                 ;8BA39C|22F2AD84|84ADF2;
                       db $0B,$FC,$99                       ;8BA3A0|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BA3A3|22FF9384|8493FF;
                       JSL.L CODE_FL_84ADF2                 ;8BA3A7|22F2AD84|84ADF2;
                       db $2D,$FC,$99                       ;8BA3AB|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BA3AE|22FF9384|8493FF;
                       JSL.L CODE_FL_8BA3EE                 ;8BA3B2|22EEA38B|8BA3EE;
                       PLB                                  ;8BA3B6|AB      |      ;
                       PLP                                  ;8BA3B7|28      |      ;
                       RTL                                  ;8BA3B8|6B      |      ;
 
       CODE_FL_8BA3B9:
                       PHP                                  ;8BA3B9|08      |      ;
                       REP #$30                             ;8BA3BA|C230    |      ;
                       PHB                                  ;8BA3BC|8B      |      ;
                       LDA.L $7ED1E4                        ;8BA3BD|AFE4D17E|7ED1E4;
                       BIT.W #$0800                         ;8BA3C1|890008  |      ;
                       BNE +                                ;8BA3C4|D025    |8BA3EB;
                       JSL.L CODE_FL_8BA371                 ;8BA3C6|2271A38B|8BA371;
                       JSL.L CODE_FL_84ADBC                 ;8BA3CA|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BA3CE|        |      ;
                       JSL.L CODE_FL_84ADF2                 ;8BA3D1|22F2AD84|84ADF2;
                       db $0B,$FC,$99                       ;8BA3D5|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BA3D8|22FF9384|8493FF;
                       JSL.L CODE_FL_84ADF2                 ;8BA3DC|22F2AD84|84ADF2;
                       db $3A,$FC,$99                       ;8BA3E0|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BA3E3|22FF9384|8493FF;
                       JSL.L CODE_FL_8BA3EE                 ;8BA3E7|22EEA38B|8BA3EE;
 
                     + PLB                                  ;8BA3EB|AB      |      ;
                       PLP                                  ;8BA3EC|28      |      ;
                       RTL                                  ;8BA3ED|6B      |      ;
 
       CODE_FL_8BA3EE:
                       PHP                                  ;8BA3EE|08      |      ;
                       REP #$30                             ;8BA3EF|C230    |      ;
                       PHB                                  ;8BA3F1|8B      |      ;
                       PHB                                  ;8BA3F2|8B      |      ;
                       PHY                                  ;8BA3F3|5A      |      ;
                       JSL.L CODE_FL_89D61B                 ;8BA3F4|221BD689|89D61B;
                       PLY                                  ;8BA3F8|7A      |      ;
                       PLB                                  ;8BA3F9|AB      |      ;
                       LDA.B $0E                            ;8BA3FA|A50E    |00000E;
                       PHA                                  ;8BA3FC|48      |      ;
                       LDA.B $0C                            ;8BA3FD|A50C    |00000C;
                       PHA                                  ;8BA3FF|48      |      ;
                       LDA.B $0A                            ;8BA400|A50A    |00000A;
                       PHA                                  ;8BA402|48      |      ;
                       LDA.B $08                            ;8BA403|A508    |000008;
                       PHA                                  ;8BA405|48      |      ;
                       LDA.B $06                            ;8BA406|A506    |000006;
                       PHA                                  ;8BA408|48      |      ;
                       LDA.B $04                            ;8BA409|A504    |000004;
                       PHA                                  ;8BA40B|48      |      ;
                       LDA.B $02                            ;8BA40C|A502    |000002;
                       PHA                                  ;8BA40E|48      |      ;
                       LDX.B $00                            ;8BA40F|A600    |000000;
                       LDA.L UNREACH_8BA490,X               ;8BA411|BF90A48B|8BA490;
                       LDX.W #$0000                         ;8BA415|A20000  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA418|206FA4  |8BA46F;
                       PLX                                  ;8BA41B|FA      |      ;
                       LDA.L DATA8_8BA4B0,X                 ;8BA41C|BFB0A48B|8BA4B0;
                       LDX.W #$0007                         ;8BA420|A20700  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA423|206FA4  |8BA46F;
                       PLX                                  ;8BA426|FA      |      ;
                       LDA.L DATA8_8BA4D0,X                 ;8BA427|BFD0A48B|8BA4D0;
                       LDX.W #$000E                         ;8BA42B|A20E00  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA42E|206FA4  |8BA46F;
                       PLX                                  ;8BA431|FA      |      ;
                       LDA.L DATA8_8BA4F0,X                 ;8BA432|BFF0A48B|8BA4F0;
                       LDX.W #$0015                         ;8BA436|A21500  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA439|206FA4  |8BA46F;
                       PLX                                  ;8BA43C|FA      |      ;
                       LDA.L DATA8_8BA510,X                 ;8BA43D|BF10A58B|8BA510;
                       LDX.W #$001C                         ;8BA441|A21C00  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA444|206FA4  |8BA46F;
                       PLX                                  ;8BA447|FA      |      ;
                       LDA.L DATA8_8BA530,X                 ;8BA448|BF30A58B|8BA530;
                       LDX.W #$0023                         ;8BA44C|A22300  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA44F|206FA4  |8BA46F;
                       PLX                                  ;8BA452|FA      |      ;
                       LDA.L DATA8_8BA550,X                 ;8BA453|BF50A58B|8BA550;
                       LDX.W #$002A                         ;8BA457|A22A00  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA45A|206FA4  |8BA46F;
                       PLX                                  ;8BA45D|FA      |      ;
                       LDA.L DATA8_8BA570,X                 ;8BA45E|BF70A58B|8BA570;
                       LDX.W #$0031                         ;8BA462|A23100  |      ;
                       JSR.W CODE_FN_8BA46F                 ;8BA465|206FA4  |8BA46F;
                       JSL.L CODE_FL_849C62                 ;8BA468|22629C84|849C62;
                       PLB                                  ;8BA46C|AB      |      ;
                       PLP                                  ;8BA46D|28      |      ;
                       RTL                                  ;8BA46E|6B      |      ;
 
       CODE_FN_8BA46F:
                       AND.W #$00FF                         ;8BA46F|29FF00  |      ;
                       CLC                                  ;8BA472|18      |      ;
                       ADC.L DATA8_998020                   ;8BA473|6F208099|998020;
                       STA.W $0000,Y                        ;8BA477|990000  |7E0000;
                       TXA                                  ;8BA47A|8A      |      ;
                       CLC                                  ;8BA47B|18      |      ;
                       ADC.W $0053,Y                        ;8BA47C|795300  |7E0053;
                       STA.W $004F,Y                        ;8BA47F|994F00  |7E004F;
                       LDA.W $004A,Y                        ;8BA482|B94A00  |7E004A;
                       AND.W #$FFF7                         ;8BA485|29F7FF  |      ;
                       STA.W $004A,Y                        ;8BA488|994A00  |7E004A;
                       JSL.L CODE_FL_849C43                 ;8BA48B|22439C84|849C43;
                       RTS                                  ;8BA48F|60      |      ;
 
       UNREACH_8BA490:
                       db $17,$21,$1D,$30,$02,$04,$11,$15   ;8BA490|        |000021;
                       db $0D,$1B,$23,$26,$25,$14,$03,$19   ;8BA498|        |00231B;
                       db $07,$06,$22,$0B,$09,$31           ;8BA4A0|        |000006;
                       db $1C,$05                           ;8BA4A6|        |      ;
                       db $13,$10,$1A,$08,$0C,$16,$01,$0F   ;8BA4A8|        |000010;
 
         DATA8_8BA4B0:
                       db $07,$06,$22,$0B,$09,$31,$1C,$05   ;8BA4B0|        |      ;
                       db $13,$10,$1A,$08,$0C,$16,$01,$0F   ;8BA4B8|        |      ;
                       db $17,$21,$1D,$30,$02,$04,$11,$15   ;8BA4C0|        |      ;
                       db $0D                               ;8BA4C8|        |      ;
                       db $1B,$23,$26                       ;8BA4C9|        |      ;
                       db $25,$14,$03                       ;8BA4CC|        |      ;
                       db $19                               ;8BA4CF|        |001B0D;
 
         DATA8_8BA4D0:
                       db $0D,$1B,$23,$26,$25               ;8BA4D0|        |      ;
                       db $14,$03,$19,$17,$21,$1D,$30,$02   ;8BA4D5|        |000003;
                       db $04,$11,$15,$13,$10,$1A,$08,$0C   ;8BA4DD|        |000011;
                       db $16,$01,$0F,$07,$06,$22,$0B,$09   ;8BA4E5|        |000001;
                       db $31,$1C,$05                       ;8BA4ED|        |00001C;
 
         DATA8_8BA4F0:
                       db $13,$10,$1A,$08,$0C               ;8BA4F0|        |      ;
                       db $16,$01                           ;8BA4F5|        |000001;
                       db $0F,$07                           ;8BA4F7|        |      ;
                       db $06,$22,$0B,$09,$31,$1C           ;8BA4F9|        |000022;
                       db $05,$0D,$1B                       ;8BA4FF|        |      ;
                       db $23,$26                           ;8BA502|        |000026;
                       db $25,$14                           ;8BA504|        |      ;
                       db $03,$19,$17,$21,$1D,$30           ;8BA506|        |000019;
                       db $02,$04,$11,$15                   ;8BA50C|        |      ;
 
         DATA8_8BA510:
                       db $02,$04,$11,$15,$17,$21           ;8BA510|        |      ;
                       db $1D,$30,$25,$14,$03,$19,$0D,$1B   ;8BA516|        |002530;
                       db $23,$26                           ;8BA51E|        |000026;
                       db $09,$31,$1C,$05,$07,$06           ;8BA520|        |      ;
                       db $22,$0B,$0C,$16,$01,$0F,$13,$10   ;8BA526|        |160C0B;
                       db $1A,$08                           ;8BA52E|        |      ;
 
         DATA8_8BA530:
                       db $09,$31,$1C,$05,$07,$06,$22,$0B   ;8BA530|        |      ;
                       db $0C                               ;8BA538|        |      ;
                       db $16,$01,$0F,$13                   ;8BA539|        |000001;
                       db $10,$1A                           ;8BA53D|        |      ;
                       db $08,$02                           ;8BA53F|        |      ;
                       db $04,$11                           ;8BA541|        |      ;
                       db $15                               ;8BA543|        |000017;
                       db $17,$21,$1D,$30,$25               ;8BA544|        |      ;
                       db $14,$03,$19,$0D,$1B,$23,$26       ;8BA549|        |000003;
 
         DATA8_8BA550:
                       db $0C,$16                           ;8BA550|        |      ;
                       db $01,$0F                           ;8BA552|        |00000F;
                       db $13,$10                           ;8BA554|        |      ;
                       db $1A,$08                           ;8BA556|        |      ;
                       db $09,$31                           ;8BA558|        |      ;
                       db $1C,$05                           ;8BA55A|        |000705;
                       db $07,$06                           ;8BA55C|        |      ;
                       db $22,$0B                           ;8BA55E|        |14250B;
                       db $25,$14                           ;8BA560|        |      ;
                       db $03,$19                           ;8BA562|        |000019;
                       db $0D,$1B                           ;8BA564|        |      ;
                       db $23,$26                           ;8BA566|        |000026;
                       db $02,$04                           ;8BA568|        |      ;
                       db $11,$15                           ;8BA56A|        |000015;
                       db $17,$21                           ;8BA56C|        |      ;
                       db $1D,$30                           ;8BA56E|        |002530;
 
         DATA8_8BA570:
                       db $25,$14,$03,$19,$0D,$1B,$23,$26   ;8BA570|        |      ;
                       db $02,$04,$11,$15,$17,$21           ;8BA578|        |      ;
                       db $1D,$30,$0C,$16,$01,$0F,$13,$10   ;8BA57E|        |000C30;
                       db $1A,$08,$09,$31,$1C,$05,$07,$06   ;8BA586|        |      ;
                       db $22,$0B                           ;8BA58E|        |C2080B;
 
       CODE_FL_8BA590:
                       PHP                                  ;8BA590|08      |      ;
                       REP #$30                             ;8BA591|C230    |      ;
                       PHB                                  ;8BA593|8B      |      ;
                       PHY                                  ;8BA594|5A      |      ;
                       JSL.L CODE_FL_84ADBC                 ;8BA595|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BA599|        |      ;
                       JSL.L CODE_FL_84ADF2                 ;8BA59C|22F2AD84|84ADF2;
                       db $47,$FC,$99                       ;8BA5A0|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BA5A3|22FF9384|8493FF;
                       PLY                                  ;8BA5A7|7A      |      ;
                       PLB                                  ;8BA5A8|AB      |      ;
                       PLP                                  ;8BA5A9|28      |      ;
                       RTL                                  ;8BA5AA|6B      |      ;
 
       CODE_FL_8BA5AB:
                       PHP                                  ;8BA5AB|08      |      ;
                       REP #$30                             ;8BA5AC|C230    |      ;
                       PHB                                  ;8BA5AE|8B      |      ;
                       PHY                                  ;8BA5AF|5A      |      ;
                       JSL.L CODE_FL_84ADBC                 ;8BA5B0|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BA5B4|        |      ;
                       JSL.L CODE_FL_84ADF2                 ;8BA5B7|22F2AD84|84ADF2;
                       db $78,$FC,$99                       ;8BA5BB|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BA5BE|22FF9384|8493FF;
                       PLY                                  ;8BA5C2|7A      |      ;
                       PLB                                  ;8BA5C3|AB      |      ;
                       PLP                                  ;8BA5C4|28      |      ;
                       RTL                                  ;8BA5C5|6B      |      ;
 
       CODE_FL_8BA5C6:
                       PHP                                  ;8BA5C6|08      |      ;
                       REP #$30                             ;8BA5C7|C230    |      ;
                       PHB                                  ;8BA5C9|8B      |      ;
                       PHX                                  ;8BA5CA|DA      |      ;
                       PHY                                  ;8BA5CB|5A      |      ;
                       ASL A                                ;8BA5CC|0A      |      ;
                       ASL A                                ;8BA5CD|0A      |      ;
                       TAX                                  ;8BA5CE|AA      |      ;
                       LDA.W #$7F00                         ;8BA5CF|A9007F  |      ;
                       STA.B $25                            ;8BA5D2|8525    |000025;
                       LDA.W #$9080                         ;8BA5D4|A98090  |      ;
                       STA.B $24                            ;8BA5D7|8524    |000024;
                       LDA.W #$7E00                         ;8BA5D9|A9007E  |      ;
                       STA.B $28                            ;8BA5DC|8528    |000028;
                       LDA.W #$3000                         ;8BA5DE|A90030  |      ;
                       STA.B $27                            ;8BA5E1|8527    |000027;
                       LDA.B $24                            ;8BA5E3|A524    |000024;
                       CLC                                  ;8BA5E5|18      |      ;
                       ADC.L DATA8_8BA61B,X                 ;8BA5E6|7F1BA68B|8BA61B;
                       STA.B $24                            ;8BA5EA|8524    |000024;
                       LDA.B $27                            ;8BA5EC|A527    |000027;
                       CLC                                  ;8BA5EE|18      |      ;
                       ADC.L DATA8_8BA61D,X                 ;8BA5EF|7F1DA68B|8BA61D;
                       STA.B $27                            ;8BA5F3|8527    |000027;
                       LDX.W #$0004                         ;8BA5F5|A20400  |      ;
 
                     - LDY.W #$000E                         ;8BA5F8|A00E00  |      ;
 
                    -- LDA.B [$24],Y                        ;8BA5FB|B724    |000024;
                       STA.B [$27],Y                        ;8BA5FD|9727    |000027;
                       DEY                                  ;8BA5FF|88      |      ;
                       DEY                                  ;8BA600|88      |      ;
                       BPL --                               ;8BA601|10F8    |8BA5FB;
                       LDA.B $24                            ;8BA603|A524    |000024;
                       CLC                                  ;8BA605|18      |      ;
                       ADC.W #$0040                         ;8BA606|694000  |      ;
                       STA.B $24                            ;8BA609|8524    |000024;
                       LDA.B $27                            ;8BA60B|A527    |000027;
                       CLC                                  ;8BA60D|18      |      ;
                       ADC.W #$0040                         ;8BA60E|694000  |      ;
                       STA.B $27                            ;8BA611|8527    |000027;
                       DEX                                  ;8BA613|CA      |      ;
                       BNE -                                ;8BA614|D0E2    |8BA5F8;
                       PLY                                  ;8BA616|7A      |      ;
                       PLX                                  ;8BA617|FA      |      ;
                       PLB                                  ;8BA618|AB      |      ;
                       PLP                                  ;8BA619|28      |      ;
                       RTL                                  ;8BA61A|6B      |      ;
 
         DATA8_8BA61B:
                       db $00,$00                           ;8BA61B|        |      ;
 
         DATA8_8BA61D:
                       db $D0,$04,$00,$00,$DA,$04,$10,$00   ;8BA61D|        |      ;
                       db $CC,$04,$10,$00,$D6,$04,$00,$00   ;8BA625|        |      ;
                       db $D0,$05,$00,$00,$DA,$05,$00,$00   ;8BA62D|        |      ;
                       db $E4,$05,$10,$00,$D6,$05           ;8BA635|        |      ;
                       db $00,$00,$04,$04,$00,$00,$04,$04   ;8BA63B|        |      ;
                       db $00,$00,$04,$04,$00,$00,$04,$04   ;8BA643|        |      ;
                       db $10,$00,$E0,$04                   ;8BA64B|        |      ;
 
       CODE_FL_8BA64F:
                       PHP                                  ;8BA64F|08      |      ;
                       REP #$30                             ;8BA650|C230    |      ;
                       LDA.L $7ED27A                        ;8BA652|AF7AD27E|7ED27A;
                       BEQ +                                ;8BA656|F020    |8BA678;
                       DEC A                                ;8BA658|3A      |      ;
                       STA.L $7ED27A                        ;8BA659|8F7AD27E|7ED27A;
                       TAX                                  ;8BA65D|AA      |      ;
                       SEP #$20                             ;8BA65E|E220    |      ;
                       LDA.L DATA8_8BA67A,X                 ;8BA660|BF7AA68B|8BA67A;
                       STA.W $01EA                          ;8BA664|8DEA01  |7E01EA;
                       LDA.B #$00                           ;8BA667|A900    |      ;
                       STA.W $01E3                          ;8BA669|8DE301  |7E01E3;
                       LDA.B #$A0                           ;8BA66C|A9A0    |      ;
                       STA.W $01E6                          ;8BA66E|8DE601  |7E01E6;
                       LDA.B #$33                           ;8BA671|A933    |      ;
                       STA.W $01E7                          ;8BA673|8DE701  |7E01E7;
                       REP #$20                             ;8BA676|C220    |      ;
 
                     + PLP                                  ;8BA678|28      |      ;
                       RTL                                  ;8BA679|6B      |      ;
 
         DATA8_8BA67A:
                       db $E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7   ;8BA67A|        |      ;
                       db $E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF   ;8BA682|        |      ;
                       db $F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7   ;8BA68A|        |      ;
                       db $F8,$F9,$FA,$FB,$E0,$FD,$E0,$FF   ;8BA692|        |      ;
                       PHP                                  ;8BA69A|08      |      ;
                       REP #$30                             ;8BA69B|C230    |      ;
                       LDA.W #$0020                         ;8BA69D|A92000  |      ;
                       STA.L $7ED27A                        ;8BA6A0|8F7AD27E|7ED27A;
                       LDA.W #$0015                         ;8BA6A4|A91500  |      ;
                       STA.W $198A                          ;8BA6A7|8D8A19  |8B198A;
                       PLP                                  ;8BA6AA|28      |      ;
                       RTL                                  ;8BA6AB|6B      |      ;
 
       CODE_FL_8BA6AC:
                       PHP                                  ;8BA6AC|08      |      ;
                       REP #$30                             ;8BA6AD|C230    |      ;
                       PHB                                  ;8BA6AF|8B      |      ;
                       PHK                                  ;8BA6B0|4B      |      ;
                       PLB                                  ;8BA6B1|AB      |      ;
                       LDA.L $7ED276                        ;8BA6B2|AF76D27E|7ED276;
                       BEQ +                                ;8BA6B6|F058    |8BA710;
                       DEC A                                ;8BA6B8|3A      |      ;
                       STA.L $7ED276                        ;8BA6B9|8F76D27E|7ED276;
                       BNE ++                               ;8BA6BD|D012    |8BA6D1;
 
                     - SEP #$20                             ;8BA6BF|E220    |      ;
                       LDA.B #$04                           ;8BA6C1|A904    |      ;
                       TRB.W $01E2                          ;8BA6C3|1CE201  |8B01E2;
                       REP #$20                             ;8BA6C6|C220    |      ;
                       LDA.W #$0000                         ;8BA6C8|A90000  |      ;
                       STA.L $7ED25A                        ;8BA6CB|8F5AD27E|7ED25A;
                       BRA +                                ;8BA6CF|803F    |8BA710;
 
                    ++ LDA.L $7ED278                        ;8BA6D1|AF78D27E|7ED278;
                       CMP.W #$003B                         ;8BA6D5|C93B00  |      ;
                       BEQ ++                               ;8BA6D8|F002    |8BA6DC;
                       BPL +++                              ;8BA6DA|1007    |8BA6E3;
 
                    ++ CMP.W #$0000                         ;8BA6DC|C90000  |      ;
                       BEQ +++                              ;8BA6DF|F002    |8BA6E3;
                       BPL ++                               ;8BA6E1|1005    |8BA6E8;
 
                   +++ LDA.W #$003B                         ;8BA6E3|A93B00  |      ;
                       BRA +++                              ;8BA6E6|8001    |8BA6E9;
 
                    ++ DEC A                                ;8BA6E8|3A      |      ;
 
                   +++ STA.L $7ED278                        ;8BA6E9|8F78D27E|7ED278;
                       CMP.W #$003B                         ;8BA6ED|C93B00  |      ;
                       BNE ++                               ;8BA6F0|D006    |8BA6F8;
                       PHA                                  ;8BA6F2|48      |      ;
                       JSL.L CODE_FL_8BF16D                 ;8BA6F3|226DF18B|8BF16D;
                       PLA                                  ;8BA6F7|68      |      ;
 
                    ++ CMP.W #$0008                         ;8BA6F8|C90800  |      ;
                       BCC -                                ;8BA6FB|90C2    |8BA6BF;
                       SEP #$20                             ;8BA6FD|E220    |      ;
                       LDA.B #$04                           ;8BA6FF|A904    |      ;
                       TSB.W $01E2                          ;8BA701|0CE201  |8B01E2;
                       REP #$20                             ;8BA704|C220    |      ;
                       JSL.L Move_TitleScreenLittleYoshi    ;8BA706|22DC8084|8480DC;
                       STA.L $7ED25A                        ;8BA70A|8F5AD27E|7ED25A;
                       BRA +                                ;8BA70E|8000    |8BA710;
 
                     + PLB                                  ;8BA710|AB      |      ;
                       PLP                                  ;8BA711|28      |      ;
                       RTL                                  ;8BA712|6B      |      ;
 
       CODE_FL_8BA713:
                       LDA.L $7ED3A1                        ;8BA713|AFA1D37E|7ED3A1;
                       CMP.W #$0008                         ;8BA717|C90800  |      ;
                       BNE +                                ;8BA71A|D019    |8BA735;
                       LDA.W #$00B4                         ;8BA71C|A9B400  |      ;
                       STA.L $7ED276                        ;8BA71F|8F76D27E|7ED276;
                       LDA.W #$0000                         ;8BA723|A90000  |      ;
                       STA.L $7ED278                        ;8BA726|8F78D27E|7ED278;
                       LDA.L $7ED1E4                        ;8BA72A|AFE4D17E|7ED1E4;
                       ORA.W #$1000                         ;8BA72E|090010  |      ;
                       STA.L $7ED1E4                        ;8BA731|8FE4D17E|7ED1E4;
 
                     + RTL                                  ;8BA735|6B      |      ;
 
       CODE_FL_8BA736:
                       PHP                                  ;8BA736|08      |      ;
                       REP #$30                             ;8BA737|C230    |      ;
                       LDA.L $7ED274                        ;8BA739|AF74D27E|7ED274;
                       BIT.W #$4000                         ;8BA73D|890040  |      ;
                       BEQ +                                ;8BA740|F01C    |8BA75E;
                       AND.W #$3FFF                         ;8BA742|29FF3F  |      ;
                       STA.L $7ED274                        ;8BA745|8F74D27E|7ED274;
                       SEP #$20                             ;8BA749|E220    |      ;
                       LDA.L $7ED26A                        ;8BA74B|AF6AD27E|7ED26A;
                       AND.B #$FB                           ;8BA74F|29FB    |      ;
                       STA.L $7ED26A                        ;8BA751|8F6AD27E|7ED26A;
                       REP #$20                             ;8BA755|C220    |      ;
                       LDA.W #$0000                         ;8BA757|A90000  |      ;
                       STA.L $7ED268                        ;8BA75A|8F68D27E|7ED268;
 
                     + LDA.L $7ED274                        ;8BA75E|AF74D27E|7ED274;
                       BIT.W #$8000                         ;8BA762|890080  |      ;
                       BEQ +                                ;8BA765|F016    |8BA77D;
                       SEP #$20                             ;8BA767|E220    |      ;
                       LDA.L $7ED26A                        ;8BA769|AF6AD27E|7ED26A;
                       ORA.B #$04                           ;8BA76D|0904    |      ;
                       STA.L $7ED26A                        ;8BA76F|8F6AD27E|7ED26A;
                       REP #$20                             ;8BA773|C220    |      ;
                       JSL.L Move_TitleScreenLittleYoshi    ;8BA775|22DC8084|8480DC;
                       STA.L $7ED268                        ;8BA779|8F68D27E|7ED268;
 
                     + PLP                                  ;8BA77D|28      |      ;
                       RTL                                  ;8BA77E|6B      |      ;
 
       CODE_JP_8BA77F:
                       LDA.L $7ED274                        ;8BA77F|AF74D27E|7ED274;
                       ORA.W #$8000                         ;8BA783|090080  |      ;
                       STA.L $7ED274                        ;8BA786|8F74D27E|7ED274;
                       JSL.L CODE_FL_8BF16D                 ;8BA78A|226DF18B|8BF16D;
                       RTL                                  ;8BA78E|6B      |      ;
 
       CODE_JP_8BA78F:
                       LDA.L $7ED274                        ;8BA78F|AF74D27E|7ED274;
                       ORA.W #$4000                         ;8BA793|090040  |      ;
                       STA.L $7ED274                        ;8BA796|8F74D27E|7ED274;
                       RTL                                  ;8BA79A|6B      |      ;
                       LDA.L $7ED39F                        ;8BA79B|AF9FD37E|7ED39F;
                       TAX                                  ;8BA79F|AA      |      ;
                       SEP #$20                             ;8BA7A0|E220    |      ;
                       LDA.B #$03                           ;8BA7A2|A903    |      ;
                       STA.L $7ED1E6,X                      ;8BA7A4|9FE6D17E|7ED1E6;
                       REP #$20                             ;8BA7A8|C220    |      ;
                       JMP.W CODE_JP_8BA77F                 ;8BA7AA|4C7FA7  |8BA77F;
                       LDA.L $7ED39F                        ;8BA7AD|AF9FD37E|7ED39F;
                       TAX                                  ;8BA7B1|AA      |      ;
                       SEP #$20                             ;8BA7B2|E220    |      ;
                       LDA.B #$02                           ;8BA7B4|A902    |      ;
                       STA.L $7ED1E6,X                      ;8BA7B6|9FE6D17E|7ED1E6;
                       REP #$20                             ;8BA7BA|C220    |      ;
                       JMP.W CODE_JP_8BA78F                 ;8BA7BC|4C8FA7  |8BA78F;
                       db $AF,$A1,$D3,$7E,$AA,$E2,$20,$A9   ;8BA7BF|        |7ED3A1;
                       db $03,$9F,$E6,$D1,$7E,$C2,$20,$4C   ;8BA7C7|        |00009F;
                       db $7F,$A7,$AF,$A1,$D3,$7E,$AA,$E2   ;8BA7CF|        |A1AFA7;
                       db $20,$A9,$02,$9F,$E6,$D1,$7E,$C2   ;8BA7D7|        |8B02A9;
                       db $20,$4C,$8F,$A7                   ;8BA7DF|        |8B8F4C;
 
       CODE_FL_8BA7E3:
                       LDA.B $B7                            ;8BA7E3|A5B7    |0000B7;
                       AND.L $7ED327                        ;8BA7E5|2F27D37E|7ED327;
                       BEQ +                                ;8BA7E9|F02A    |8BA815;
                       LDA.L $7ED329                        ;8BA7EB|AF29D37E|7ED329;
                       BNE +                                ;8BA7EF|D024    |8BA815;
                       LDA.L $7ED1E4                        ;8BA7F1|AFE4D17E|7ED1E4;
                       BIT.W #$0800                         ;8BA7F5|890008  |      ;
                       BNE +                                ;8BA7F8|D01B    |8BA815;
                       LDA.L $7ED24E                        ;8BA7FA|AF4ED27E|7ED24E;
                       AND.W #$00FF                         ;8BA7FE|29FF00  |      ;
                       CMP.W #$000F                         ;8BA801|C90F00  |      ;
                       BNE +                                ;8BA804|D00F    |8BA815;
                       JSL.L CODE_FL_8BF158                 ;8BA806|2258F18B|8BF158;
                       JSL.L CODE_FL_8BF12E                 ;8BA80A|222EF18B|8BF12E;
                       LDA.W #$0001                         ;8BA80E|A90100  |      ;
                       STA.L $7ED329                        ;8BA811|8F29D37E|7ED329;
 
                     + LDA.L $7ED329                        ;8BA815|AF29D37E|7ED329;
                       BEQ +                                ;8BA819|F06B    |8BA886;
                       LDA.W #$000F                         ;8BA81B|A90F00  |      ;
                       SEC                                  ;8BA81E|38      |      ;
                       SBC.L $7ED32B                        ;8BA81F|EF2BD37E|7ED32B;
                       BPL ++                               ;8BA823|1003    |8BA828;
                       LDA.W #$0000                         ;8BA825|A90000  |      ;
 
                    ++ SEP #$20                             ;8BA828|E220    |      ;
                       STA.L $7ED24E                        ;8BA82A|8F4ED27E|7ED24E;
                       STA.L $7ED25C                        ;8BA82E|8F5CD27E|7ED25C;
                       REP #$20                             ;8BA832|C220    |      ;
                       LDA.L $7ED32B                        ;8BA834|AF2BD37E|7ED32B;
                       CMP.W #$0010                         ;8BA838|C91000  |      ;
                       BNE ++                               ;8BA83B|D040    |8BA87D;
                       SEP #$20                             ;8BA83D|E220    |      ;
                       LDA.B #$81                           ;8BA83F|A981    |      ;
                       STA.L NMITIMEN                       ;8BA841|8F004200|004200;
                       REP #$20                             ;8BA845|C220    |      ;
                       JSL.L CODE_FL_80A145                 ;8BA847|2245A180|80A145;
                       JSL.L CODE_FL_809115                 ;8BA84B|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8BA84F|22F79C80|809CF7;
                       LDA.W #$0000                         ;8BA853|A90000  |      ;
                       STA.L $7ED1E0                        ;8BA856|8FE0D17E|7ED1E0;
                       LDA.L $7ED32D                        ;8BA85A|AF2DD37E|7ED32D;
                       BNE UNREACH_8BA877                   ;8BA85E|D017    |8BA877;
                       LDA.L $7ED1E4                        ;8BA860|AFE4D17E|7ED1E4;
                       AND.W #$DFFF                         ;8BA864|29FFDF  |      ;
                       AND.W #$BFFF                         ;8BA867|29FFBF  |      ;
                       STA.L $7ED1E4                        ;8BA86A|8FE4D17E|7ED1E4;
                       LDA.W #$0007                         ;8BA86E|A90700  |      ;
                       STA.L Game_State-$7E0000             ;8BA871|8FA00200|0002A0;
                       BRA +                                ;8BA875|800F    |8BA886;
 
       UNREACH_8BA877:
                       db $22,$CD,$BD,$83,$80,$09           ;8BA877|        |83BDCD;
 
                    ++ LDA.L $7ED32B                        ;8BA87D|AF2BD37E|7ED32B;
                       INC A                                ;8BA881|1A      |      ;
                       STA.L $7ED32B                        ;8BA882|8F2BD37E|7ED32B;
 
                     + RTL                                  ;8BA886|6B      |      ;
                       SEP #$20                             ;8BA887|E220    |      ;
                       LDA.B #$81                           ;8BA889|A981    |      ;
                       STA.L NMITIMEN                       ;8BA88B|8F004200|004200;
                       REP #$20                             ;8BA88F|C220    |      ;
                       JSL.L CODE_FL_80A145                 ;8BA891|2245A180|80A145;
                       JSL.L CODE_FL_809115                 ;8BA895|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8BA899|22F79C80|809CF7;
                       LDA.W #$0000                         ;8BA89D|A90000  |      ;
                       STA.L $7ED1E0                        ;8BA8A0|8FE0D17E|7ED1E0;
                       STA.L $001A82                        ;8BA8A4|8F821A00|001A82;
                       LDA.L $7ED1E4                        ;8BA8A8|AFE4D17E|7ED1E4;
                       AND.W #$FBFF                         ;8BA8AC|29FFFB  |      ;
                       STA.L $7ED1E4                        ;8BA8AF|8FE4D17E|7ED1E4;
                       LDA.L $7ED1E4                        ;8BA8B3|AFE4D17E|7ED1E4;
                       BIT.W #$0800                         ;8BA8B7|890008  |      ;
                       BEQ +                                ;8BA8BA|F006    |8BA8C2;
                       JSL.L CODE_FL_8BA9E5                 ;8BA8BC|22E5A98B|8BA9E5;
                       BRA ++                               ;8BA8C0|8065    |8BA927;
 
                     + LDA.B $B3                            ;8BA8C2|A5B3    |0000B3;
                       AND.W #$FFF0                         ;8BA8C4|29F0FF  |      ;
                       CMP.W #$4040                         ;8BA8C7|C94040  |      ;
                       BNE +                                ;8BA8CA|D017    |8BA8E3;
                       LDA.L $7ED1E4                        ;8BA8CC|AFE4D17E|7ED1E4;
                       AND.W #$DFFF                         ;8BA8D0|29FFDF  |      ;
                       AND.W #$BFFF                         ;8BA8D3|29FFBF  |      ;
                       STA.L $7ED1E4                        ;8BA8D6|8FE4D17E|7ED1E4;
                       LDA.W #$0007                         ;8BA8DA|A90700  |      ;
                       STA.L Game_State-$7E0000             ;8BA8DD|8FA00200|0002A0;
                       BRA ++                               ;8BA8E1|8044    |8BA927;
 
                     + LDA.L $7ED21A                        ;8BA8E3|AF1AD27E|7ED21A;
                       TAX                                  ;8BA8E7|AA      |      ;
                       LDA.L DATA8_8BA928,X                 ;8BA8E8|BF28A98B|8BA928;
                       AND.W #$00FF                         ;8BA8EC|29FF00  |      ;
                       STA.L Character_1P-$7E0000           ;8BA8EF|8FBA0200|0002BA;
                       LDA.L $7ED1E2                        ;8BA8F3|AFE2D17E|7ED1E2;
                       TAX                                  ;8BA8F7|AA      |      ;
                       LDA.L DATA8_8BA935,X                 ;8BA8F8|BF35A98B|8BA935;
                       AND.W #$00FF                         ;8BA8FC|29FF00  |      ;
                       STA.L $0002BC                        ;8BA8FF|8FBC0200|0002BC;
                       LDA.W #$0003                         ;8BA903|A90300  |      ;
                       STA.L Game_State-$7E0000             ;8BA906|8FA00200|0002A0;
                       LDA.W #$0001                         ;8BA90A|A90100  |      ;
                       STA.L $0002A8                        ;8BA90D|8FA80200|0002A8;
                       LDA.W #$0000                         ;8BA911|A90000  |      ;
                       STA.L $7E38FE                        ;8BA914|8FFE387E|7E38FE;
                       STA.L Game_State_State-$7E0000       ;8BA918|8FA20200|0002A2;
                       LDA.W #$0005                         ;8BA91C|A90500  |      ;
                       STA.L Difficulty_1P-$7E0000          ;8BA91F|8FAC0200|0002AC;
                       STA.L Difficulty_2P-$7E0000          ;8BA923|8FAE0200|0002AE;
 
                    ++ RTS                                  ;8BA927|60      |      ;
 
         DATA8_8BA928:
                       db $00,$01,$02,$03,$04,$05,$06,$07   ;8BA928|        |      ;
                       db $08                               ;8BA930|        |      ;
                       db $09,$0A,$0B                       ;8BA931|        |      ;
                       db $0C                               ;8BA934|        |      ;
 
         DATA8_8BA935:
                       db $00,$01,$02,$03,$04,$05,$06,$07   ;8BA935|        |      ;
                       db $08,$09,$0A,$0B,$0B               ;8BA93D|        |      ;
 
       CODE_FL_8BA942:
                       PHP                                  ;8BA942|08      |      ;
                       REP #$30                             ;8BA943|C230    |      ;
                       LDA.W #$0000                         ;8BA945|A90000  |      ;
                       STA.L $7ED1E0                        ;8BA948|8FE0D17E|7ED1E0;
                       LDA.L $7ED1E4                        ;8BA94C|AFE4D17E|7ED1E4;
                       AND.W #$DFFF                         ;8BA950|29FFDF  |      ;
                       AND.W #$BFFF                         ;8BA953|29FFBF  |      ;
                       STA.L $7ED1E4                        ;8BA956|8FE4D17E|7ED1E4;
                       LDA.W #$0007                         ;8BA95A|A90700  |      ;
                       STA.L Game_State-$7E0000             ;8BA95D|8FA00200|0002A0;
                       LDA.L $7ED21A                        ;8BA961|AF1AD27E|7ED21A;
                       TAX                                  ;8BA965|AA      |      ;
                       SEP #$20                             ;8BA966|E220    |      ;
                       LDA.L $7ED1F6,X                      ;8BA968|BFF6D17E|7ED1F6;
                       INC A                                ;8BA96C|1A      |      ;
                       STA.L $7ED1F6,X                      ;8BA96D|9FF6D17E|7ED1F6;
                       REP #$20                             ;8BA971|C220    |      ;
                       LDA.L $7ED21A                        ;8BA973|AF1AD27E|7ED21A;
                       CMP.W #$000C                         ;8BA977|C90C00  |      ;
                       BEQ +                                ;8BA97A|F011    |8BA98D;
                       SEP #$20                             ;8BA97C|E220    |      ;
                       LDA.B #$00                           ;8BA97E|A900    |      ;
                       STA.L $7ED1E6,X                      ;8BA980|9FE6D17E|7ED1E6;
                       REP #$20                             ;8BA984|C220    |      ;
                       LDA.W #$000C                         ;8BA986|A90C00  |      ;
                       STA.L $7ED21A                        ;8BA989|8F1AD27E|7ED21A;
 
                     + PLP                                  ;8BA98D|28      |      ;
                       RTL                                  ;8BA98E|6B      |      ;
 
       CODE_FL_8BA98F:
                       PHP                                  ;8BA98F|08      |      ;
                       REP #$30                             ;8BA990|C230    |      ;
                       LDA.W #$0000                         ;8BA992|A90000  |      ;
                       STA.L $7ED1E0                        ;8BA995|8FE0D17E|7ED1E0;
                       LDA.L $7ED1E4                        ;8BA999|AFE4D17E|7ED1E4;
                       AND.W #$DFFF                         ;8BA99D|29FFDF  |      ;
                       ORA.W #$4000                         ;8BA9A0|090040  |      ;
                       STA.L $7ED1E4                        ;8BA9A3|8FE4D17E|7ED1E4;
                       LDA.W #$0007                         ;8BA9A7|A90700  |      ;
                       STA.L Game_State-$7E0000             ;8BA9AA|8FA00200|0002A0;
                       LDA.L $0002BC                        ;8BA9AE|AFBC0200|0002BC;
                       TAX                                  ;8BA9B2|AA      |      ;
                       LDA.L Character_1P-$7E0000           ;8BA9B3|AFBA0200|0002BA;
                       STA.L $7ED206,X                      ;8BA9B7|9F06D27E|7ED206;
                       JSR.W CODE_FN_8BA9C0                 ;8BA9BB|20C0A9  |8BA9C0;
                       PLP                                  ;8BA9BE|28      |      ;
                       RTL                                  ;8BA9BF|6B      |      ;
 
       CODE_FN_8BA9C0:
                       LDA.L $001A80                        ;8BA9C0|AF801A00|001A80;
                       AND.W #$0003                         ;8BA9C4|290300  |      ;
                       TAX                                  ;8BA9C7|AA      |      ;
                       LDA.L DATA8_8BA9E1,X                 ;8BA9C8|BFE1A98B|8BA9E1;
                       AND.W #$00FF                         ;8BA9CC|29FF00  |      ;
                       CMP.L $0002BC                        ;8BA9CF|CFBC0200|0002BC;
                       BNE +                                ;8BA9D3|D00B    |8BA9E0;
                       LDA.L $7ED1E4                        ;8BA9D5|AFE4D17E|7ED1E4;
                       ORA.W #$0800                         ;8BA9D9|090008  |      ;
                       STA.L $7ED1E4                        ;8BA9DC|8FE4D17E|7ED1E4;
 
                     + RTS                                  ;8BA9E0|60      |      ;
 
         DATA8_8BA9E1:
                       db $09,$0A,$0B,$0B                   ;8BA9E1|        |      ;
 
       CODE_FL_8BA9E5:
                       PHP                                  ;8BA9E5|08      |      ;
                       REP #$30                             ;8BA9E6|C230    |      ;
                       LDA.L $001A80                        ;8BA9E8|AF801A00|001A80;
                       BNE +                                ;8BA9EC|D006    |8BA9F4;
                       JSL.L CODE_FL_86D898                 ;8BA9EE|2298D886|86D898;
                       PLP                                  ;8BA9F2|28      |      ;
                       RTL                                  ;8BA9F3|6B      |      ;
 
                     + DEC A                                ;8BA9F4|3A      |      ;
                       BNE +                                ;8BA9F5|D006    |8BA9FD;
                       db $22,$B3,$F1,$8B,$28,$6B           ;8BA9F7|        |8BF1B3;
 
                     + DEC A                                ;8BA9FD|3A      |      ;
                       BNE UNREACH_8BAA06                   ;8BA9FE|D006    |8BAA06;
                       JSL.L CODE_FL_8BF1B3                 ;8BAA00|22B3F18B|8BF1B3;
                       PLP                                  ;8BAA04|28      |      ;
                       RTL                                  ;8BAA05|6B      |      ;
 
       UNREACH_8BAA06:
                       db $3A,$D0,$06,$22,$B3,$F1,$8B,$28   ;8BAA06|        |      ;
                       db $6B,$00                           ;8BAA0E|        |      ;
                       RTL                                  ;8BAA10|6B      |      ;
                       db $01,$FC,$B6,$FF,$FF,$FF,$19,$F1   ;8BAA11|        |      ;
                       db $8B,$01,$13,$B8,$FF,$FF,$FF,$26   ;8BAA19|        |      ;
                       db $A5,$89,$33,$B5,$FF,$26,$A5,$89   ;8BAA21|        |      ;
                       db $6B,$B5,$01,$10,$AA,$FF,$FF,$FF   ;8BAA29|        |      ;
                       db $F1,$D9,$86,$01,$10,$AA,$FF,$FF   ;8BAA31|        |      ;
                       db $01,$C7,$B5,$FF,$FF,$FF,$6D,$A5   ;8BAA39|        |      ;
                       db $89,$27,$D3,$7E,$00,$10,$1E,$C7   ;8BAA41|        |      ;
                       db $B5,$FF,$FF,$FF,$26,$A5,$89,$FA   ;8BAA49|        |      ;
                       db $B5,$01,$76,$B6,$FF,$FF,$FF,$6D   ;8BAA51|        |      ;
                       db $A5,$89,$5E,$D2,$7E,$00,$00,$08   ;8BAA59|        |      ;
                       db $DF,$B6,$00,$00,$01,$AA,$B6,$FF   ;8BAA61|        |      ;
                       db $FF,$FF,$5D,$A5,$89,$F2,$D1,$7E   ;8BAA69|        |      ;
                       db $03,$01,$34,$B6,$FF,$FF,$FF,$6D   ;8BAA71|        |      ;
                       db $A5,$89,$B3,$D4,$7E,$01,$00,$FF   ;8BAA79|        |      ;
                       db $26,$A5,$89,$FA,$B5,$FF,$6D,$A5   ;8BAA81|        |      ;
                       db $89,$27,$D3,$7E,$00,$10,$FF,$26   ;8BAA89|        |      ;
                       db $A5,$89,$B9,$B7,$FF,$6D,$A5,$89   ;8BAA91|        |      ;
                       db $27,$D3,$7E,$00,$10,$FF,$5D,$A5   ;8BAA99|        |      ;
                       db $89,$F2,$D1,$7E,$02,$1E,$10,$AA   ;8BAAA1|        |      ;
                       db $FF,$FF,$FF,$99,$C6,$8B,$01,$4C   ;8BAAA9|        |      ;
                       db $B6,$FF,$FF,$FF,$6D,$A5,$89,$FE   ;8BAAB1|        |      ;
                       db $D3,$7E,$01,$00,$FF,$26,$A5,$89   ;8BAAB9|        |      ;
                       db $17,$B6,$FF,$6D,$A5,$89,$B3,$D4   ;8BAAC1|        |      ;
                       db $7E,$00,$00,$FF,$26,$A5,$89,$A2   ;8BAAC9|        |      ;
                       db $B7,$01,$10,$AA,$FF,$FF,$01,$9B   ;8BAAD1|        |      ;
                       db $A7,$FF,$FF,$FF,$26,$A5,$89,$F5   ;8BAAD9|        |      ;
                       db $B7,$1E,$10,$AA,$FF,$FF,$01,$AD   ;8BAAE1|        |      ;
                       db $A7,$FF,$FF,$01,$83,$C5,$FF,$FF   ;8BAAE9|        |      ;
                       db $78,$10,$AA,$FF,$FF,$FF,$3C,$F1   ;8BAAF1|        |      ;
                       db $8B,$FF,$04,$F1,$8B,$FF,$0E,$C1   ;8BAAF9|        |      ;
                       db $8B,$04,$10,$AA,$FF,$FF,$FF,$9A   ;8BAB01|        |      ;
                       db $A6,$8B,$FF,$26,$A5,$89,$EA,$B6   ;8BAB09|        |      ;
                       db $01,$9F,$B6,$FF,$FF,$01,$1C,$B8   ;8BAB11|        |      ;
                       db $FF,$FF,$FF,$6D,$A5,$89,$B3,$D4   ;8BAB19|        |      ;
                       db $7E,$01,$00,$FF,$26,$A5,$89,$FA   ;8BAB21|        |      ;
                       db $B5,$FF,$6D,$A5,$89,$FE,$D3,$7E   ;8BAB29|        |      ;
                       db $00,$00,$FF,$26,$A5,$89,$B9,$B7   ;8BAB31|        |      ;
                       db $01,$BC,$CB,$FF,$FF,$78,$10,$AA   ;8BAB39|        |      ;
                       db $FF,$FF,$FF,$35,$F1,$8B,$FF,$26   ;8BAB41|        |      ;
                       db $A5,$89,$50,$B5,$FF,$26,$A5,$89   ;8BAB49|        |      ;
                       db $CC,$B7,$01,$FC,$B6,$FF,$FF,$FF   ;8BAB51|        |      ;
                       db $12,$F1,$8B,$01,$13,$B8,$FF,$FF   ;8BAB59|        |      ;
                       db $FF,$6D,$A5,$89,$B3,$D4,$7E,$01   ;8BAB61|        |      ;
                       db $00,$01,$DA,$C0,$FF,$FF,$FF,$26   ;8BAB69|        |      ;
                       db $A5,$89,$33,$B5,$FF,$6D,$A5,$89   ;8BAB71|        |      ;
                       db $27,$D3,$7E,$00,$10,$01,$10,$BB   ;8BAB79|        |      ;
                       db $FF,$FF,$FF,$26,$A5,$89,$B9,$B7   ;8BAB81|        |      ;
                       db $14,$10,$AA,$FF,$FF,$FF,$26,$A5   ;8BAB89|        |      ;
                       db $89,$00,$B8,$28,$10,$AA,$FF,$FF   ;8BAB91|        |      ;
                       db $01,$6C,$C5,$FF,$FF,$1E,$10,$AA   ;8BAB99|        |      ;
                       db $FF,$FF,$FF,$6D,$A5,$89,$FE,$D3   ;8BABA1|        |      ;
                       db $7E,$01,$00,$FF,$26,$A5,$89,$17   ;8BABA9|        |      ;
                       db $B6,$FF,$19,$F1,$8B,$FF,$26,$A5   ;8BABB1|        |      ;
                       db $89,$A2,$B7,$01,$10,$AA,$FF,$FF   ;8BABB9|        |      ;
                       db $01,$9B,$A7,$FF,$FF,$FF,$26,$A5   ;8BABC1|        |      ;
                       db $89,$F5,$B7,$1E,$10,$AA,$FF,$FF   ;8BABC9|        |      ;
                       db $01,$AD,$A7,$FF,$FF,$01,$83,$C5   ;8BABD1|        |      ;
                       db $FF,$FF,$78,$10,$AA,$FF,$FF,$FF   ;8BABD9|        |      ;
                       db $3C,$F1,$8B,$FF,$04,$F1,$8B,$FF   ;8BABE1|        |      ;
                       db $0E,$C1,$8B,$04,$10,$AA,$FF,$FF   ;8BABE9|        |      ;
                       db $FF,$9A,$A6,$8B,$FF,$26,$A5,$89   ;8BABF1|        |      ;
                       db $EA,$B6,$01,$1C,$B8,$FF,$FF,$FF   ;8BABF9|        |      ;
                       db $6D,$A5,$89,$B3,$D4,$7E,$01,$00   ;8BAC01|        |      ;
                       db $FF,$26,$A5,$89,$FA,$B5,$FF,$6D   ;8BAC09|        |      ;
                       db $A5,$89,$FE,$D3,$7E,$00,$00,$FF   ;8BAC11|        |      ;
                       db $26,$A5,$89,$B9,$B7,$01,$BC,$CB   ;8BAC19|        |      ;
                       db $FF,$FF,$78,$10,$AA,$FF,$FF,$FF   ;8BAC21|        |      ;
                       db $35,$F1,$8B,$FF,$26,$A5,$89,$50   ;8BAC29|        |      ;
                       db $B5,$FF,$26,$A5,$89,$CC,$B7,$08   ;8BAC31|        |      ;
                       db $DF,$B6,$00,$00,$01,$4C,$B6,$FF   ;8BAC39|        |      ;
                       db $FF,$01,$34,$B6,$FF,$FF,$FF,$6D   ;8BAC41|        |      ;
                       db $A5,$89,$FE,$D3,$7E,$01,$00,$FF   ;8BAC49|        |      ;
                       db $6D,$A5,$89,$5E,$D2,$7E,$00,$00   ;8BAC51|        |      ;
                       db $FF,$6D,$A5,$89,$44,$D3,$7E,$00   ;8BAC59|        |      ;
                       db $01,$FF,$55,$C5,$8B,$FF,$55,$C1   ;8BAC61|        |      ;
                       db $8B,$FF,$26,$A5,$89,$33,$B5,$FF   ;8BAC69|        |      ;
                       db $26,$A5,$89,$33,$B9,$01,$AF,$BA   ;8BAC71|        |      ;
                       db $FF,$FF,$FF,$6D,$A5,$89,$27,$D3   ;8BAC79|        |      ;
                       db $7E,$00,$10,$0A,$AF,$BA,$FF,$FF   ;8BAC81|        |      ;
                       db $01,$BC,$CB,$FF,$FF,$78,$AF,$BA   ;8BAC89|        |      ;
                       db $FF,$FF,$FF,$35,$F1,$8B,$FF,$26   ;8BAC91|        |      ;
                       db $A5,$89,$CF,$BA,$FF,$26,$A5,$89   ;8BAC99|        |      ;
                       db $CC,$B7                           ;8BACA1|        |      ;
                       db $01,$3A,$B7,$FF,$FF,$01,$4C,$B6   ;8BACA3|        |00003A;
                       db $FF,$FF,$01,$34,$B6,$FF,$FF,$FF   ;8BACAB|        |3401FF;
                       db $6D,$A5,$89,$FE,$D3,$7E,$01,$00   ;8BACB3|        |0089A5;
                       db $FF,$6D,$A5,$89,$5E,$D2,$7E,$00   ;8BACBB|        |89A56D;
                       db $00,$FF,$6D,$A5,$89,$44,$D3,$7E   ;8BACC3|        |      ;
                       db $00,$01,$01,$55,$C5,$FF,$FF,$01   ;8BACCB|        |      ;
                       db $55,$C1,$FF,$FF,$FF,$26,$A5,$89   ;8BACD3|        |0000C1;
                       db $33,$B5,$FF,$6D,$A5,$89,$27,$D3   ;8BACDB|        |0000B5;
                       db $7E,$00,$10,$3C,$10,$AA,$FF,$FF   ;8BACE3|        |001000;
                       db $01,$1C,$B8,$FF,$FF,$FF,$6D,$A5   ;8BACEB|        |00001C;
                       db $89,$B3,$D4,$7E,$01,$00,$FF,$26   ;8BACF3|        |      ;
                       db $A5,$89,$FA,$B5,$FF,$6D,$A5,$89   ;8BACFB|        |000089;
                       db $FE,$D3,$7E,$00,$00,$FF,$26,$A5   ;8BAD03|        |007ED3;
                       db $89,$B9,$B7,$01,$BC,$CB,$FF,$FF   ;8BAD0B|        |      ;
                       db $78,$10,$AA,$FF,$FF,$FF,$35,$F1   ;8BAD13|        |      ;
                       db $8B,$FF,$26,$A5,$89,$50,$B5,$FF   ;8BAD1B|        |      ;
                       db $26,$A5,$89,$CC,$B7               ;8BAD23|        |0000A5;
                       db $01,$FC,$B6,$FF,$FF,$FF,$12,$F1   ;8BAD28|        |      ;
                       db $8B,$01,$13,$B8,$FF,$FF,$FF,$6D   ;8BAD30|        |      ;
                       db $A5,$89,$B3,$D4,$7E,$01,$00,$01   ;8BAD38|        |      ;
                       db $DA,$C0,$FF,$FF,$FF,$26,$A5,$89   ;8BAD40|        |      ;
                       db $33,$B5,$FF,$6D,$A5,$89,$27,$D3   ;8BAD48|        |      ;
                       db $7E,$00,$10,$01,$10,$BB,$FF,$FF   ;8BAD50|        |      ;
                       db $FF,$26,$A5,$89,$B9,$B7,$14,$10   ;8BAD58|        |      ;
                       db $AA,$FF,$FF,$FF,$26,$A5,$89,$00   ;8BAD60|        |      ;
                       db $B8,$28,$10,$AA,$FF,$FF,$01,$6C   ;8BAD68|        |      ;
                       db $C5,$FF,$FF,$1E,$10,$AA,$FF,$FF   ;8BAD70|        |      ;
                       db $FF,$6D,$A5,$89,$FE,$D3,$7E,$01   ;8BAD78|        |      ;
                       db $00,$FF,$26,$A5,$89,$17,$B6,$FF   ;8BAD80|        |      ;
                       db $19,$F1,$8B,$FF,$26,$A5,$89,$A2   ;8BAD88|        |      ;
                       db $B7,$01,$10,$AA,$FF,$FF,$01,$9B   ;8BAD90|        |      ;
                       db $A7,$FF,$FF,$78,$10,$AA,$FF,$FF   ;8BAD98|        |      ;
                       db $01,$AD,$A7,$FF,$FF,$01,$0B,$B8   ;8BADA0|        |      ;
                       db $FF,$FF,$01,$AA,$B6,$FF,$FF,$FF   ;8BADA8|        |      ;
                       db $5D,$A5,$89,$F2,$D1,$7E,$03,$FF   ;8BADB0|        |      ;
                       db $6D,$A5,$89,$B3,$D4,$7E,$01,$00   ;8BADB8|        |      ;
                       db $FF,$26,$A5,$89,$FA,$B5,$FF,$6D   ;8BADC0|        |      ;
                       db $A5,$89,$27,$D3,$7E,$00,$10,$FF   ;8BADC8|        |      ;
                       db $26,$A5,$89,$B9,$B7,$FF,$6D,$A5   ;8BADD0|        |      ;
                       db $89,$27,$D3,$7E,$00,$10,$FF,$5D   ;8BADD8|        |      ;
                       db $A5,$89,$F2,$D1,$7E,$02,$FF,$99   ;8BADE0|        |      ;
                       db $C6,$8B,$1E,$10,$AA,$FF,$FF,$FF   ;8BADE8|        |      ;
                       db $26,$A5,$89,$DA,$E9,$1E,$10,$AA   ;8BADF0|        |      ;
                       db $FF,$FF,$FF,$05,$CB,$8B,$FF,$ED   ;8BADF8|        |      ;
                       db $E9,$8B,$FF,$26,$A5,$89,$8F,$EA   ;8BAE00|        |      ;
                       db $FF,$2C,$CB,$8B,$78,$10,$AA,$FF   ;8BAE08|        |      ;
                       db $FF,$FF,$35,$F1,$8B,$FF,$26,$A5   ;8BAE10|        |      ;
                       db $89,$50,$B5,$FF,$25,$AE,$8B,$FF   ;8BAE18|        |      ;
                       db $26,$A5,$89,$DE,$B7               ;8BAE20|        |      ;
                       LDA.L $7ED1E4                        ;8BAE25|AFE4D17E|7ED1E4;
                       ORA.W #$2000                         ;8BAE29|090020  |      ;
                       AND.W #$BFFF                         ;8BAE2C|29FFBF  |      ;
                       STA.L $7ED1E4                        ;8BAE2F|8FE4D17E|7ED1E4;
                       RTL                                  ;8BAE33|6B      |      ;
                       db $FF,$19,$F1,$8B,$FF,$78,$B7,$8B   ;8BAE34|        |      ;
                       db $FF,$6D,$A5,$89,$FE,$D3,$7E,$01   ;8BAE3C|        |      ;
                       db $00,$FF,$6D,$A5,$89,$5E,$D2,$7E   ;8BAE44|        |      ;
                       db $00,$00,$FF,$3D,$AF,$8B,$FF,$6B   ;8BAE4C|        |      ;
                       db $C8,$8B,$FF,$26,$A5,$89,$33,$B5   ;8BAE54|        |      ;
                       db $FF,$6D,$A5,$89,$27,$D3,$7E,$00   ;8BAE5C|        |      ;
                       db $10,$FF,$26,$A5,$89,$EA,$B6,$3C   ;8BAE64|        |      ;
                       db $10,$AA,$FF,$FF,$FF,$99,$C6,$8B   ;8BAE6C|        |      ;
                       db $78,$10,$AA,$FF,$FF,$01,$20,$C9   ;8BAE74|        |      ;
                       db $FF,$FF,$FF,$26,$A5,$89,$EA,$B6   ;8BAE7C|        |      ;
                       db $FF,$12,$F1,$8B,$01,$B5,$B4,$FF   ;8BAE84|        |      ;
                       db $FF,$FF,$26,$A5,$89,$4A,$B8,$FF   ;8BAE8C|        |      ;
                       db $26,$A5,$89,$25,$B8,$01,$1C,$B8   ;8BAE94|        |      ;
                       db $FF,$FF,$01,$AA,$B6,$FF,$FF,$FF   ;8BAE9C|        |      ;
                       db $5D,$A5,$89,$EE,$D1,$7E,$03,$FF   ;8BAEA4|        |      ;
                       db $5D,$A5,$89,$EF,$D1,$7E,$03,$FF   ;8BAEAC|        |      ;
                       db $6D,$A5,$89,$B3,$D4,$7E,$01,$00   ;8BAEB4|        |      ;
                       db $FF,$26,$A5,$89,$FA,$B5,$FF,$6D   ;8BAEBC|        |      ;
                       db $A5,$89,$FE,$D3,$7E,$00,$00,$FF   ;8BAEC4|        |      ;
                       db $6D,$A5,$89,$27,$D3,$7E,$00,$10   ;8BAECC|        |      ;
                       db $FF,$26,$A5,$89,$B9,$B7,$FF,$6D   ;8BAED4|        |      ;
                       db $A5,$89,$27,$D3,$7E,$00,$10,$FF   ;8BAEDC|        |      ;
                       db $5D,$A5,$89,$EE,$D1,$7E,$02,$FF   ;8BAEE4|        |      ;
                       db $5D,$A5,$89,$EF,$D1,$7E,$02,$1E   ;8BAEEC|        |      ;
                       db $10,$AA,$FF,$FF,$FF,$13,$A7,$8B   ;8BAEF4|        |      ;
                       db $1E,$10,$AA,$FF,$FF,$FF,$6D,$A5   ;8BAEFC|        |      ;
                       db $89,$27,$D3,$7E,$00,$00,$FF,$6D   ;8BAF04|        |      ;
                       db $A5,$89,$FE,$D3,$7E,$01,$00,$FF   ;8BAF0C|        |      ;
                       db $26,$A5,$89,$17,$B6,$FF,$6D,$A5   ;8BAF14|        |      ;
                       db $89,$B3,$D4,$7E,$00,$00,$FF,$26   ;8BAF1C|        |      ;
                       db $A5,$89,$33,$B9,$3C,$AF,$BA,$FF   ;8BAF24|        |      ;
                       db $FF,$FF,$35,$F1,$8B,$FF,$26,$A5   ;8BAF2C|        |      ;
                       db $89,$CF,$BA,$FF,$26,$A5,$89,$CC   ;8BAF34|        |      ;
                       db $B7                               ;8BAF3C|        |      ;
                       LDA.L $7ED1E4                        ;8BAF3D|AFE4D17E|7ED1E4;
                       AND.W #$DFFF                         ;8BAF41|29FFDF  |      ;
                       ORA.W #$4000                         ;8BAF44|090040  |      ;
                       STA.L $7ED1E4                        ;8BAF47|8FE4D17E|7ED1E4;
                       LDA.W #$000D                         ;8BAF4B|A90D00  |      ;
                       STA.L $7ED3A3                        ;8BAF4E|8FA3D37E|7ED3A3;
                       RTL                                  ;8BAF52|6B      |      ;
                       db $01,$FC,$B6,$FF,$FF,$FF,$1E,$B1   ;8BAF53|        |      ;
                       db $8B,$01,$13,$B8,$FF,$FF,$01,$AA   ;8BAF5B|        |      ;
                       db $B6,$FF,$FF,$FF,$6D,$A5,$89,$B3   ;8BAF63|        |      ;
                       db $D4,$7E,$01,$00,$FF,$B2,$C9,$8B   ;8BAF6B|        |      ;
                       db $FF,$94,$B4,$8B,$FF,$73,$B4,$8B   ;8BAF73|        |      ;
                       db $FF,$26,$A5,$89,$33,$B5,$FF,$6D   ;8BAF7B|        |      ;
                       db $A5,$89,$27,$D3,$7E,$00,$10,$FF   ;8BAF83|        |      ;
                       db $5D,$A5,$89,$EE,$D1,$7E,$03,$FF   ;8BAF8B|        |      ;
                       db $5D,$A5,$89,$EF,$D1,$7E,$03,$FF   ;8BAF93|        |      ;
                       db $6D,$A5,$89,$27,$D3,$7E,$00,$10   ;8BAF9B|        |      ;
                       db $FF,$26,$A5,$89,$B9,$B7,$FF,$5D   ;8BAFA3|        |      ;
                       db $A5,$89,$EE,$D1,$7E,$02,$FF,$5D   ;8BAFAB|        |      ;
                       db $A5,$89,$EF,$D1,$7E,$02,$FF,$D6   ;8BAFB3|        |      ;
                       db $B4,$8B,$FF,$26,$A5,$89,$8E,$B8   ;8BAFBB|        |      ;
                       db $0A,$10,$AA,$FF,$FF,$01,$6C,$C5   ;8BAFC3|        |      ;
                       db $FF,$FF,$1E,$10,$AA,$FF,$FF,$FF   ;8BAFCB|        |      ;
                       db $6D,$A5,$89,$27,$D3,$7E,$00,$10   ;8BAFD3|        |      ;
                       db $5A,$10,$AA,$FF,$FF,$FF,$0D,$B1   ;8BAFDB|        |      ;
                       db $8B,$FF,$6D,$A5,$89,$FE,$D3,$7E   ;8BAFE3|        |      ;
                       db $01,$00,$FF,$26,$A5,$89,$17,$B6   ;8BAFEB|        |      ;
                       db $FF,$26,$A5,$89,$A2,$B7,$01,$10   ;8BAFF3|        |      ;
                       db $AA,$FF,$FF,$FF,$6D,$A5,$89,$B3   ;8BAFFB|        |      ;
                       db $D4,$7E,$00,$00,$FF,$0B,$B0,$8B   ;8BB003|        |      ;
                       LDA.L $7ED3A1                        ;8BB00B|AFA1D37E|7ED3A1;
                       CMP.W #$000B                         ;8BB00F|C90B00  |      ;
                       BEQ +                                ;8BB012|F008    |8BB01C;
                       JSL.L CODE_FL_89A62C                 ;8BB014|222CA689|89A62C;
                       db $79,$AE,$8B                       ;8BB018|        |      ;
                       RTL                                  ;8BB01B|6B      |      ;
 
                     + JSL.L CODE_FL_89A62C                 ;8BB01C|222CA689|89A62C;
                       db $24,$B0,$8B                       ;8BB020|        |      ;
                       RTL                                  ;8BB023|6B      |      ;
                       db $01,$20,$C9,$FF,$FF,$C0,$10,$AA   ;8BB024|        |      ;
                       db $FF,$FF,$FF,$19,$F1,$8B,$FF,$FB   ;8BB02C|        |      ;
                       db $BC,$8B,$FF,$26,$A5,$89,$22,$B9   ;8BB034|        |      ;
                       db $01,$31,$CA,$FF,$FF,$FF,$26,$A5   ;8BB03C|        |      ;
                       db $89,$EA,$B6,$FF,$26,$A5,$89,$CF   ;8BB044|        |      ;
                       db $B8,$1E,$10,$AA,$FF,$FF,$FF,$26   ;8BB04C|        |      ;
                       db $A5,$89,$0A,$B9,$1E,$10,$AA,$FF   ;8BB054|        |      ;
                       db $FF,$01,$1C,$B8,$FF,$FF,$01,$AA   ;8BB05C|        |      ;
                       db $B6,$FF,$FF,$FF,$5D,$A5,$89,$F0   ;8BB064|        |      ;
                       db $D1,$7E,$03,$FF,$6D,$A5,$89,$B3   ;8BB06C|        |      ;
                       db $D4,$7E,$01,$00,$FF,$26,$A5,$89   ;8BB074|        |      ;
                       db $FA,$B5,$FF,$6D,$A5,$89,$FE,$D3   ;8BB07C|        |      ;
                       db $7E,$00,$00,$FF,$6D,$A5,$89,$27   ;8BB084|        |      ;
                       db $D3,$7E,$00,$10,$FF,$26,$A5,$89   ;8BB08C|        |      ;
                       db $B9,$B7,$FF,$6D,$A5,$89,$27,$D3   ;8BB094|        |      ;
                       db $7E,$00,$10,$FF,$5D,$A5,$89,$F0   ;8BB09C|        |      ;
                       db $D1,$7E,$02,$1E,$10,$AA,$FF,$FF   ;8BB0A4|        |      ;
                       db $FF,$6D,$A5,$89,$27,$D3,$7E,$00   ;8BB0AC|        |      ;
                       db $00,$FF,$6D,$A5,$89,$FE,$D3,$7E   ;8BB0B4|        |      ;
                       db $01,$00,$FF,$26,$A5,$89,$17,$B6   ;8BB0BC|        |      ;
                       db $FF,$6D,$A5,$89,$B3,$D4,$7E,$00   ;8BB0C4|        |      ;
                       db $00,$FF,$26,$A5,$89,$33,$B9,$3C   ;8BB0CC|        |      ;
                       db $AF,$BA,$FF,$FF,$FF,$35,$F1,$8B   ;8BB0D4|        |      ;
                       db $FF,$26,$A5,$89,$CF,$BA,$FF,$26   ;8BB0DC|        |      ;
                       db $A5,$89,$CC,$B7,$3C,$10,$AA,$FF   ;8BB0E4|        |      ;
                       db $FF,$FF,$35,$F1,$8B,$FF,$26,$A5   ;8BB0EC|        |      ;
                       db $89,$35,$B1,$FF,$01,$B1,$8B,$FF   ;8BB0F4|        |      ;
                       db $26,$A5,$89,$CC,$B7               ;8BB0FC|        |      ;
                       LDA.L $7ED1E4                        ;8BB101|AFE4D17E|7ED1E4;
                       ORA.W #$0800                         ;8BB105|090008  |      ;
                       STA.L $7ED1E4                        ;8BB108|8FE4D17E|7ED1E4;
                       RTL                                  ;8BB10C|6B      |      ;
                       LDA.L $7ED1E4                        ;8BB10D|AFE4D17E|7ED1E4;
                       BIT.W #$0800                         ;8BB111|890008  |      ;
                       BEQ +                                ;8BB114|F007    |8BB11D;
                       JSL.L CODE_FL_89A62C                 ;8BB116|222CA689|89A62C;
                       db $E8,$B0,$8B                       ;8BB11A|        |      ;
 
                     + RTL                                  ;8BB11D|6B      |      ;
                       LDA.L $7ED3A1                        ;8BB11E|AFA1D37E|7ED3A1;
                       CMP.W #$000B                         ;8BB122|C90B00  |      ;
                       BEQ +                                ;8BB125|F00D    |8BB134;
                       LDA.L $7ED1E4                        ;8BB127|AFE4D17E|7ED1E4;
                       BIT.W #$0800                         ;8BB12B|890008  |      ;
                       BNE +                                ;8BB12E|D004    |8BB134;
                       JSL.L CODE_FL_8BF119                 ;8BB130|2219F18B|8BF119;
 
                     + RTL                                  ;8BB134|6B      |      ;
                       SEP #$20                             ;8BB135|E220    |      ;
                       LDA.B $A9                            ;8BB137|A5A9    |0000A9;
                       AND.B #$07                           ;8BB139|2907    |      ;
                       BNE +                                ;8BB13B|D00F    |8BB14C;
                       LDA.L $7ED24E                        ;8BB13D|AF4ED27E|7ED24E;
                       BEQ ++                               ;8BB141|F00C    |8BB14F;
                       DEC A                                ;8BB143|3A      |      ;
                       STA.L $7ED24E                        ;8BB144|8F4ED27E|7ED24E;
                       STA.L $7ED25C                        ;8BB148|8F5CD27E|7ED25C;
 
                     + REP #$20                             ;8BB14C|C220    |      ;
                       RTL                                  ;8BB14E|6B      |      ;
 
                    ++ REP #$20                             ;8BB14F|C220    |      ;
                       JSL.L CODE_FL_89A509                 ;8BB151|2209A589|89A509;
                       RTL                                  ;8BB155|6B      |      ;
                       db $FF,$8B,$B7,$8B,$01,$13,$B8,$FF   ;8BB156|        |      ;
                       db $FF,$01,$AA,$B6,$FF,$FF,$FF,$4E   ;8BB15E|        |      ;
                       db $B4,$8B,$FF,$6D,$A5,$89,$FE,$D3   ;8BB166|        |      ;
                       db $7E,$00,$00,$FF,$6D,$A5,$89,$B3   ;8BB16E|        |      ;
                       db $D4,$7E,$01,$00,$FF,$5D,$A5,$89   ;8BB176|        |      ;
                       db $F1,$D1,$7E,$03,$FF,$6D,$A5,$89   ;8BB17E|        |      ;
                       db $5E,$D2,$7E,$00,$01,$FF,$CA,$BC   ;8BB186|        |      ;
                       db $8B,$FF,$26,$A5,$89,$33,$B5,$FF   ;8BB18E|        |      ;
                       db $26,$A5,$89,$B9,$B7,$FF,$5D,$A5   ;8BB196|        |      ;
                       db $89,$F1,$D1,$7E,$02,$78,$10,$AA   ;8BB19E|        |      ;
                       db $FF,$FF,$FF,$78,$BC,$8B,$FF,$26   ;8BB1A6|        |      ;
                       db $A5,$89,$B9,$B7,$F0,$10,$AA,$FF   ;8BB1AE|        |      ;
                       db $FF,$78,$10,$AA,$FF,$FF,$FF,$2D   ;8BB1B6|        |      ;
                       db $C6,$8B,$78,$10,$AA,$FF,$FF,$FF   ;8BB1BE|        |      ;
                       db $6D,$A5,$89,$FE,$D3,$7E,$01,$00   ;8BB1C6|        |      ;
                       db $FF,$26,$A5,$89,$17,$B6,$FF,$6D   ;8BB1CE|        |      ;
                       db $A5,$89,$B3,$D4,$7E,$00,$00,$1E   ;8BB1D6|        |      ;
                       db $10,$AA,$FF,$FF,$FF,$26,$A5,$89   ;8BB1DE|        |      ;
                       db $F7,$B4,$FF,$43,$CB,$8B,$FF,$FA   ;8BB1E6|        |      ;
                       db $EE,$8B,$FF,$26,$A5,$89,$02,$EF   ;8BB1EE|        |      ;
                       db $3C,$10,$AA,$FF,$FF,$FF,$ED,$F0   ;8BB1F6|        |      ;
                       db $8B,$FF,$26,$A5,$89,$14,$B5,$FF   ;8BB1FE|        |      ;
                       db $02,$CD,$8B,$FF,$D7,$B2,$8B,$FF   ;8BB206|        |      ;
                       db $BF,$B2,$8B,$3C,$10,$AA,$FF,$FF   ;8BB20E|        |      ;
                       db $1E,$05,$F0,$FF,$FF,$1E,$0E,$F0   ;8BB216|        |      ;
                       db $FF,$FF,$01,$ED,$EF,$FF,$FF,$01   ;8BB21E|        |      ;
                       db $17,$F0,$FF,$FF,$FF,$E3,$B2,$8B   ;8BB226|        |      ;
                       db $FF,$6D,$A5,$89,$B3,$D4,$7E,$00   ;8BB22E|        |      ;
                       db $00,$FF,$26,$A5,$89,$A2,$B7,$01   ;8BB236|        |      ;
                       db $10,$AA,$FF,$FF,$FF,$0F,$B3,$8B   ;8BB23E|        |      ;
                       db $FF,$6D,$A5,$89,$B3,$D4,$7E,$01   ;8BB246|        |      ;
                       db $00,$FF,$26,$A5,$89,$FA,$B5,$FF   ;8BB24E|        |      ;
                       db $6D,$A5,$89,$FE,$D3,$7E,$00,$00   ;8BB256|        |      ;
                       db $FF,$26,$A5,$89,$B9,$B7,$FF,$CB   ;8BB25E|        |      ;
                       db $B2,$8B,$FF,$FA,$EE,$8B,$FF,$26   ;8BB266|        |      ;
                       db $A5,$89,$23,$F0,$FF,$61,$CC,$8B   ;8BB26E|        |      ;
                       db $B4,$10,$AA,$FF,$FF,$B4,$10,$AA   ;8BB276|        |      ;
                       db $FF,$FF,$78,$10,$AA,$FF,$FF,$FF   ;8BB27E|        |      ;
                       db $26,$A5,$89,$B9,$B7,$FF,$D6,$A4   ;8BB286|        |      ;
                       db $89,$E8,$B0                       ;8BB28E|        |      ;
                       LDA.W #$7E00                         ;8BB291|A9007E  |      ;
                       STA.W $19BD                          ;8BB294|8DBD19  |0019BD;
                       LDA.W #$533B                         ;8BB297|A93B53  |      ;
                       STA.W $19BC                          ;8BB29A|8DBC19  |0019BC;
                       LDY.W #$0001                         ;8BB29D|A00100  |      ;
                       LDX.W #$0000                         ;8BB2A0|A20000  |      ;
                       JSL.L CODE_FL_899E35                 ;8BB2A3|22359E89|899E35;
                       RTL                                  ;8BB2A7|6B      |      ;
                       LDA.W #$7E00                         ;8BB2A8|A9007E  |      ;
                       STA.W $19BD                          ;8BB2AB|8DBD19  |0019BD;
                       LDA.W #$533B                         ;8BB2AE|A93B53  |      ;
                       STA.W $19BC                          ;8BB2B1|8DBC19  |0019BC;
                       LDY.W #$0005                         ;8BB2B4|A00500  |      ;
                       LDX.W #$0000                         ;8BB2B7|A20000  |      ;
                       JSL.L CODE_FL_899E35                 ;8BB2BA|22359E89|899E35;
                       RTL                                  ;8BB2BE|6B      |      ;
                       LDA.L $7ED274                        ;8BB2BF|AF74D27E|7ED274;
                       ORA.W #$1000                         ;8BB2C3|090010  |      ;
                       STA.L $7ED274                        ;8BB2C6|8F74D27E|7ED274;
                       RTL                                  ;8BB2CA|6B      |      ;
                       LDA.L $7ED274                        ;8BB2CB|AF74D27E|7ED274;
                       AND.W #$EFFF                         ;8BB2CF|29FFEF  |      ;
                       STA.L $7ED274                        ;8BB2D2|8F74D27E|7ED274;
                       RTL                                  ;8BB2D6|6B      |      ;
                       LDA.L $7ED274                        ;8BB2D7|AF74D27E|7ED274;
                       ORA.W #$0400                         ;8BB2DB|090004  |      ;
                       STA.L $7ED274                        ;8BB2DE|8F74D27E|7ED274;
                       RTL                                  ;8BB2E2|6B      |      ;
                       LDA.L $7ED274                        ;8BB2E3|AF74D27E|7ED274;
                       AND.W #$FBFF                         ;8BB2E7|29FFFB  |      ;
                       STA.L $7ED274                        ;8BB2EA|8F74D27E|7ED274;
                       RTL                                  ;8BB2EE|6B      |      ;
                       db $AF,$B5,$D4,$7E,$AA,$E2,$20,$A9   ;8BB2EF|        |7ED4B5;
                       db $03,$9F,$E6,$D1,$7E,$C2,$20,$6B   ;8BB2F7|        |00009F;
                       db $AF,$B5,$D4,$7E,$AA,$E2,$20,$A9   ;8BB2FF|        |7ED4B5;
                       db $02,$9F,$E6,$D1,$7E,$C2,$20,$6B   ;8BB307|        |      ;
                       LDA.L $7ED211                        ;8BB30F|AF11D27E|7ED211;
                       AND.W #$00FF                         ;8BB313|29FF00  |      ;
                       JSL.L CODE_FL_8B9107                 ;8BB316|2207918B|8B9107;
                       RTL                                  ;8BB31A|6B      |      ;
                       db $01,$AD,$B3,$FF,$FF,$01,$3A,$B7   ;8BB31B|        |      ;
                       db $FF,$FF,$01,$4C,$B6,$FF,$FF,$01   ;8BB323|        |      ;
                       db $34,$B6,$FF,$FF,$01,$1C,$B8,$FF   ;8BB32B|        |      ;
                       db $FF,$01,$93,$B3,$FF,$FF,$FF,$26   ;8BB333|        |      ;
                       db $A5,$89,$33,$B5,$FF,$6D,$A5,$89   ;8BB33B|        |      ;
                       db $27,$D3,$7E,$00,$10,$FF,$26,$A5   ;8BB343|        |      ;
                       db $89,$B9,$B7                       ;8BB34B|        |      ;
                       db $FF,$13,$A7,$8B,$1E,$10,$AA,$FF   ;8BB34E|        |8BA713;
                       db $FF,$FF,$6D,$A5,$89,$27,$D3,$7E   ;8BB356|        |A56DFF;
                       db $00,$00,$FF,$6D,$A5,$89,$FE,$D3   ;8BB35E|        |      ;
                       db $7E,$01,$00,$FF,$26,$A5,$89,$17   ;8BB366|        |000001;
                       db $B6,$FF,$6D,$A5,$89,$B3,$D4,$7E   ;8BB36E|        |0000FF;
                       db $00,$00,$FF,$26,$A5,$89,$33,$B9   ;8BB376|        |      ;
                       db $3C,$AF,$BA,$FF,$FF,$FF,$35,$F1   ;8BB37E|        |00BAAF;
                       db $8B,$FF,$26,$A5,$89,$CF,$BA,$FF   ;8BB386|        |      ;
                       db $26,$A5,$89,$CC,$B7               ;8BB38E|        |0000A5;
                       JSL.L CODE_FL_8BB414                 ;8BB393|2214B48B|8BB414;
                       LDA.W #$0100                         ;8BB397|A90001  |      ;
                       STA.L $7ED25E                        ;8BB39A|8F5ED27E|7ED25E;
                       LDA.W #$0001                         ;8BB39E|A90100  |      ;
                       STA.L $7ED4B3                        ;8BB3A1|8FB3D47E|7ED4B3;
                       LDA.W #$0000                         ;8BB3A5|A90000  |      ;
                       STA.L $7ED3FE                        ;8BB3A8|8FFED37E|7ED3FE;
                       RTL                                  ;8BB3AC|6B      |      ;
                       LDA.L $7ED3A1                        ;8BB3AD|AFA1D37E|7ED3A1;
                       CMP.W #$000B                         ;8BB3B1|C90B00  |      ;
                       BEQ +                                ;8BB3B4|F005    |8BB3BB;
                       db $22,$12,$F1,$8B,$6B               ;8BB3B6|        |8BF112;
 
                     + JSL.L CODE_FL_8BF119                 ;8BB3BB|2219F18B|8BF119;
                       RTL                                  ;8BB3BF|6B      |      ;
                       db $FF,$19,$F1,$8B,$FF,$D6,$A4,$89   ;8BB3C0|        |      ;
                       db $CE,$B3                           ;8BB3C8|        |      ;
                       db $FF,$12,$F1,$8B                   ;8BB3CA|        |8BF112;
                       db $08,$DF,$B6,$00,$00,$01,$4C,$B6   ;8BB3CE|        |      ;
                       db $FF,$FF,$01,$34,$B6,$FF,$FF,$FF   ;8BB3D6|        |      ;
                       db $14,$B4,$8B,$FF,$26,$A5,$89,$33   ;8BB3DE|        |      ;
                       db $B5,$FF,$06,$B4,$8B,$FF,$26,$A5   ;8BB3E6|        |      ;
                       db $89,$33,$B9,$3C,$AF,$BA,$FF,$FF   ;8BB3EE|        |      ;
                       db $FF,$35,$F1,$8B,$FF,$26,$A5,$89   ;8BB3F6|        |      ;
                       db $CF,$BA,$FF,$26,$A5,$89,$CC,$B7   ;8BB3FE|        |      ;
                       LDA.L $7ED1E4                        ;8BB406|AFE4D17E|7ED1E4;
                       BIT.W #$1000                         ;8BB40A|890010  |      ;
                       BNE +                                ;8BB40D|D004    |8BB413;
                       JSL.L CODE_FL_8BA713                 ;8BB40F|2213A78B|8BA713;
 
                     + RTL                                  ;8BB413|6B      |      ;
 
       CODE_FL_8BB414:
                       LDA.L $7ED3A1                        ;8BB414|AFA1D37E|7ED3A1;
                       STA.L $7ED3A3                        ;8BB418|8FA3D37E|7ED3A3;
                       LDA.W #$0001                         ;8BB41C|A90100  |      ;
                       STA.L $7ED3FE                        ;8BB41F|8FFED37E|7ED3FE;
                       LDA.W #$0000                         ;8BB423|A90000  |      ;
                       STA.L $7ED25E                        ;8BB426|8F5ED27E|7ED25E;
                       LDA.W #$0100                         ;8BB42A|A90001  |      ;
                       STA.L $7ED344                        ;8BB42D|8F44D37E|7ED344;
                       LDA.W #$0001                         ;8BB431|A90100  |      ;
                       STA.L $7ED7DF                        ;8BB434|8FDFD77E|7ED7DF;
                       LDA.L $7ED3A1                        ;8BB438|AFA1D37E|7ED3A1;
                       CMP.W #$000B                         ;8BB43C|C90B00  |      ;
                       BEQ +                                ;8BB43F|F00D    |8BB44E;
                       JSL.L CODE_FL_8BC9B2                 ;8BB441|22B2C98B|8BC9B2;
                       JSL.L CODE_FL_8BB4B5                 ;8BB445|22B5B48B|8BB4B5;
                       JSL.L CODE_FL_8BB473                 ;8BB449|2273B48B|8BB473;
                       RTL                                  ;8BB44D|6B      |      ;
 
                     + LDA.W #$0000                         ;8BB44E|A90000  |      ;
                       STA.L $7ED25E                        ;8BB451|8F5ED27E|7ED25E;
                       LDA.W #$0100                         ;8BB455|A90001  |      ;
                       STA.L $7ED344                        ;8BB458|8F44D37E|7ED344;
                       JSL.L CODE_FL_8BBD28                 ;8BB45C|2228BD8B|8BBD28;
                       JSL.L CODE_FL_8BCA53                 ;8BB460|2253CA8B|8BCA53;
                       LDA.W #$0038                         ;8BB464|A93800  |      ;
                       STA.L $7ED34A                        ;8BB467|8F4AD37E|7ED34A;
                       LDA.W #$FFE8                         ;8BB46B|A9E8FF  |      ;
                       STA.L $7ED35C                        ;8BB46E|8F5CD37E|7ED35C;
                       RTL                                  ;8BB472|6B      |      ;
 
       CODE_FL_8BB473:
                       LDA.W #$0020                         ;8BB473|A92000  |      ;
                       STA.L $7ED358                        ;8BB476|8F58D37E|7ED358;
                       LSR A                                ;8BB47A|4A      |      ;
                       EOR.W #$FFFF                         ;8BB47B|49FFFF  |      ;
                       INC A                                ;8BB47E|1A      |      ;
                       STA.L $7ED35A                        ;8BB47F|8F5AD37E|7ED35A;
                       LDA.W #$0060                         ;8BB483|A96000  |      ;
                       STA.L $7ED5DB                        ;8BB486|8FDBD57E|7ED5DB;
                       LSR A                                ;8BB48A|4A      |      ;
                       EOR.W #$FFFF                         ;8BB48B|49FFFF  |      ;
                       INC A                                ;8BB48E|1A      |      ;
                       STA.L $7ED5DD                        ;8BB48F|8FDDD57E|7ED5DD;
                       RTL                                  ;8BB493|6B      |      ;
                       LDA.L $7ED39F                        ;8BB494|AF9FD37E|7ED39F;
                       CMP.W #$0009                         ;8BB498|C90900  |      ;
                       BEQ +                                ;8BB49B|F00B    |8BB4A8;
                       CMP.W #$000A                         ;8BB49D|C90A00  |      ;
                       BEQ ++                               ;8BB4A0|F00C    |8BB4AE;
                       JSL.L CODE_FL_8BE5A3                 ;8BB4A2|22A3E58B|8BE5A3;
                       BRA +++                              ;8BB4A6|800C    |8BB4B4;
 
                     + JSL.L CODE_FL_8BE5F0                 ;8BB4A8|22F0E58B|8BE5F0;
                       BRA +++                              ;8BB4AC|8006    |8BB4B4;
 
                    ++ JSL.L CODE_FL_8BE62E                 ;8BB4AE|222EE68B|8BE62E;
                       BRA +++                              ;8BB4B2|8000    |8BB4B4;
 
                   +++ RTL                                  ;8BB4B4|6B      |      ;
 
       CODE_FL_8BB4B5:
                       LDA.L $7ED3A1                        ;8BB4B5|AFA1D37E|7ED3A1;
                       CMP.W #$0009                         ;8BB4B9|C90900  |      ;
                       BEQ +                                ;8BB4BC|F00B    |8BB4C9;
                       CMP.W #$000A                         ;8BB4BE|C90A00  |      ;
                       BEQ ++                               ;8BB4C1|F00C    |8BB4CF;
                       JSL.L CODE_FL_8BE58C                 ;8BB4C3|228CE58B|8BE58C;
                       BRA +++                              ;8BB4C7|800C    |8BB4D5;
 
                     + JSL.L CODE_FL_8BE5D9                 ;8BB4C9|22D9E58B|8BE5D9;
                       BRA +++                              ;8BB4CD|8006    |8BB4D5;
 
                    ++ JSL.L CODE_FL_8BE617                 ;8BB4CF|2217E68B|8BE617;
                       BRA +++                              ;8BB4D3|8000    |8BB4D5;
 
                   +++ RTL                                  ;8BB4D5|6B      |      ;
                       LDA.L $7ED39F                        ;8BB4D6|AF9FD37E|7ED39F;
                       CMP.W #$0009                         ;8BB4DA|C90900  |      ;
                       BEQ +                                ;8BB4DD|F00B    |8BB4EA;
                       CMP.W #$000A                         ;8BB4DF|C90A00  |      ;
                       BEQ ++                               ;8BB4E2|F00C    |8BB4F0;
                       JSL.L CODE_FL_8BE684                 ;8BB4E4|2284E68B|8BE684;
                       BRA +++                              ;8BB4E8|800C    |8BB4F6;
 
                     + JSL.L CODE_FL_8BE6DA                 ;8BB4EA|22DAE68B|8BE6DA;
                       BRA +++                              ;8BB4EE|8006    |8BB4F6;
 
                    ++ JSL.L CODE_FL_8BE730                 ;8BB4F0|2230E78B|8BE730;
                       BRA +++                              ;8BB4F4|8000    |8BB4F6;
 
                   +++ RTL                                  ;8BB4F6|6B      |      ;
                       SEP #$20                             ;8BB4F7|E220    |      ;
                       LDA.B $A9                            ;8BB4F9|A5A9    |0000A9;
                       AND.B #$03                           ;8BB4FB|2903    |      ;
                       BNE +                                ;8BB4FD|D00B    |8BB50A;
                       LDA.L $7ED24E                        ;8BB4FF|AF4ED27E|7ED24E;
                       BEQ ++                               ;8BB503|F008    |8BB50D;
                       DEC A                                ;8BB505|3A      |      ;
                       STA.L $7ED24E                        ;8BB506|8F4ED27E|7ED24E;
 
                     + REP #$20                             ;8BB50A|C220    |      ;
                       RTL                                  ;8BB50C|6B      |      ;
 
                    ++ REP #$20                             ;8BB50D|C220    |      ;
                       JSL.L CODE_FL_89A509                 ;8BB50F|2209A589|89A509;
                       RTL                                  ;8BB513|6B      |      ;
                       SEP #$20                             ;8BB514|E220    |      ;
                       LDA.B $A9                            ;8BB516|A5A9    |0000A9;
                       AND.B #$03                           ;8BB518|2903    |      ;
                       BNE +                                ;8BB51A|D00D    |8BB529;
                       LDA.L $7ED24E                        ;8BB51C|AF4ED27E|7ED24E;
                       CMP.B #$0F                           ;8BB520|C90F    |      ;
                       BEQ ++                               ;8BB522|F008    |8BB52C;
                       INC A                                ;8BB524|1A      |      ;
                       STA.L $7ED24E                        ;8BB525|8F4ED27E|7ED24E;
 
                     + REP #$20                             ;8BB529|C220    |      ;
                       RTL                                  ;8BB52B|6B      |      ;
 
                    ++ REP #$20                             ;8BB52C|C220    |      ;
                       JSL.L CODE_FL_89A509                 ;8BB52E|2209A589|89A509;
                       RTL                                  ;8BB532|6B      |      ;
                       SEP #$20                             ;8BB533|E220    |      ;
                       LDA.L $7ED24E                        ;8BB535|AF4ED27E|7ED24E;
                       CMP.B #$0F                           ;8BB539|C90F    |      ;
                       BEQ +                                ;8BB53B|F00C    |8BB549;
                       INC A                                ;8BB53D|1A      |      ;
                       STA.L $7ED24E                        ;8BB53E|8F4ED27E|7ED24E;
                       STA.L $7ED25C                        ;8BB542|8F5CD27E|7ED25C;
                       REP #$20                             ;8BB546|C220    |      ;
                       RTL                                  ;8BB548|6B      |      ;
 
                     + REP #$20                             ;8BB549|C220    |      ;
                       JSL.L CODE_FL_89A509                 ;8BB54B|2209A589|89A509;
                       RTL                                  ;8BB54F|6B      |      ;
 
       CODE_FL_8BB550:
                       SEP #$20                             ;8BB550|E220    |      ;
                       LDA.L $7ED24E                        ;8BB552|AF4ED27E|7ED24E;
                       BEQ +                                ;8BB556|F00C    |8BB564;
                       DEC A                                ;8BB558|3A      |      ;
                       STA.L $7ED24E                        ;8BB559|8F4ED27E|7ED24E;
                       STA.L $7ED25C                        ;8BB55D|8F5CD27E|7ED25C;
                       REP #$20                             ;8BB561|C220    |      ;
                       RTL                                  ;8BB563|6B      |      ;
 
                     + REP #$20                             ;8BB564|C220    |      ;
                       JSL.L CODE_FL_89A509                 ;8BB566|2209A589|89A509;
                       RTL                                  ;8BB56A|6B      |      ;
                       LDA.L $7ED329                        ;8BB56B|AF29D37E|7ED329;
                       BNE +                                ;8BB56F|D02E    |8BB59F;
                       LDA.B $B7                            ;8BB571|A5B7    |0000B7;
                       BIT.W #$8000                         ;8BB573|890080  |      ;
                       BEQ ++                               ;8BB576|F014    |8BB58C;
                       db $22,$51,$F1,$8B,$22,$2E,$F1,$8B   ;8BB578|        |8BF151;
                       db $A9,$01,$00,$8F,$29,$D3,$7E,$8F   ;8BB580|        |      ;
                       db $2D,$D3,$7E,$6B                   ;8BB588|        |007ED3;
 
                    ++ LDA.B $B7                            ;8BB58C|A5B7    |0000B7;
                       BIT.W #$1080                         ;8BB58E|898010  |      ;
                       BEQ +                                ;8BB591|F00C    |8BB59F;
                       JSR.W CODE_FN_8BB5A4                 ;8BB593|20A4B5  |8BB5A4;
                       JSL.L CODE_FL_8BF158                 ;8BB596|2258F18B|8BF158;
                       JSL.L CODE_FL_89A509                 ;8BB59A|2209A589|89A509;
                       RTL                                  ;8BB59E|6B      |      ;
 
                     + JSL.L CODE_FL_8BC46D                 ;8BB59F|226DC48B|8BC46D;
                       RTL                                  ;8BB5A3|6B      |      ;
 
       CODE_FN_8BB5A4:
                       LDA.B $B3                            ;8BB5A4|A5B3    |0000B3;
                       ORA.B $B5                            ;8BB5A6|05B5    |0000B5;
                       BIT.W #$0800                         ;8BB5A8|890008  |      ;
                       BEQ +                                ;8BB5AB|F019    |8BB5C6;
                       BIT.W #$0020                         ;8BB5AD|892000  |      ;
                       BEQ +                                ;8BB5B0|F014    |8BB5C6;
                       LDA.L $001A80                        ;8BB5B2|AF801A00|001A80;
                       CMP.W #$0002                         ;8BB5B6|C90200  |      ;
                       BNE +                                ;8BB5B9|D00B    |8BB5C6;
                       LDA.W #$0003                         ;8BB5BB|A90300  |      ;
                       STA.L $001A80                        ;8BB5BE|8F801A00|001A80;
                       JSL.L CODE_FL_8B950C                 ;8BB5C2|220C958B|8B950C;
 
                     + RTS                                  ;8BB5C6|60      |      ;
                       LDY.W #$0005                         ;8BB5C7|A00500  |      ;
                       LDA.B [$96],Y                        ;8BB5CA|B796    |000096;
                       AND.W #$0001                         ;8BB5CC|290100  |      ;
                       BEQ +                                ;8BB5CF|F017    |8BB5E8;
                       LDA.W #$7AAE                         ;8BB5D1|A9AE7A  |      ;
                       STA.L $7E8930                        ;8BB5D4|8F30897E|7E8930;
                       LDA.W #$5088                         ;8BB5D8|A98850  |      ;
                       STA.L $7E8932                        ;8BB5DB|8F32897E|7E8932;
                       LDA.W #$4D07                         ;8BB5DF|A9074D  |      ;
                       STA.L $7E8934                        ;8BB5E2|8F34897E|7E8934;
                       BRA ++                               ;8BB5E6|8011    |8BB5F9;
 
                     + LDA.W #$7FFF                         ;8BB5E8|A9FF7F  |      ;
                       STA.L $7E8930                        ;8BB5EB|8F30897E|7E8930;
                       STA.L $7E8932                        ;8BB5EF|8F32897E|7E8932;
                       STA.L $7E8934                        ;8BB5F3|8F34897E|7E8934;
                       BRA ++                               ;8BB5F7|8000    |8BB5F9;
 
                    ++ RTL                                  ;8BB5F9|6B      |      ;
                       LDA.L $7ED25E                        ;8BB5FA|AF5ED27E|7ED25E;
                       AND.W #$01FF                         ;8BB5FE|29FF01  |      ;
                       CMP.W #$0100                         ;8BB601|C90001  |      ;
                       BEQ +                                ;8BB604|F00C    |8BB612;
                       CLC                                  ;8BB606|18      |      ;
                       ADC.W #$0008                         ;8BB607|690800  |      ;
                       AND.W #$FFF8                         ;8BB60A|29F8FF  |      ;
                       STA.L $7ED25E                        ;8BB60D|8F5ED27E|7ED25E;
                       RTL                                  ;8BB611|6B      |      ;
 
                     + JSL.L CODE_FL_89A509                 ;8BB612|2209A589|89A509;
                       RTL                                  ;8BB616|6B      |      ;
                       LDA.L $7ED25E                        ;8BB617|AF5ED27E|7ED25E;
                       AND.W #$01FF                         ;8BB61B|29FF01  |      ;
                       CMP.W #$0000                         ;8BB61E|C90000  |      ;
                       BEQ +                                ;8BB621|F00C    |8BB62F;
                       CLC                                  ;8BB623|18      |      ;
                       ADC.W #$0008                         ;8BB624|690800  |      ;
                       AND.W #$FFF8                         ;8BB627|29F8FF  |      ;
                       STA.L $7ED25E                        ;8BB62A|8F5ED27E|7ED25E;
                       RTL                                  ;8BB62E|6B      |      ;
 
                     + JSL.L CODE_FL_89A509                 ;8BB62F|2209A589|89A509;
                       RTL                                  ;8BB633|6B      |      ;
                       LDX.W #$00FE                         ;8BB634|A2FE00  |      ;
 
                     - LDA.L $7F6080,X                      ;8BB637|BF80607F|7F6080;
                       STA.L $7E88F6,X                      ;8BB63B|9FF6887E|7E88F6;
                       DEX                                  ;8BB63F|CA      |      ;
                       DEX                                  ;8BB640|CA      |      ;
                       BPL -                                ;8BB641|10F4    |8BB637;
                       LDA.L $001A80                        ;8BB643|AF801A00|001A80;
                       JSL.L CODE_FL_8B950C                 ;8BB647|220C958B|8B950C;
                       RTL                                  ;8BB64B|6B      |      ;
                       LDY.W #$0440                         ;8BB64C|A04004  |      ;
                       LDX.W #$0000                         ;8BB64F|A20000  |      ;
 
                     - LDA.L $7F5C40,X                      ;8BB652|BF405C7F|7F5C40;
                       STA.L $7E23C0,X                      ;8BB656|9FC0237E|7E23C0;
                       INX                                  ;8BB65A|E8      |      ;
                       DEY                                  ;8BB65B|88      |      ;
                       INX                                  ;8BB65C|E8      |      ;
                       DEY                                  ;8BB65D|88      |      ;
                       BNE -                                ;8BB65E|D0F2    |8BB652;
                       PHB                                  ;8BB660|8B      |      ;
                       PHK                                  ;8BB661|4B      |      ;
                       PLB                                  ;8BB662|AB      |      ;
                       LDY.W #$B66D                         ;8BB663|A06DB6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BB666|22CAA080|80A0CA;
                       PLB                                  ;8BB66A|AB      |      ;
                       BRA +                                ;8BB66B|8008    |8BB675;
                       db $C0,$23,$7E,$40,$04,$80,$E0,$79   ;8BB66D|        |      ;
 
                     + RTL                                  ;8BB675|6B      |      ;
                       LDA.W #$0000                         ;8BB676|A90000  |      ;
                       LDY.W #$0440                         ;8BB679|A04004  |      ;
                       LDX.W #$0000                         ;8BB67C|A20000  |      ;
 
                     - STA.L $7E23C0,X                      ;8BB67F|9FC0237E|7E23C0;
                       INX                                  ;8BB683|E8      |      ;
                       DEY                                  ;8BB684|88      |      ;
                       INX                                  ;8BB685|E8      |      ;
                       DEY                                  ;8BB686|88      |      ;
                       BNE -                                ;8BB687|D0F6    |8BB67F;
                       PHB                                  ;8BB689|8B      |      ;
                       PHK                                  ;8BB68A|4B      |      ;
                       PLB                                  ;8BB68B|AB      |      ;
                       LDY.W #$B696                         ;8BB68C|A096B6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BB68F|22CAA080|80A0CA;
                       PLB                                  ;8BB693|AB      |      ;
                       BRA +                                ;8BB694|8008    |8BB69E;
                       db $C0,$23,$7E,$40,$04,$80,$E0,$79   ;8BB696|        |      ;
 
                     + RTL                                  ;8BB69E|6B      |      ;
                       JSR.W CODE_FN_8BB6B5                 ;8BB69F|20B5B6  |8BB6B5;
                       LDA.W #$241F                         ;8BB6A2|A91F24  |      ;
                       STA.L $7E2D98                        ;8BB6A5|8F982D7E|7E2D98;
                       RTL                                  ;8BB6A9|6B      |      ;
                       JSR.W CODE_FN_8BB6B5                 ;8BB6AA|20B5B6  |8BB6B5;
                       LDA.W #$248C                         ;8BB6AD|A98C24  |      ;
                       STA.L $7E2D98                        ;8BB6B0|8F982D7E|7E2D98;
                       RTL                                  ;8BB6B4|6B      |      ;
 
       CODE_FN_8BB6B5:
                       LDY.W #$0440                         ;8BB6B5|A04004  |      ;
                       LDX.W #$0000                         ;8BB6B8|A20000  |      ;
 
                     - LDA.L $7F5440,X                      ;8BB6BB|BF40547F|7F5440;
                       STA.L $7E2BC0,X                      ;8BB6BF|9FC02B7E|7E2BC0;
                       INX                                  ;8BB6C3|E8      |      ;
                       DEY                                  ;8BB6C4|88      |      ;
                       INX                                  ;8BB6C5|E8      |      ;
                       DEY                                  ;8BB6C6|88      |      ;
                       BNE -                                ;8BB6C7|D0F2    |8BB6BB;
                       PHB                                  ;8BB6C9|8B      |      ;
                       PHK                                  ;8BB6CA|4B      |      ;
                       PLB                                  ;8BB6CB|AB      |      ;
                       LDY.W #$B6D6                         ;8BB6CC|A0D6B6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BB6CF|22CAA080|80A0CA;
                       PLB                                  ;8BB6D3|AB      |      ;
                       BRA +                                ;8BB6D4|8008    |8BB6DE;
                       db $C0,$2B,$7E,$40,$04,$80,$E0,$7D   ;8BB6D6|        |      ;
 
                     + RTS                                  ;8BB6DE|60      |      ;
                       LDY.W #$0005                         ;8BB6DF|A00500  |      ;
                       LDA.B [$96],Y                        ;8BB6E2|B796    |000096;
                       DEC A                                ;8BB6E4|3A      |      ;
                       JSL.L CODE_FL_8BD989                 ;8BB6E5|2289D98B|8BD989;
                       RTL                                  ;8BB6E9|6B      |      ;
                       LDA.L $7ED340                        ;8BB6EA|AF40D37E|7ED340;
                       BEQ +                                ;8BB6EE|F00B    |8BB6FB;
                       LDA.W #$0000                         ;8BB6F0|A90000  |      ;
                       STA.L $7ED340                        ;8BB6F3|8F40D37E|7ED340;
                       JSL.L CODE_FL_89A509                 ;8BB6F7|2209A589|89A509;
 
                     + RTL                                  ;8BB6FB|6B      |      ;
                       JSL.L CODE_FL_84ADBC                 ;8BB6FC|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BB700|        |      ;
                       JSL.L CODE_FL_8BC3CE                 ;8BB703|22CEC38B|8BC3CE;
                       LDA.L $7ED39F                        ;8BB707|AF9FD37E|7ED39F;
                       JSL.L CODE_FL_84AE27                 ;8BB70B|2227AE84|84AE27;
                       db $13,$B7,$8B                       ;8BB70F|        |      ;
                       RTL                                  ;8BB712|6B      |      ;
                       db $CE,$B8,$99,$D7,$B8,$99,$E0,$B8   ;8BB713|        |      ;
                       db $99,$E9,$B8,$99,$F2,$B8,$99,$FB   ;8BB71B|        |      ;
                       db $B8,$99,$04,$B9,$99,$0D,$B9,$99   ;8BB723|        |      ;
                       db $16,$B9,$99,$1F,$B9,$99,$28,$B9   ;8BB72B|        |      ;
                       db $99                               ;8BB733|        |      ;
                       db $BC,$B8,$99                       ;8BB734|        |0099B8;
                       db $C5,$B8,$99                       ;8BB737|        |      ;
                       JSL.L CODE_FL_84ADBC                 ;8BB73A|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BB73E|        |      ;
                       JSL.L CODE_FL_8BC3CE                 ;8BB741|22CEC38B|8BC3CE;
                       LDA.L $7ED3A1                        ;8BB745|AFA1D37E|7ED3A1;
                       JSL.L CODE_FL_84AE27                 ;8BB749|2227AE84|84AE27;
                       db $51,$B7,$8B                       ;8BB74D|        |      ;
                       RTL                                  ;8BB750|6B      |      ;
                       db $31,$B9,$99,$3A,$B9,$99,$43,$B9   ;8BB751|        |0000B9;
                       db $99,$4C,$B9,$99,$55,$B9,$99,$5E   ;8BB759|        |00B94C;
                       db $B9,$99,$67,$B9,$99,$70,$B9,$99   ;8BB761|        |006799;
                       db $79,$B9,$99,$82,$B9,$99,$8B,$B9   ;8BB769|        |0099B9;
                       db $99                               ;8BB771|        |00B994;
                       db $94,$B9,$99                       ;8BB772|        |      ;
                       db $9D,$B9,$99                       ;8BB775|        |0099B9;
                       JSL.L CODE_FL_84ADBC                 ;8BB778|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BB77C|        |      ;
                       JSL.L CODE_FL_8BC3CE                 ;8BB77F|22CEC38B|8BC3CE;
                       JSL.L CODE_FL_84ADF2                 ;8BB783|22F2AD84|84ADF2;
                       db $79,$B9,$99                       ;8BB787|        |      ;
                       RTL                                  ;8BB78A|6B      |      ;
                       JSL.L CODE_FL_84ADBC                 ;8BB78B|22BCAD84|84ADBC;
                       db $7C,$D2,$7E                       ;8BB78F|        |      ;
                       JSL.L CODE_FL_8BC3CE                 ;8BB792|22CEC38B|8BC3CE;
                       JSL.L CODE_FL_84ADF2                 ;8BB796|22F2AD84|84ADF2;
                       db $A6,$B9,$99                       ;8BB79A|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BB79D|22FF9384|8493FF;
                       RTL                                  ;8BB7A1|6B      |      ;
                       PEA.W $7E00                          ;8BB7A2|F4007E  |8B7E00;
                       PLB                                  ;8BB7A5|AB      |      ;
                       PLB                                  ;8BB7A6|AB      |      ;
                       LDY.W #$D27C                         ;8BB7A7|A07CD2  |      ;
                       JSL.L CODE_FL_8499C4                 ;8BB7AA|22C49984|8499C4;
                       BCS +                                ;8BB7AE|B008    |8BB7B8;
                       JSL.L CODE_FL_849B8E                 ;8BB7B0|228E9B84|849B8E;
                       JSL.L CODE_FL_89A509                 ;8BB7B4|2209A589|89A509;
 
                     + RTL                                  ;8BB7B8|6B      |      ;
                       PEA.W $7E00                          ;8BB7B9|F4007E  |8B7E00;
                       PLB                                  ;8BB7BC|AB      |      ;
                       PLB                                  ;8BB7BD|AB      |      ;
                       LDY.W #$D27C                         ;8BB7BE|A07CD2  |      ;
                       JSL.L CODE_FL_849406                 ;8BB7C1|22069484|849406;
                       BCS +                                ;8BB7C5|B004    |8BB7CB;
                       JSL.L CODE_FL_89A509                 ;8BB7C7|2209A589|89A509;
 
                     + RTL                                  ;8BB7CB|6B      |      ;
                       JSL.L CODE_FL_809115                 ;8BB7CC|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8BB7D0|22F79C80|809CF7;
                       LDA.L $7ED1E0                        ;8BB7D4|AFE0D17E|7ED1E0;
                       INC A                                ;8BB7D8|1A      |      ;
                       STA.L $7ED1E0                        ;8BB7D9|8FE0D17E|7ED1E0;
                       RTL                                  ;8BB7DD|6B      |      ;
                       LDA.W #$0000                         ;8BB7DE|A90000  |      ;
                       STA.L $7ED1E0                        ;8BB7E1|8FE0D17E|7ED1E0;
                       JSL.L CODE_FL_809115                 ;8BB7E5|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8BB7E9|22F79C80|809CF7;
                       LDA.W #$0007                         ;8BB7ED|A90700  |      ;
                       STA.L Game_State-$7E0000             ;8BB7F0|8FA00200|0002A0;
                       RTL                                  ;8BB7F4|6B      |      ;
                       JSL.L CODE_FL_8BA2C4                 ;8BB7F5|22C4A28B|8BA2C4;
                       BCS +                                ;8BB7F9|B004    |8BB7FF;
                       JSL.L CODE_FL_89A509                 ;8BB7FB|2209A589|89A509;
 
                     + RTL                                  ;8BB7FF|6B      |      ;
                       JSL.L CODE_FL_8BA2EE                 ;8BB800|22EEA28B|8BA2EE;
                       BCS +                                ;8BB804|B004    |8BB80A;
                       JSL.L CODE_FL_89A509                 ;8BB806|2209A589|89A509;
 
                     + RTL                                  ;8BB80A|6B      |      ;
                       LDA.W #$000C                         ;8BB80B|A90C00  |      ;
                       JSL.L CODE_FL_8B9107                 ;8BB80E|2207918B|8B9107;
                       RTL                                  ;8BB812|6B      |      ;
                       LDA.L $7ED39F                        ;8BB813|AF9FD37E|7ED39F;
                       JSL.L CODE_FL_8B9107                 ;8BB817|2207918B|8B9107;
                       RTL                                  ;8BB81B|6B      |      ;
                       LDA.L $7ED3A1                        ;8BB81C|AFA1D37E|7ED3A1;
                       JSL.L CODE_FL_8B9107                 ;8BB820|2207918B|8B9107;
                       RTL                                  ;8BB824|6B      |      ;
                       LDA.L $7ED5DB                        ;8BB825|AFDBD57E|7ED5DB;
                       CMP.W #$0060                         ;8BB829|C96000  |      ;
                       BNE +                                ;8BB82C|D005    |8BB833;
                       JSL.L CODE_FL_89A509                 ;8BB82E|2209A589|89A509;
                       RTL                                  ;8BB832|6B      |      ;
 
                     + LDA.L $7ED5DB                        ;8BB833|AFDBD57E|7ED5DB;
                       INC A                                ;8BB837|1A      |      ;
                       STA.L $7ED5DB                        ;8BB838|8FDBD57E|7ED5DB;
                       LDA.L $7ED5DB                        ;8BB83C|AFDBD57E|7ED5DB;
                       LSR A                                ;8BB840|4A      |      ;
                       EOR.W #$FFFF                         ;8BB841|49FFFF  |      ;
                       INC A                                ;8BB844|1A      |      ;
                       STA.L $7ED5DD                        ;8BB845|8FDDD57E|7ED5DD;
                       RTL                                  ;8BB849|6B      |      ;
                       LDA.L $7ED358                        ;8BB84A|AF58D37E|7ED358;
                       CMP.W #$0020                         ;8BB84E|C92000  |      ;
                       BNE +                                ;8BB851|D005    |8BB858;
                       JSL.L CODE_FL_89A509                 ;8BB853|2209A589|89A509;
                       RTL                                  ;8BB857|6B      |      ;
 
                     + LDA.L $7ED358                        ;8BB858|AF58D37E|7ED358;
                       INC A                                ;8BB85C|1A      |      ;
                       STA.L $7ED358                        ;8BB85D|8F58D37E|7ED358;
                       LDA.L $7ED5DB                        ;8BB861|AFDBD57E|7ED5DB;
                       INC A                                ;8BB865|1A      |      ;
                       STA.L $7ED5DB                        ;8BB866|8FDBD57E|7ED5DB;
                       LDA.L $7ED344                        ;8BB86A|AF44D37E|7ED344;
                       DEC A                                ;8BB86E|3A      |      ;
                       STA.L $7ED344                        ;8BB86F|8F44D37E|7ED344;
                       LDA.L $7ED358                        ;8BB873|AF58D37E|7ED358;
                       LSR A                                ;8BB877|4A      |      ;
                       EOR.W #$FFFF                         ;8BB878|49FFFF  |      ;
                       INC A                                ;8BB87B|1A      |      ;
                       STA.L $7ED35A                        ;8BB87C|8F5AD37E|7ED35A;
                       LDA.L $7ED5DB                        ;8BB880|AFDBD57E|7ED5DB;
                       LSR A                                ;8BB884|4A      |      ;
                       EOR.W #$FFFF                         ;8BB885|49FFFF  |      ;
                       INC A                                ;8BB888|1A      |      ;
                       STA.L $7ED5DD                        ;8BB889|8FDDD57E|7ED5DD;
                       RTL                                  ;8BB88D|6B      |      ;
                       LDA.L $7ED358                        ;8BB88E|AF58D37E|7ED358;
                       BNE +                                ;8BB892|D005    |8BB899;
                       JSL.L CODE_FL_89A509                 ;8BB894|2209A589|89A509;
                       RTL                                  ;8BB898|6B      |      ;
 
                     + LDA.L $7ED358                        ;8BB899|AF58D37E|7ED358;
                       DEC A                                ;8BB89D|3A      |      ;
                       STA.L $7ED358                        ;8BB89E|8F58D37E|7ED358;
                       LDA.L $7ED5DB                        ;8BB8A2|AFDBD57E|7ED5DB;
                       DEC A                                ;8BB8A6|3A      |      ;
                       STA.L $7ED5DB                        ;8BB8A7|8FDBD57E|7ED5DB;
                       LDA.L $7ED344                        ;8BB8AB|AF44D37E|7ED344;
                       INC A                                ;8BB8AF|1A      |      ;
                       STA.L $7ED344                        ;8BB8B0|8F44D37E|7ED344;
                       LDA.L $7ED358                        ;8BB8B4|AF58D37E|7ED358;
                       LSR A                                ;8BB8B8|4A      |      ;
                       EOR.W #$FFFF                         ;8BB8B9|49FFFF  |      ;
                       INC A                                ;8BB8BC|1A      |      ;
                       STA.L $7ED35A                        ;8BB8BD|8F5AD37E|7ED35A;
                       LDA.L $7ED5DB                        ;8BB8C1|AFDBD57E|7ED5DB;
                       LSR A                                ;8BB8C5|4A      |      ;
                       EOR.W #$FFFF                         ;8BB8C6|49FFFF  |      ;
                       INC A                                ;8BB8C9|1A      |      ;
                       STA.L $7ED5DD                        ;8BB8CA|8FDDD57E|7ED5DD;
                       RTL                                  ;8BB8CE|6B      |      ;
                       LDA.B $A9                            ;8BB8CF|A5A9    |0000A9;
                       AND.W #$0003                         ;8BB8D1|290300  |      ;
                       BNE +                                ;8BB8D4|D017    |8BB8ED;
                       LDA.L $7ED34A                        ;8BB8D6|AF4AD37E|7ED34A;
                       CMP.W #$0038                         ;8BB8DA|C93800  |      ;
                       BNE ++                               ;8BB8DD|D005    |8BB8E4;
                       JSL.L CODE_FL_89A509                 ;8BB8DF|2209A589|89A509;
                       RTL                                  ;8BB8E3|6B      |      ;
 
                    ++ LDA.L $7ED34A                        ;8BB8E4|AF4AD37E|7ED34A;
                       INC A                                ;8BB8E8|1A      |      ;
                       STA.L $7ED34A                        ;8BB8E9|8F4AD37E|7ED34A;
 
                     + RTL                                  ;8BB8ED|6B      |      ;
                       db $A5,$A9,$29,$03,$00,$D0,$14,$AF   ;8BB8EE|        |0000A9;
                       db $4A,$D3,$7E,$D0,$05,$22,$09,$A5   ;8BB8F6|        |      ;
                       db $89,$6B,$AF,$4A,$D3,$7E,$3A,$8F   ;8BB8FE|        |      ;
                       db $4A,$D3,$7E,$6B                   ;8BB906|        |      ;
                       LDA.L $7ED35C                        ;8BB90A|AF5CD37E|7ED35C;
                       CMP.W #$FFE8                         ;8BB90E|C9E8FF  |      ;
                       BNE +                                ;8BB911|D005    |8BB918;
                       JSL.L CODE_FL_89A509                 ;8BB913|2209A589|89A509;
                       RTL                                  ;8BB917|6B      |      ;
 
                     + LDA.L $7ED35C                        ;8BB918|AF5CD37E|7ED35C;
                       DEC A                                ;8BB91C|3A      |      ;
                       STA.L $7ED35C                        ;8BB91D|8F5CD37E|7ED35C;
                       RTL                                  ;8BB921|6B      |      ;
                       LDA.L $7ED344                        ;8BB922|AF44D37E|7ED344;
                       AND.W #$01FF                         ;8BB926|29FF01  |      ;
                       CMP.W #$0100                         ;8BB929|C90001  |      ;
                       BNE +                                ;8BB92C|D004    |8BB932;
                       JSL.L CODE_FL_89A509                 ;8BB92E|2209A589|89A509;
 
                     + RTL                                  ;8BB932|6B      |      ;
                       LDA.L $0000A9                        ;8BB933|AFA90000|0000A9;
                       AND.W #$0010                         ;8BB937|291000  |      ;
                       BNE +                                ;8BB93A|D005    |8BB941;
                       JSR.W CODE_FN_8BBAD8                 ;8BB93C|20D8BA  |8BBAD8;
                       BRA ++                               ;8BB93F|8005    |8BB946;
 
                     + JSR.W CODE_FN_8BBAF4                 ;8BB941|20F4BA  |8BBAF4;
                       BRA ++                               ;8BB944|8000    |8BB946;
 
                    ++ LDA.L $7ED216                        ;8BB946|AF16D27E|7ED216;
                       CMP.W #$0004                         ;8BB94A|C90400  |      ;
                       BEQ +                                ;8BB94D|F005    |8BB954;
                       LDA.W #$0001                         ;8BB94F|A90100  |      ;
                       BRA ++                               ;8BB952|8003    |8BB957;
 
                     + LDA.W #$0000                         ;8BB954|A90000  |      ;
 
                    ++ STA.B $00                            ;8BB957|8500    |000000;
                       LDA.B $BB                            ;8BB959|A5BB    |0000BB;
                       BIT.W #$0800                         ;8BB95B|890008  |      ;
                       BEQ +                                ;8BB95E|F01E    |8BB97E;
                       LDA.L $7ED218                        ;8BB960|AF18D27E|7ED218;
                       CMP.B $00                            ;8BB964|C500    |000000;
                       BEQ ++                               ;8BB966|F002    |8BB96A;
                       BPL +++                              ;8BB968|1007    |8BB971;
 
                    ++ CMP.W #$0000                         ;8BB96A|C90000  |      ;
                       BEQ +++                              ;8BB96D|F002    |8BB971;
                       BPL ++                               ;8BB96F|1004    |8BB975;
 
                   +++ LDA.B $00                            ;8BB971|A500    |000000;
                       BRA +++                              ;8BB973|8001    |8BB976;
 
                    ++ DEC A                                ;8BB975|3A      |      ;
 
                   +++ STA.L $7ED218                        ;8BB976|8F18D27E|7ED218;
                       JSL.L CODE_FL_8BF14A                 ;8BB97A|224AF18B|8BF14A;
 
                     + LDA.B $BB                            ;8BB97E|A5BB    |0000BB;
                       BIT.W #$0400                         ;8BB980|890004  |      ;
                       BEQ +                                ;8BB983|F01B    |8BB9A0;
                       LDA.L $7ED218                        ;8BB985|AF18D27E|7ED218;
                       CMP.W #$0000                         ;8BB989|C90000  |      ;
                       BMI ++                               ;8BB98C|3004    |8BB992;
                       CMP.B $00                            ;8BB98E|C500    |000000;
                       BMI +++                              ;8BB990|3005    |8BB997;
 
                    ++ LDA.W #$0000                         ;8BB992|A90000  |      ;
                       BRA ++                               ;8BB995|8001    |8BB998;
 
                   +++ INC A                                ;8BB997|1A      |      ;
 
                    ++ STA.L $7ED218                        ;8BB998|8F18D27E|7ED218;
                       JSL.L CODE_FL_8BF14A                 ;8BB99C|224AF18B|8BF14A;
 
                     + LDA.L $7ED218                        ;8BB9A0|AF18D27E|7ED218;
                       BNE +                                ;8BB9A4|D005    |8BB9AB;
                       LDA.W #$0004                         ;8BB9A6|A90400  |      ;
                       BRA ++                               ;8BB9A9|8003    |8BB9AE;
 
                     + LDA.W #$0003                         ;8BB9AB|A90300  |      ;
 
                    ++ STA.B $00                            ;8BB9AE|8500    |000000;
                       LDA.B $BB                            ;8BB9B0|A5BB    |0000BB;
                       BIT.W #$0200                         ;8BB9B2|890002  |      ;
                       BEQ +                                ;8BB9B5|F01E    |8BB9D5;
                       LDA.L $7ED216                        ;8BB9B7|AF16D27E|7ED216;
                       CMP.B $00                            ;8BB9BB|C500    |000000;
                       BEQ ++                               ;8BB9BD|F002    |8BB9C1;
                       BPL +++                              ;8BB9BF|1007    |8BB9C8;
 
                    ++ CMP.W #$0000                         ;8BB9C1|C90000  |      ;
                       BEQ +++                              ;8BB9C4|F002    |8BB9C8;
                       BPL ++                               ;8BB9C6|1004    |8BB9CC;
 
                   +++ LDA.B $00                            ;8BB9C8|A500    |000000;
                       BRA +++                              ;8BB9CA|8001    |8BB9CD;
 
                    ++ DEC A                                ;8BB9CC|3A      |      ;
 
                   +++ STA.L $7ED216                        ;8BB9CD|8F16D27E|7ED216;
                       JSL.L CODE_FL_8BF14A                 ;8BB9D1|224AF18B|8BF14A;
 
                     + LDA.B $BB                            ;8BB9D5|A5BB    |0000BB;
                       BIT.W #$0100                         ;8BB9D7|890001  |      ;
                       BEQ +                                ;8BB9DA|F01B    |8BB9F7;
                       LDA.L $7ED216                        ;8BB9DC|AF16D27E|7ED216;
                       CMP.W #$0000                         ;8BB9E0|C90000  |      ;
                       BMI ++                               ;8BB9E3|3004    |8BB9E9;
                       CMP.B $00                            ;8BB9E5|C500    |000000;
                       BMI +++                              ;8BB9E7|3005    |8BB9EE;
 
                    ++ LDA.W #$0000                         ;8BB9E9|A90000  |      ;
                       BRA ++                               ;8BB9EC|8001    |8BB9EF;
 
                   +++ INC A                                ;8BB9EE|1A      |      ;
 
                    ++ STA.L $7ED216                        ;8BB9EF|8F16D27E|7ED216;
                       JSL.L CODE_FL_8BF14A                 ;8BB9F3|224AF18B|8BF14A;
 
                     + JSL.L CODE_FL_8BBA2A                 ;8BB9F7|222ABA8B|8BBA2A;
                       LDA.B $B7                            ;8BB9FB|A5B7    |0000B7;
                       BIT.W #$1080                         ;8BB9FD|898010  |      ;
                       BEQ +                                ;8BBA00|F017    |8BBA19;
                       LDA.L $7ED21A                        ;8BBA02|AF1AD27E|7ED21A;
                       TAX                                  ;8BBA06|AA      |      ;
                       LDA.L $7ED1E6,X                      ;8BBA07|BFE6D17E|7ED1E6;
                       AND.W #$00FF                         ;8BBA0B|29FF00  |      ;
                       BEQ +                                ;8BBA0E|F009    |8BBA19;
                       JSL.L CODE_FL_8BF158                 ;8BBA10|2258F18B|8BF158;
                       JSL.L CODE_FL_89A509                 ;8BBA14|2209A589|89A509;
                       RTL                                  ;8BBA18|6B      |      ;
 
                     + LDA.B $A9                            ;8BBA19|A5A9    |0000A9;
                       LSR A                                ;8BBA1B|4A      |      ;
                       LSR A                                ;8BBA1C|4A      |      ;
                       LSR A                                ;8BBA1D|4A      |      ;
                       AND.W #$0001                         ;8BBA1E|290100  |      ;
                       CLC                                  ;8BBA21|18      |      ;
                       ADC.W #$02E9                         ;8BBA22|69E902  |      ;
                       JSL.L CODE_FL_8BBA78                 ;8BBA25|2278BA8B|8BBA78;
                       RTL                                  ;8BBA29|6B      |      ;
 
       CODE_FL_8BBA2A:
                       LDX.W #$0000                         ;8BBA2A|A20000  |      ;
                       SEP #$20                             ;8BBA2D|E220    |      ;
 
                     - LDA.L DATA8_8BBA5B,X                 ;8BBA2F|BF5BBA8B|8BBA5B;
                       BMI UNREACH_8BBA4C                   ;8BBA33|3017    |8BBA4C;
                       CMP.L $7ED216                        ;8BBA35|CF16D27E|7ED216;
                       BNE +                                ;8BBA39|D00C    |8BBA47;
                       LDA.L DATA8_8BBA5C,X                 ;8BBA3B|BF5CBA8B|8BBA5C;
                       CMP.L $7ED218                        ;8BBA3F|CF18D27E|7ED218;
                       BNE +                                ;8BBA43|D002    |8BBA47;
                       BRA ++                               ;8BBA45|8006    |8BBA4D;
 
                     + INX                                  ;8BBA47|E8      |      ;
                       INX                                  ;8BBA48|E8      |      ;
                       INX                                  ;8BBA49|E8      |      ;
                       BRA -                                ;8BBA4A|80E3    |8BBA2F;
 
       UNREACH_8BBA4C:
                       db $00                               ;8BBA4C|        |      ;
 
                    ++ REP #$20                             ;8BBA4D|C220    |      ;
                       LDA.L DATA8_8BBA5D,X                 ;8BBA4F|BF5DBA8B|8BBA5D;
                       AND.W #$00FF                         ;8BBA53|29FF00  |      ;
                       STA.L $7ED21A                        ;8BBA56|8F1AD27E|7ED21A;
                       RTL                                  ;8BBA5A|6B      |      ;
 
         DATA8_8BBA5B:
                       db $00                               ;8BBA5B|        |      ;
 
         DATA8_8BBA5C:
                       db $00                               ;8BBA5C|        |      ;
 
         DATA8_8BBA5D:
                       db $00,$01,$00,$01,$02,$00,$02,$03   ;8BBA5D|        |      ;
                       db $00,$03,$04,$00,$0C,$00,$01,$04   ;8BBA65|        |      ;
                       db $01,$01,$05,$02,$01,$06,$03,$01   ;8BBA6D|        |      ;
                       db $07,$FF                           ;8BBA75|        |      ;
                       db $FF                               ;8BBA77|        |AFD385;
 
       CODE_FL_8BBA78:
                       STA.B $D3                            ;8BBA78|85D3    |0000D3;
                       LDA.L $7ED216                        ;8BBA7A|AF16D27E|7ED216;
                       ASL A                                ;8BBA7E|0A      |      ;
                       TAX                                  ;8BBA7F|AA      |      ;
                       LDA.L DATA8_8BBAA5,X                 ;8BBA80|BFA5BA8B|8BBAA5;
                       STA.B $CF                            ;8BBA84|85CF    |0000CF;
                       LDA.L $7ED218                        ;8BBA86|AF18D27E|7ED218;
                       ASL A                                ;8BBA8A|0A      |      ;
                       TAX                                  ;8BBA8B|AA      |      ;
                       LDA.L DATA8_8BBAA1,X                 ;8BBA8C|BFA1BA8B|8BBAA1;
                       STA.B $D1                            ;8BBA90|85D1    |0000D1;
                       LDA.W #$8100                         ;8BBA92|A90081  |      ;
                       STA.B $D6                            ;8BBA95|85D6    |0000D6;
                       LDA.W #$8000                         ;8BBA97|A90080  |      ;
                       STA.B $D5                            ;8BBA9A|85D5    |0000D5;
                       JSL.L CODE_FL_80BBAF                 ;8BBA9C|22AFBB80|80BBAF;
                       RTL                                  ;8BBAA0|6B      |      ;
 
         DATA8_8BBAA1:
                       db $97,$00,$BF,$00                   ;8BBAA1|        |      ;
 
         DATA8_8BBAA5:
                       db $30,$00,$58,$00,$80,$00,$A8,$00   ;8BBAA5|        |      ;
                       db $D0,$00                           ;8BBAAD|        |      ;
 
       CODE_FL_8BBAAF:
                       LDA.B $A9                            ;8BBAAF|A5A9    |0000A9;
                       BIT.W #$0002                         ;8BBAB1|890200  |      ;
                       BEQ +                                ;8BBAB4|F005    |8BBABB;
                       JSR.W CODE_FN_8BBAD8                 ;8BBAB6|20D8BA  |8BBAD8;
                       BRA ++                               ;8BBAB9|8005    |8BBAC0;
 
                     + JSR.W CODE_FN_8BBAF4                 ;8BBABB|20F4BA  |8BBAF4;
                       BRA ++                               ;8BBABE|8000    |8BBAC0;
 
                    ++ LDA.B $A9                            ;8BBAC0|A5A9    |0000A9;
                       BIT.W #$0002                         ;8BBAC2|890200  |      ;
                       BNE +                                ;8BBAC5|D007    |8BBACE;
                       LDA.W #$02E9                         ;8BBAC7|A9E902  |      ;
                       JSL.L CODE_FL_8BBA78                 ;8BBACA|2278BA8B|8BBA78;
 
                     + RTL                                  ;8BBACE|6B      |      ;
                       JSL.L CODE_FL_8BBAAF                 ;8BBACF|22AFBA8B|8BBAAF;
                       JSL.L CODE_FL_8BB550                 ;8BBAD3|2250B58B|8BB550;
                       RTL                                  ;8BBAD7|6B      |      ;
 
       CODE_FN_8BBAD8:
                       LDX.W #$000A                         ;8BBAD8|A20A00  |      ;
 
                     - LDA.L DATA8_8BBAE8,X                 ;8BBADB|BFE8BA8B|8BBAE8;
                       STA.L $7E25B0,X                      ;8BBADF|9FB0257E|7E25B0;
                       DEX                                  ;8BBAE3|CA      |      ;
                       DEX                                  ;8BBAE4|CA      |      ;
                       BPL -                                ;8BBAE5|10F4    |8BBADB;
                       RTS                                  ;8BBAE7|60      |      ;
 
         DATA8_8BBAE8:
                       db $1E,$E4,$1F,$A4,$1F,$E4,$1E,$E4   ;8BBAE8|        |      ;
                       db $1E,$E4,$1F,$A4                   ;8BBAF0|        |      ;
 
       CODE_FN_8BBAF4:
                       LDX.W #$000A                         ;8BBAF4|A20A00  |      ;
 
                     - LDA.L DATA8_8BBB04,X                 ;8BBAF7|BF04BB8B|8BBB04;
                       STA.L $7E25B0,X                      ;8BBAFB|9FB0257E|7E25B0;
                       DEX                                  ;8BBAFF|CA      |      ;
                       DEX                                  ;8BBB00|CA      |      ;
                       BPL -                                ;8BBB01|10F4    |8BBAF7;
                       RTS                                  ;8BBB03|60      |      ;
 
         DATA8_8BBB04:
                       db $6F,$26,$7F,$26,$AF,$26,$BF,$26   ;8BBB04|        |      ;
                       db $CF,$26,$DF,$26                   ;8BBB0C|        |      ;
                       LDA.B $96                            ;8BBB10|A596    |000096;
                       PHA                                  ;8BBB12|48      |      ;
                       LDA.W #$D38A                         ;8BBB13|A98AD3  |      ;
                       STA.B $96                            ;8BBB16|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BBB18|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BBB1C|222CA689|89A62C;
                       db $44,$BB,$8B                       ;8BBB20|        |      ;
                       PLA                                  ;8BBB23|68      |      ;
                       STA.B $96                            ;8BBB24|8596    |000096;
                       SEP #$20                             ;8BBB26|E220    |      ;
                       LDA.B #$04                           ;8BBB28|A904    |      ;
                       STA.L $0001E3                        ;8BBB2A|8FE30100|0001E3;
                       LDA.B #$33                           ;8BBB2E|A933    |      ;
                       STA.L $0001E7                        ;8BBB30|8FE70100|0001E7;
                       LDA.B #$82                           ;8BBB34|A982    |      ;
                       STA.L $0001E6                        ;8BBB36|8FE60100|0001E6;
                       REP #$20                             ;8BBB3A|C220    |      ;
                       LDA.W #$0000                         ;8BBB3C|A90000  |      ;
                       STA.L $7E86F8                        ;8BBB3F|8FF8867E|7E86F8;
                       RTL                                  ;8BBB43|6B      |      ;
                       db $01,$CF,$BB,$FF,$FF,$0A,$F2,$ED   ;8BBB44|        |      ;
                       db $FF,$FF,$01,$CF,$BB,$FF,$FF,$0A   ;8BBB4C|        |      ;
                       db $F2,$ED,$FF,$FF,$01,$CF,$BB,$FF   ;8BBB54|        |      ;
                       db $FF,$0A,$F2,$ED,$FF,$FF,$01,$CF   ;8BBB5C|        |      ;
                       db $BB,$FF,$FF,$0A,$F2,$ED,$FF,$FF   ;8BBB64|        |      ;
                       db $01,$CF,$BB,$FF,$FF,$0A,$F2,$ED   ;8BBB6C|        |      ;
                       db $FF,$FF,$01,$CF,$BB,$FF,$FF,$0A   ;8BBB74|        |      ;
                       db $F2,$ED,$FF,$FF,$01,$CF,$BB,$FF   ;8BBB7C|        |      ;
                       db $FF,$F0,$F2,$ED,$FF,$FF,$01,$D8   ;8BBB84|        |      ;
                       db $BB,$FF,$FF,$0A,$7D,$EB,$FF,$FF   ;8BBB8C|        |      ;
                       db $01,$D8,$BB,$FF,$FF,$0A,$7D,$EB   ;8BBB94|        |      ;
                       db $FF,$FF,$01,$D8,$BB,$FF,$FF,$0A   ;8BBB9C|        |      ;
                       db $7D,$EB,$FF,$FF,$01,$D8,$BB,$FF   ;8BBBA4|        |      ;
                       db $FF,$0A,$7D,$EB,$FF,$FF,$01,$D8   ;8BBBAC|        |      ;
                       db $BB,$FF,$FF,$0A,$7D,$EB,$FF,$FF   ;8BBBB4|        |      ;
                       db $01,$D8,$BB,$FF,$FF,$0A,$7D,$EB   ;8BBBBC|        |      ;
                       db $FF,$FF,$01,$D8,$BB,$FF,$FF,$FF   ;8BBBC4|        |      ;
                       db $E9,$A4,$89                       ;8BBBCC|        |      ;
                       JSL.L CODE_FL_8BEDF2                 ;8BBBCF|22F2ED8B|8BEDF2;
                       LDA.W #$18C6                         ;8BBBD3|A9C618  |      ;
                       BRA +                                ;8BBBD6|8009    |8BBBE1;
                       JSL.L CODE_FL_8BEB7D                 ;8BBBD8|227DEB8B|8BEB7D;
                       LDA.W #$0000                         ;8BBBDC|A90000  |      ;
                       BRA +                                ;8BBBDF|8000    |8BBBE1;
 
                     + CMP.L $7E86F8                        ;8BBBE1|CFF8867E|7E86F8;
                       BEQ +                                ;8BBBE5|F00F    |8BBBF6;
                       STA.B $02                            ;8BBBE7|8502    |000002;
                       LDA.L $7E86F8                        ;8BBBE9|AFF8867E|7E86F8;
                       JSL.L CODE_FL_80B32C                 ;8BBBED|222CB380|80B32C;
                       STA.L $7E86F8                        ;8BBBF1|8FF8867E|7E86F8;
                       RTL                                  ;8BBBF5|6B      |      ;
 
                     + RTL                                  ;8BBBF6|6B      |      ;
                       db $FF,$90,$F1,$8B,$FF,$26,$A5,$89   ;8BBBF7|        |      ;
                       db $45,$BC,$FF,$2D,$BC,$8B           ;8BBBFF|        |      ;
                       db $01,$28,$BD,$FF,$FF,$01,$12,$BD   ;8BBC05|        |000028;
                       db $FF,$FF,$10,$FE,$BD,$FF,$FF,$03   ;8BBC0D|        |FE10FF;
                       db $9D,$BD,$FF,$FF,$F0,$10,$AA,$FF   ;8BBC15|        |00FFBD;
                       db $FF,$3C,$10,$AA,$FF,$FF,$FF,$26   ;8BBC1D|        |AA103C;
                       db $A5,$89,$41,$C0                   ;8BBC25|        |000089;
                       db $FF,$E9,$A4,$89                   ;8BBC29|        |      ;
                       LDA.W #$0000                         ;8BBC2D|A90000  |      ;
                       STA.L $7ED254                        ;8BBC30|8F54D27E|7ED254;
                       LDA.L $7ED1E2                        ;8BBC34|AFE2D17E|7ED1E2;
                       CMP.W #$000C                         ;8BBC38|C90C00  |      ;
                       BNE +                                ;8BBC3B|D007    |8BBC44;
                       JSL.L CODE_FL_89A62C                 ;8BBC3D|222CA689|89A62C;
                       db $29,$BC,$8B                       ;8BBC41|        |      ;
 
                     + RTL                                  ;8BBC44|6B      |      ;
                       LDA.L $0000A9                        ;8BBC45|AFA90000|0000A9;
                       AND.W #$000F                         ;8BBC49|290F00  |      ;
                       ASL A                                ;8BBC4C|0A      |      ;
                       TAX                                  ;8BBC4D|AA      |      ;
                       LDA.W CODE_00BC58,X                  ;8BBC4E|BD58BC  |00BC58;
                       STA.L $7ED254                        ;8BBC51|8F54D27E|7ED254;
                       JMP.W CODE_JP_8BBF94                 ;8BBC55|4C94BF  |8BBF94;
                       db $FD,$FF,$03,$00,$FA,$FF,$06,$00   ;8BBC58|        |      ;
                       db $FD,$FF,$03,$00,$FA,$FF,$06,$00   ;8BBC60|        |      ;
                       db $FD,$FF,$03,$00,$FA,$FF,$06,$00   ;8BBC68|        |      ;
                       db $FD,$FF,$03,$00,$F8,$FF,$08,$00   ;8BBC70|        |      ;
                       LDA.B $96                            ;8BBC78|A596    |000096;
                       PHA                                  ;8BBC7A|48      |      ;
                       LDA.W #$D379                         ;8BBC7B|A979D3  |      ;
                       STA.B $96                            ;8BBC7E|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BBC80|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BBC84|222CA689|89A62C;
                       db $F7,$BB,$8B                       ;8BBC88|        |      ;
                       PLA                                  ;8BBC8B|68      |      ;
                       STA.B $96                            ;8BBC8C|8596    |000096;
                       RTL                                  ;8BBC8E|6B      |      ;
                       db $FF,$89,$F1,$8B,$FF,$26,$A5,$89   ;8BBC8F|        |      ;
                       db $99,$BC                           ;8BBC97|        |      ;
                       LDA.L $0000A9                        ;8BBC99|AFA90000|0000A9;
                       AND.W #$000F                         ;8BBC9D|290F00  |      ;
                       ASL A                                ;8BBCA0|0A      |      ;
                       TAX                                  ;8BBCA1|AA      |      ;
                       LDA.W LOOSE_OP_00BCAA,X              ;8BBCA2|BDAABC  |00BCAA;
                       STA.L $7ED254                        ;8BBCA5|8F54D27E|7ED254;
                       RTL                                  ;8BBCA9|6B      |      ;
                       db $00,$00,$00,$00,$FF,$FF,$01,$00   ;8BBCAA|        |      ;
                       db $00,$00,$00,$00,$FF,$FF,$01,$00   ;8BBCB2|        |      ;
                       db $00,$00,$00,$00,$FF,$FF,$01,$00   ;8BBCBA|        |      ;
                       db $00,$00,$00,$00,$FE,$FF,$02,$00   ;8BBCC2|        |      ;
                       LDA.B $96                            ;8BBCCA|A596    |000096;
                       PHA                                  ;8BBCCC|48      |      ;
                       LDA.W #$D379                         ;8BBCCD|A979D3  |      ;
                       STA.B $96                            ;8BBCD0|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BBCD2|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BBCD6|222CA689|89A62C;
                       db $8F,$BC,$8B                       ;8BBCDA|        |      ;
                       PLA                                  ;8BBCDD|68      |      ;
                       STA.B $96                            ;8BBCDE|8596    |000096;
                       RTL                                  ;8BBCE0|6B      |      ;
                       db $FF,$26,$A5,$89,$94,$BF,$01,$28   ;8BBCE1|        |      ;
                       db $BD,$FF,$FF,$01,$12,$BD,$FF,$FF   ;8BBCE9|        |      ;
                       db $FF,$26,$A5,$89,$41,$C0,$FF,$E9   ;8BBCF1|        |      ;
                       db $A4,$89                           ;8BBCF9|        |      ;
                       LDA.B $96                            ;8BBCFB|A596    |000096;
                       PHA                                  ;8BBCFD|48      |      ;
                       LDA.W #$D379                         ;8BBCFE|A979D3  |      ;
                       STA.B $96                            ;8BBD01|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BBD03|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BBD07|222CA689|89A62C;
                       db $E1,$BC,$8B                       ;8BBD0B|        |      ;
                       PLA                                  ;8BBD0E|68      |      ;
                       STA.B $96                            ;8BBD0F|8596    |000096;
                       RTL                                  ;8BBD11|6B      |      ;
                       PHB                                  ;8BBD12|8B      |      ;
                       PHK                                  ;8BBD13|4B      |      ;
                       PLB                                  ;8BBD14|AB      |      ;
                       LDY.W #$BD1F                         ;8BBD15|A01FBD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BBD18|22CAA080|80A0CA;
                       PLB                                  ;8BBD1C|AB      |      ;
                       BRA +                                ;8BBD1D|8008    |8BBD27;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8BBD1F|        |      ;
 
                     + RTL                                  ;8BBD27|6B      |      ;
 
       CODE_FL_8BBD28:
                       PHB                                  ;8BBD28|8B      |      ;
                       PHK                                  ;8BBD29|4B      |      ;
                       PLB                                  ;8BBD2A|AB      |      ;
                       LDY.W #$BD35                         ;8BBD2B|A035BD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BBD2E|22CAA080|80A0CA;
                       PLB                                  ;8BBD32|AB      |      ;
                       BRA +                                ;8BBD33|8008    |8BBD3D;
                       db $7D,$BD,$8B,$20,$00,$80,$80,$77   ;8BBD35|        |      ;
 
                     + PHB                                  ;8BBD3D|8B      |      ;
                       PHK                                  ;8BBD3E|4B      |      ;
                       PLB                                  ;8BBD3F|AB      |      ;
                       LDY.W #$BD4A                         ;8BBD40|A04ABD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BBD43|22CAA080|80A0CA;
                       PLB                                  ;8BBD47|AB      |      ;
                       BRA +                                ;8BBD48|8008    |8BBD52;
                       db $7D,$BD,$8B,$20,$00,$80,$A0,$77   ;8BBD4A|        |      ;
 
                     + PHB                                  ;8BBD52|8B      |      ;
                       PHK                                  ;8BBD53|4B      |      ;
                       PLB                                  ;8BBD54|AB      |      ;
                       LDY.W #$BD5F                         ;8BBD55|A05FBD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BBD58|22CAA080|80A0CA;
                       PLB                                  ;8BBD5C|AB      |      ;
                       BRA +                                ;8BBD5D|8008    |8BBD67;
                       db $7D,$BD,$8B,$20,$00,$80,$C0,$77   ;8BBD5F|        |      ;
 
                     + PHB                                  ;8BBD67|8B      |      ;
                       PHK                                  ;8BBD68|4B      |      ;
                       PLB                                  ;8BBD69|AB      |      ;
                       LDY.W #$BD74                         ;8BBD6A|A074BD  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BBD6D|22CAA080|80A0CA;
                       PLB                                  ;8BBD71|AB      |      ;
                       BRA +                                ;8BBD72|8008    |8BBD7C;
                       db $7D,$BD,$8B,$20,$00,$80,$E0,$77   ;8BBD74|        |      ;
 
                     + RTL                                  ;8BBD7C|6B      |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BBD7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BBD85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BBD8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BBD95|        |      ;
                       db $A0,$05,$00,$B7,$96,$29,$FF,$00   ;8BBD9D|        |      ;
                       db $3A,$22,$AB,$BD,$8B,$6B,$29,$03   ;8BBDA5|        |      ;
                       db $00,$0A,$AA,$7C,$B3,$BD,$BB,$BD   ;8BBDAD|        |      ;
                       db $D1,$BD,$E7,$BD,$FD,$BD,$8B,$4B   ;8BBDB5|        |0000BD;
                       db $AB,$A0,$C8,$BD,$22,$CA,$A0,$80   ;8BBDBD|        |      ;
                       db $AB,$80,$08,$60,$B1,$7F,$00,$02   ;8BBDC5|        |      ;
                       db $80,$00,$3D,$6B,$8B,$4B,$AB,$A0   ;8BBDCD|        |8BBDCF;
                       db $DE,$BD,$22,$CA,$A0,$80,$AB,$80   ;8BBDD5|        |0022BD;
                       db $08,$60,$B3,$7F,$00,$02,$80,$00   ;8BBDDD|        |      ;
                       db $3E,$6B,$8B,$4B,$AB,$A0,$F4,$BD   ;8BBDE5|        |008B6B;
                       db $22,$CA,$A0,$80,$AB,$80,$08,$60   ;8BBDED|        |80A0CA;
                       db $B5,$7F,$00,$02,$80,$00,$3F,$6B   ;8BBDF5|        |00007F;
                       db $6B,$A0,$05,$00,$B7,$96,$29,$FF   ;8BBDFD|        |      ;
                       db $00,$3A,$22,$0C,$BE,$8B,$6B,$29   ;8BBE05|        |      ;
                       db $0F,$00,$0A,$AA,$7C,$14,$BE,$34   ;8BBE0D|        |AA0A00;
                       db $BE,$4A,$BE,$60,$BE,$76,$BE,$8C   ;8BBE15|        |00BE4A;
                       db $BE,$A2,$BE,$B8,$BE,$CE,$BE,$E4   ;8BBE1D|        |00BEA2;
                       db $BE,$FA,$BE,$10,$BF,$26,$BF,$3C   ;8BBE25|        |00BEFA;
                       db $BF,$52,$BF,$68,$BF,$7E,$BF,$8B   ;8BBE2D|        |68BF52;
                       db $4B,$AB,$A0,$41,$BE,$22,$CA,$A0   ;8BBE35|        |      ;
                       db $80,$AB,$80,$08,$60,$91,$7F,$00   ;8BBE3D|        |8BBDEA;
                       db $02,$80,$00,$50,$6B,$8B,$4B,$AB   ;8BBE45|        |      ;
                       db $A0,$57,$BE,$22,$CA,$A0,$80,$AB   ;8BBE4D|        |      ;
                       db $80,$08,$60,$93,$7F,$00,$02,$80   ;8BBE55|        |8BBE5F;
                       db $00,$51,$6B,$8B,$4B,$AB,$A0,$6D   ;8BBE5D|        |      ;
                       db $BE,$22,$CA,$A0,$80,$AB,$80,$08   ;8BBE65|        |00CA22;
                       db $60,$95,$7F,$00,$02,$80,$00,$52   ;8BBE6D|        |      ;
                       db $6B,$8B,$4B,$AB,$A0,$83,$BE,$22   ;8BBE75|        |      ;
                       db $CA,$A0,$80,$AB,$80,$08,$60,$97   ;8BBE7D|        |      ;
                       db $7F,$00,$02,$80,$00,$53,$6B,$8B   ;8BBE85|        |800200;
                       db $4B,$AB,$A0,$99,$BE,$22,$CA,$A0   ;8BBE8D|        |      ;
                       db $80,$AB,$80,$08,$60,$99,$7F,$00   ;8BBE95|        |8BBE42;
                       db $02,$80,$00,$54,$6B,$8B,$4B,$AB   ;8BBE9D|        |      ;
                       db $A0,$AF,$BE,$22,$CA,$A0,$80,$AB   ;8BBEA5|        |      ;
                       db $80,$08,$60,$9B,$7F,$00,$02,$80   ;8BBEAD|        |8BBEB7;
                       db $00,$55,$6B,$8B,$4B,$AB,$A0,$C5   ;8BBEB5|        |      ;
                       db $BE,$22,$CA,$A0,$80,$AB,$80,$08   ;8BBEBD|        |00CA22;
                       db $60,$9D,$7F,$00,$02,$80,$00,$56   ;8BBEC5|        |      ;
                       db $6B,$8B,$4B,$AB,$A0,$DB,$BE,$22   ;8BBECD|        |      ;
                       db $CA,$A0,$80,$AB,$80,$08,$60,$9F   ;8BBED5|        |      ;
                       db $7F,$00,$02,$80,$00,$57,$6B,$8B   ;8BBEDD|        |800200;
                       db $4B,$AB,$A0,$F1,$BE,$22,$CA,$A0   ;8BBEE5|        |      ;
                       db $80,$AB,$80,$08,$60,$A1,$7F,$00   ;8BBEED|        |8BBE9A;
                       db $02,$80,$00,$58,$6B,$8B,$4B,$AB   ;8BBEF5|        |      ;
                       db $A0,$07,$BF,$22,$CA,$A0,$80,$AB   ;8BBEFD|        |      ;
                       db $80,$08,$60,$A3,$7F,$00,$02,$80   ;8BBF05|        |8BBF0F;
                       db $00,$59,$6B,$8B,$4B,$AB,$A0,$1D   ;8BBF0D|        |      ;
                       db $BF,$22,$CA,$A0,$80,$AB,$80,$08   ;8BBF15|        |A0CA22;
                       db $60,$A5,$7F,$00,$02,$80,$00,$5A   ;8BBF1D|        |      ;
                       db $6B,$8B,$4B,$AB,$A0,$33,$BF,$22   ;8BBF25|        |      ;
                       db $CA,$A0,$80,$AB,$80,$08,$60,$A7   ;8BBF2D|        |      ;
                       db $7F,$00,$02,$80,$00,$5B,$6B,$8B   ;8BBF35|        |800200;
                       db $4B,$AB,$A0,$49,$BF,$22,$CA,$A0   ;8BBF3D|        |      ;
                       db $80,$AB,$80,$08,$60,$A9,$7F,$00   ;8BBF45|        |8BBEF2;
                       db $02,$80,$00,$5C,$6B,$8B,$4B,$AB   ;8BBF4D|        |      ;
                       db $A0,$5F,$BF,$22,$CA,$A0,$80,$AB   ;8BBF55|        |      ;
                       db $80,$08,$60,$AB,$7F,$00,$02,$80   ;8BBF5D|        |8BBF67;
                       db $00,$5D,$6B,$8B,$4B,$AB,$A0,$75   ;8BBF65|        |      ;
                       db $BF,$22,$CA,$A0,$80,$AB,$80,$08   ;8BBF6D|        |A0CA22;
                       db $60,$AD,$7F,$00,$02,$80,$00,$5E   ;8BBF75|        |      ;
                       db $6B,$8B,$4B,$AB,$A0,$8B,$BF,$22   ;8BBF7D|        |      ;
                       db $CA,$A0,$80,$AB,$80,$08,$60,$AF   ;8BBF85|        |      ;
                       db $7F,$00,$02,$80,$00,$5F,$6B       ;8BBF8D|        |800200;
 
       CODE_JP_8BBF94:
                       LDA.L $7ED39D                        ;8BBF94|AF9DD37E|7ED39D;
                       AND.W #$000F                         ;8BBF98|290F00  |      ;
                       STA.L $7ED39D                        ;8BBF9B|8F9DD37E|7ED39D;
                       BNE +                                ;8BBF9F|D007    |8BBFA8;
                       LDA.W #$0000                         ;8BBFA1|A90000  |      ;
                       STA.L $7ED39B                        ;8BBFA4|8F9BD37E|7ED39B;
 
                     + LDY.W #$0004                         ;8BBFA8|A00400  |      ;
 
                     - LDA.L $7ED39D                        ;8BBFAB|AF9DD37E|7ED39D;
                       ASL A                                ;8BBFAF|0A      |      ;
                       CLC                                  ;8BBFB0|18      |      ;
                       ADC.W LOOSE_OP_00C03B,Y              ;8BBFB1|793BC0  |00C03B;
                       TAX                                  ;8BBFB4|AA      |      ;
                       CPY.W #$0000                         ;8BBFB5|C00000  |      ;
                       BNE +                                ;8BBFB8|D00E    |8BBFC8;
                       LDA.L $7ED39D                        ;8BBFBA|AF9DD37E|7ED39D;
                       CMP.W #$0006                         ;8BBFBE|C90600  |      ;
                       BCC ++                               ;8BBFC1|9024    |8BBFE7;
                       CMP.W #$000A                         ;8BBFC3|C90A00  |      ;
                       BCS ++                               ;8BBFC6|B01F    |8BBFE7;
 
                     + LDA.L $7F8680,X                      ;8BBFC8|BF80867F|7F8680;
                       STA.B $02                            ;8BBFCC|8502    |000002;
                       LDA.L $7E86F6,X                      ;8BBFCE|BFF6867E|7E86F6;
                       JSL.L CODE_FL_80B32C                 ;8BBFD2|222CB380|80B32C;
                       STA.L $7E86F6,X                      ;8BBFD6|9FF6867E|7E86F6;
                       CMP.L $7F8680,X                      ;8BBFDA|DF80867F|7F8680;
                       BEQ ++                               ;8BBFDE|F007    |8BBFE7;
                       LDA.W #$0001                         ;8BBFE0|A90100  |      ;
                       STA.L $7ED39B                        ;8BBFE3|8F9BD37E|7ED39B;
 
                    ++ DEY                                  ;8BBFE7|88      |      ;
                       DEY                                  ;8BBFE8|88      |      ;
                       BPL -                                ;8BBFE9|10C0    |8BBFAB;
                       LDA.L $7ED39D                        ;8BBFEB|AF9DD37E|7ED39D;
                       ASL A                                ;8BBFEF|0A      |      ;
                       ASL A                                ;8BBFF0|0A      |      ;
                       TAX                                  ;8BBFF1|AA      |      ;
                       LDY.W #$0007                         ;8BBFF2|A00700  |      ;
 
                     - LDA.L $7F8C82,X                      ;8BBFF5|BF828C7F|7F8C82;
                       STA.B $02                            ;8BBFF9|8502    |000002;
                       LDA.L $7E4C1E,X                      ;8BBFFB|BF1E4C7E|7E4C1E;
                       JSL.L CODE_FL_80B32C                 ;8BBFFF|222CB380|80B32C;
                       STA.L $7E4C1E,X                      ;8BC003|9F1E4C7E|7E4C1E;
                       CMP.L $7F8C82,X                      ;8BC007|DF828C7F|7F8C82;
                       BEQ +                                ;8BC00B|F007    |8BC014;
                       LDA.W #$0001                         ;8BC00D|A90100  |      ;
                       STA.L $7ED39B                        ;8BC010|8F9BD37E|7ED39B;
 
                     + TXA                                  ;8BC014|8A      |      ;
                       CLC                                  ;8BC015|18      |      ;
                       ADC.W #$0040                         ;8BC016|694000  |      ;
                       TAX                                  ;8BC019|AA      |      ;
                       DEY                                  ;8BC01A|88      |      ;
                       BPL -                                ;8BC01B|10D8    |8BBFF5;
                       LDA.L $7ED39D                        ;8BC01D|AF9DD37E|7ED39D;
                       CMP.W #$000F                         ;8BC021|C90F00  |      ;
                       BNE +                                ;8BC024|D00B    |8BC031;
                       LDA.L $7ED39B                        ;8BC026|AF9BD37E|7ED39B;
                       BNE +                                ;8BC02A|D005    |8BC031;
                       JSL.L CODE_FL_89A509                 ;8BC02C|2209A589|89A509;
                       RTL                                  ;8BC030|6B      |      ;
 
                     + LDA.L $7ED39D                        ;8BC031|AF9DD37E|7ED39D;
                       INC A                                ;8BC035|1A      |      ;
                       STA.L $7ED39D                        ;8BC036|8F9DD37E|7ED39D;
                       RTL                                  ;8BC03A|6B      |      ;
                       db $C0,$00,$A0,$00,$80,$00           ;8BC03B|        |      ;
                       LDA.L $7ED39D                        ;8BC041|AF9DD37E|7ED39D;
                       AND.W #$000F                         ;8BC045|290F00  |      ;
                       STA.L $7ED39D                        ;8BC048|8F9DD37E|7ED39D;
                       BNE +                                ;8BC04C|D007    |8BC055;
                       LDA.W #$0000                         ;8BC04E|A90000  |      ;
                       STA.L $7ED39B                        ;8BC051|8F9BD37E|7ED39B;
 
                     + LDA.L $7ED39D                        ;8BC055|AF9DD37E|7ED39D;
                       ASL A                                ;8BC059|0A      |      ;
                       CLC                                  ;8BC05A|18      |      ;
                       ADC.W #$0080                         ;8BC05B|698000  |      ;
                       TAX                                  ;8BC05E|AA      |      ;
                       LDY.W #$0001                         ;8BC05F|A00100  |      ;
 
                     - LDA.L $7F8480,X                      ;8BC062|BF80847F|7F8480;
                       STA.B $02                            ;8BC066|8502    |000002;
                       LDA.L $7E86F6,X                      ;8BC068|BFF6867E|7E86F6;
                       JSL.L CODE_FL_80B32C                 ;8BC06C|222CB380|80B32C;
                       STA.L $7E86F6,X                      ;8BC070|9FF6867E|7E86F6;
                       CMP.L $7F8480,X                      ;8BC074|DF80847F|7F8480;
                       BEQ +                                ;8BC078|F007    |8BC081;
                       LDA.W #$0001                         ;8BC07A|A90100  |      ;
                       STA.L $7ED39B                        ;8BC07D|8F9BD37E|7ED39B;
 
                     + TXA                                  ;8BC081|8A      |      ;
                       CLC                                  ;8BC082|18      |      ;
                       ADC.W #$0020                         ;8BC083|692000  |      ;
                       TAX                                  ;8BC086|AA      |      ;
                       DEY                                  ;8BC087|88      |      ;
                       BPL -                                ;8BC088|10D8    |8BC062;
                       LDA.L $7ED39D                        ;8BC08A|AF9DD37E|7ED39D;
                       ASL A                                ;8BC08E|0A      |      ;
                       ASL A                                ;8BC08F|0A      |      ;
                       TAX                                  ;8BC090|AA      |      ;
                       LDY.W #$0007                         ;8BC091|A00700  |      ;
 
                     - LDA.L $7F8882,X                      ;8BC094|BF82887F|7F8882;
                       STA.B $02                            ;8BC098|8502    |000002;
                       LDA.L $7E4C1E,X                      ;8BC09A|BF1E4C7E|7E4C1E;
                       JSL.L CODE_FL_80B32C                 ;8BC09E|222CB380|80B32C;
                       STA.L $7E4C1E,X                      ;8BC0A2|9F1E4C7E|7E4C1E;
                       CMP.L $7F8882,X                      ;8BC0A6|DF82887F|7F8882;
                       BEQ +                                ;8BC0AA|F007    |8BC0B3;
                       LDA.W #$0001                         ;8BC0AC|A90100  |      ;
                       STA.L $7ED39B                        ;8BC0AF|8F9BD37E|7ED39B;
 
                     + TXA                                  ;8BC0B3|8A      |      ;
                       CLC                                  ;8BC0B4|18      |      ;
                       ADC.W #$0040                         ;8BC0B5|694000  |      ;
                       TAX                                  ;8BC0B8|AA      |      ;
                       DEY                                  ;8BC0B9|88      |      ;
                       BPL -                                ;8BC0BA|10D8    |8BC094;
                       LDA.L $7ED39D                        ;8BC0BC|AF9DD37E|7ED39D;
                       CMP.W #$000F                         ;8BC0C0|C90F00  |      ;
                       BNE +                                ;8BC0C3|D00B    |8BC0D0;
                       LDA.L $7ED39B                        ;8BC0C5|AF9BD37E|7ED39B;
                       BNE +                                ;8BC0C9|D005    |8BC0D0;
                       JSL.L CODE_FL_89A509                 ;8BC0CB|2209A589|89A509;
                       RTL                                  ;8BC0CF|6B      |      ;
 
                     + LDA.L $7ED39D                        ;8BC0D0|AF9DD37E|7ED39D;
                       INC A                                ;8BC0D4|1A      |      ;
                       STA.L $7ED39D                        ;8BC0D5|8F9DD37E|7ED39D;
                       RTL                                  ;8BC0D9|6B      |      ;
                       LDA.B $96                            ;8BC0DA|A596    |000096;
                       PHA                                  ;8BC0DC|48      |      ;
                       LDA.W #$D379                         ;8BC0DD|A979D3  |      ;
                       STA.B $96                            ;8BC0E0|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC0E2|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC0E6|222CA689|89A62C;
                       db $FF,$C0,$8B                       ;8BC0EA|        |      ;
                       PLA                                  ;8BC0ED|68      |      ;
                       STA.B $96                            ;8BC0EE|8596    |000096;
                       LDA.W #$0068                         ;8BC0F0|A96800  |      ;
                       STA.L $7ED5F5                        ;8BC0F3|8FF5D57E|7ED5F5;
                       LDA.W #$7F00                         ;8BC0F7|A9007F  |      ;
                       STA.L $7ED5F3                        ;8BC0FA|8FF3D57E|7ED5F3;
                       RTL                                  ;8BC0FE|6B      |      ;
                       db $FF,$26,$A5,$89,$99,$C1,$7C,$4E   ;8BC0FF|        |      ;
                       db $C2,$FF,$FF,$FF,$E9,$A4,$89       ;8BC107|        |      ;
                       LDA.B $96                            ;8BC10E|A596    |000096;
                       PHA                                  ;8BC110|48      |      ;
                       LDA.W #$D379                         ;8BC111|A979D3  |      ;
                       STA.B $96                            ;8BC114|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC116|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC11A|222CA689|89A62C;
                       db $33,$C1,$8B                       ;8BC11E|        |      ;
                       PLA                                  ;8BC121|68      |      ;
                       STA.B $96                            ;8BC122|8596    |000096;
                       LDA.W #$0168                         ;8BC124|A96801  |      ;
                       STA.L $7ED5F5                        ;8BC127|8FF5D57E|7ED5F5;
                       LDA.W #$0000                         ;8BC12B|A90000  |      ;
                       STA.L $7ED5F3                        ;8BC12E|8FF3D57E|7ED5F3;
                       RTL                                  ;8BC132|6B      |      ;
                       db $FF,$26,$A5,$89,$43,$C1,$FF,$26   ;8BC133|        |      ;
                       db $A5,$89,$4C,$C1                   ;8BC13B|        |      ;
                       db $FF,$E9,$A4,$89                   ;8BC13F|        |89A4E9;
                       JSL.L CODE_FL_8BC30E                 ;8BC143|220EC38B|8BC30E;
                       JSL.L CODE_FL_8BC180                 ;8BC147|2280C18B|8BC180;
                       RTL                                  ;8BC14B|6B      |      ;
                       JSL.L CODE_FL_8BC30E                 ;8BC14C|220EC38B|8BC30E;
                       JSL.L CODE_FL_8BC1B9                 ;8BC150|22B9C18B|8BC1B9;
                       RTL                                  ;8BC154|6B      |      ;
                       LDA.B $96                            ;8BC155|A596    |000096;
                       PHA                                  ;8BC157|48      |      ;
                       LDA.W #$D379                         ;8BC158|A979D3  |      ;
                       STA.B $96                            ;8BC15B|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC15D|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC161|222CA689|89A62C;
                       db $7A,$C1,$8B                       ;8BC165|        |      ;
                       PLA                                  ;8BC168|68      |      ;
                       STA.B $96                            ;8BC169|8596    |000096;
                       LDA.W #$0168                         ;8BC16B|A96801  |      ;
                       STA.L $7ED5F5                        ;8BC16E|8FF5D57E|7ED5F5;
                       LDA.W #$7F00                         ;8BC172|A9007F  |      ;
                       STA.L $7ED5F3                        ;8BC175|8FF3D57E|7ED5F3;
                       RTL                                  ;8BC179|6B      |      ;
                       db $FF,$26,$A5,$89,$B9,$C1           ;8BC17A|        |      ;
 
       CODE_FL_8BC180:
                       LDA.L $7ED5F3                        ;8BC180|AFF3D57E|7ED5F3;
                       CLC                                  ;8BC184|18      |      ;
                       ADC.W #$0080                         ;8BC185|698000  |      ;
                       STA.L $7ED5F3                        ;8BC188|8FF3D57E|7ED5F3;
                       CMP.W #$8000                         ;8BC18C|C90080  |      ;
                       BCS +                                ;8BC18F|B003    |8BC194;
                       JMP.W CODE_FL_8BC1B9                 ;8BC191|4CB9C1  |8BC1B9;
 
                     + JSL.L CODE_FL_89A509                 ;8BC194|2209A589|89A509;
                       RTL                                  ;8BC198|6B      |      ;
                       LDA.L $7ED5F3                        ;8BC199|AFF3D57E|7ED5F3;
                       CLC                                  ;8BC19D|18      |      ;
                       ADC.W #$FD00                         ;8BC19E|6900FD  |      ;
                       STA.L $7ED5F3                        ;8BC1A1|8FF3D57E|7ED5F3;
                       CMP.W #$F000                         ;8BC1A5|C900F0  |      ;
                       BCS +                                ;8BC1A8|B003    |8BC1AD;
                       JMP.W CODE_FL_8BC1B9                 ;8BC1AA|4CB9C1  |8BC1B9;
 
                     + LDA.W #$0000                         ;8BC1AD|A90000  |      ;
                       STA.L $7ED5F3                        ;8BC1B0|8FF3D57E|7ED5F3;
                       JSL.L CODE_FL_89A509                 ;8BC1B4|2209A589|89A509;
                       RTL                                  ;8BC1B8|6B      |      ;
 
       CODE_FL_8BC1B9:
                       LDA.W #$8900                         ;8BC1B9|A90089  |      ;
                       STA.B $D6                            ;8BC1BC|85D6    |0000D6;
                       LDA.W #$8900                         ;8BC1BE|A90089  |      ;
                       STA.B $D5                            ;8BC1C1|85D5    |0000D5;
                       LDA.W #$0044                         ;8BC1C3|A94400  |      ;
                       STA.B $D3                            ;8BC1C6|85D3    |0000D3;
                       LDA.L $7ED5F5                        ;8BC1C8|AFF5D57E|7ED5F5;
                       SEC                                  ;8BC1CC|38      |      ;
                       SBC.L $7ED250                        ;8BC1CD|EF50D27E|7ED250;
                       STA.B $00                            ;8BC1D1|8500    |000000;
                       LDX.W #$002E                         ;8BC1D3|A22E00  |      ;
 
                     - LDA.L $7ED627,X                      ;8BC1D6|BF27D67E|7ED627;
                       BNE +                                ;8BC1DA|D02E    |8BC20A;
                       SEP #$20                             ;8BC1DC|E220    |      ;
                       JSL.L CODE_FL_8481D6                 ;8BC1DE|22D68184|8481D6;
                       CMP.L $7ED5F4                        ;8BC1E2|CFF4D57E|7ED5F4;
                       BCS +                                ;8BC1E6|B022    |8BC20A;
                       REP #$20                             ;8BC1E8|C220    |      ;
                       LDA.W #$0001                         ;8BC1EA|A90100  |      ;
                       STA.L $7ED627,X                      ;8BC1ED|9F27D67E|7ED627;
                       JSL.L CODE_FL_8481D6                 ;8BC1F1|22D68184|8481D6;
                       AND.W #$007F                         ;8BC1F5|297F00  |      ;
                       STA.L $7ED5F7,X                      ;8BC1F8|9FF7D57E|7ED5F7;
                       LSR A                                ;8BC1FC|4A      |      ;
                       CLC                                  ;8BC1FD|18      |      ;
                       ADC.L $7ED5F7,X                      ;8BC1FE|7FF7D57E|7ED5F7;
                       CLC                                  ;8BC202|18      |      ;
                       SBC.W #$0060                         ;8BC203|E96000  |      ;
                       STA.L $7ED5F7,X                      ;8BC206|9FF7D57E|7ED5F7;
 
                     + REP #$20                             ;8BC20A|C220    |      ;
                       LDA.L $7ED627,X                      ;8BC20C|BF27D67E|7ED627;
                       BEQ +                                ;8BC210|F037    |8BC249;
                       CLC                                  ;8BC212|18      |      ;
                       ADC.W #$0008                         ;8BC213|690800  |      ;
                       CMP.W #$0080                         ;8BC216|C98000  |      ;
                       BCC ++                               ;8BC219|9009    |8BC224;
                       LDA.W #$0000                         ;8BC21B|A90000  |      ;
                       STA.L $7ED627,X                      ;8BC21E|9F27D67E|7ED627;
                       BRA +                                ;8BC222|8025    |8BC249;
 
                    ++ STA.L $7ED627,X                      ;8BC224|9F27D67E|7ED627;
                       LDA.L $7ED5F7,X                      ;8BC228|BFF7D57E|7ED5F7;
                       CLC                                  ;8BC22C|18      |      ;
                       ADC.W #$0004                         ;8BC22D|690400  |      ;
                       STA.L $7ED5F7,X                      ;8BC230|9FF7D57E|7ED5F7;
                       LDA.L $7ED5F7,X                      ;8BC234|BFF7D57E|7ED5F7;
                       CLC                                  ;8BC238|18      |      ;
                       ADC.B $00                            ;8BC239|6500    |000000;
                       STA.B $CF                            ;8BC23B|85CF    |0000CF;
                       LDA.L $7ED627,X                      ;8BC23D|BF27D67E|7ED627;
                       STA.B $D1                            ;8BC241|85D1    |0000D1;
                       PHX                                  ;8BC243|DA      |      ;
                       JSL.L CODE_FL_80BBAF                 ;8BC244|22AFBB80|80BBAF;
                       PLX                                  ;8BC248|FA      |      ;
 
                     + DEX                                  ;8BC249|CA      |      ;
                       DEX                                  ;8BC24A|CA      |      ;
                       BPL -                                ;8BC24B|1089    |8BC1D6;
                       RTL                                  ;8BC24D|6B      |      ;
                       PHP                                  ;8BC24E|08      |      ;
                       REP #$30                             ;8BC24F|C230    |      ;
                       PHB                                  ;8BC251|8B      |      ;
                       PHK                                  ;8BC252|4B      |      ;
                       PLB                                  ;8BC253|AB      |      ;
                       LDA.B $A9                            ;8BC254|A5A9    |0000A9;
                       AND.W #$000F                         ;8BC256|290F00  |      ;
                       ASL A                                ;8BC259|0A      |      ;
                       TAX                                  ;8BC25A|AA      |      ;
                       JSR.W (DATA8_8BC261,X)               ;8BC25B|FC61C2  |8BC261;
                       PLB                                  ;8BC25E|AB      |      ;
                       PLP                                  ;8BC25F|28      |      ;
                       RTL                                  ;8BC260|6B      |      ;
 
         DATA8_8BC261:
                       db $81,$C2,$87,$C2,$8D,$C2,$93,$C2   ;8BC261|        |      ;
                       db $99,$C2,$9F,$C2,$A5,$C2,$AB,$C2   ;8BC269|        |      ;
                       db $B1,$C2,$B7,$C2,$BD,$C2,$C3,$C2   ;8BC271|        |      ;
                       db $C9,$C2,$CF,$C2,$D5,$C2,$D5,$C2   ;8BC279|        |      ;
                       LDX.W #$0082                         ;8BC281|A28200  |      ;
                       JMP.W CODE_JP_8BC2F3                 ;8BC284|4CF3C2  |8BC2F3;
                       LDX.W #$00A2                         ;8BC287|A2A200  |      ;
                       JMP.W CODE_JP_8BC2F3                 ;8BC28A|4CF3C2  |8BC2F3;
                       LDX.W #$00C2                         ;8BC28D|A2C200  |      ;
                       JMP.W CODE_JP_8BC2F3                 ;8BC290|4CF3C2  |8BC2F3;
                       LDX.W #$00E2                         ;8BC293|A2E200  |      ;
                       JMP.W CODE_JP_8BC2F3                 ;8BC296|4CF3C2  |8BC2F3;
                       LDX.W #$0182                         ;8BC299|A28201  |      ;
                       JMP.W CODE_JP_8BC2F3                 ;8BC29C|4CF3C2  |8BC2F3;
                       LDX.W #$0000                         ;8BC29F|A20000  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2A2|4CD6C2  |8BC2D6;
                       LDX.W #$0040                         ;8BC2A5|A24000  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2A8|4CD6C2  |8BC2D6;
                       LDX.W #$0080                         ;8BC2AB|A28000  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2AE|4CD6C2  |8BC2D6;
                       LDX.W #$00C0                         ;8BC2B1|A2C000  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2B4|4CD6C2  |8BC2D6;
                       LDX.W #$0100                         ;8BC2B7|A20001  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2BA|4CD6C2  |8BC2D6;
                       LDX.W #$0140                         ;8BC2BD|A24001  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2C0|4CD6C2  |8BC2D6;
                       LDX.W #$0180                         ;8BC2C3|A28001  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2C6|4CD6C2  |8BC2D6;
                       LDX.W #$01C0                         ;8BC2C9|A2C001  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2CC|4CD6C2  |8BC2D6;
                       LDX.W #$0200                         ;8BC2CF|A20002  |      ;
                       JMP.W CODE_JP_8BC2D6                 ;8BC2D2|4CD6C2  |8BC2D6;
                       RTS                                  ;8BC2D5|60      |      ;
 
       CODE_JP_8BC2D6:
                       LDY.W #$0010                         ;8BC2D6|A01000  |      ;
 
                     - LDA.L $7F8882,X                      ;8BC2D9|BF82887F|7F8882;
                       STA.B $02                            ;8BC2DD|8502    |000002;
                       LDA.L $7E4C1E,X                      ;8BC2DF|BF1E4C7E|7E4C1E;
                       JSL.L CODE_FL_80B32C                 ;8BC2E3|222CB380|80B32C;
                       STA.L $7E4C1E,X                      ;8BC2E7|9F1E4C7E|7E4C1E;
                       DEX                                  ;8BC2EB|CA      |      ;
                       DEX                                  ;8BC2EC|CA      |      ;
                       DEX                                  ;8BC2ED|CA      |      ;
                       DEX                                  ;8BC2EE|CA      |      ;
                       DEY                                  ;8BC2EF|88      |      ;
                       BNE -                                ;8BC2F0|D0E7    |8BC2D9;
                       RTS                                  ;8BC2F2|60      |      ;
 
       CODE_JP_8BC2F3:
                       LDY.W #$000F                         ;8BC2F3|A00F00  |      ;
 
                     - LDA.L $7F8480,X                      ;8BC2F6|BF80847F|7F8480;
                       STA.B $02                            ;8BC2FA|8502    |000002;
                       LDA.L $7E86F6,X                      ;8BC2FC|BFF6867E|7E86F6;
                       JSL.L CODE_FL_80B32C                 ;8BC300|222CB380|80B32C;
                       STA.L $7E86F6,X                      ;8BC304|9FF6867E|7E86F6;
                       INX                                  ;8BC308|E8      |      ;
                       INX                                  ;8BC309|E8      |      ;
                       DEY                                  ;8BC30A|88      |      ;
                       BNE -                                ;8BC30B|D0E9    |8BC2F6;
                       RTS                                  ;8BC30D|60      |      ;
 
       CODE_FL_8BC30E:
                       PHP                                  ;8BC30E|08      |      ;
                       REP #$30                             ;8BC30F|C230    |      ;
                       PHB                                  ;8BC311|8B      |      ;
                       PHK                                  ;8BC312|4B      |      ;
                       PLB                                  ;8BC313|AB      |      ;
                       LDA.B $A9                            ;8BC314|A5A9    |0000A9;
                       AND.W #$000F                         ;8BC316|290F00  |      ;
                       ASL A                                ;8BC319|0A      |      ;
                       TAX                                  ;8BC31A|AA      |      ;
                       JSR.W (DATA8_8BC321,X)               ;8BC31B|FC21C3  |8BC321;
                       PLB                                  ;8BC31E|AB      |      ;
                       PLP                                  ;8BC31F|28      |      ;
                       RTL                                  ;8BC320|6B      |      ;
 
         DATA8_8BC321:
                       db $41,$C3,$47,$C3,$4D,$C3,$53,$C3   ;8BC321|        |      ;
                       db $59,$C3,$5F,$C3,$65,$C3,$6B,$C3   ;8BC329|        |      ;
                       db $71,$C3,$77,$C3,$7D,$C3,$83,$C3   ;8BC331|        |      ;
                       db $89,$C3,$8F,$C3,$95,$C3,$95,$C3   ;8BC339|        |      ;
                       LDX.W #$0082                         ;8BC341|A28200  |      ;
                       JMP.W CODE_JP_8BC3B3                 ;8BC344|4CB3C3  |8BC3B3;
                       LDX.W #$00A2                         ;8BC347|A2A200  |      ;
                       JMP.W CODE_JP_8BC3B3                 ;8BC34A|4CB3C3  |8BC3B3;
                       LDX.W #$00C2                         ;8BC34D|A2C200  |      ;
                       JMP.W CODE_JP_8BC3B3                 ;8BC350|4CB3C3  |8BC3B3;
                       LDX.W #$00E2                         ;8BC353|A2E200  |      ;
                       JMP.W CODE_JP_8BC3B3                 ;8BC356|4CB3C3  |8BC3B3;
                       LDX.W #$0182                         ;8BC359|A28201  |      ;
                       JMP.W CODE_JP_8BC3B3                 ;8BC35C|4CB3C3  |8BC3B3;
                       LDX.W #$0000                         ;8BC35F|A20000  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC362|4C96C3  |8BC396;
                       LDX.W #$0040                         ;8BC365|A24000  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC368|4C96C3  |8BC396;
                       LDX.W #$0080                         ;8BC36B|A28000  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC36E|4C96C3  |8BC396;
                       LDX.W #$00C0                         ;8BC371|A2C000  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC374|4C96C3  |8BC396;
                       LDX.W #$0100                         ;8BC377|A20001  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC37A|4C96C3  |8BC396;
                       LDX.W #$0140                         ;8BC37D|A24001  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC380|4C96C3  |8BC396;
                       LDX.W #$0180                         ;8BC383|A28001  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC386|4C96C3  |8BC396;
                       LDX.W #$01C0                         ;8BC389|A2C001  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC38C|4C96C3  |8BC396;
                       LDX.W #$0200                         ;8BC38F|A20002  |      ;
                       JMP.W CODE_JP_8BC396                 ;8BC392|4C96C3  |8BC396;
                       RTS                                  ;8BC395|60      |      ;
 
       CODE_JP_8BC396:
                       LDY.W #$0010                         ;8BC396|A01000  |      ;
 
                     - LDA.L $7F8C82,X                      ;8BC399|BF828C7F|7F8C82;
                       STA.B $02                            ;8BC39D|8502    |000002;
                       LDA.L $7E4C1E,X                      ;8BC39F|BF1E4C7E|7E4C1E;
                       JSL.L CODE_FL_80B32C                 ;8BC3A3|222CB380|80B32C;
                       STA.L $7E4C1E,X                      ;8BC3A7|9F1E4C7E|7E4C1E;
                       DEX                                  ;8BC3AB|CA      |      ;
                       DEX                                  ;8BC3AC|CA      |      ;
                       DEX                                  ;8BC3AD|CA      |      ;
                       DEX                                  ;8BC3AE|CA      |      ;
                       DEY                                  ;8BC3AF|88      |      ;
                       BNE -                                ;8BC3B0|D0E7    |8BC399;
                       RTS                                  ;8BC3B2|60      |      ;
 
       CODE_JP_8BC3B3:
                       LDY.W #$000F                         ;8BC3B3|A00F00  |      ;
 
                     - LDA.L $7F8680,X                      ;8BC3B6|BF80867F|7F8680;
                       STA.B $02                            ;8BC3BA|8502    |000002;
                       LDA.L $7E86F6,X                      ;8BC3BC|BFF6867E|7E86F6;
                       JSL.L CODE_FL_80B32C                 ;8BC3C0|222CB380|80B32C;
                       STA.L $7E86F6,X                      ;8BC3C4|9FF6867E|7E86F6;
                       INX                                  ;8BC3C8|E8      |      ;
                       INX                                  ;8BC3C9|E8      |      ;
                       DEY                                  ;8BC3CA|88      |      ;
                       BNE -                                ;8BC3CB|D0E9    |8BC3B6;
                       RTS                                  ;8BC3CD|60      |      ;
 
       CODE_FL_8BC3CE:
                       PHP                                  ;8BC3CE|08      |      ;
                       REP #$30                             ;8BC3CF|C230    |      ;
                       JSL.L CODE_FL_84ADF2                 ;8BC3D1|22F2AD84|84ADF2;
                       db $89,$B8,$99                       ;8BC3D5|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BC3D8|22FF9384|8493FF;
                       PLP                                  ;8BC3DC|28      |      ;
                       RTL                                  ;8BC3DD|6B      |      ;
 
       CODE_FL_8BC3DE:
                       PHP                                  ;8BC3DE|08      |      ;
                       REP #$30                             ;8BC3DF|C230    |      ;
                       PHA                                  ;8BC3E1|48      |      ;
                       PHX                                  ;8BC3E2|DA      |      ;
                       PHY                                  ;8BC3E3|5A      |      ;
                       CMP.W #$000F                         ;8BC3E4|C90F00  |      ;
                       BCS +                                ;8BC3E7|B061    |8BC44A;
                       TAX                                  ;8BC3E9|AA      |      ;
                       CMP.W #$0009                         ;8BC3EA|C90900  |      ;
                       BEQ ++                               ;8BC3ED|F007    |8BC3F6;
                       CMP.W #$000A                         ;8BC3EF|C90A00  |      ;
                       BEQ +++                              ;8BC3F2|F00A    |8BC3FE;
                       BRA ++++                             ;8BC3F4|801B    |8BC411;
 
                    ++ LDA.L $001A80                        ;8BC3F6|AF801A00|001A80;
                       BEQ ++                               ;8BC3FA|F010    |8BC40C;
                       BRA +++++                            ;8BC3FC|800B    |8BC409;
 
                   +++ LDA.L $001A80                        ;8BC3FE|AF801A00|001A80;
                       CMP.W #$0001                         ;8BC402|C90100  |      ;
                       BEQ ++                               ;8BC405|F005    |8BC40C;
                       BRA +++++                            ;8BC407|8000    |8BC409;
 
                 +++++ TXA                                  ;8BC409|8A      |      ;
                       BRA ++++                             ;8BC40A|8005    |8BC411;
 
                    ++ LDA.W #$000B                         ;8BC40C|A90B00  |      ;
                       BRA ++++                             ;8BC40F|8000    |8BC411;
 
                  ++++ ASL A                                ;8BC411|0A      |      ;
                       TAX                                  ;8BC412|AA      |      ;
                       LDA.L DATA8_8BC44F,X                 ;8BC413|BF4FC48B|8BC44F;
                       STA.B $D3                            ;8BC417|85D3    |0000D3;
                       STZ.B $D1                            ;8BC419|64D1    |0000D1;
                       CPX.W #$001C                         ;8BC41B|E01C00  |      ;
                       BNE ++                               ;8BC41E|D005    |8BC425;
                       LDA.W #$0040                         ;8BC420|A94000  |      ;
                       STA.B $D1                            ;8BC423|85D1    |0000D1;
 
                    ++ LDA.W #$0010                         ;8BC425|A91000  |      ;
                       STA.B $CF                            ;8BC428|85CF    |0000CF;
                       JSL.L Move_TitleScreenLittleYoshi    ;8BC42A|22DC8084|8480DC;
                       CLC                                  ;8BC42E|18      |      ;
                       ADC.W #$0020                         ;8BC42F|692000  |      ;
                       CLC                                  ;8BC432|18      |      ;
                       ADC.L $7ED272                        ;8BC433|6F72D27E|7ED272;
                       CLC                                  ;8BC437|18      |      ;
                       ADC.B $D1                            ;8BC438|65D1    |0000D1;
                       STA.B $D1                            ;8BC43A|85D1    |0000D1;
                       LDA.W #$8900                         ;8BC43C|A90089  |      ;
                       STA.B $D6                            ;8BC43F|85D6    |0000D6;
                       LDA.W #$8900                         ;8BC441|A90089  |      ;
                       STA.B $D5                            ;8BC444|85D5    |0000D5;
                       JSL.L CODE_FL_80BBAF                 ;8BC446|22AFBB80|80BBAF;
 
                     + PLY                                  ;8BC44A|7A      |      ;
                       PLX                                  ;8BC44B|FA      |      ;
                       PLA                                  ;8BC44C|68      |      ;
                       PLP                                  ;8BC44D|28      |      ;
                       RTL                                  ;8BC44E|6B      |      ;
 
         DATA8_8BC44F:
                       db $48,$00,$49,$00,$4A,$00,$4B,$00   ;8BC44F|        |      ;
                       db $4C,$00,$4D,$00,$4E,$00,$4F,$00   ;8BC457|        |      ;
                       db $50,$00,$50,$00,$50,$00,$51,$00   ;8BC45F|        |      ;
                       db $47,$00,$52,$00,$52,$00           ;8BC467|        |      ;
 
       CODE_FL_8BC46D:
                       LDA.B $BB                            ;8BC46D|A5BB    |0000BB;
                       BIT.W #$0200                         ;8BC46F|890002  |      ;
                       BEQ +                                ;8BC472|F023    |8BC497;
                       JSL.L CODE_FL_8BF14A                 ;8BC474|224AF18B|8BF14A;
                       LDA.L $001A80                        ;8BC478|AF801A00|001A80;
                       CMP.W #$0002                         ;8BC47C|C90200  |      ;
                       BEQ ++                               ;8BC47F|F002    |8BC483;
                       BPL +++                              ;8BC481|1007    |8BC48A;
 
                    ++ CMP.W #$0000                         ;8BC483|C90000  |      ;
                       BEQ +++                              ;8BC486|F002    |8BC48A;
                       BPL ++                               ;8BC488|1005    |8BC48F;
 
                   +++ LDA.W #$0002                         ;8BC48A|A90200  |      ;
                       BRA +++                              ;8BC48D|8001    |8BC490;
 
                    ++ DEC A                                ;8BC48F|3A      |      ;
 
                   +++ STA.L $001A80                        ;8BC490|8F801A00|001A80;
                       JSR.W CODE_FN_8BC4F1                 ;8BC494|20F1C4  |8BC4F1;
 
                     + LDA.B $BB                            ;8BC497|A5BB    |0000BB;
                       BIT.W #$0100                         ;8BC499|890001  |      ;
                       BEQ +                                ;8BC49C|F01F    |8BC4BD;
                       JSL.L CODE_FL_8BF14A                 ;8BC49E|224AF18B|8BF14A;
                       LDA.L $001A80                        ;8BC4A2|AF801A00|001A80;
                       CMP.W #$0000                         ;8BC4A6|C90000  |      ;
                       BMI ++                               ;8BC4A9|3005    |8BC4B0;
                       CMP.W #$0002                         ;8BC4AB|C90200  |      ;
                       BMI +++                              ;8BC4AE|3005    |8BC4B5;
 
                    ++ LDA.W #$0000                         ;8BC4B0|A90000  |      ;
                       BRA ++                               ;8BC4B3|8001    |8BC4B6;
 
                   +++ INC A                                ;8BC4B5|1A      |      ;
 
                    ++ STA.L $001A80                        ;8BC4B6|8F801A00|001A80;
                       JSR.W CODE_FN_8BC4F1                 ;8BC4BA|20F1C4  |8BC4F1;
 
                     + LDA.L $001A80                        ;8BC4BD|AF801A00|001A80;
                       TAX                                  ;8BC4C1|AA      |      ;
                       LDA.L DATA8_8BC4ED,X                 ;8BC4C2|BFEDC48B|8BC4ED;
                       AND.W #$00FF                         ;8BC4C6|29FF00  |      ;
                       STA.B $CF                            ;8BC4C9|85CF    |0000CF;
                       LDA.W #$00B1                         ;8BC4CB|A9B100  |      ;
                       STA.B $D1                            ;8BC4CE|85D1    |0000D1;
                       LDA.W #$8100                         ;8BC4D0|A90081  |      ;
                       STA.B $D6                            ;8BC4D3|85D6    |0000D6;
                       LDA.W #$8000                         ;8BC4D5|A90080  |      ;
                       STA.B $D5                            ;8BC4D8|85D5    |0000D5;
                       LDA.B $A9                            ;8BC4DA|A5A9    |0000A9;
                       LSR A                                ;8BC4DC|4A      |      ;
                       LSR A                                ;8BC4DD|4A      |      ;
                       LSR A                                ;8BC4DE|4A      |      ;
                       AND.W #$0001                         ;8BC4DF|290100  |      ;
                       CLC                                  ;8BC4E2|18      |      ;
                       ADC.W #$0328                         ;8BC4E3|692803  |      ;
                       STA.B $D3                            ;8BC4E6|85D3    |0000D3;
                       JSL.L CODE_FL_80BBAF                 ;8BC4E8|22AFBB80|80BBAF;
                       RTL                                  ;8BC4EC|6B      |      ;
 
         DATA8_8BC4ED:
                       db $48,$80,$B8,$B8                   ;8BC4ED|        |      ;
 
       CODE_FN_8BC4F1:
                       LDA.L $001A80                        ;8BC4F1|AF801A00|001A80;
                       JSL.L CODE_FL_8B955D                 ;8BC4F5|225D958B|8B955D;
                       PHB                                  ;8BC4F9|8B      |      ;
                       PHK                                  ;8BC4FA|4B      |      ;
                       PLB                                  ;8BC4FB|AB      |      ;
                       LDY.W #$C506                         ;8BC4FC|A006C5  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BC4FF|22CAA080|80A0CA;
                       PLB                                  ;8BC503|AB      |      ;
                       BRA +                                ;8BC504|8008    |8BC50E;
                       db $C0,$23,$7E,$40,$04,$80,$E0,$79   ;8BC506|        |      ;
 
                     + LDA.L $001A80                        ;8BC50E|AF801A00|001A80;
                       JSL.L CODE_FL_8B950C                 ;8BC512|220C958B|8B950C;
                       RTS                                  ;8BC516|60      |      ;
                       LDA.L $0000A9                        ;8BC517|AFA90000|0000A9;
                       AND.W #$0008                         ;8BC51B|290800  |      ;
                       BEQ +                                ;8BC51E|F01D    |8BC53D;
                       LDA.W #$0073                         ;8BC520|A97300  |      ;
                       STA.B $D3                            ;8BC523|85D3    |0000D3;
                       LDA.W #$0094                         ;8BC525|A99400  |      ;
                       STA.B $CF                            ;8BC528|85CF    |0000CF;
                       LDA.W #$00C8                         ;8BC52A|A9C800  |      ;
                       STA.B $D1                            ;8BC52D|85D1    |0000D1;
                       LDA.W #$8900                         ;8BC52F|A90089  |      ;
                       STA.B $D6                            ;8BC532|85D6    |0000D6;
                       LDA.W #$8900                         ;8BC534|A90089  |      ;
                       STA.B $D5                            ;8BC537|85D5    |0000D5;
                       JSL.L CODE_FL_80BBAF                 ;8BC539|22AFBB80|80BBAF;
 
                     + RTL                                  ;8BC53D|6B      |      ;
                       db $A5,$96,$48,$A9,$2F,$D3,$85,$96   ;8BC53E|        |000096;
                       db $22,$50,$A4,$89,$22,$2C,$A6,$89   ;8BC546|        |89A450;
                       db $9A,$C5,$8B,$68,$85,$96,$6B       ;8BC54E|        |      ;
                       LDA.B $96                            ;8BC555|A596    |000096;
                       PHA                                  ;8BC557|48      |      ;
                       LDA.W #$D32F                         ;8BC558|A92FD3  |      ;
                       STA.B $96                            ;8BC55B|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC55D|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC561|222CA689|89A62C;
                       db $D5,$C5,$8B                       ;8BC565|        |      ;
                       PLA                                  ;8BC568|68      |      ;
                       STA.B $96                            ;8BC569|8596    |000096;
                       RTL                                  ;8BC56B|6B      |      ;
                       LDA.B $96                            ;8BC56C|A596    |000096;
                       PHA                                  ;8BC56E|48      |      ;
                       LDA.W #$D32F                         ;8BC56F|A92FD3  |      ;
                       STA.B $96                            ;8BC572|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC574|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC578|222CA689|89A62C;
                       db $B0,$C6,$8B                       ;8BC57C|        |      ;
                       PLA                                  ;8BC57F|68      |      ;
                       STA.B $96                            ;8BC580|8596    |000096;
                       RTL                                  ;8BC582|6B      |      ;
                       LDA.B $96                            ;8BC583|A596    |000096;
                       PHA                                  ;8BC585|48      |      ;
                       LDA.W #$D32F                         ;8BC586|A92FD3  |      ;
                       STA.B $96                            ;8BC589|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC58B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC58F|222CA689|89A62C;
                       db $10,$C7,$8B                       ;8BC593|        |      ;
                       PLA                                  ;8BC596|68      |      ;
                       STA.B $96                            ;8BC597|8596    |000096;
                       RTL                                  ;8BC599|6B      |      ;
                       db $01,$05,$C7,$0D,$00,$FF,$26,$A5   ;8BC59A|        |      ;
                       db $89,$C4,$C5,$01,$05,$C7,$17,$00   ;8BC5A2|        |      ;
                       db $01,$05,$C7,$0E,$00,$03,$05,$C7   ;8BC5AA|        |      ;
                       db $0F,$00,$01,$05,$C7,$0E,$00,$01   ;8BC5B2|        |      ;
                       db $05,$C7,$17,$00,$FF,$D6,$A4,$89   ;8BC5BA|        |      ;
                       db $9A,$C5                           ;8BC5C2|        |      ;
                       JSL.L CODE_FL_8481D6                 ;8BC5C4|22D68184|8481D6;
                       CMP.W #$0004                         ;8BC5C8|C90400  |      ;
                       BCC +                                ;8BC5CB|9003    |8BC5D0;
                       JMP.W CODE_JP_8BC705                 ;8BC5CD|4C05C7  |8BC705;
 
                     + JSL.L CODE_FL_89A509                 ;8BC5D0|2209A589|89A509;
                       RTL                                  ;8BC5D4|6B      |      ;
                       db $01,$0D,$C6,$0D,$00,$FF,$26,$A5   ;8BC5D5|        |      ;
                       db $89,$FF,$C5,$01,$0D,$C6,$17,$00   ;8BC5DD|        |      ;
                       db $01,$0D,$C6,$0E,$00,$03,$0D,$C6   ;8BC5E5|        |      ;
                       db $0F,$00,$01,$0D,$C6,$0E,$00,$01   ;8BC5ED|        |      ;
                       db $0D,$C6,$17,$00,$FF,$D6,$A4,$89   ;8BC5F5|        |      ;
                       db $D5,$C5                           ;8BC5FD|        |      ;
                       JSL.L CODE_FL_8481D6                 ;8BC5FF|22D68184|8481D6;
                       CMP.W #$0004                         ;8BC603|C90400  |      ;
                       BCS CODE_JP_8BC60D                   ;8BC606|B005    |8BC60D;
                       JSL.L CODE_FL_89A509                 ;8BC608|2209A589|89A509;
                       RTL                                  ;8BC60C|6B      |      ;
 
       CODE_JP_8BC60D:
                       LDA.L $7ED3A1                        ;8BC60D|AFA1D37E|7ED3A1;
                       JSL.L CODE_FL_8BC3DE                 ;8BC611|22DEC38B|8BC3DE;
                       JMP.W CODE_JP_8BCBD3                 ;8BC615|4CD3CB  |8BCBD3;
                       db $04,$05,$C7,$0C,$00,$04,$05,$C7   ;8BC618|        |      ;
                       db $1A,$00,$01,$05,$C7,$0D,$00,$FF   ;8BC620|        |      ;
                       db $D6,$A4,$89,$B0,$C6               ;8BC628|        |      ;
                       LDA.B $96                            ;8BC62D|A596    |000096;
                       PHA                                  ;8BC62F|48      |      ;
                       LDA.W #$D32F                         ;8BC630|A92FD3  |      ;
                       STA.B $96                            ;8BC633|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC635|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC639|222CA689|89A62C;
                       db $18,$C6,$8B                       ;8BC63D|        |      ;
                       PLA                                  ;8BC640|68      |      ;
                       STA.B $96                            ;8BC641|8596    |000096;
                       RTL                                  ;8BC643|6B      |      ;
                       db $02,$05,$C7,$18,$00,$FF,$66,$F1   ;8BC644|        |      ;
                       db $8B,$04,$05,$C7,$10,$00,$02,$05   ;8BC64C|        |      ;
                       db $C7,$18,$00,$04,$05,$C7,$0D,$00   ;8BC654|        |      ;
                       db $02,$05,$C7,$18,$00,$04,$05,$C7   ;8BC65C|        |      ;
                       db $10,$00,$02,$05,$C7,$18,$00,$01   ;8BC664|        |      ;
                       db $05,$C7,$0D,$00,$01,$05,$C7,$0E   ;8BC66C|        |      ;
                       db $00,$01,$05,$C7,$0F,$00,$04,$05   ;8BC674|        |      ;
                       db $C7,$11,$00,$02,$05,$C7,$16,$00   ;8BC67C|        |      ;
                       db $04,$05,$C7,$12,$00,$02,$05,$C7   ;8BC684|        |      ;
                       db $16,$00,$40,$05,$C7,$11,$00,$FF   ;8BC68C|        |      ;
                       db $D6,$A4,$89,$9A,$C5               ;8BC694|        |      ;
                       LDA.B $96                            ;8BC699|A596    |000096;
                       PHA                                  ;8BC69B|48      |      ;
                       LDA.W #$D32F                         ;8BC69C|A92FD3  |      ;
                       STA.B $96                            ;8BC69F|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC6A1|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC6A5|222CA689|89A62C;
                       db $44,$C6,$8B                       ;8BC6A9|        |      ;
                       PLA                                  ;8BC6AC|68      |      ;
                       STA.B $96                            ;8BC6AD|8596    |000096;
                       RTL                                  ;8BC6AF|6B      |      ;
                       db $02,$05,$C7,$18,$00,$FF,$5F,$F1   ;8BC6B0|        |      ;
                       db $8B,$04,$05,$C7,$10,$00,$02,$05   ;8BC6B8|        |      ;
                       db $C7,$18,$00,$04,$05,$C7,$0D,$00   ;8BC6C0|        |      ;
                       db $02,$05,$C7,$18,$00,$04,$05,$C7   ;8BC6C8|        |      ;
                       db $10,$00,$02,$05,$C7,$18,$00,$01   ;8BC6D0|        |      ;
                       db $05,$C7,$0D,$00,$01,$05,$C7,$0E   ;8BC6D8|        |      ;
                       db $00,$01,$05,$C7,$0F,$00,$04,$05   ;8BC6E0|        |      ;
                       db $C7,$11,$00,$02,$05,$C7,$16,$00   ;8BC6E8|        |      ;
                       db $04,$05,$C7,$12,$00,$02,$05,$C7   ;8BC6F0|        |      ;
                       db $16,$00,$40,$05,$C7,$15,$00,$FF   ;8BC6F8|        |      ;
                       db $D6,$A4,$89,$9A,$C5               ;8BC700|        |      ;
 
       CODE_JP_8BC705:
                       LDA.L $7ED3A3                        ;8BC705|AFA3D37E|7ED3A3;
                       JSL.L CODE_FL_8BC3DE                 ;8BC709|22DEC38B|8BC3DE;
                       JMP.W CODE_JP_8BCBD3                 ;8BC70D|4CD3CB  |8BCBD3;
                       db $03,$B8,$C7,$1A,$00,$10,$B8,$C7   ;8BC710|        |      ;
                       db $0C,$00,$FF,$9E,$F1,$8B,$01,$87   ;8BC718|        |      ;
                       db $C7,$0B,$00,$01,$87,$C7,$00,$00   ;8BC720|        |      ;
                       db $01,$87,$C7,$01,$00,$01,$87,$C7   ;8BC728|        |      ;
                       db $02,$00,$01,$87,$C7,$03,$00,$01   ;8BC730|        |      ;
                       db $87,$C7,$04,$00,$01,$87,$C7,$05   ;8BC738|        |      ;
                       db $00,$01,$87,$C7,$06,$00,$01,$87   ;8BC740|        |      ;
                       db $C7,$07,$00,$01,$87,$C7,$08,$00   ;8BC748|        |      ;
                       db $01,$87,$C7,$09,$00,$01,$87,$C7   ;8BC750|        |      ;
                       db $0A,$00,$FF,$D6,$A4,$89,$1E,$C7   ;8BC758|        |      ;
                       db $FF,$AC,$F1,$8B,$48,$98,$C7,$1F   ;8BC760|        |      ;
                       db $00,$FF,$6D,$A5,$89,$40,$D3,$7E   ;8BC768|        |      ;
                       db $01,$00,$05,$A5,$C7,$2F,$00,$0C   ;8BC770|        |      ;
                       db $A8,$C7,$0C,$00,$03,$A8,$C7,$1A   ;8BC778|        |      ;
                       db $00,$FF,$D6,$A4,$89,$D5,$C5       ;8BC780|        |      ;
                       LDA.L $7ED344                        ;8BC787|AF44D37E|7ED344;
                       CMP.W #$FF48                         ;8BC78B|C948FF  |      ;
                       BPL +                                ;8BC78E|1008    |8BC798;
                       JSL.L CODE_FL_89A62C                 ;8BC790|222CA689|89A62C;
                       db $60,$C7,$8B                       ;8BC794|        |      ;
                       RTL                                  ;8BC797|6B      |      ;
 
                     + LDA.L $7ED344                        ;8BC798|AF44D37E|7ED344;
                       DEC A                                ;8BC79C|3A      |      ;
                       STA.L $7ED344                        ;8BC79D|8F44D37E|7ED344;
                       JSL.L CODE_FL_8BE897                 ;8BC7A1|2297E88B|8BE897;
                       JMP.W CODE_JP_8BCBD3                 ;8BC7A5|4CD3CB  |8BCBD3;
                       LDY.W #$0005                         ;8BC7A8|A00500  |      ;
                       LDA.B [$96],Y                        ;8BC7AB|B796    |000096;
                       AND.W #$00FF                         ;8BC7AD|29FF00  |      ;
                       DEC A                                ;8BC7B0|3A      |      ;
                       JSL.L CODE_FL_8BD8F9                 ;8BC7B1|22F9D88B|8BD8F9;
                       JMP.W CODE_JP_8BCBD3                 ;8BC7B5|4CD3CB  |8BCBD3;
                       LDY.W #$0005                         ;8BC7B8|A00500  |      ;
                       LDA.B [$96],Y                        ;8BC7BB|B796    |000096;
                       AND.W #$00FF                         ;8BC7BD|29FF00  |      ;
                       DEC A                                ;8BC7C0|3A      |      ;
                       JSL.L CODE_FL_8BD869                 ;8BC7C1|2269D88B|8BD869;
                       JMP.W CODE_JP_8BCBD3                 ;8BC7C5|4CD3CB  |8BCBD3;
                       db $FF,$39,$C8,$8B,$03,$B8,$C7,$1A   ;8BC7C8|        |      ;
                       db $00,$10,$B8,$C7,$0C,$00,$FF,$9E   ;8BC7D0|        |      ;
                       db $F1,$8B,$01,$48,$C8,$0B,$00,$01   ;8BC7D8|        |      ;
                       db $48,$C8,$00,$00,$01,$48,$C8,$01   ;8BC7E0|        |      ;
                       db $00,$01,$48,$C8,$02,$00,$01,$48   ;8BC7E8|        |      ;
                       db $C8,$03,$00,$01,$48,$C8,$04,$00   ;8BC7F0|        |      ;
                       db $01,$48,$C8,$05,$00,$01,$48,$C8   ;8BC7F8|        |      ;
                       db $06,$00,$01,$48,$C8,$07,$00,$01   ;8BC800|        |      ;
                       db $48,$C8,$08,$00,$01,$48,$C8,$09   ;8BC808|        |      ;
                       db $00,$01,$48,$C8,$0A,$00,$FF,$D6   ;8BC810|        |      ;
                       db $A4,$89,$DA,$C7,$FF,$A5,$F1,$8B   ;8BC818|        |      ;
                       db $10,$A8,$C7,$0C,$00,$03,$A8,$C7   ;8BC820|        |      ;
                       db $1A,$00,$FF,$6D,$A5,$89,$40,$D3   ;8BC828|        |      ;
                       db $7E,$01,$00,$FF,$D6,$A4,$89,$9A   ;8BC830|        |      ;
                       db $C5                               ;8BC838|        |      ;
                       LDA.W #$0080                         ;8BC839|A98000  |      ;
                       STA.L $7ED358                        ;8BC83C|8F58D37E|7ED358;
                       LDA.W #$FFC0                         ;8BC840|A9C0FF  |      ;
                       STA.L $7ED35A                        ;8BC843|8F5AD37E|7ED35A;
                       RTL                                  ;8BC847|6B      |      ;
                       LDA.L $7ED358                        ;8BC848|AF58D37E|7ED358;
                       BEQ +                                ;8BC84C|F015    |8BC863;
                       DEC A                                ;8BC84E|3A      |      ;
                       STA.L $7ED358                        ;8BC84F|8F58D37E|7ED358;
                       LSR A                                ;8BC853|4A      |      ;
                       EOR.W #$FFFF                         ;8BC854|49FFFF  |      ;
                       INC A                                ;8BC857|1A      |      ;
                       STA.L $7ED35A                        ;8BC858|8F5AD37E|7ED35A;
                       JSL.L CODE_FL_8BE897                 ;8BC85C|2297E88B|8BE897;
                       JMP.W CODE_JP_8BCBD3                 ;8BC860|4CD3CB  |8BCBD3;
 
                     + JSL.L CODE_FL_89A62C                 ;8BC863|222CA689|89A62C;
                       db $1C,$C8,$8B                       ;8BC867|        |      ;
                       RTL                                  ;8BC86A|6B      |      ;
                       LDA.B $96                            ;8BC86B|A596    |000096;
                       PHA                                  ;8BC86D|48      |      ;
                       LDA.W #$D32F                         ;8BC86E|A92FD3  |      ;
                       STA.B $96                            ;8BC871|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC873|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC877|222CA689|89A62C;
                       db $C8,$C7,$8B                       ;8BC87B|        |      ;
                       PLA                                  ;8BC87E|68      |      ;
                       STA.B $96                            ;8BC87F|8596    |000096;
                       RTL                                  ;8BC881|6B      |      ;
                       db $03,$B8,$C7,$1A,$00,$10,$B8,$C7   ;8BC882|        |      ;
                       db $0C,$00,$FF,$9E,$F1,$8B,$01,$F8   ;8BC88A|        |      ;
                       db $C8,$0B,$00,$01,$F8,$C8,$00,$00   ;8BC892|        |      ;
                       db $01,$F8,$C8,$01,$00,$01,$F8,$C8   ;8BC89A|        |      ;
                       db $02,$00,$01,$F8,$C8,$03,$00,$01   ;8BC8A2|        |      ;
                       db $F8,$C8,$04,$00,$01,$F8,$C8,$05   ;8BC8AA|        |      ;
                       db $00,$01,$F8,$C8,$06,$00,$01,$F8   ;8BC8B2|        |      ;
                       db $C8,$07,$00,$01,$F8,$C8,$08,$00   ;8BC8BA|        |      ;
                       db $01,$F8,$C8,$09,$00,$01,$F8,$C8   ;8BC8C2|        |      ;
                       db $0A,$00,$FF,$D6,$A4,$89,$90,$C8   ;8BC8CA|        |      ;
                       db $FF,$A5,$F1,$8B,$05,$1D,$C9,$19   ;8BC8D2|        |      ;
                       db $00,$FF,$74,$F1,$8B,$3C,$19,$C9   ;8BC8DA|        |      ;
                       db $19,$00,$0C,$A8,$C7,$0C,$00,$FF   ;8BC8E2|        |      ;
                       db $6D,$A5,$89,$40,$D3,$7E,$01,$00   ;8BC8EA|        |      ;
                       db $FF,$D6,$A4,$89,$37,$C9           ;8BC8F2|        |      ;
                       LDA.L $7ED344                        ;8BC8F8|AF44D37E|7ED344;
                       CMP.W #$FF00                         ;8BC8FC|C900FF  |      ;
                       BPL +                                ;8BC8FF|1008    |8BC909;
                       JSL.L CODE_FL_89A62C                 ;8BC901|222CA689|89A62C;
                       db $D2,$C8,$8B                       ;8BC905|        |      ;
                       RTL                                  ;8BC908|6B      |      ;
 
                     + LDA.L $7ED344                        ;8BC909|AF44D37E|7ED344;
                       DEC A                                ;8BC90D|3A      |      ;
                       STA.L $7ED344                        ;8BC90E|8F44D37E|7ED344;
                       JSL.L CODE_FL_8BE897                 ;8BC912|2297E88B|8BE897;
                       JMP.W CODE_JP_8BCBD3                 ;8BC916|4CD3CB  |8BCBD3;
                       JSL.L CODE_FL_8BCC1B                 ;8BC919|221BCC8B|8BCC1B;
                       JMP.W CODE_JP_8BCBD3                 ;8BC91D|4CD3CB  |8BCBD3;
                       LDA.B $96                            ;8BC920|A596    |000096;
                       PHA                                  ;8BC922|48      |      ;
                       LDA.W #$D32F                         ;8BC923|A92FD3  |      ;
                       STA.B $96                            ;8BC926|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC928|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC92C|222CA689|89A62C;
                       db $82,$C8,$8B                       ;8BC930|        |      ;
                       PLA                                  ;8BC933|68      |      ;
                       STA.B $96                            ;8BC934|8596    |000096;
                       RTL                                  ;8BC936|6B      |      ;
                       db $01,$0D,$C6,$0C,$00,$FF,$26,$A5   ;8BC937|        |      ;
                       db $89,$61,$C9,$01,$0D,$C6,$1E,$00   ;8BC93F|        |      ;
                       db $01,$0D,$C6,$1C,$00,$03,$0D,$C6   ;8BC947|        |      ;
                       db $1D,$00,$01,$0D,$C6,$1C,$00,$01   ;8BC94F|        |      ;
                       db $0D,$C6,$1E,$00,$FF,$D6,$A4,$89   ;8BC957|        |      ;
                       db $37,$C9                           ;8BC95F|        |      ;
                       JSL.L CODE_FL_8481D6                 ;8BC961|22D68184|8481D6;
                       CMP.W #$0004                         ;8BC965|C90400  |      ;
                       BCC +                                ;8BC968|9003    |8BC96D;
                       JMP.W CODE_JP_8BC60D                 ;8BC96A|4C0DC6  |8BC60D;
 
                     + JSL.L CODE_FL_89A509                 ;8BC96D|2209A589|89A509;
                       RTL                                  ;8BC971|6B      |      ;
                       db $0C,$A8,$C7,$0C,$00,$01,$05,$C7   ;8BC972|        |      ;
                       db $0C,$00,$FF,$26,$A5,$89,$A1,$C9   ;8BC97A|        |      ;
                       db $01,$05,$C7,$1E,$00,$01,$05,$C7   ;8BC982|        |      ;
                       db $1C,$00,$03,$05,$C7,$1D,$00,$01   ;8BC98A|        |      ;
                       db $05,$C7,$1C,$00,$01,$05,$C7,$1E   ;8BC992|        |      ;
                       db $00,$FF,$D6,$A4,$89,$77,$C9       ;8BC99A|        |      ;
                       JSL.L CODE_FL_8481D6                 ;8BC9A1|22D68184|8481D6;
                       CMP.W #$0004                         ;8BC9A5|C90400  |      ;
                       BCC +                                ;8BC9A8|9003    |8BC9AD;
                       JMP.W CODE_JP_8BC705                 ;8BC9AA|4C05C7  |8BC705;
 
                     + JSL.L CODE_FL_89A509                 ;8BC9AD|2209A589|89A509;
                       RTL                                  ;8BC9B1|6B      |      ;
 
       CODE_FL_8BC9B2:
                       LDA.B $96                            ;8BC9B2|A596    |000096;
                       PHA                                  ;8BC9B4|48      |      ;
                       LDA.W #$D32F                         ;8BC9B5|A92FD3  |      ;
                       STA.B $96                            ;8BC9B8|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BC9BA|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BC9BE|222CA689|89A62C;
                       db $72,$C9,$8B                       ;8BC9C2|        |      ;
                       PLA                                  ;8BC9C5|68      |      ;
                       STA.B $96                            ;8BC9C6|8596    |000096;
                       RTL                                  ;8BC9C8|6B      |      ;
                       db $FF,$A5,$F1,$8B,$0C,$A8,$C7,$0C   ;8BC9C9|        |      ;
                       db $00,$28,$D3,$CB,$0C,$00,$10,$D3   ;8BC9D1|        |      ;
                       db $CB,$1A,$00,$10,$D3,$CB,$0C,$00   ;8BC9D9|        |      ;
                       db $10,$D3,$CB,$1A,$00,$28,$D3,$CB   ;8BC9E1|        |      ;
                       db $0C,$00,$04,$D3,$CB,$1A,$00,$04   ;8BC9E9|        |      ;
                       db $D3,$CB,$0D,$00,$28,$D3,$CB,$2D   ;8BC9F1|        |      ;
                       db $00,$10,$D3,$CB,$2E,$00,$10,$D3   ;8BC9F9|        |      ;
                       db $CB,$2D,$00,$10,$D3,$CB,$2E,$00   ;8BCA01|        |      ;
                       db $28,$D3,$CB,$2D,$00,$04,$D3,$CB   ;8BCA09|        |      ;
                       db $2E,$00,$FF,$6D,$A5,$89,$40,$D3   ;8BCA11|        |      ;
                       db $7E,$01,$00,$3A,$D3,$CB,$0D,$00   ;8BCA19|        |      ;
                       db $06,$D3,$CB,$0C,$00,$20,$D3,$CB   ;8BCA21|        |      ;
                       db $1B,$00,$FF,$26,$A5,$89,$0D,$C6   ;8BCA29|        |      ;
                       LDA.B $96                            ;8BCA31|A596    |000096;
                       PHA                                  ;8BCA33|48      |      ;
                       LDA.W #$D32F                         ;8BCA34|A92FD3  |      ;
                       STA.B $96                            ;8BCA37|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCA39|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCA3D|222CA689|89A62C;
                       db $C9,$C9,$8B                       ;8BCA41|        |      ;
                       PLA                                  ;8BCA44|68      |      ;
                       STA.B $96                            ;8BCA45|8596    |000096;
                       RTL                                  ;8BCA47|6B      |      ;
                       db $0C,$A8,$C7,$1B,$00,$FF,$26,$A5   ;8BCA48|        |      ;
                       db $89,$05,$C7                       ;8BCA50|        |      ;
 
       CODE_FL_8BCA53:
                       LDA.B $96                            ;8BCA53|A596    |000096;
                       PHA                                  ;8BCA55|48      |      ;
                       LDA.W #$D32F                         ;8BCA56|A92FD3  |      ;
                       STA.B $96                            ;8BCA59|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCA5B|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCA5F|222CA689|89A62C;
                       db $48,$CA,$8B                       ;8BCA63|        |      ;
                       PLA                                  ;8BCA66|68      |      ;
                       STA.B $96                            ;8BCA67|8596    |000096;
                       RTL                                  ;8BCA69|6B      |      ;
                       db $04,$AC,$CA,$2B,$00,$04,$AC,$CA   ;8BCA6A|        |      ;
                       db $20,$00,$04,$AC,$CA,$21,$00,$03   ;8BCA72|        |      ;
                       db $AC,$CA,$22,$00,$02,$AC,$CA,$23   ;8BCA7A|        |      ;
                       db $00,$03,$AC,$CA,$24,$00,$04,$AC   ;8BCA82|        |      ;
                       db $CA,$25,$00,$04,$AC,$CA,$26,$00   ;8BCA8A|        |      ;
                       db $04,$AC,$CA,$27,$00,$03,$AC,$CA   ;8BCA92|        |      ;
                       db $28,$00,$02,$AC,$CA,$29,$00,$03   ;8BCA9A|        |      ;
                       db $AC,$CA,$2A,$00,$FF,$D6,$A4,$89   ;8BCAA2|        |      ;
                       db $6A,$CA                           ;8BCAAA|        |      ;
                       LDA.L $7ED344                        ;8BCAAC|AF44D37E|7ED344;
                       DEC A                                ;8BCAB0|3A      |      ;
                       STA.L $7ED344                        ;8BCAB1|8F44D37E|7ED344;
                       JSL.L CODE_FL_8BE897                 ;8BCAB5|2297E88B|8BE897;
                       JMP.W CODE_JP_8BCBD3                 ;8BCAB9|4CD3CB  |8BCBD3;
 
       CODE_FL_8BCABC:
                       LDA.B $96                            ;8BCABC|A596    |000096;
                       PHA                                  ;8BCABE|48      |      ;
                       LDA.W #$D32F                         ;8BCABF|A92FD3  |      ;
                       STA.B $96                            ;8BCAC2|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCAC4|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCAC8|222CA689|89A62C;
                       db $6A,$CA,$8B                       ;8BCACC|        |      ;
                       PLA                                  ;8BCACF|68      |      ;
                       STA.B $96                            ;8BCAD0|8596    |000096;
                       RTL                                  ;8BCAD2|6B      |      ;
                       db $10,$FA,$CA,$0D,$00,$10,$E6,$CA   ;8BCAD3|        |      ;
                       db $0D,$00,$10,$F0,$CA,$0D,$00,$FF   ;8BCADB|        |      ;
                       db $E9,$A4,$89                       ;8BCAE3|        |      ;
                       LDA.B $A9                            ;8BCAE6|A5A9    |0000A9;
                       AND.W #$0001                         ;8BCAE8|290100  |      ;
                       BEQ +                                ;8BCAEB|F017    |8BCB04;
                       JMP.W CODE_JP_8BCBD3                 ;8BCAED|4CD3CB  |8BCBD3;
                       LDA.B $A9                            ;8BCAF0|A5A9    |0000A9;
                       AND.W #$0003                         ;8BCAF2|290300  |      ;
                       BNE +                                ;8BCAF5|D00D    |8BCB04;
                       JMP.W CODE_JP_8BCBD3                 ;8BCAF7|4CD3CB  |8BCBD3;
                       LDA.B $A9                            ;8BCAFA|A5A9    |0000A9;
                       AND.W #$0003                         ;8BCAFC|290300  |      ;
                       BEQ +                                ;8BCAFF|F003    |8BCB04;
                       JMP.W CODE_JP_8BCBD3                 ;8BCB01|4CD3CB  |8BCBD3;
 
                     + RTL                                  ;8BCB04|6B      |      ;
                       LDA.B $96                            ;8BCB05|A596    |000096;
                       PHA                                  ;8BCB07|48      |      ;
                       LDA.W #$D32F                         ;8BCB08|A92FD3  |      ;
                       STA.B $96                            ;8BCB0B|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCB0D|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCB11|222CA689|89A62C;
                       db $D3,$CA,$8B                       ;8BCB15|        |      ;
                       PLA                                  ;8BCB18|68      |      ;
                       STA.B $96                            ;8BCB19|8596    |000096;
                       RTL                                  ;8BCB1B|6B      |      ;
                       db $FF,$26,$A5,$89,$22,$CB           ;8BCB1C|        |      ;
                       JSL.L CODE_FL_8BEB7D                 ;8BCB22|227DEB8B|8BEB7D;
                       LDA.W #$000E                         ;8BCB26|A90E00  |      ;
                       JMP.W CODE_FL_8BC3DE                 ;8BCB29|4CDEC3  |8BC3DE;
                       LDA.B $96                            ;8BCB2C|A596    |000096;
                       PHA                                  ;8BCB2E|48      |      ;
                       LDA.W #$D32F                         ;8BCB2F|A92FD3  |      ;
                       STA.B $96                            ;8BCB32|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCB34|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCB38|222CA689|89A62C;
                       db $1C,$CB,$8B                       ;8BCB3C|        |      ;
                       PLA                                  ;8BCB3F|68      |      ;
                       STA.B $96                            ;8BCB40|8596    |000096;
                       RTL                                  ;8BCB42|6B      |      ;
                       LDA.B $96                            ;8BCB43|A596    |000096;
                       PHA                                  ;8BCB45|48      |      ;
                       LDA.W #$D32F                         ;8BCB46|A92FD3  |      ;
                       STA.B $96                            ;8BCB49|8596    |000096;
                       JSL.L CODE_FL_89A6A7                 ;8BCB4B|22A7A689|89A6A7;
                       PLA                                  ;8BCB4F|68      |      ;
                       STA.B $96                            ;8BCB50|8596    |000096;
                       RTL                                  ;8BCB52|6B      |      ;
                       db $02,$0D,$C6,$18,$00,$FF,$66,$F1   ;8BCB53|        |      ;
                       db $8B,$04,$0D,$C6,$10,$00,$02,$0D   ;8BCB5B|        |      ;
                       db $C6,$18,$00,$04,$0D,$C6,$0D,$00   ;8BCB63|        |      ;
                       db $02,$0D,$C6,$18,$00,$04,$0D,$C6   ;8BCB6B|        |      ;
                       db $10,$00,$02,$0D,$C6,$18,$00,$01   ;8BCB73|        |      ;
                       db $0D,$C6,$0D,$00,$01,$0D,$C6,$0E   ;8BCB7B|        |      ;
                       db $00,$01,$0D,$C6,$0F,$00,$04,$0D   ;8BCB83|        |      ;
                       db $C6,$11,$00,$02,$0D,$C6,$16,$00   ;8BCB8B|        |      ;
                       db $04,$0D,$C6,$12,$00,$02,$0D,$C6   ;8BCB93|        |      ;
                       db $16,$00,$08,$0D,$C6,$11,$00,$02   ;8BCB9B|        |      ;
                       db $0D,$C6,$13,$00,$04,$0D,$C6,$14   ;8BCBA3|        |      ;
                       db $00,$02,$0D,$C6,$13,$00,$40,$0D   ;8BCBAB|        |      ;
                       db $C6,$11,$00,$FF,$26,$A5,$89,$0D   ;8BCBB3|        |      ;
                       db $C6                               ;8BCBBB|        |      ;
                       LDA.B $96                            ;8BCBBC|A596    |000096;
                       PHA                                  ;8BCBBE|48      |      ;
                       LDA.W #$D32F                         ;8BCBBF|A92FD3  |      ;
                       STA.B $96                            ;8BCBC2|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCBC4|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCBC8|222CA689|89A62C;
                       db $53,$CB,$8B                       ;8BCBCC|        |      ;
                       PLA                                  ;8BCBCF|68      |      ;
                       STA.B $96                            ;8BCBD0|8596    |000096;
                       RTL                                  ;8BCBD2|6B      |      ;
 
       CODE_JP_8BCBD3:
                       LDA.W #$0080                         ;8BCBD3|A98000  |      ;
                       CLC                                  ;8BCBD6|18      |      ;
                       ADC.L $7ED358                        ;8BCBD7|6F58D37E|7ED358;
                       CLC                                  ;8BCBDB|18      |      ;
                       ADC.L $7ED348                        ;8BCBDC|6F48D37E|7ED348;
                       STA.B $CF                            ;8BCBE0|85CF    |0000CF;
                       LDA.W #$0054                         ;8BCBE2|A95400  |      ;
                       CLC                                  ;8BCBE5|18      |      ;
                       ADC.L $7ED35A                        ;8BCBE6|6F5AD37E|7ED35A;
                       CLC                                  ;8BCBEA|18      |      ;
                       ADC.L $7ED34A                        ;8BCBEB|6F4AD37E|7ED34A;
                       CLC                                  ;8BCBEF|18      |      ;
                       ADC.L $7ED35C                        ;8BCBF0|6F5CD37E|7ED35C;
                       CLC                                  ;8BCBF4|18      |      ;
                       ADC.L $7ED272                        ;8BCBF5|6F72D27E|7ED272;
                       STA.B $D1                            ;8BCBF9|85D1    |0000D1;
                       LDA.W #$8900                         ;8BCBFB|A90089  |      ;
                       STA.B $D6                            ;8BCBFE|85D6    |0000D6;
                       LDA.W #$8900                         ;8BCC00|A90089  |      ;
                       STA.B $D5                            ;8BCC03|85D5    |0000D5;
                       LDA.W #$FFFF                         ;8BCC05|A9FFFF  |      ;
                       STA.B $D8                            ;8BCC08|85D8    |0000D8;
                       LDA.W #$0000                         ;8BCC0A|A90000  |      ;
                       STA.B $DA                            ;8BCC0D|85DA    |0000DA;
                       LDY.W #$0003                         ;8BCC0F|A00300  |      ;
                       LDA.B [$96],Y                        ;8BCC12|B796    |000096;
                       STA.B $D3                            ;8BCC14|85D3    |0000D3;
                       JSL.L CODE_FL_80BC55                 ;8BCC16|2255BC80|80BC55;
                       RTL                                  ;8BCC1A|6B      |      ;
 
       CODE_FL_8BCC1B:
                       LDA.W #$0066                         ;8BCC1B|A96600  |      ;
                       CLC                                  ;8BCC1E|18      |      ;
                       ADC.L $7ED358                        ;8BCC1F|6F58D37E|7ED358;
                       CLC                                  ;8BCC23|18      |      ;
                       ADC.L $7ED348                        ;8BCC24|6F48D37E|7ED348;
                       STA.B $CF                            ;8BCC28|85CF    |0000CF;
                       JSL.L Move_TitleScreenLittleYoshi    ;8BCC2A|22DC8084|8480DC;
                       CLC                                  ;8BCC2E|18      |      ;
                       ADC.W #$003C                         ;8BCC2F|693C00  |      ;
                       CLC                                  ;8BCC32|18      |      ;
                       ADC.L $7ED35A                        ;8BCC33|6F5AD37E|7ED35A;
                       CLC                                  ;8BCC37|18      |      ;
                       ADC.L $7ED34A                        ;8BCC38|6F4AD37E|7ED34A;
                       CLC                                  ;8BCC3C|18      |      ;
                       ADC.L $7ED272                        ;8BCC3D|6F72D27E|7ED272;
                       STA.B $D1                            ;8BCC41|85D1    |0000D1;
                       LDA.W #$8900                         ;8BCC43|A90089  |      ;
                       STA.B $D6                            ;8BCC46|85D6    |0000D6;
                       LDA.W #$8900                         ;8BCC48|A90089  |      ;
                       STA.B $D5                            ;8BCC4B|85D5    |0000D5;
                       LDA.W #$FFFF                         ;8BCC4D|A9FFFF  |      ;
                       STA.B $D8                            ;8BCC50|85D8    |0000D8;
                       LDA.W #$0000                         ;8BCC52|A90000  |      ;
                       STA.B $DA                            ;8BCC55|85DA    |0000DA;
                       LDA.W #$002C                         ;8BCC57|A92C00  |      ;
                       STA.B $D3                            ;8BCC5A|85D3    |0000D3;
                       JSL.L CODE_FL_80BC55                 ;8BCC5C|2255BC80|80BC55;
                       RTL                                  ;8BCC60|6B      |      ;
                       LDA.B $96                            ;8BCC61|A596    |000096;
                       PHA                                  ;8BCC63|48      |      ;
                       LDA.W #$D32F                         ;8BCC64|A92FD3  |      ;
                       STA.B $96                            ;8BCC67|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCC69|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCC6D|222CA689|89A62C;
                       db $98,$CE,$8B                       ;8BCC71|        |      ;
                       PLA                                  ;8BCC74|68      |      ;
                       STA.B $96                            ;8BCC75|8596    |000096;
                       RTL                                  ;8BCC77|6B      |      ;
                       LDA.B $96                            ;8BCC78|A596    |000096;
                       PHA                                  ;8BCC7A|48      |      ;
                       LDA.W #$D32F                         ;8BCC7B|A92FD3  |      ;
                       STA.B $96                            ;8BCC7E|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCC80|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCC84|222CA689|89A62C;
                       db $7A,$CD,$8B                       ;8BCC88|        |      ;
                       PLA                                  ;8BCC8B|68      |      ;
                       STA.B $96                            ;8BCC8C|8596    |000096;
                       RTL                                  ;8BCC8E|6B      |      ;
                       LDA.B $96                            ;8BCC8F|A596    |000096;
                       PHA                                  ;8BCC91|48      |      ;
                       LDA.W #$D32F                         ;8BCC92|A92FD3  |      ;
                       STA.B $96                            ;8BCC95|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCC97|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCC9B|222CA689|89A62C;
                       db $9E,$CD,$8B                       ;8BCC9F|        |      ;
                       PLA                                  ;8BCCA2|68      |      ;
                       STA.B $96                            ;8BCCA3|8596    |000096;
                       RTL                                  ;8BCCA5|6B      |      ;
                       LDA.B $96                            ;8BCCA6|A596    |000096;
                       PHA                                  ;8BCCA8|48      |      ;
                       LDA.W #$D32F                         ;8BCCA9|A92FD3  |      ;
                       STA.B $96                            ;8BCCAC|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCCAE|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCCB2|222CA689|89A62C;
                       db $CA,$CD,$8B                       ;8BCCB6|        |      ;
                       PLA                                  ;8BCCB9|68      |      ;
                       STA.B $96                            ;8BCCBA|8596    |000096;
                       RTL                                  ;8BCCBC|6B      |      ;
                       db $A5,$96,$48,$A9,$2F,$D3,$85,$96   ;8BCCBD|        |000096;
                       db $22,$50,$A4,$89,$22,$2C,$A6,$89   ;8BCCC5|        |89A450;
                       db $F0,$CD,$8B,$68,$85,$96,$6B       ;8BCCCD|        |8BCC9C;
                       LDA.B $96                            ;8BCCD4|A596    |000096;
                       PHA                                  ;8BCCD6|48      |      ;
                       LDA.W #$D32F                         ;8BCCD7|A92FD3  |      ;
                       STA.B $96                            ;8BCCDA|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCCDC|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCCE0|222CA689|89A62C;
                       db $51,$CD,$8B                       ;8BCCE4|        |      ;
                       PLA                                  ;8BCCE7|68      |      ;
                       STA.B $96                            ;8BCCE8|8596    |000096;
                       RTL                                  ;8BCCEA|6B      |      ;
                       LDA.B $96                            ;8BCCEB|A596    |000096;
                       PHA                                  ;8BCCED|48      |      ;
                       LDA.W #$D32F                         ;8BCCEE|A92FD3  |      ;
                       STA.B $96                            ;8BCCF1|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCCF3|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCCF7|222CA689|89A62C;
                       db $34,$CD,$8B                       ;8BCCFB|        |      ;
                       PLA                                  ;8BCCFE|68      |      ;
                       STA.B $96                            ;8BCCFF|8596    |000096;
                       RTL                                  ;8BCD01|6B      |      ;
                       LDA.B $96                            ;8BCD02|A596    |000096;
                       PHA                                  ;8BCD04|48      |      ;
                       LDA.W #$D32F                         ;8BCD05|A92FD3  |      ;
                       STA.B $96                            ;8BCD08|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BCD0A|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BCD0E|222CA689|89A62C;
                       db $19,$CD,$8B                       ;8BCD12|        |      ;
                       PLA                                  ;8BCD15|68      |      ;
                       STA.B $96                            ;8BCD16|8596    |000096;
                       RTL                                  ;8BCD18|6B      |      ;
                       db $FF,$19,$F1,$8B,$78,$10,$AA,$FF   ;8BCD19|        |      ;
                       db $FF,$78,$10,$AA,$FF,$FF,$B4,$10   ;8BCD21|        |      ;
                       db $AA,$FF,$FF,$FF,$27,$F1,$8B,$FF   ;8BCD29|        |      ;
                       db $E9,$A4,$89,$20,$48,$CD,$8E,$00   ;8BCD31|        |      ;
                       db $FF,$64,$D2,$8B,$20,$48,$CD,$8F   ;8BCD39|        |      ;
                       db $00,$FF,$D6,$A4,$89,$34,$CD       ;8BCD41|        |      ;
                       JSL.L CODE_FL_8BD26C                 ;8BCD48|226CD28B|8BD26C;
                       JSL.L CODE_FL_8BCF47                 ;8BCD4C|2247CF8B|8BCF47;
                       RTL                                  ;8BCD50|6B      |      ;
                       db $03,$47,$CF,$86,$00,$03,$47,$CF   ;8BCD51|        |      ;
                       db $87,$00,$05,$47,$CF,$88,$00,$10   ;8BCD59|        |      ;
                       db $47,$CF,$89,$00,$05,$47,$CF,$88   ;8BCD61|        |      ;
                       db $00,$03,$47,$CF,$87,$00,$03,$47   ;8BCD69|        |      ;
                       db $CF,$86,$00,$FF,$D6,$A4,$89,$1C   ;8BCD71|        |      ;
                       db $CF,$FF,$83,$D1,$8B,$01,$8F,$CD   ;8BCD79|        |      ;
                       db $8A,$00,$FF,$26,$A5,$89,$8F,$CD   ;8BCD81|        |      ;
                       db $FF,$D6,$A4,$89,$1C,$CF           ;8BCD89|        |      ;
                       JSR.W CODE_FN_8BD01F                 ;8BCD8F|201FD0  |8BD01F;
                       BCC +                                ;8BCD92|9005    |8BCD99;
                       JSL.L CODE_FL_89A509                 ;8BCD94|2209A589|89A509;
                       RTL                                  ;8BCD98|6B      |      ;
 
                     + JSL.L CODE_FL_8BCF47                 ;8BCD99|2247CF8B|8BCF47;
                       RTL                                  ;8BCD9D|6B      |      ;
                       db $FF,$83,$D1,$8B,$03,$B8,$CD,$8B   ;8BCD9E|        |      ;
                       db $00,$03,$B8,$CD,$8C,$00,$FF,$D6   ;8BCDA6|        |      ;
                       db $A4,$89,$A2,$CD,$FF,$D6,$A4,$89   ;8BCDAE|        |      ;
                       db $1C,$CF                           ;8BCDB6|        |      ;
                       JSR.W CODE_FN_8BD01F                 ;8BCDB8|201FD0  |8BD01F;
                       BCC +                                ;8BCDBB|9008    |8BCDC5;
                       JSL.L CODE_FL_89A62C                 ;8BCDBD|222CA689|89A62C;
                       db $B2,$CD,$8B                       ;8BCDC1|        |      ;
                       RTL                                  ;8BCDC4|6B      |      ;
 
                     + JSL.L CODE_FL_8BCF47                 ;8BCDC5|2247CF8B|8BCF47;
                       RTL                                  ;8BCDC9|6B      |      ;
                       db $FF,$83,$D1,$8B,$03,$DE,$CD,$8B   ;8BCDCA|        |      ;
                       db $00,$03,$DE,$CD,$8C,$00,$FF,$D6   ;8BCDD2|        |      ;
                       db $A4,$89,$CE,$CD                   ;8BCDDA|        |      ;
                       JSR.W CODE_FN_8BD01F                 ;8BCDDE|201FD0  |8BD01F;
                       BCC +                                ;8BCDE1|9008    |8BCDEB;
                       JSL.L CODE_FL_89A62C                 ;8BCDE3|222CA689|89A62C;
                       db $CA,$CD,$8B                       ;8BCDE7|        |      ;
                       RTL                                  ;8BCDEA|6B      |      ;
 
                     + JSL.L CODE_FL_8BCF47                 ;8BCDEB|2247CF8B|8BCF47;
                       RTL                                  ;8BCDEF|6B      |      ;
                       db $03,$3E,$CE,$8B,$00,$03,$3E,$CE   ;8BCDF0|        |00003E;
                       db $8C,$00,$FF,$D6,$A4,$89,$F0,$CD   ;8BCDF8|        |00FF00;
                       db $FF,$51,$D3,$8B,$03,$76,$CE,$9C   ;8BCE00|        |8BD351;
                       db $00,$03,$76,$CE,$9D,$00,$FF,$D6   ;8BCE08|        |      ;
                       db $A4,$89,$04,$CE,$03,$5A,$CE,$9C   ;8BCE10|        |000089;
                       db $00,$03,$5A,$CE,$9D,$00,$FF,$D6   ;8BCE18|        |      ;
                       db $A4,$89,$14,$CE,$FF,$18,$D3,$8B   ;8BCE20|        |000089;
                       db $03,$87,$CE,$8B,$00,$03,$87,$CE   ;8BCE28|        |000087;
                       db $8C,$00,$FF,$D6,$A4,$89,$28,$CE   ;8BCE30|        |00FF00;
                       db $FF,$D6,$A4,$89,$F0,$CD,$AF,$58   ;8BCE38|        |89A4D6;
                       db $D3,$7E,$38,$E9,$03,$00,$8F,$58   ;8BCE40|        |00007E;
                       db $D3,$7E,$C9,$DF,$FF,$10,$08,$22   ;8BCE48|        |00007E;
                       db $2C,$A6,$89,$00,$CE,$8B,$6B,$4C   ;8BCE50|        |0089A6;
                       db $47,$CF,$AF,$58,$D3,$7E,$18,$69   ;8BCE58|        |0000CF;
                       db $03,$00,$8F,$58,$D3,$7E,$C9,$21   ;8BCE60|        |000000;
                       db $00,$30,$08,$22,$2C,$A6,$89,$24   ;8BCE68|        |      ;
                       db $CE,$8B,$6B,$4C,$47,$CF,$22,$D6   ;8BCE70|        |006B8B;
                       db $D2,$8B,$90,$08,$22,$2C,$A6,$89   ;8BCE78|        |00008B;
                       db $14,$CE,$8B,$6B,$4C,$47,$CF,$22   ;8BCE80|        |0000CE;
                       db $D6,$D2,$8B,$90,$08,$22,$2C,$A6   ;8BCE88|        |0000D2;
                       db $89,$38,$CE,$8B,$6B,$4C,$47,$CF   ;8BCE90|        |      ;
                       db $FF,$20,$F1,$8B,$D2,$10,$AA,$FF   ;8BCE98|        |      ;
                       db $FF,$FF,$81,$D0,$8B,$03,$E4,$CE   ;8BCEA0|        |      ;
                       db $8B,$00,$03,$E4,$CE,$8C,$00,$FF   ;8BCEA8|        |      ;
                       db $D6,$A4,$89,$A5,$CE,$FF,$A1,$CF   ;8BCEB0|        |      ;
                       db $8B,$01,$F6,$CE,$8D,$00,$FF,$26   ;8BCEB8|        |      ;
                       db $A5,$89,$F6,$CE,$FF,$A1,$CF,$8B   ;8BCEC0|        |      ;
                       db $FF,$26,$A5,$89,$F6,$CE,$01,$09   ;8BCEC8|        |      ;
                       db $CF,$8E,$00,$FF,$26,$A5,$89,$09   ;8BCED0|        |      ;
                       db $CF,$B4,$13,$CF,$FF,$FF,$FF,$D6   ;8BCED8|        |      ;
                       db $A4,$89,$1C,$CF                   ;8BCEE0|        |      ;
                       JSR.W CODE_FN_8BD01F                 ;8BCEE4|201FD0  |8BD01F;
                       BCC +                                ;8BCEE7|9008    |8BCEF1;
                       JSL.L CODE_FL_89A62C                 ;8BCEE9|222CA689|89A62C;
                       db $B5,$CE,$8B                       ;8BCEED|        |      ;
                       RTL                                  ;8BCEF0|6B      |      ;
 
                     + JSL.L CODE_FL_8BCF47                 ;8BCEF1|2247CF8B|8BCF47;
                       RTL                                  ;8BCEF5|6B      |      ;
                       JSR.W CODE_FN_8BD01F                 ;8BCEF6|201FD0  |8BD01F;
                       BCC +                                ;8BCEF9|9005    |8BCF00;
                       JSL.L CODE_FL_89A509                 ;8BCEFB|2209A589|89A509;
                       RTL                                  ;8BCEFF|6B      |      ;
 
                     + JSL.L CODE_FL_8BCF47                 ;8BCF00|2247CF8B|8BCF47;
                       JSL.L CODE_FL_8BCFC7                 ;8BCF04|22C7CF8B|8BCFC7;
                       RTL                                  ;8BCF08|6B      |      ;
                       JSR.W CODE_FN_8BD01F                 ;8BCF09|201FD0  |8BD01F;
                       BCC +                                ;8BCF0C|9005    |8BCF13;
                       JSL.L CODE_FL_89A509                 ;8BCF0E|2209A589|89A509;
                       RTL                                  ;8BCF12|6B      |      ;
 
                     + JSL.L CODE_FL_8BD1CF                 ;8BCF13|22CFD18B|8BD1CF;
                       JSL.L CODE_FL_8BCF47                 ;8BCF17|2247CF8B|8BCF47;
                       RTL                                  ;8BCF1B|6B      |      ;
                       db $02,$47,$CF,$83,$00,$FF,$26,$A5   ;8BCF1C|        |      ;
                       db $89,$3C,$CF,$02,$47,$CF,$84,$00   ;8BCF24|        |      ;
                       db $05,$47,$CF,$85,$00,$02,$47,$CF   ;8BCF2C|        |      ;
                       db $84,$00,$FF,$D6,$A4,$89,$1C,$CF   ;8BCF34|        |      ;
                       JSL.L CODE_FL_8BDBDC                 ;8BCF3C|22DCDB8B|8BDBDC;
                       BCC +                                ;8BCF40|9004    |8BCF46;
                       JSL.L CODE_FL_8BCF47                 ;8BCF42|2247CF8B|8BCF47;
 
                     + RTL                                  ;8BCF46|6B      |      ;
 
       CODE_FL_8BCF47:
                       LDA.W #$8100                         ;8BCF47|A90081  |      ;
                       STA.B $D6                            ;8BCF4A|85D6    |0000D6;
                       LDA.W #$8000                         ;8BCF4C|A90080  |      ;
                       STA.B $D5                            ;8BCF4F|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BCF51|A9FFC1  |      ;
                       STA.B $D8                            ;8BCF54|85D8    |0000D8;
                       LDA.W #$2C00                         ;8BCF56|A9002C  |      ;
                       STA.B $DA                            ;8BCF59|85DA    |0000DA;
                       LDA.W #$0080                         ;8BCF5B|A98000  |      ;
                       CLC                                  ;8BCF5E|18      |      ;
                       ADC.L $7ED358                        ;8BCF5F|6F58D37E|7ED358;
                       STA.B $CF                            ;8BCF63|85CF    |0000CF;
                       LDA.W #$0068                         ;8BCF65|A96800  |      ;
                       CLC                                  ;8BCF68|18      |      ;
                       ADC.L $7ED35A                        ;8BCF69|6F5AD37E|7ED35A;
                       STA.B $D1                            ;8BCF6D|85D1    |0000D1;
                       LDY.W #$0003                         ;8BCF6F|A00300  |      ;
                       LDA.B [$96],Y                        ;8BCF72|B796    |000096;
                       STA.B $D3                            ;8BCF74|85D3    |0000D3;
                       JSL.L CODE_FL_80BC55                 ;8BCF76|2255BC80|80BC55;
                       LDA.W #$0068                         ;8BCF7A|A96800  |      ;
                       STA.B $D1                            ;8BCF7D|85D1    |0000D1;
                       LDA.L $7ED35A                        ;8BCF7F|AF5AD37E|7ED35A;
                       CMP.W #$FFF8                         ;8BCF83|C9F8FF  |      ;
                       BPL +                                ;8BCF86|100F    |8BCF97;
                       CMP.W #$FFF0                         ;8BCF88|C9F0FF  |      ;
                       BPL ++                               ;8BCF8B|1005    |8BCF92;
                       LDA.W #$0098                         ;8BCF8D|A99800  |      ;
                       BRA +++                              ;8BCF90|8008    |8BCF9A;
 
                    ++ LDA.W #$0097                         ;8BCF92|A99700  |      ;
                       BRA +++                              ;8BCF95|8003    |8BCF9A;
 
                     + LDA.W #$0096                         ;8BCF97|A99600  |      ;
 
                   +++ STA.B $D3                            ;8BCF9A|85D3    |0000D3;
                       JSL.L CODE_FL_80BC55                 ;8BCF9C|2255BC80|80BC55;
                       RTL                                  ;8BCFA0|6B      |      ;
                       LDA.W #$0080                         ;8BCFA1|A98000  |      ;
                       CLC                                  ;8BCFA4|18      |      ;
                       ADC.L $7ED358                        ;8BCFA5|6F58D37E|7ED358;
                       PHA                                  ;8BCFA9|48      |      ;
                       SBC.W #$0010                         ;8BCFAA|E91000  |      ;
                       STA.L $7ED360                        ;8BCFAD|8F60D37E|7ED360;
                       PLA                                  ;8BCFB1|68      |      ;
                       CLC                                  ;8BCFB2|18      |      ;
                       ADC.W #$0010                         ;8BCFB3|691000  |      ;
                       STA.L $7ED362                        ;8BCFB6|8F62D37E|7ED362;
                       LDA.W #$0068                         ;8BCFBA|A96800  |      ;
                       CLC                                  ;8BCFBD|18      |      ;
                       ADC.L $7ED35A                        ;8BCFBE|6F5AD37E|7ED35A;
                       STA.L $7ED364                        ;8BCFC2|8F64D37E|7ED364;
                       RTL                                  ;8BCFC6|6B      |      ;
 
       CODE_FL_8BCFC7:
                       LDA.L $7ED364                        ;8BCFC7|AF64D37E|7ED364;
                       CMP.W #$0058                         ;8BCFCB|C95800  |      ;
                       BMI +                                ;8BCFCE|304E    |8BD01E;
                       LDA.L $7ED360                        ;8BCFD0|AF60D37E|7ED360;
                       DEC A                                ;8BCFD4|3A      |      ;
                       STA.L $7ED360                        ;8BCFD5|8F60D37E|7ED360;
                       LDA.L $7ED362                        ;8BCFD9|AF62D37E|7ED362;
                       INC A                                ;8BCFDD|1A      |      ;
                       STA.L $7ED362                        ;8BCFDE|8F62D37E|7ED362;
                       LDA.L $7ED364                        ;8BCFE2|AF64D37E|7ED364;
                       DEC A                                ;8BCFE6|3A      |      ;
                       STA.L $7ED364                        ;8BCFE7|8F64D37E|7ED364;
                       LDA.W #$8100                         ;8BCFEB|A90081  |      ;
                       STA.B $D6                            ;8BCFEE|85D6    |0000D6;
                       LDA.W #$8000                         ;8BCFF0|A90080  |      ;
                       STA.B $D5                            ;8BCFF3|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BCFF5|A9FFC1  |      ;
                       STA.B $D8                            ;8BCFF8|85D8    |0000D8;
                       LDA.W #$2C00                         ;8BCFFA|A9002C  |      ;
                       STA.B $DA                            ;8BCFFD|85DA    |0000DA;
                       LDA.L $7ED364                        ;8BCFFF|AF64D37E|7ED364;
                       STA.B $D1                            ;8BD003|85D1    |0000D1;
                       LDA.W #$0093                         ;8BD005|A99300  |      ;
                       STA.B $D3                            ;8BD008|85D3    |0000D3;
                       LDA.L $7ED360                        ;8BD00A|AF60D37E|7ED360;
                       STA.B $CF                            ;8BD00E|85CF    |0000CF;
                       JSL.L CODE_FL_80BC55                 ;8BD010|2255BC80|80BC55;
                       LDA.L $7ED362                        ;8BD014|AF62D37E|7ED362;
                       STA.B $CF                            ;8BD018|85CF    |0000CF;
                       JSL.L CODE_FL_80BC55                 ;8BD01A|2255BC80|80BC55;
 
                     + RTL                                  ;8BD01E|6B      |      ;
 
       CODE_FN_8BD01F:
                       LDA.L $7ED35C                        ;8BD01F|AF5CD37E|7ED35C;
                       BEQ +                                ;8BD023|F058    |8BD07D;
                       TAX                                  ;8BD025|AA      |      ;
                       LDA.L $8B0000,X                      ;8BD026|BF00008B|8B0000;
                       CMP.W #$8000                         ;8BD02A|C90080  |      ;
                       BNE ++                               ;8BD02D|D009    |8BD038;
                       LDA.W #$0000                         ;8BD02F|A90000  |      ;
                       STA.L $7ED35C                        ;8BD032|8F5CD37E|7ED35C;
                       BRA +++                              ;8BD036|8047    |8BD07F;
 
                    ++ CMP.W #$8001                         ;8BD038|C90180  |      ;
                       BNE ++                               ;8BD03B|D00C    |8BD049;
                       LDA.L $7ED35C                        ;8BD03D|AF5CD37E|7ED35C;
                       INC A                                ;8BD041|1A      |      ;
                       INC A                                ;8BD042|1A      |      ;
                       STA.L $7ED35C                        ;8BD043|8F5CD37E|7ED35C;
                       BRA +++                              ;8BD047|8036    |8BD07F;
 
                    ++ LDA.L $8B0000,X                      ;8BD049|BF00008B|8B0000;
                       BIT.W #$0080                         ;8BD04D|898000  |      ;
                       BNE UNREACH_8BD057                   ;8BD050|D005    |8BD057;
                       AND.W #$007F                         ;8BD052|297F00  |      ;
                       BRA ++                               ;8BD055|8003    |8BD05A;
 
       UNREACH_8BD057:
                       db $09,$80,$FF                       ;8BD057|        |      ;
 
                    ++ STA.L $7ED358                        ;8BD05A|8F58D37E|7ED358;
                       LDA.L $8B0001,X                      ;8BD05E|BF01008B|8B0001;
                       BIT.W #$0080                         ;8BD062|898000  |      ;
                       BNE ++                               ;8BD065|D005    |8BD06C;
                       AND.W #$007F                         ;8BD067|297F00  |      ;
                       BRA ++++                             ;8BD06A|8003    |8BD06F;
 
                    ++ ORA.W #$FF80                         ;8BD06C|0980FF  |      ;
 
                  ++++ STA.L $7ED35A                        ;8BD06F|8F5AD37E|7ED35A;
                       LDA.L $7ED35C                        ;8BD073|AF5CD37E|7ED35C;
                       INC A                                ;8BD077|1A      |      ;
                       INC A                                ;8BD078|1A      |      ;
                       STA.L $7ED35C                        ;8BD079|8F5CD37E|7ED35C;
 
                     + CLC                                  ;8BD07D|18      |      ;
                       RTS                                  ;8BD07E|60      |      ;
 
                   +++ SEC                                  ;8BD07F|38      |      ;
                       RTS                                  ;8BD080|60      |      ;
                       LDA.W #$D089                         ;8BD081|A989D0  |      ;
                       STA.L $7ED35C                        ;8BD084|8F5CD37E|7ED35C;
                       RTL                                  ;8BD088|6B      |      ;
                       db $7F,$C1,$7C,$C0,$78,$C0,$74,$C0   ;8BD089|        |      ;
                       db $70,$C1,$6C,$C1,$68,$C2,$64,$C3   ;8BD091|        |      ;
                       db $60,$C5,$5C,$C7,$58,$C9,$55,$CB   ;8BD099|        |      ;
                       db $51,$CD,$4E,$D0,$4B,$D3,$48,$D6   ;8BD0A1|        |      ;
                       db $45,$D9,$43,$DD,$41,$E0,$3F,$E4   ;8BD0A9|        |      ;
                       db $3D,$E8,$3B,$EC,$3A,$F0,$39,$F4   ;8BD0B1|        |      ;
                       db $39,$F8,$38,$FC,$38,$00,$01,$80   ;8BD0B9|        |      ;
                       db $38,$FD,$38,$FA,$37,$F7,$36,$F4   ;8BD0C1|        |      ;
                       db $35,$F2,$34,$EF,$33,$ED,$32,$EC   ;8BD0C9|        |      ;
                       db $32,$EB,$31,$EB,$30,$EA,$30,$E9   ;8BD0D1|        |      ;
                       db $2F,$E9,$2E,$E8,$2D,$E8,$2C,$E8   ;8BD0D9|        |      ;
                       db $2C,$E8,$2C,$E8,$2B,$E8,$2A,$E8   ;8BD0E1|        |      ;
                       db $29,$E9,$28,$E9,$28,$EA,$27,$EB   ;8BD0E9|        |      ;
                       db $26,$EB,$26,$EC,$25,$ED,$24,$EF   ;8BD0F1|        |      ;
                       db $23,$F2,$22,$F4,$21,$F7,$20,$FA   ;8BD0F9|        |      ;
                       db $20,$FD,$20,$00,$01,$80,$20,$FE   ;8BD101|        |      ;
                       db $20,$FC,$1F,$FA,$1F,$F8,$1E,$F6   ;8BD109|        |      ;
                       db $1E,$F5,$1D,$F3,$1C,$F3,$1C,$F2   ;8BD111|        |      ;
                       db $1B,$F2,$1B,$F1,$1A,$F1,$1A,$F1   ;8BD119|        |      ;
                       db $19,$F0,$19,$F0,$18,$F0,$18,$F0   ;8BD121|        |      ;
                       db $18,$F0,$17,$F0,$17,$F0,$16,$F1   ;8BD129|        |      ;
                       db $16,$F1,$15,$F1,$15,$F2,$14,$F2   ;8BD131|        |      ;
                       db $14,$F3,$13,$F3,$12,$F5,$12,$F6   ;8BD139|        |      ;
                       db $11,$F8,$11,$FA,$10,$FC,$10,$FE   ;8BD141|        |      ;
                       db $10,$00,$01,$80,$0F,$00,$0E,$00   ;8BD149|        |      ;
                       db $0D,$00,$0C,$00,$0C,$00,$0B,$00   ;8BD151|        |      ;
                       db $0A,$00,$09,$00,$09,$00,$08,$00   ;8BD159|        |      ;
                       db $07,$00,$07,$00,$06,$00,$05,$00   ;8BD161|        |      ;
                       db $05,$00,$04,$00,$04,$00,$03,$00   ;8BD169|        |      ;
                       db $03,$00,$02,$00,$02,$00,$02,$00   ;8BD171|        |      ;
                       db $01,$00,$01,$00,$01,$00,$00,$00   ;8BD179|        |      ;
                       db $00,$80                           ;8BD181|        |      ;
                       LDA.W #$D18B                         ;8BD183|A98BD1  |      ;
                       STA.L $7ED35C                        ;8BD186|8F5CD37E|7ED35C;
                       RTL                                  ;8BD18A|6B      |      ;
                       db $00,$00,$00,$FC,$00,$F8,$00,$F4   ;8BD18B|        |      ;
                       db $00,$F0,$00,$ED,$00,$EA,$00,$E7   ;8BD193|        |      ;
                       db $00,$E4,$00,$E3,$00,$E2,$00,$E2   ;8BD19B|        |      ;
                       db $00,$E1,$00,$E1,$00,$E0,$00,$E0   ;8BD1A3|        |      ;
                       db $00,$E0,$00,$E0,$00,$E0,$00,$E1   ;8BD1AB|        |      ;
                       db $00,$E1,$00,$E2,$00,$E2,$00,$E3   ;8BD1B3|        |      ;
                       db $00,$E4,$00,$E7,$00,$EA,$00,$ED   ;8BD1BB|        |      ;
                       db $00,$F0,$00,$F4,$00,$F8,$00,$FC   ;8BD1C3|        |      ;
                       db $00,$00,$00,$80                   ;8BD1CB|        |      ;
 
       CODE_FL_8BD1CF:
                       LDA.W #$8100                         ;8BD1CF|A90081  |      ;
                       STA.B $D6                            ;8BD1D2|85D6    |0000D6;
                       LDA.W #$8000                         ;8BD1D4|A90080  |      ;
                       STA.B $D5                            ;8BD1D7|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BD1D9|A9FFC1  |      ;
                       STA.B $D8                            ;8BD1DC|85D8    |0000D8;
                       LDA.W #$2C00                         ;8BD1DE|A9002C  |      ;
                       STA.B $DA                            ;8BD1E1|85DA    |0000DA;
                       LDA.W #$0093                         ;8BD1E3|A99300  |      ;
                       STA.B $D3                            ;8BD1E6|85D3    |0000D3;
                       LDA.L $0000A9                        ;8BD1E8|AFA90000|0000A9;
                       AND.W #$001F                         ;8BD1EC|291F00  |      ;
                       ASL A                                ;8BD1EF|0A      |      ;
                       TAX                                  ;8BD1F0|AA      |      ;
                       LDA.L DATA8_8BD224,X                 ;8BD1F1|BF24D28B|8BD224;
                       BIT.W #$0080                         ;8BD1F5|898000  |      ;
                       BNE +                                ;8BD1F8|D005    |8BD1FF;
                       AND.W #$007F                         ;8BD1FA|297F00  |      ;
                       BRA ++                               ;8BD1FD|8003    |8BD202;
 
                     + ORA.W #$FF80                         ;8BD1FF|0980FF  |      ;
 
                    ++ CLC                                  ;8BD202|18      |      ;
                       ADC.W #$0078                         ;8BD203|697800  |      ;
                       STA.B $CF                            ;8BD206|85CF    |0000CF;
                       LDA.L DATA8_8BD225,X                 ;8BD208|BF25D28B|8BD225;
                       BIT.W #$0080                         ;8BD20C|898000  |      ;
                       BNE +                                ;8BD20F|D005    |8BD216;
                       AND.W #$007F                         ;8BD211|297F00  |      ;
                       BRA ++                               ;8BD214|8003    |8BD219;
 
                     + ORA.W #$FF80                         ;8BD216|0980FF  |      ;
 
                    ++ CLC                                  ;8BD219|18      |      ;
                       ADC.W #$004A                         ;8BD21A|694A00  |      ;
                       STA.B $D1                            ;8BD21D|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BD21F|2255BC80|80BC55;
                       RTL                                  ;8BD223|6B      |      ;
 
         DATA8_8BD224:
                       db $10                               ;8BD224|        |      ;
 
         DATA8_8BD225:
                       db $00,$10,$00,$0F,$00,$0D,$01,$0B   ;8BD225|        |      ;
                       db $01,$09,$02,$06,$02,$03,$02,$00   ;8BD22D|        |      ;
                       db $02,$FD,$02,$FA,$02,$F7,$02,$F5   ;8BD235|        |      ;
                       db $01,$F3,$01,$F1,$00,$F0,$00,$F0   ;8BD23D|        |      ;
                       db $00,$F0,$00,$F1,$00,$F3,$FF,$F5   ;8BD245|        |      ;
                       db $FF,$F7,$FE,$FA,$FE,$FD,$FE,$00   ;8BD24D|        |      ;
                       db $FE,$03,$FE,$06,$FE,$09,$FE,$0B   ;8BD255|        |      ;
                       db $FF,$0D,$FF,$0F,$00,$10,$00       ;8BD25D|        |      ;
                       LDA.W #$0001                         ;8BD264|A90100  |      ;
                       STA.L $7ED35C                        ;8BD267|8F5CD37E|7ED35C;
                       RTL                                  ;8BD26B|6B      |      ;
 
       CODE_FL_8BD26C:
                       LDA.L $7ED35C                        ;8BD26C|AF5CD37E|7ED35C;
                       BEQ +                                ;8BD270|F047    |8BD2B9;
                       TAX                                  ;8BD272|AA      |      ;
                       LDA.L UNREACH_8BD2BA,X               ;8BD273|BFBAD28B|8BD2BA;
                       AND.W #$00FF                         ;8BD277|29FF00  |      ;
                       CMP.W #$00FF                         ;8BD27A|C9FF00  |      ;
                       BNE ++                               ;8BD27D|D009    |8BD288;
                       LDA.W #$0000                         ;8BD27F|A90000  |      ;
                       STA.L $7ED35C                        ;8BD282|8F5CD37E|7ED35C;
                       BRA +                                ;8BD286|8031    |8BD2B9;
 
                    ++ CLC                                  ;8BD288|18      |      ;
                       ADC.W #$0078                         ;8BD289|697800  |      ;
                       STA.B $D3                            ;8BD28C|85D3    |0000D3;
                       LDA.L $7ED35C                        ;8BD28E|AF5CD37E|7ED35C;
                       INC A                                ;8BD292|1A      |      ;
                       STA.L $7ED35C                        ;8BD293|8F5CD37E|7ED35C;
                       LDA.W #$8100                         ;8BD297|A90081  |      ;
                       STA.B $D6                            ;8BD29A|85D6    |0000D6;
                       LDA.W #$8000                         ;8BD29C|A90080  |      ;
                       STA.B $D5                            ;8BD29F|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BD2A1|A9FFC1  |      ;
                       STA.B $D8                            ;8BD2A4|85D8    |0000D8;
                       LDA.W #$2C00                         ;8BD2A6|A9002C  |      ;
                       STA.B $DA                            ;8BD2A9|85DA    |0000DA;
                       LDA.W #$0064                         ;8BD2AB|A96400  |      ;
                       STA.B $CF                            ;8BD2AE|85CF    |0000CF;
                       LDA.W #$0056                         ;8BD2B0|A95600  |      ;
                       STA.B $D1                            ;8BD2B3|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BD2B5|2255BC80|80BC55;
 
                     + RTL                                  ;8BD2B9|6B      |      ;
 
       UNREACH_8BD2BA:
                       db $19                               ;8BD2BA|        |001919;
                       db $19,$19,$19,$19,$19,$19,$19,$19   ;8BD2BB|        |      ;
                       db $19,$19,$1A,$1A,$1A,$1A,$1A,$1A   ;8BD2C3|        |      ;
                       db $1A,$1A,$1A,$1A,$1A,$1A,$1A,$1A   ;8BD2CB|        |      ;
                       db $1A,$1A,$FF,$AF                   ;8BD2D3|        |      ;
                       db $5C,$D3,$7E,$F0,$2A,$AA,$20,$08   ;8BD2D7|        |F07ED3;
                       db $D3,$B0,$25,$BF,$00,$00,$8B,$89   ;8BD2DF|        |0000B0;
                       db $80,$00,$D0,$05,$29,$7F,$00,$80   ;8BD2E7|        |8BD2E9;
                       db $03,$09,$80,$FF,$8F,$58,$D3,$7E   ;8BD2EF|        |000009;
                       db $AF,$5C,$D3,$7E,$1A,$8F,$5C,$D3   ;8BD2F7|        |7ED35C;
                       db $7E,$AA,$20,$08,$D3,$B0,$01,$18   ;8BD2FF|        |0020AA;
                       db $6B,$BF,$00,$00,$8B,$29,$FF,$00   ;8BD307|        |      ;
                       db $C9,$80,$00,$F0,$02,$18,$60,$38   ;8BD30F|        |      ;
                       db $60,$A9,$20,$D3,$8F,$5C,$D3,$7E   ;8BD317|        |      ;
                       db $6B,$21,$23,$25,$27,$29,$2B,$2D   ;8BD31F|        |      ;
                       db $2F,$31,$33,$34,$36,$37,$39,$3A   ;8BD327|        |343331;
                       db $3C,$3D,$3E,$3F,$3F,$40,$40,$41   ;8BD32F|        |003E3D;
                       db $41,$41,$41,$41,$40,$40,$3F,$3F   ;8BD337|        |000041;
                       db $3E,$3D,$3C,$3A,$39,$37,$36,$34   ;8BD33F|        |003C3D;
                       db $33,$31,$2F,$2D,$2B,$29,$27,$25   ;8BD347|        |000031;
                       db $23,$80,$A9,$59,$D3,$8F,$5C,$D3   ;8BD34F|        |000080;
                       db $7E,$6B,$DF,$DD,$DB,$D9,$D7,$D5   ;8BD357|        |00DF6B;
                       db $D3,$D1,$CF,$CD,$CC,$CA,$C9,$C7   ;8BD35F|        |0000D1;
                       db $C6,$C4,$C3,$C2,$C1,$C1,$C0,$C0   ;8BD367|        |0000C4;
                       db $BF,$BF,$BF,$BF,$BF,$C0,$C0,$C1   ;8BD36F|        |BFBFBF;
                       db $C1,$C2,$C3,$C4,$C6,$C7,$C9,$CA   ;8BD377|        |0000C2;
                       db $CC,$CD,$CF,$D1,$D3,$D5,$D7,$D9   ;8BD37F|        |00CFCD;
                       db $DB,$DD,$80                       ;8BD387|        |      ;
                       db $FF,$38,$D4,$8B,$10,$29,$D4,$FF   ;8BD38A|        |      ;
                       db $FF,$FF,$72,$D4,$8B,$03,$29,$D4   ;8BD392|        |      ;
                       db $FF,$FF,$01,$22,$D4,$00,$00,$01   ;8BD39A|        |      ;
                       db $22,$D4,$02,$00,$01,$22,$D4,$04   ;8BD3A2|        |      ;
                       db $00,$01,$22,$D4,$06,$00,$01,$22   ;8BD3AA|        |      ;
                       db $D4,$08,$00,$01,$22,$D4,$0A,$00   ;8BD3B2|        |      ;
                       db $01,$22,$D4,$0C,$00,$01,$22,$D4   ;8BD3BA|        |      ;
                       db $0E,$00,$01,$22,$D4,$10,$00,$01   ;8BD3C2|        |      ;
                       db $22,$D4,$12,$00,$03,$29,$D4,$FF   ;8BD3CA|        |      ;
                       db $FF,$FF,$4D,$D4,$8B,$10,$29,$D4   ;8BD3D2|        |      ;
                       db $FF,$FF,$FF,$87,$D4,$8B,$03,$29   ;8BD3DA|        |      ;
                       db $D4,$FF,$FF,$01,$22,$D4,$01,$00   ;8BD3E2|        |      ;
                       db $01,$22,$D4,$03,$00,$01,$22,$D4   ;8BD3EA|        |      ;
                       db $05,$00,$01,$22,$D4,$07,$00,$01   ;8BD3F2|        |      ;
                       db $22,$D4,$09,$00,$01,$22,$D4,$0B   ;8BD3FA|        |      ;
                       db $00,$01,$22,$D4,$0D,$00,$01,$22   ;8BD402|        |      ;
                       db $D4,$0F,$00,$01,$22,$D4,$11,$00   ;8BD40A|        |      ;
                       db $01,$22,$D4,$13,$00,$03,$29,$D4   ;8BD412|        |      ;
                       db $FF,$FF,$FF,$D6,$A4,$89,$8A,$D3   ;8BD41A|        |      ;
                       JSL.L CODE_FL_8BD57E                 ;8BD422|227ED58B|8BD57E;
                       JMP.W CODE_JP_8BD429                 ;8BD426|4C29D4  |8BD429;
 
       CODE_JP_8BD429:
                       LDA.L $7ED3A9                        ;8BD429|AFA9D37E|7ED3A9;
                       JSR.W CODE_FN_8BD4AC                 ;8BD42D|20ACD4  |8BD4AC;
                       LDA.L $7ED3AB                        ;8BD430|AFABD37E|7ED3AB;
                       JSR.W CODE_FN_8BD4DB                 ;8BD434|20DBD4  |8BD4DB;
                       RTL                                  ;8BD437|6B      |      ;
                       LDA.L $7ED3A5                        ;8BD438|AFA5D37E|7ED3A5;
                       BIT.W #$8000                         ;8BD43C|890080  |      ;
                       BEQ +                                ;8BD43F|F004    |8BD445;
                       JSL.L CODE_FL_8B95FA                 ;8BD441|22FA958B|8B95FA;
 
                     + LDA.W #$006F                         ;8BD445|A96F00  |      ;
                       STA.L $7ED3A9                        ;8BD448|8FA9D37E|7ED3A9;
                       RTL                                  ;8BD44C|6B      |      ;
                       LDA.L $7ED3A5                        ;8BD44D|AFA5D37E|7ED3A5;
                       BIT.W #$8000                         ;8BD451|890080  |      ;
                       BEQ +                                ;8BD454|F004    |8BD45A;
                       JSL.L CODE_FL_8B9701                 ;8BD456|2201978B|8B9701;
 
                     + LDA.L $7ED3A5                        ;8BD45A|AFA5D37E|7ED3A5;
                       BIT.W #$4000                         ;8BD45E|890040  |      ;
                       BNE +                                ;8BD461|D005    |8BD468;
                       LDA.W #$006F                         ;8BD463|A96F00  |      ;
                       BRA ++                               ;8BD466|8005    |8BD46D;
 
                     + LDA.W #$0070                         ;8BD468|A97000  |      ;
                       BRA ++                               ;8BD46B|8000    |8BD46D;
 
                    ++ STA.L $7ED3A9                        ;8BD46D|8FA9D37E|7ED3A9;
                       RTL                                  ;8BD471|6B      |      ;
                       LDA.L $7ED3A7                        ;8BD472|AFA7D37E|7ED3A7;
                       BIT.W #$8000                         ;8BD476|890080  |      ;
                       BEQ +                                ;8BD479|F004    |8BD47F;
                       JSL.L CODE_FL_8B9808                 ;8BD47B|2208988B|8B9808;
 
                     + LDA.W #$0071                         ;8BD47F|A97100  |      ;
                       STA.L $7ED3AB                        ;8BD482|8FABD37E|7ED3AB;
                       RTL                                  ;8BD486|6B      |      ;
                       LDA.L $7ED3A7                        ;8BD487|AFA7D37E|7ED3A7;
                       BIT.W #$8000                         ;8BD48B|890080  |      ;
                       BEQ +                                ;8BD48E|F004    |8BD494;
                       JSL.L CODE_FL_8B990F                 ;8BD490|220F998B|8B990F;
 
                     + LDA.L $7ED3A7                        ;8BD494|AFA7D37E|7ED3A7;
                       BIT.W #$4000                         ;8BD498|890040  |      ;
                       BNE +                                ;8BD49B|D005    |8BD4A2;
                       LDA.W #$0071                         ;8BD49D|A97100  |      ;
                       BRA ++                               ;8BD4A0|8005    |8BD4A7;
 
                     + LDA.W #$0072                         ;8BD4A2|A97200  |      ;
                       BRA ++                               ;8BD4A5|8000    |8BD4A7;
 
                    ++ STA.L $7ED3AB                        ;8BD4A7|8FABD37E|7ED3AB;
                       RTL                                  ;8BD4AB|6B      |      ;
 
       CODE_FN_8BD4AC:
                       STA.B $D3                            ;8BD4AC|85D3    |0000D3;
                       LDA.W #$0090                         ;8BD4AE|A99000  |      ;
                       SEC                                  ;8BD4B1|38      |      ;
                       SBC.L $7ED250                        ;8BD4B2|EF50D27E|7ED250;
                       STA.B $CF                            ;8BD4B6|85CF    |0000CF;
                       LDA.W #$00BF                         ;8BD4B8|A9BF00  |      ;
                       SEC                                  ;8BD4BB|38      |      ;
                       SBC.L $7ED252                        ;8BD4BC|EF52D27E|7ED252;
                       STA.B $D1                            ;8BD4C0|85D1    |0000D1;
                       LDA.W #$8900                         ;8BD4C2|A90089  |      ;
                       STA.B $D6                            ;8BD4C5|85D6    |0000D6;
                       LDA.W #$8900                         ;8BD4C7|A90089  |      ;
                       STA.B $D5                            ;8BD4CA|85D5    |0000D5;
                       LDA.W #$CFFF                         ;8BD4CC|A9FFCF  |      ;
                       STA.B $D8                            ;8BD4CF|85D8    |0000D8;
                       LDA.W #$0000                         ;8BD4D1|A90000  |      ;
                       STA.B $DA                            ;8BD4D4|85DA    |0000DA;
                       JSL.L CODE_FL_80BC55                 ;8BD4D6|2255BC80|80BC55;
                       RTS                                  ;8BD4DA|60      |      ;
 
       CODE_FN_8BD4DB:
                       STA.B $D3                            ;8BD4DB|85D3    |0000D3;
                       LDA.W #$0190                         ;8BD4DD|A99001  |      ;
                       SEC                                  ;8BD4E0|38      |      ;
                       SBC.L $7ED250                        ;8BD4E1|EF50D27E|7ED250;
                       STA.B $CF                            ;8BD4E5|85CF    |0000CF;
                       LDA.W #$003F                         ;8BD4E7|A93F00  |      ;
                       SEC                                  ;8BD4EA|38      |      ;
                       SBC.L $7ED252                        ;8BD4EB|EF52D27E|7ED252;
                       STA.B $D1                            ;8BD4EF|85D1    |0000D1;
                       LDA.W #$8900                         ;8BD4F1|A90089  |      ;
                       STA.B $D6                            ;8BD4F4|85D6    |0000D6;
                       LDA.W #$8900                         ;8BD4F6|A90089  |      ;
                       STA.B $D5                            ;8BD4F9|85D5    |0000D5;
                       LDA.W #$CFFF                         ;8BD4FB|A9FFCF  |      ;
                       STA.B $D8                            ;8BD4FE|85D8    |0000D8;
                       LDA.W #$0000                         ;8BD500|A90000  |      ;
                       STA.B $DA                            ;8BD503|85DA    |0000DA;
                       JSL.L CODE_FL_80BC55                 ;8BD505|2255BC80|80BC55;
                       RTS                                  ;8BD509|60      |      ;
                       db $01,$7E,$D5,$00,$00,$01,$7E,$D5   ;8BD50A|        |      ;
                       db $02,$00,$01,$7E,$D5,$04,$00,$01   ;8BD512|        |      ;
                       db $7E,$D5,$06,$00,$01,$7E,$D5,$08   ;8BD51A|        |      ;
                       db $00,$01,$7E,$D5,$0A,$00,$01,$7E   ;8BD522|        |      ;
                       db $D5,$0C,$00,$01,$7E,$D5,$0E,$00   ;8BD52A|        |      ;
                       db $01,$7E,$D5,$10,$00,$01,$7E,$D5   ;8BD532|        |      ;
                       db $12,$00,$20,$10,$AA,$FF,$FF,$01   ;8BD53A|        |      ;
                       db $7E,$D5,$01,$00,$01,$7E,$D5,$03   ;8BD542|        |      ;
                       db $00,$01,$7E,$D5,$05,$00,$01,$7E   ;8BD54A|        |      ;
                       db $D5,$07,$00,$01,$7E,$D5,$09,$00   ;8BD552|        |      ;
                       db $01,$7E,$D5,$0B,$00,$01,$7E,$D5   ;8BD55A|        |      ;
                       db $0D,$00,$01,$7E,$D5,$0F,$00,$01   ;8BD562|        |      ;
                       db $7E,$D5,$11,$00,$01,$7E,$D5,$13   ;8BD56A|        |      ;
                       db $00,$20,$10,$AA,$FF,$FF,$FF,$D6   ;8BD572|        |      ;
                       db $A4,$89,$0A,$D5                   ;8BD57A|        |      ;
 
       CODE_FL_8BD57E:
                       LDY.W #$0003                         ;8BD57E|A00300  |      ;
                       LDA.B [$96],Y                        ;8BD581|B796    |000096;
                       JMP.W CODE_FL_8BD586                 ;8BD583|4C86D5  |8BD586;
 
       CODE_FL_8BD586:
                       PHP                                  ;8BD586|08      |      ;
                       REP #$30                             ;8BD587|C230    |      ;
                       PHB                                  ;8BD589|8B      |      ;
                       PHA                                  ;8BD58A|48      |      ;
                       PHX                                  ;8BD58B|DA      |      ;
                       PHY                                  ;8BD58C|5A      |      ;
                       PEA.W $7E00                          ;8BD58D|F4007E  |8B7E00;
                       PLB                                  ;8BD590|AB      |      ;
                       PLB                                  ;8BD591|AB      |      ;
                       AND.W #$001F                         ;8BD592|291F00  |      ;
                       TAY                                  ;8BD595|A8      |      ;
                       AND.W #$FFFE                         ;8BD596|29FEFF  |      ;
                       TAX                                  ;8BD599|AA      |      ;
                       LDA.L DATA8_8BD63A,X                 ;8BD59A|BF3AD68B|8BD63A;
                       STA.L $7ED3C4                        ;8BD59E|8FC4D37E|7ED3C4;
                       CLC                                  ;8BD5A2|18      |      ;
                       ADC.W #$0020                         ;8BD5A3|692000  |      ;
                       STA.L $7ED3CC                        ;8BD5A6|8FCCD37E|7ED3CC;
                       CLC                                  ;8BD5AA|18      |      ;
                       ADC.W #$0020                         ;8BD5AB|692000  |      ;
                       STA.L $7ED3D4                        ;8BD5AE|8FD4D37E|7ED3D4;
                       LDA.W #$0008                         ;8BD5B2|A90800  |      ;
                       STA.L $7ED3C1                        ;8BD5B5|8FC1D37E|7ED3C1;
                       STA.L $7ED3C9                        ;8BD5B9|8FC9D37E|7ED3C9;
                       STA.L $7ED3D1                        ;8BD5BD|8FD1D37E|7ED3D1;
                       SEP #$20                             ;8BD5C1|E220    |      ;
                       LDA.B #$80                           ;8BD5C3|A980    |      ;
                       STA.L $7ED3C3                        ;8BD5C5|8FC3D37E|7ED3C3;
                       STA.L $7ED3CB                        ;8BD5C9|8FCBD37E|7ED3CB;
                       STA.L $7ED3D3                        ;8BD5CD|8FD3D37E|7ED3D3;
                       REP #$20                             ;8BD5D1|C220    |      ;
                       TYA                                  ;8BD5D3|98      |      ;
                       BIT.W #$0001                         ;8BD5D4|890100  |      ;
                       BNE +                                ;8BD5D7|D023    |8BD5FC;
                       LDA.W #$8B00                         ;8BD5D9|A9008B  |      ;
                       STA.L $7ED3BF                        ;8BD5DC|8FBFD37E|7ED3BF;
                       STA.L $7ED3C7                        ;8BD5E0|8FC7D37E|7ED3C7;
                       STA.L $7ED3CF                        ;8BD5E4|8FCFD37E|7ED3CF;
                       LDA.W #$D64E                         ;8BD5E8|A94ED6  |      ;
                       STA.W $D3BE                          ;8BD5EB|8DBED3  |7ED3BE;
                       LDA.W #$D656                         ;8BD5EE|A956D6  |      ;
                       STA.W $D3C6                          ;8BD5F1|8DC6D3  |7ED3C6;
                       LDA.W #$D65E                         ;8BD5F4|A95ED6  |      ;
                       STA.W $D3CE                          ;8BD5F7|8DCED3  |7ED3CE;
                       BRA ++                               ;8BD5FA|8023    |8BD61F;
 
                     + LDA.W #$8B00                         ;8BD5FC|A9008B  |      ;
                       STA.L $7ED3BF                        ;8BD5FF|8FBFD37E|7ED3BF;
                       STA.L $7ED3C7                        ;8BD603|8FC7D37E|7ED3C7;
                       STA.L $7ED3CF                        ;8BD607|8FCFD37E|7ED3CF;
                       LDA.W #$D666                         ;8BD60B|A966D6  |      ;
                       STA.W $D3BE                          ;8BD60E|8DBED3  |7ED3BE;
                       LDA.W #$D66E                         ;8BD611|A96ED6  |      ;
                       STA.W $D3C6                          ;8BD614|8DC6D3  |7ED3C6;
                       LDA.W #$D676                         ;8BD617|A976D6  |      ;
                       STA.W $D3CE                          ;8BD61A|8DCED3  |7ED3CE;
                       BRA ++                               ;8BD61D|8000    |8BD61F;
 
                    ++ LDY.W #$D3BE                         ;8BD61F|A0BED3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD622|22CAA080|80A0CA;
                       LDY.W #$D3C6                         ;8BD626|A0C6D3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD629|22CAA080|80A0CA;
                       LDY.W #$D3CE                         ;8BD62D|A0CED3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD630|22CAA080|80A0CA;
                       PLY                                  ;8BD634|7A      |      ;
                       PLX                                  ;8BD635|FA      |      ;
                       PLA                                  ;8BD636|68      |      ;
                       PLB                                  ;8BD637|AB      |      ;
                       PLP                                  ;8BD638|28      |      ;
                       RTL                                  ;8BD639|6B      |      ;
 
         DATA8_8BD63A:
                       db $78,$73,$D6,$71,$C4,$72,$47,$70   ;8BD63A|        |      ;
                       db $12,$70,$21,$75,$46,$74,$69,$76   ;8BD642|        |      ;
                       db $B6,$75,$1B,$75,$C0,$1D,$C1,$1D   ;8BD64A|        |      ;
                       db $C1,$5D,$C0,$5D,$C2,$1D,$C3,$1D   ;8BD652|        |      ;
                       db $C3,$5D,$C2,$5D,$C4,$1D,$C5,$1D   ;8BD65A|        |      ;
                       db $C5,$5D,$C4,$5D,$C6,$1D,$C7,$1D   ;8BD662|        |      ;
                       db $C7,$5D,$C6,$5D,$C8,$1D,$C3,$1D   ;8BD66A|        |      ;
                       db $C3,$5D,$C8,$5D,$C9,$1D,$CA,$1D   ;8BD672|        |      ;
                       db $CA,$5D,$C9,$5D                   ;8BD67A|        |      ;
 
       CODE_FL_8BD67E:
                       PHP                                  ;8BD67E|08      |      ;
                       REP #$30                             ;8BD67F|C230    |      ;
                       PHB                                  ;8BD681|8B      |      ;
                       PHA                                  ;8BD682|48      |      ;
                       PHX                                  ;8BD683|DA      |      ;
                       PHY                                  ;8BD684|5A      |      ;
                       PEA.W $7E00                          ;8BD685|F4007E  |7E7E00;
                       PLB                                  ;8BD688|AB      |      ;
                       PLB                                  ;8BD689|AB      |      ;
                       TAY                                  ;8BD68A|A8      |      ;
                       ASL A                                ;8BD68B|0A      |      ;
                       TAX                                  ;8BD68C|AA      |      ;
                       LDA.L DATA8_8BD7D5,X                 ;8BD68D|BFD5D78B|8BD7D5;
                       STA.W $D3DC                          ;8BD691|8DDCD3  |7ED3DC;
                       CLC                                  ;8BD694|18      |      ;
                       ADC.W #$0020                         ;8BD695|692000  |      ;
                       AND.W #$03FF                         ;8BD698|29FF03  |      ;
                       STA.W $D3E4                          ;8BD69B|8DE4D3  |7ED3E4;
                       CLC                                  ;8BD69E|18      |      ;
                       ADC.W #$0020                         ;8BD69F|692000  |      ;
                       AND.W #$03FF                         ;8BD6A2|29FF03  |      ;
                       STA.W $D3EC                          ;8BD6A5|8DECD3  |7ED3EC;
                       CLC                                  ;8BD6A8|18      |      ;
                       ADC.W #$0020                         ;8BD6A9|692000  |      ;
                       AND.W #$03FF                         ;8BD6AC|29FF03  |      ;
                       STA.W $D3F4                          ;8BD6AF|8DF4D3  |7ED3F4;
                       CLC                                  ;8BD6B2|18      |      ;
                       ADC.W #$0020                         ;8BD6B3|692000  |      ;
                       AND.W #$03FF                         ;8BD6B6|29FF03  |      ;
                       STA.W $D3FC                          ;8BD6B9|8DFCD3  |7ED3FC;
                       TYA                                  ;8BD6BC|98      |      ;
                       BIT.W #$0020                         ;8BD6BD|892000  |      ;
                       BNE +                                ;8BD6C0|D034    |8BD6F6;
                       LDA.W $D3DC                          ;8BD6C2|ADDCD3  |7ED3DC;
                       CLC                                  ;8BD6C5|18      |      ;
                       ADC.W #$7000                         ;8BD6C6|690070  |      ;
                       STA.W $D3DC                          ;8BD6C9|8DDCD3  |7ED3DC;
                       LDA.W $D3E4                          ;8BD6CC|ADE4D3  |7ED3E4;
                       CLC                                  ;8BD6CF|18      |      ;
                       ADC.W #$7000                         ;8BD6D0|690070  |      ;
                       STA.W $D3E4                          ;8BD6D3|8DE4D3  |7ED3E4;
                       LDA.W $D3EC                          ;8BD6D6|ADECD3  |7ED3EC;
                       CLC                                  ;8BD6D9|18      |      ;
                       ADC.W #$7000                         ;8BD6DA|690070  |      ;
                       STA.W $D3EC                          ;8BD6DD|8DECD3  |7ED3EC;
                       LDA.W $D3F4                          ;8BD6E0|ADF4D3  |7ED3F4;
                       CLC                                  ;8BD6E3|18      |      ;
                       ADC.W #$7000                         ;8BD6E4|690070  |      ;
                       STA.W $D3F4                          ;8BD6E7|8DF4D3  |7ED3F4;
                       LDA.W $D3FC                          ;8BD6EA|ADFCD3  |7ED3FC;
                       CLC                                  ;8BD6ED|18      |      ;
                       ADC.W #$7000                         ;8BD6EE|690070  |      ;
                       STA.W $D3FC                          ;8BD6F1|8DFCD3  |7ED3FC;
                       BRA ++                               ;8BD6F4|8034    |8BD72A;
 
                     + LDA.W $D3DC                          ;8BD6F6|ADDCD3  |7ED3DC;
                       CLC                                  ;8BD6F9|18      |      ;
                       ADC.W #$7400                         ;8BD6FA|690074  |      ;
                       STA.W $D3DC                          ;8BD6FD|8DDCD3  |7ED3DC;
                       LDA.W $D3E4                          ;8BD700|ADE4D3  |7ED3E4;
                       CLC                                  ;8BD703|18      |      ;
                       ADC.W #$7400                         ;8BD704|690074  |      ;
                       STA.W $D3E4                          ;8BD707|8DE4D3  |7ED3E4;
                       LDA.W $D3EC                          ;8BD70A|ADECD3  |7ED3EC;
                       CLC                                  ;8BD70D|18      |      ;
                       ADC.W #$7400                         ;8BD70E|690074  |      ;
                       STA.W $D3EC                          ;8BD711|8DECD3  |7ED3EC;
                       LDA.W $D3F4                          ;8BD714|ADF4D3  |7ED3F4;
                       CLC                                  ;8BD717|18      |      ;
                       ADC.W #$7400                         ;8BD718|690074  |      ;
                       STA.W $D3F4                          ;8BD71B|8DF4D3  |7ED3F4;
                       LDA.W $D3FC                          ;8BD71E|ADFCD3  |7ED3FC;
                       CLC                                  ;8BD721|18      |      ;
                       ADC.W #$7400                         ;8BD722|690074  |      ;
                       STA.W $D3FC                          ;8BD725|8DFCD3  |7ED3FC;
                       BRA ++                               ;8BD728|8000    |8BD72A;
 
                    ++ LDA.W #$0002                         ;8BD72A|A90200  |      ;
                       STA.W $D3D9                          ;8BD72D|8DD9D3  |7ED3D9;
                       STA.W $D3E1                          ;8BD730|8DE1D3  |7ED3E1;
                       STA.W $D3E9                          ;8BD733|8DE9D3  |7ED3E9;
                       STA.W $D3F1                          ;8BD736|8DF1D3  |7ED3F1;
                       STA.W $D3F9                          ;8BD739|8DF9D3  |7ED3F9;
                       SEP #$20                             ;8BD73C|E220    |      ;
                       LDA.B #$80                           ;8BD73E|A980    |      ;
                       STA.W $D3DB                          ;8BD740|8DDBD3  |7ED3DB;
                       STA.W $D3E3                          ;8BD743|8DE3D3  |7ED3E3;
                       STA.W $D3EB                          ;8BD746|8DEBD3  |7ED3EB;
                       STA.W $D3F3                          ;8BD749|8DF3D3  |7ED3F3;
                       STA.W $D3FB                          ;8BD74C|8DFBD3  |7ED3FB;
                       REP #$20                             ;8BD74F|C220    |      ;
                       SEP #$20                             ;8BD751|E220    |      ;
                       LDA.B #$8B                           ;8BD753|A98B    |      ;
                       STA.W $D3D8                          ;8BD755|8DD8D3  |7ED3D8;
                       STA.W $D3E0                          ;8BD758|8DE0D3  |7ED3E0;
                       STA.W $D3E8                          ;8BD75B|8DE8D3  |7ED3E8;
                       STA.W $D3F0                          ;8BD75E|8DF0D3  |7ED3F0;
                       STA.W $D3F8                          ;8BD761|8DF8D3  |7ED3F8;
                       REP #$20                             ;8BD764|C220    |      ;
                       TYA                                  ;8BD766|98      |      ;
                       BIT.W #$0001                         ;8BD767|890100  |      ;
                       BNE +                                ;8BD76A|D020    |8BD78C;
                       LDA.W #$D855                         ;8BD76C|A955D8  |      ;
                       STA.W $D3D6                          ;8BD76F|8DD6D3  |7ED3D6;
                       LDA.W #$D857                         ;8BD772|A957D8  |      ;
                       STA.W $D3DE                          ;8BD775|8DDED3  |7ED3DE;
                       LDA.W #$D859                         ;8BD778|A959D8  |      ;
                       STA.W $D3E6                          ;8BD77B|8DE6D3  |7ED3E6;
                       LDA.W #$D85B                         ;8BD77E|A95BD8  |      ;
                       STA.W $D3EE                          ;8BD781|8DEED3  |7ED3EE;
                       LDA.W #$D85D                         ;8BD784|A95DD8  |      ;
                       STA.W $D3F6                          ;8BD787|8DF6D3  |7ED3F6;
                       BRA ++                               ;8BD78A|8020    |8BD7AC;
 
                     + LDA.W #$D85F                         ;8BD78C|A95FD8  |      ;
                       STA.W $D3D6                          ;8BD78F|8DD6D3  |7ED3D6;
                       LDA.W #$D861                         ;8BD792|A961D8  |      ;
                       STA.W $D3DE                          ;8BD795|8DDED3  |7ED3DE;
                       LDA.W #$D863                         ;8BD798|A963D8  |      ;
                       STA.W $D3E6                          ;8BD79B|8DE6D3  |7ED3E6;
                       LDA.W #$D865                         ;8BD79E|A965D8  |      ;
                       STA.W $D3EE                          ;8BD7A1|8DEED3  |7ED3EE;
                       LDA.W #$D867                         ;8BD7A4|A967D8  |      ;
                       STA.W $D3F6                          ;8BD7A7|8DF6D3  |7ED3F6;
                       BRA ++                               ;8BD7AA|8000    |8BD7AC;
 
                    ++ LDY.W #$D3D6                         ;8BD7AC|A0D6D3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD7AF|22CAA080|80A0CA;
                       LDY.W #$D3DE                         ;8BD7B3|A0DED3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD7B6|22CAA080|80A0CA;
                       LDY.W #$D3E6                         ;8BD7BA|A0E6D3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD7BD|22CAA080|80A0CA;
                       LDY.W #$D3EE                         ;8BD7C1|A0EED3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD7C4|22CAA080|80A0CA;
                       LDY.W #$D3F6                         ;8BD7C8|A0F6D3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD7CB|22CAA080|80A0CA;
                       PLY                                  ;8BD7CF|7A      |      ;
                       PLX                                  ;8BD7D0|FA      |      ;
                       PLA                                  ;8BD7D1|68      |      ;
                       PLB                                  ;8BD7D2|AB      |      ;
                       PLP                                  ;8BD7D3|28      |      ;
                       RTL                                  ;8BD7D4|6B      |      ;
 
         DATA8_8BD7D5:
                       db $E0,$03,$E1,$03,$C2,$03,$C3,$03   ;8BD7D5|        |      ;
                       db $A4,$03,$A5,$03,$86,$03,$87,$03   ;8BD7DD|        |      ;
                       db $68,$03,$69,$03,$4A,$03,$4B,$03   ;8BD7E5|        |      ;
                       db $2C,$03,$2D,$03,$0E,$03,$0F,$03   ;8BD7ED|        |      ;
                       db $F0,$02,$F1,$02,$D2,$02,$D3,$02   ;8BD7F5|        |      ;
                       db $B4,$02,$B5,$02,$96,$02,$97,$02   ;8BD7FD|        |      ;
                       db $78,$02,$79,$02,$5A,$02,$5B,$02   ;8BD805|        |      ;
                       db $3C,$02,$3D,$02,$1E,$02,$1F,$02   ;8BD80D|        |      ;
                       db $E0,$01,$E1,$01,$C2,$01,$C3,$01   ;8BD815|        |      ;
                       db $A4,$01,$A5,$01,$86,$01,$87,$01   ;8BD81D|        |      ;
                       db $68,$01,$69,$01,$4A,$01,$4B,$01   ;8BD825|        |      ;
                       db $2C,$01,$2D,$01,$0E,$01,$0F,$01   ;8BD82D|        |      ;
                       db $F0,$00,$F1,$00,$D2,$00,$D3,$00   ;8BD835|        |      ;
                       db $B4,$00,$B5,$00,$96,$00,$97,$00   ;8BD83D|        |      ;
                       db $78,$00,$79,$00,$5A,$00,$5B,$00   ;8BD845|        |      ;
                       db $3C,$00,$3D,$00,$1E,$00,$1F,$00   ;8BD84D|        |      ;
                       db $CB,$11,$CD,$11,$CF,$11,$D1,$11   ;8BD855|        |      ;
                       db $D3,$11,$CC,$11,$CE,$11,$D0,$11   ;8BD85D|        |      ;
                       db $D2,$11,$00,$00                   ;8BD865|        |      ;
 
       CODE_FL_8BD869:
                       PHP                                  ;8BD869|08      |      ;
                       REP #$30                             ;8BD86A|C230    |      ;
                       PHA                                  ;8BD86C|48      |      ;
                       PHX                                  ;8BD86D|DA      |      ;
                       PHY                                  ;8BD86E|5A      |      ;
                       AND.W #$00FF                         ;8BD86F|29FF00  |      ;
                       CMP.W #$0005                         ;8BD872|C90500  |      ;
                       BCS +                                ;8BD875|B005    |8BD87C;
                       ASL A                                ;8BD877|0A      |      ;
                       TAX                                  ;8BD878|AA      |      ;
                       JSR.W (DATA8_8BD881,X)               ;8BD879|FC81D8  |8BD881;
 
                     + PLY                                  ;8BD87C|7A      |      ;
                       PLX                                  ;8BD87D|FA      |      ;
                       PLA                                  ;8BD87E|68      |      ;
                       PLP                                  ;8BD87F|28      |      ;
                       RTL                                  ;8BD880|6B      |      ;
 
         DATA8_8BD881:
                       db $8B,$D8,$A1,$D8,$B7,$D8,$CD,$D8   ;8BD881|        |      ;
                       db $E3,$D8                           ;8BD889|        |      ;
                       PHB                                  ;8BD88B|8B      |      ;
                       PHK                                  ;8BD88C|4B      |      ;
                       PLB                                  ;8BD88D|AB      |      ;
                       LDY.W #$D898                         ;8BD88E|A098D8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD891|22CAA080|80A0CA;
                       PLB                                  ;8BD895|AB      |      ;
                       BRA +                                ;8BD896|8008    |8BD8A0;
                       db $00,$2D,$7F,$00,$02,$80,$00,$10   ;8BD898|        |      ;
 
                     + RTS                                  ;8BD8A0|60      |      ;
                       PHB                                  ;8BD8A1|8B      |      ;
                       PHK                                  ;8BD8A2|4B      |      ;
                       PLB                                  ;8BD8A3|AB      |      ;
                       LDY.W #$D8AE                         ;8BD8A4|A0AED8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD8A7|22CAA080|80A0CA;
                       PLB                                  ;8BD8AB|AB      |      ;
                       BRA +                                ;8BD8AC|8008    |8BD8B6;
                       db $00,$2F,$7F,$00,$02,$80,$00,$11   ;8BD8AE|        |      ;
 
                     + RTS                                  ;8BD8B6|60      |      ;
                       PHB                                  ;8BD8B7|8B      |      ;
                       PHK                                  ;8BD8B8|4B      |      ;
                       PLB                                  ;8BD8B9|AB      |      ;
                       LDY.W #$D8C4                         ;8BD8BA|A0C4D8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD8BD|22CAA080|80A0CA;
                       PLB                                  ;8BD8C1|AB      |      ;
                       BRA +                                ;8BD8C2|8008    |8BD8CC;
                       db $00,$31,$7F,$00,$02,$80,$00,$12   ;8BD8C4|        |      ;
 
                     + RTS                                  ;8BD8CC|60      |      ;
                       PHB                                  ;8BD8CD|8B      |      ;
                       PHK                                  ;8BD8CE|4B      |      ;
                       PLB                                  ;8BD8CF|AB      |      ;
                       LDY.W #$D8DA                         ;8BD8D0|A0DAD8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD8D3|22CAA080|80A0CA;
                       PLB                                  ;8BD8D7|AB      |      ;
                       BRA +                                ;8BD8D8|8008    |8BD8E2;
                       db $00,$33,$7F,$00,$02,$80,$00,$13   ;8BD8DA|        |      ;
 
                     + RTS                                  ;8BD8E2|60      |      ;
                       PHB                                  ;8BD8E3|8B      |      ;
                       PHK                                  ;8BD8E4|4B      |      ;
                       PLB                                  ;8BD8E5|AB      |      ;
                       LDY.W #$D8F0                         ;8BD8E6|A0F0D8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD8E9|22CAA080|80A0CA;
                       PLB                                  ;8BD8ED|AB      |      ;
                       BRA +                                ;8BD8EE|8008    |8BD8F8;
                       db $00,$35,$7F,$00,$02,$80,$00,$14   ;8BD8F0|        |      ;
 
                     + RTS                                  ;8BD8F8|60      |      ;
 
       CODE_FL_8BD8F9:
                       PHP                                  ;8BD8F9|08      |      ;
                       REP #$30                             ;8BD8FA|C230    |      ;
                       PHA                                  ;8BD8FC|48      |      ;
                       PHX                                  ;8BD8FD|DA      |      ;
                       PHY                                  ;8BD8FE|5A      |      ;
                       AND.W #$00FF                         ;8BD8FF|29FF00  |      ;
                       CMP.W #$0005                         ;8BD902|C90500  |      ;
                       BCS +                                ;8BD905|B005    |8BD90C;
                       ASL A                                ;8BD907|0A      |      ;
                       TAX                                  ;8BD908|AA      |      ;
                       JSR.W (DATA8_8BD911,X)               ;8BD909|FC11D9  |8BD911;
 
                     + PLY                                  ;8BD90C|7A      |      ;
                       PLX                                  ;8BD90D|FA      |      ;
                       PLA                                  ;8BD90E|68      |      ;
                       PLP                                  ;8BD90F|28      |      ;
                       RTL                                  ;8BD910|6B      |      ;
 
         DATA8_8BD911:
                       db $1B,$D9,$31,$D9,$47,$D9,$5D,$D9   ;8BD911|        |      ;
                       db $73,$D9                           ;8BD919|        |      ;
                       PHB                                  ;8BD91B|8B      |      ;
                       PHK                                  ;8BD91C|4B      |      ;
                       PLB                                  ;8BD91D|AB      |      ;
                       LDY.W #$D928                         ;8BD91E|A028D9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD921|22CAA080|80A0CA;
                       PLB                                  ;8BD925|AB      |      ;
                       BRA +                                ;8BD926|8008    |8BD930;
                       db $00,$37,$7F,$00,$02,$80,$00,$10   ;8BD928|        |      ;
 
                     + RTS                                  ;8BD930|60      |      ;
                       PHB                                  ;8BD931|8B      |      ;
                       PHK                                  ;8BD932|4B      |      ;
                       PLB                                  ;8BD933|AB      |      ;
                       LDY.W #$D93E                         ;8BD934|A03ED9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD937|22CAA080|80A0CA;
                       PLB                                  ;8BD93B|AB      |      ;
                       BRA +                                ;8BD93C|8008    |8BD946;
                       db $00,$39,$7F,$00,$02,$80,$00,$11   ;8BD93E|        |      ;
 
                     + RTS                                  ;8BD946|60      |      ;
                       PHB                                  ;8BD947|8B      |      ;
                       PHK                                  ;8BD948|4B      |      ;
                       PLB                                  ;8BD949|AB      |      ;
                       LDY.W #$D954                         ;8BD94A|A054D9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD94D|22CAA080|80A0CA;
                       PLB                                  ;8BD951|AB      |      ;
                       BRA +                                ;8BD952|8008    |8BD95C;
                       db $00,$3B,$7F,$00,$02,$80,$00,$12   ;8BD954|        |      ;
 
                     + RTS                                  ;8BD95C|60      |      ;
                       PHB                                  ;8BD95D|8B      |      ;
                       PHK                                  ;8BD95E|4B      |      ;
                       PLB                                  ;8BD95F|AB      |      ;
                       LDY.W #$D96A                         ;8BD960|A06AD9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD963|22CAA080|80A0CA;
                       PLB                                  ;8BD967|AB      |      ;
                       BRA +                                ;8BD968|8008    |8BD972;
                       db $00,$3D,$7F,$00,$02,$80,$00,$13   ;8BD96A|        |      ;
 
                     + RTS                                  ;8BD972|60      |      ;
                       PHB                                  ;8BD973|8B      |      ;
                       PHK                                  ;8BD974|4B      |      ;
                       PLB                                  ;8BD975|AB      |      ;
                       LDY.W #$D980                         ;8BD976|A080D9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD979|22CAA080|80A0CA;
                       PLB                                  ;8BD97D|AB      |      ;
                       BRA +                                ;8BD97E|8008    |8BD988;
                       db $00,$3F,$7F,$00,$02,$80,$00,$14   ;8BD980|        |      ;
 
                     + RTS                                  ;8BD988|60      |      ;
 
       CODE_FL_8BD989:
                       PHP                                  ;8BD989|08      |      ;
                       REP #$30                             ;8BD98A|C230    |      ;
                       PHA                                  ;8BD98C|48      |      ;
                       PHX                                  ;8BD98D|DA      |      ;
                       PHY                                  ;8BD98E|5A      |      ;
                       AND.W #$00FF                         ;8BD98F|29FF00  |      ;
                       CMP.W #$0008                         ;8BD992|C90800  |      ;
                       BCS +                                ;8BD995|B005    |8BD99C;
                       ASL A                                ;8BD997|0A      |      ;
                       TAX                                  ;8BD998|AA      |      ;
                       JSR.W (DATA8_8BD9A1,X)               ;8BD999|FCA1D9  |8BD9A1;
 
                     + PLY                                  ;8BD99C|7A      |      ;
                       PLX                                  ;8BD99D|FA      |      ;
                       PLA                                  ;8BD99E|68      |      ;
                       PLP                                  ;8BD99F|28      |      ;
                       RTL                                  ;8BD9A0|6B      |      ;
 
         DATA8_8BD9A1:
                       db $B1,$D9,$C7,$D9,$DD,$D9,$F3,$D9   ;8BD9A1|        |      ;
                       db $09,$DA,$1F,$DA,$35,$DA,$4B,$DA   ;8BD9A9|        |      ;
                       PHB                                  ;8BD9B1|8B      |      ;
                       PHK                                  ;8BD9B2|4B      |      ;
                       PLB                                  ;8BD9B3|AB      |      ;
                       LDY.W #$D9BE                         ;8BD9B4|A0BED9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD9B7|22CAA080|80A0CA;
                       PLB                                  ;8BD9BB|AB      |      ;
                       BRA +                                ;8BD9BC|8008    |8BD9C6;
                       db $00,$41,$7F,$00,$02,$80,$00,$28   ;8BD9BE|        |      ;
 
                     + RTS                                  ;8BD9C6|60      |      ;
                       PHB                                  ;8BD9C7|8B      |      ;
                       PHK                                  ;8BD9C8|4B      |      ;
                       PLB                                  ;8BD9C9|AB      |      ;
                       LDY.W #$D9D4                         ;8BD9CA|A0D4D9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD9CD|22CAA080|80A0CA;
                       PLB                                  ;8BD9D1|AB      |      ;
                       BRA +                                ;8BD9D2|8008    |8BD9DC;
                       db $00,$43,$7F,$00,$02,$80,$00,$29   ;8BD9D4|        |      ;
 
                     + RTS                                  ;8BD9DC|60      |      ;
                       PHB                                  ;8BD9DD|8B      |      ;
                       PHK                                  ;8BD9DE|4B      |      ;
                       PLB                                  ;8BD9DF|AB      |      ;
                       LDY.W #$D9EA                         ;8BD9E0|A0EAD9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD9E3|22CAA080|80A0CA;
                       PLB                                  ;8BD9E7|AB      |      ;
                       BRA +                                ;8BD9E8|8008    |8BD9F2;
                       db $00,$45,$7F,$00,$02,$80,$00,$2A   ;8BD9EA|        |      ;
 
                     + RTS                                  ;8BD9F2|60      |      ;
                       PHB                                  ;8BD9F3|8B      |      ;
                       PHK                                  ;8BD9F4|4B      |      ;
                       PLB                                  ;8BD9F5|AB      |      ;
                       LDY.W #$DA00                         ;8BD9F6|A000DA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BD9F9|22CAA080|80A0CA;
                       PLB                                  ;8BD9FD|AB      |      ;
                       BRA +                                ;8BD9FE|8008    |8BDA08;
                       db $00,$47,$7F,$00,$02,$80,$00,$2B   ;8BDA00|        |      ;
 
                     + RTS                                  ;8BDA08|60      |      ;
                       PHB                                  ;8BDA09|8B      |      ;
                       PHK                                  ;8BDA0A|4B      |      ;
                       PLB                                  ;8BDA0B|AB      |      ;
                       LDY.W #$DA16                         ;8BDA0C|A016DA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BDA0F|22CAA080|80A0CA;
                       PLB                                  ;8BDA13|AB      |      ;
                       BRA +                                ;8BDA14|8008    |8BDA1E;
                       db $00,$49,$7F,$00,$02,$80,$00,$2C   ;8BDA16|        |      ;
 
                     + RTS                                  ;8BDA1E|60      |      ;
                       PHB                                  ;8BDA1F|8B      |      ;
                       PHK                                  ;8BDA20|4B      |      ;
                       PLB                                  ;8BDA21|AB      |      ;
                       LDY.W #$DA2C                         ;8BDA22|A02CDA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BDA25|22CAA080|80A0CA;
                       PLB                                  ;8BDA29|AB      |      ;
                       BRA +                                ;8BDA2A|8008    |8BDA34;
                       db $00,$4B,$7F,$00,$02,$80,$00,$2D   ;8BDA2C|        |      ;
 
                     + RTS                                  ;8BDA34|60      |      ;
                       PHB                                  ;8BDA35|8B      |      ;
                       PHK                                  ;8BDA36|4B      |      ;
                       PLB                                  ;8BDA37|AB      |      ;
                       LDY.W #$DA42                         ;8BDA38|A042DA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BDA3B|22CAA080|80A0CA;
                       PLB                                  ;8BDA3F|AB      |      ;
                       BRA +                                ;8BDA40|8008    |8BDA4A;
                       db $00,$4D,$7F,$00,$02,$80,$00,$2E   ;8BDA42|        |      ;
 
                     + RTS                                  ;8BDA4A|60      |      ;
                       PHB                                  ;8BDA4B|8B      |      ;
                       PHK                                  ;8BDA4C|4B      |      ;
                       PLB                                  ;8BDA4D|AB      |      ;
                       LDY.W #$DA58                         ;8BDA4E|A058DA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BDA51|22CAA080|80A0CA;
                       PLB                                  ;8BDA55|AB      |      ;
                       BRA +                                ;8BDA56|8008    |8BDA60;
                       db $00,$4F,$7F,$00,$02,$80,$00,$2F   ;8BDA58|        |      ;
 
                     + RTS                                  ;8BDA60|60      |      ;
                       db $01,$10,$AA,$09,$03,$FF,$26,$A5   ;8BDA61|        |      ;
                       db $89,$DC,$DB,$05,$10,$AA,$0A,$03   ;8BDA69|        |      ;
                       db $FF,$D6,$A4,$89,$61,$DA,$01,$10   ;8BDA71|        |      ;
                       db $AA,$04,$03,$FF,$26,$A5,$89,$DC   ;8BDA79|        |      ;
                       db $DB,$05,$10,$AA,$05,$03,$FF,$D6   ;8BDA81|        |      ;
                       db $A4,$89,$77,$DA,$01,$10,$AA,$0E   ;8BDA89|        |      ;
                       db $03,$FF,$26,$A5,$89,$DC,$DB,$05   ;8BDA91|        |      ;
                       db $10,$AA,$0F,$03,$FF,$D6,$A4,$89   ;8BDA99|        |      ;
                       db $8D,$DA,$0E,$10,$AA,$12,$03,$0E   ;8BDAA1|        |      ;
                       db $10,$AA,$13,$03,$0E,$10,$AA,$14   ;8BDAA9|        |      ;
                       db $03,$FF,$D6,$A4,$89,$A3,$DA,$01   ;8BDAB1|        |      ;
                       db $10,$AA,$1B,$03,$FF,$26,$A5,$89   ;8BDAB9|        |      ;
                       db $DC,$DB,$05,$10,$AA,$1C,$03,$03   ;8BDAC1|        |      ;
                       db $10,$AA,$1D,$03,$05,$10,$AA,$1E   ;8BDAC9|        |      ;
                       db $03,$FF,$D6,$A4,$89,$B8,$DA,$FF   ;8BDAD1|        |      ;
                       db $FC,$DA,$8B,$01,$10,$AA,$17,$03   ;8BDAD9|        |      ;
                       db $FF,$26,$A5,$89,$DC,$DB,$02,$10   ;8BDAE1|        |      ;
                       db $AA,$18,$03,$04,$10,$AA,$19,$03   ;8BDAE9|        |      ;
                       db $02,$10,$AA,$18,$03,$FF,$D6,$A4   ;8BDAF1|        |      ;
                       db $89,$DC,$DA                       ;8BDAF9|        |      ;
                       LDA.L $7ED87B                        ;8BDAFC|AF7BD87E|7ED87B;
                       BEQ +                                ;8BDB00|F007    |8BDB09;
                       JSL.L CODE_FL_89A62C                 ;8BDB02|222CA689|89A62C;
                       db $0A,$DB,$8B                       ;8BDB06|        |      ;
 
                     + RTL                                  ;8BDB09|6B      |      ;
                       db $01,$10,$AA,$75,$00,$FF,$26,$A5   ;8BDB0A|        |      ;
                       db $89,$DC,$DB,$02,$10,$AA,$76,$00   ;8BDB12|        |      ;
                       db $04,$10,$AA,$77,$00,$02,$10,$AA   ;8BDB1A|        |      ;
                       db $76,$00,$FF,$D6,$A4,$89,$0A,$DB   ;8BDB22|        |      ;
                       db $01,$10,$AA,$02,$00,$FF,$26,$A5   ;8BDB2A|        |      ;
                       db $89,$DC,$DB,$02,$10,$AA,$03,$00   ;8BDB32|        |      ;
                       db $04,$10,$AA,$04,$00,$02,$10,$AA   ;8BDB3A|        |      ;
                       db $03,$00,$FF,$D6,$A4,$89,$2A,$DB   ;8BDB42|        |      ;
                       db $01,$10,$AA,$02,$00,$FF,$26,$A5   ;8BDB4A|        |      ;
                       db $89,$DC,$DB,$06,$10,$AA,$03,$00   ;8BDB52|        |      ;
                       db $FF,$D6,$A4,$89,$4A,$DB,$01,$10   ;8BDB5A|        |      ;
                       db $AA,$02,$00,$FF,$26,$A5,$89,$DC   ;8BDB62|        |      ;
                       db $DB,$02,$10,$AA,$03,$00,$04,$10   ;8BDB6A|        |      ;
                       db $AA,$04,$00,$02,$10,$AA,$03,$00   ;8BDB72|        |      ;
                       db $FF,$D6,$A4,$89,$60,$DB,$01,$10   ;8BDB7A|        |      ;
                       db $AA,$01,$00,$FF,$26,$A5,$89,$DC   ;8BDB82|        |      ;
                       db $DB,$05,$10,$AA,$02,$00,$FF,$D6   ;8BDB8A|        |      ;
                       db $A4,$89,$80,$DB,$01,$10,$AA,$01   ;8BDB92|        |      ;
                       db $00,$FF,$26,$A5,$89,$DC,$DB,$05   ;8BDB9A|        |      ;
                       db $10,$AA,$02,$00,$FF,$D6,$A4,$89   ;8BDBA2|        |      ;
                       db $96,$DB,$01,$10,$AA,$01,$00,$FF   ;8BDBAA|        |      ;
                       db $26,$A5,$89,$DC,$DB,$02,$10,$AA   ;8BDBB2|        |      ;
                       db $02,$00,$04,$10,$AA,$03,$00,$02   ;8BDBBA|        |      ;
                       db $10,$AA,$02,$00,$FF,$D6,$A4,$89   ;8BDBC2|        |      ;
                       db $AC,$DB,$16,$10,$AA,$00,$00,$0C   ;8BDBCA|        |      ;
                       db $10,$AA,$01,$00,$FF,$D6,$A4,$89   ;8BDBD2|        |      ;
                       db $CC,$DB                           ;8BDBDA|        |      ;
 
       CODE_FL_8BDBDC:
                       JSL.L CODE_FL_8481D6                 ;8BDBDC|22D68184|8481D6;
                       CMP.W #$0004                         ;8BDBE0|C90400  |      ;
                       BCS +                                ;8BDBE3|B006    |8BDBEB;
                       JSL.L CODE_FL_89A509                 ;8BDBE5|2209A589|89A509;
                       CLC                                  ;8BDBE9|18      |      ;
                       RTL                                  ;8BDBEA|6B      |      ;
 
                     + SEC                                  ;8BDBEB|38      |      ;
                       RTL                                  ;8BDBEC|6B      |      ;
                       db $10,$F8,$DB,$6E,$00,$FF,$D6,$A4   ;8BDBED|        |      ;
                       db $89,$ED,$DB                       ;8BDBF5|        |      ;
                       LDA.W #$000C                         ;8BDBF8|A90C00  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BDBFB|202AE5  |8BE52A;
                       LDA.W #$0000                         ;8BDBFE|A90000  |      ;
                       JSL.L CODE_FL_84811F                 ;8BDC01|221F8184|84811F;
                       CLC                                  ;8BDC05|18      |      ;
                       ADC.W #$0014                         ;8BDC06|691400  |      ;
                       TAY                                  ;8BDC09|A8      |      ;
                       LDX.W #$0013                         ;8BDC0A|A21300  |      ;
                       JSR.W CODE_FN_8BDC35                 ;8BDC0D|2035DC  |8BDC35;
                       LDA.W #$0050                         ;8BDC10|A95000  |      ;
                       JSL.L CODE_FL_84811F                 ;8BDC13|221F8184|84811F;
                       CLC                                  ;8BDC17|18      |      ;
                       ADC.W #$0002                         ;8BDC18|690200  |      ;
                       TAY                                  ;8BDC1B|A8      |      ;
                       LDX.W #$003A                         ;8BDC1C|A23A00  |      ;
                       JSR.W CODE_FN_8BDC35                 ;8BDC1F|2035DC  |8BDC35;
                       LDA.W #$00A0                         ;8BDC22|A9A000  |      ;
                       JSL.L CODE_FL_84811F                 ;8BDC25|221F8184|84811F;
                       CLC                                  ;8BDC29|18      |      ;
                       ADC.W #$0017                         ;8BDC2A|691700  |      ;
                       TAY                                  ;8BDC2D|A8      |      ;
                       LDX.W #$004C                         ;8BDC2E|A24C00  |      ;
                       JSR.W CODE_FN_8BDC35                 ;8BDC31|2035DC  |8BDC35;
                       RTL                                  ;8BDC34|6B      |      ;
 
       CODE_FN_8BDC35:
                       TXA                                  ;8BDC35|8A      |      ;
                       CLC                                  ;8BDC36|18      |      ;
                       ADC.L $7ED4CA                        ;8BDC37|6FCAD47E|7ED4CA;
                       TAX                                  ;8BDC3B|AA      |      ;
                       TYA                                  ;8BDC3C|98      |      ;
                       CLC                                  ;8BDC3D|18      |      ;
                       ADC.L $7ED4CC                        ;8BDC3E|6FCCD47E|7ED4CC;
                       TAY                                  ;8BDC42|A8      |      ;
                       JSR.W CODE_FN_8BE542                 ;8BDC43|2042E5  |8BE542;
                       RTS                                  ;8BDC46|60      |      ;
                       db $18,$57,$DC,$54,$00,$14,$57,$DC   ;8BDC47|        |      ;
                       db $56,$00,$FF,$D6,$A4,$89,$47,$DC   ;8BDC4F|        |      ;
                       LDA.W #$0000                         ;8BDC57|A90000  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BDC5A|202AE5  |8BE52A;
                       LDA.W #$000D                         ;8BDC5D|A90D00  |      ;
                       CLC                                  ;8BDC60|18      |      ;
                       ADC.L $7ED4DF                        ;8BDC61|6FDFD47E|7ED4DF;
                       TAX                                  ;8BDC65|AA      |      ;
                       JSL.L CODE_FL_8480FD                 ;8BDC66|22FD8084|8480FD;
                       CLC                                  ;8BDC6A|18      |      ;
                       ADC.W #$001E                         ;8BDC6B|691E00  |      ;
                       CLC                                  ;8BDC6E|18      |      ;
                       ADC.L $7ED4E1                        ;8BDC6F|6FE1D47E|7ED4E1;
                       TAY                                  ;8BDC73|A8      |      ;
                       JSR.W CODE_FN_8BE542                 ;8BDC74|2042E5  |8BE542;
                       RTL                                  ;8BDC77|6B      |      ;
                       db $0C,$8D,$DC,$57,$00,$18,$8D,$DC   ;8BDC78|        |      ;
                       db $55,$00,$14,$8D,$DC,$57,$00,$FF   ;8BDC80|        |      ;
                       db $D6,$A4,$89,$7D,$DC               ;8BDC88|        |      ;
                       LDA.W #$0000                         ;8BDC8D|A90000  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BDC90|202AE5  |8BE52A;
                       LDA.W #$003E                         ;8BDC93|A93E00  |      ;
                       CLC                                  ;8BDC96|18      |      ;
                       ADC.L $7ED4DF                        ;8BDC97|6FDFD47E|7ED4DF;
                       TAX                                  ;8BDC9B|AA      |      ;
                       JSL.L CODE_FL_8480FD                 ;8BDC9C|22FD8084|8480FD;
                       CLC                                  ;8BDCA0|18      |      ;
                       ADC.W #$0014                         ;8BDCA1|691400  |      ;
                       CLC                                  ;8BDCA4|18      |      ;
                       ADC.L $7ED4E1                        ;8BDCA5|6FE1D47E|7ED4E1;
                       TAY                                  ;8BDCA9|A8      |      ;
                       JSR.W CODE_FN_8BE542                 ;8BDCAA|2042E5  |8BE542;
                       RTL                                  ;8BDCAD|6B      |      ;
 
       CODE_FN_8BDCAE:
                       PHP                                  ;8BDCAE|08      |      ;
                       REP #$30                             ;8BDCAF|C230    |      ;
                       PHB                                  ;8BDCB1|8B      |      ;
                       PHK                                  ;8BDCB2|4B      |      ;
                       PLB                                  ;8BDCB3|AB      |      ;
                       LDA.W #$0001                         ;8BDCB4|A90100  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BDCB7|202AE5  |8BE52A;
                       LDA.W #$8900                         ;8BDCBA|A90089  |      ;
                       STA.B $D6                            ;8BDCBD|85D6    |0000D6;
                       LDA.W #$8900                         ;8BDCBF|A90089  |      ;
                       STA.B $D5                            ;8BDCC2|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BDCC4|A9FFC1  |      ;
                       STA.B $D8                            ;8BDCC7|85D8    |0000D8;
                       LDA.W #$0058                         ;8BDCC9|A95800  |      ;
                       STA.B $D3                            ;8BDCCC|85D3    |0000D3;
                       LDX.W #$000E                         ;8BDCCE|A20E00  |      ;
 
       CODE_JP_8BDCD1:
                       LDA.L $7ED54E,X                      ;8BDCD1|BF4ED57E|7ED54E;
                       INC A                                ;8BDCD5|1A      |      ;
                       STA.L $7ED54E,X                      ;8BDCD6|9F4ED57E|7ED54E;
                       BPL +                                ;8BDCDA|1003    |8BDCDF;
                       JMP.W CODE_JP_8BDD77                 ;8BDCDC|4C77DD  |8BDD77;
 
                     + CMP.W #$012C                         ;8BDCDF|C92C01  |      ;
                       BMI CODE_8BDCFF                      ;8BDCE2|301B    |8BDCFF;
                       LDA.W #$0000                         ;8BDCE4|A90000  |      ;
                       STA.L $7ED54E,X                      ;8BDCE7|9F4ED57E|7ED54E;
                       STA.L $7ED55E,X                      ;8BDCEB|9F5ED57E|7ED55E;
                       LDA.L $7ED58E,X                      ;8BDCEF|BF8ED57E|7ED58E;
                       STA.L $7ED56E,X                      ;8BDCF3|9F6ED57E|7ED56E;
                       LDA.L $7ED59E,X                      ;8BDCF7|BF9ED57E|7ED59E;
                       STA.L $7ED57E,X                      ;8BDCFB|9F7ED57E|7ED57E;
 
          CODE_8BDCFF:
                       LDA.L $7ED55E,X                      ;8BDCFF|BF5ED57E|7ED55E;
                       TAY                                  ;8BDD03|A8      |      ;
                       LDA.W DATA8_8BDD81,Y                 ;8BDD04|B981DD  |8BDD81;
                       CMP.W #$8080                         ;8BDD07|C98080  |      ;
                       BNE +                                ;8BDD0A|D009    |8BDD15;
                       LDA.W #$0000                         ;8BDD0C|A90000  |      ;
                       STA.L $7ED55E,X                      ;8BDD0F|9F5ED57E|7ED55E;
                       BRA CODE_8BDCFF                      ;8BDD13|80EA    |8BDCFF;
 
                     + LDA.L $7ED55E,X                      ;8BDD15|BF5ED57E|7ED55E;
                       INC A                                ;8BDD19|1A      |      ;
                       INC A                                ;8BDD1A|1A      |      ;
                       STA.L $7ED55E,X                      ;8BDD1B|9F5ED57E|7ED55E;
                       LDA.W DATA8_8BDD81,Y                 ;8BDD1F|B981DD  |8BDD81;
                       BIT.W #$0080                         ;8BDD22|898000  |      ;
                       BNE +                                ;8BDD25|D005    |8BDD2C;
                       AND.W #$007F                         ;8BDD27|297F00  |      ;
                       BRA ++                               ;8BDD2A|8003    |8BDD2F;
 
                     + ORA.W #$FF80                         ;8BDD2C|0980FF  |      ;
 
                    ++ CLC                                  ;8BDD2F|18      |      ;
                       ADC.L $7ED56E,X                      ;8BDD30|7F6ED57E|7ED56E;
                       STA.L $7ED56E,X                      ;8BDD34|9F6ED57E|7ED56E;
                       LDA.W DATA8_8BDD82,Y                 ;8BDD38|B982DD  |8BDD82;
                       BIT.W #$0080                         ;8BDD3B|898000  |      ;
                       BNE +                                ;8BDD3E|D005    |8BDD45;
                       AND.W #$007F                         ;8BDD40|297F00  |      ;
                       BRA ++                               ;8BDD43|8003    |8BDD48;
 
                     + ORA.W #$FF80                         ;8BDD45|0980FF  |      ;
 
                    ++ CLC                                  ;8BDD48|18      |      ;
                       ADC.L $7ED57E,X                      ;8BDD49|7F7ED57E|7ED57E;
                       STA.L $7ED57E,X                      ;8BDD4D|9F7ED57E|7ED57E;
                       LDA.L $7ED56E,X                      ;8BDD51|BF6ED57E|7ED56E;
                       SEC                                  ;8BDD55|38      |      ;
                       SBC.L $7ED250                        ;8BDD56|EF50D27E|7ED250;
                       CLC                                  ;8BDD5A|18      |      ;
                       ADC.L $7ED54A                        ;8BDD5B|6F4AD57E|7ED54A;
                       STA.B $CF                            ;8BDD5F|85CF    |0000CF;
                       LDA.L $7ED57E,X                      ;8BDD61|BF7ED57E|7ED57E;
                       SEC                                  ;8BDD65|38      |      ;
                       SBC.L $7ED252                        ;8BDD66|EF52D27E|7ED252;
                       CLC                                  ;8BDD6A|18      |      ;
                       ADC.L $7ED54C                        ;8BDD6B|6F4CD57E|7ED54C;
                       STA.B $D1                            ;8BDD6F|85D1    |0000D1;
                       PHX                                  ;8BDD71|DA      |      ;
                       JSL.L CODE_FL_80BC55                 ;8BDD72|2255BC80|80BC55;
                       PLX                                  ;8BDD76|FA      |      ;
 
       CODE_JP_8BDD77:
                       DEX                                  ;8BDD77|CA      |      ;
                       DEX                                  ;8BDD78|CA      |      ;
                       BMI +                                ;8BDD79|3003    |8BDD7E;
                       JMP.W CODE_JP_8BDCD1                 ;8BDD7B|4CD1DC  |8BDCD1;
 
                     + PLB                                  ;8BDD7E|AB      |      ;
                       PLP                                  ;8BDD7F|28      |      ;
                       RTS                                  ;8BDD80|60      |      ;
 
         DATA8_8BDD81:
                       db $00                               ;8BDD81|        |      ;
 
         DATA8_8BDD82:
                       db $01,$00,$00,$FF,$00,$00,$00,$00   ;8BDD82|        |      ;
                       db $01,$00,$00,$00,$00,$00,$00,$00   ;8BDD8A|        |      ;
                       db $01,$00,$00,$FF,$01,$00,$01,$00   ;8BDD92|        |      ;
                       db $00,$00,$00,$00,$01,$00,$00,$01   ;8BDD9A|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BDDA2|        |      ;
                       db $00,$01,$00,$00,$00,$01,$FF,$00   ;8BDDAA|        |      ;
                       db $00,$00,$00,$00,$00,$01,$00,$00   ;8BDDB2|        |      ;
                       db $00,$00,$01,$00,$00,$00,$01,$00   ;8BDDBA|        |      ;
                       db $00,$00,$00,$00,$01,$00,$00,$FF   ;8BDDC2|        |      ;
                       db $00,$00,$00,$00,$00,$00,$01,$FF   ;8BDDCA|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BDDD2|        |      ;
                       db $01,$00,$00,$00,$00,$00,$01,$00   ;8BDDDA|        |      ;
                       db $01,$01,$00,$00,$00,$80,$80       ;8BDDE2|        |      ;
 
       CODE_FN_8BDDE9:
                       PHP                                  ;8BDDE9|08      |      ;
                       REP #$30                             ;8BDDEA|C230    |      ;
                       PHB                                  ;8BDDEC|8B      |      ;
                       PHK                                  ;8BDDED|4B      |      ;
                       PLB                                  ;8BDDEE|AB      |      ;
                       LDX.W #$000E                         ;8BDDEF|A20E00  |      ;
 
                     - LDA.L DATA8_8BDE34,X                 ;8BDDF2|BF34DE8B|8BDE34;
                       AND.W #$00FF                         ;8BDDF6|29FF00  |      ;
                       EOR.W #$FFFF                         ;8BDDF9|49FFFF  |      ;
                       INC A                                ;8BDDFC|1A      |      ;
                       STA.L $7ED54E,X                      ;8BDDFD|9F4ED57E|7ED54E;
                       LDA.W #$0000                         ;8BDE01|A90000  |      ;
                       STA.L $7ED55E,X                      ;8BDE04|9F5ED57E|7ED55E;
                       LDA.L DATA8_8BDE33,X                 ;8BDE08|BF33DE8B|8BDE33;
                       BIT.W #$0080                         ;8BDE0C|898000  |      ;
                       BNE UNREACH_8BDE16                   ;8BDE0F|D005    |8BDE16;
                       AND.W #$007F                         ;8BDE11|297F00  |      ;
                       BRA +                                ;8BDE14|8003    |8BDE19;
 
       UNREACH_8BDE16:
                       db $09,$80,$FF                       ;8BDE16|        |      ;
 
                     + STA.L $7ED56E,X                      ;8BDE19|9F6ED57E|7ED56E;
                       STA.L $7ED58E,X                      ;8BDE1D|9F8ED57E|7ED58E;
                       LDA.W #$FFF6                         ;8BDE21|A9F6FF  |      ;
                       STA.L $7ED57E,X                      ;8BDE24|9F7ED57E|7ED57E;
                       STA.L $7ED59E,X                      ;8BDE28|9F9ED57E|7ED59E;
                       DEX                                  ;8BDE2C|CA      |      ;
                       DEX                                  ;8BDE2D|CA      |      ;
                       BPL -                                ;8BDE2E|10C2    |8BDDF2;
                       PLB                                  ;8BDE30|AB      |      ;
                       PLP                                  ;8BDE31|28      |      ;
                       RTS                                  ;8BDE32|60      |      ;
 
         DATA8_8BDE33:
                       db $15                               ;8BDE33|        |      ;
 
         DATA8_8BDE34:
                       db $40,$1B,$E1,$21,$92,$27,$23,$2D   ;8BDE34|        |      ;
                       db $D4,$33,$55,$39,$A6,$3F,$77       ;8BDE3C|        |      ;
 
       CODE_FN_8BDE43:
                       PHP                                  ;8BDE43|08      |      ;
                       REP #$30                             ;8BDE44|C230    |      ;
                       PHB                                  ;8BDE46|8B      |      ;
                       PHK                                  ;8BDE47|4B      |      ;
                       PLB                                  ;8BDE48|AB      |      ;
                       LDA.W #$0003                         ;8BDE49|A90300  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BDE4C|202AE5  |8BE52A;
                       LDA.W #$8900                         ;8BDE4F|A90089  |      ;
                       STA.B $D6                            ;8BDE52|85D6    |0000D6;
                       LDA.W #$8900                         ;8BDE54|A90089  |      ;
                       STA.B $D5                            ;8BDE57|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BDE59|A9FFC1  |      ;
                       STA.B $D8                            ;8BDE5C|85D8    |0000D8;
                       LDA.W #$0053                         ;8BDE5E|A95300  |      ;
                       STA.B $D3                            ;8BDE61|85D3    |0000D3;
                       LDA.L $7ED515                        ;8BDE63|AF15D57E|7ED515;
                       CLC                                  ;8BDE67|18      |      ;
                       ADC.W #$0080                         ;8BDE68|698000  |      ;
                       STA.L $7ED515                        ;8BDE6B|8F15D57E|7ED515;
                       LDA.L $7ED516                        ;8BDE6F|AF16D57E|7ED516;
                       AND.W #$007F                         ;8BDE73|297F00  |      ;
                       ASL A                                ;8BDE76|0A      |      ;
                       TAX                                  ;8BDE77|AA      |      ;
                       JSR.W CODE_FN_8BDEAE                 ;8BDE78|20AEDE  |8BDEAE;
                       LDA.L $7ED516                        ;8BDE7B|AF16D57E|7ED516;
                       CLC                                  ;8BDE7F|18      |      ;
                       ADC.W #$0020                         ;8BDE80|692000  |      ;
                       AND.W #$007F                         ;8BDE83|297F00  |      ;
                       ASL A                                ;8BDE86|0A      |      ;
                       TAX                                  ;8BDE87|AA      |      ;
                       JSR.W CODE_FN_8BDEAE                 ;8BDE88|20AEDE  |8BDEAE;
                       LDA.L $7ED516                        ;8BDE8B|AF16D57E|7ED516;
                       CLC                                  ;8BDE8F|18      |      ;
                       ADC.W #$0040                         ;8BDE90|694000  |      ;
                       AND.W #$007F                         ;8BDE93|297F00  |      ;
                       ASL A                                ;8BDE96|0A      |      ;
                       TAX                                  ;8BDE97|AA      |      ;
                       JSR.W CODE_FN_8BDEAE                 ;8BDE98|20AEDE  |8BDEAE;
                       LDA.L $7ED516                        ;8BDE9B|AF16D57E|7ED516;
                       CLC                                  ;8BDE9F|18      |      ;
                       ADC.W #$0060                         ;8BDEA0|696000  |      ;
                       AND.W #$007F                         ;8BDEA3|297F00  |      ;
                       ASL A                                ;8BDEA6|0A      |      ;
                       TAX                                  ;8BDEA7|AA      |      ;
                       JSR.W CODE_FN_8BDEAE                 ;8BDEA8|20AEDE  |8BDEAE;
                       PLB                                  ;8BDEAB|AB      |      ;
                       PLP                                  ;8BDEAC|28      |      ;
                       RTS                                  ;8BDEAD|60      |      ;
 
       CODE_FN_8BDEAE:
                       LDA.W DATA8_8BDEF3,X                 ;8BDEAE|BDF3DE  |8BDEF3;
                       BIT.W #$0080                         ;8BDEB1|898000  |      ;
                       BNE +                                ;8BDEB4|D005    |8BDEBB;
                       AND.W #$007F                         ;8BDEB6|297F00  |      ;
                       BRA ++                               ;8BDEB9|8003    |8BDEBE;
 
                     + ORA.W #$FF80                         ;8BDEBB|0980FF  |      ;
 
                    ++ CLC                                  ;8BDEBE|18      |      ;
                       ADC.W #$0030                         ;8BDEBF|693000  |      ;
                       CLC                                  ;8BDEC2|18      |      ;
                       ADC.L $7ED50D                        ;8BDEC3|6F0DD57E|7ED50D;
                       SEC                                  ;8BDEC7|38      |      ;
                       SBC.L $7ED250                        ;8BDEC8|EF50D27E|7ED250;
                       STA.B $CF                            ;8BDECC|85CF    |0000CF;
                       LDA.W DATA8_8BDEF4,X                 ;8BDECE|BDF4DE  |8BDEF4;
                       BIT.W #$0080                         ;8BDED1|898000  |      ;
                       BNE +                                ;8BDED4|D005    |8BDEDB;
                       AND.W #$007F                         ;8BDED6|297F00  |      ;
                       BRA ++                               ;8BDED9|8003    |8BDEDE;
 
                     + ORA.W #$FF80                         ;8BDEDB|0980FF  |      ;
 
                    ++ CLC                                  ;8BDEDE|18      |      ;
                       ADC.W #$0008                         ;8BDEDF|690800  |      ;
                       CLC                                  ;8BDEE2|18      |      ;
                       ADC.L $7ED50F                        ;8BDEE3|6F0FD57E|7ED50F;
                       SEC                                  ;8BDEE7|38      |      ;
                       SBC.L $7ED252                        ;8BDEE8|EF52D27E|7ED252;
                       STA.B $D1                            ;8BDEEC|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BDEEE|2255BC80|80BC55;
                       RTS                                  ;8BDEF2|60      |      ;
 
         DATA8_8BDEF3:
                       db $20                               ;8BDEF3|        |      ;
 
         DATA8_8BDEF4:
                       db $00,$20,$00,$20,$00,$20,$01,$1F   ;8BDEF4|        |      ;
                       db $01,$1F,$02,$1F,$02,$1E,$02,$1E   ;8BDEFC|        |      ;
                       db $03,$1D,$03,$1C,$04,$1B,$04,$1B   ;8BDF04|        |      ;
                       db $04,$1A,$05,$19,$05,$18,$05,$16   ;8BDF0C|        |      ;
                       db $06,$15,$06,$14,$06,$13,$06,$12   ;8BDF14|        |      ;
                       db $07,$10,$07,$0F,$07,$0D,$07,$0C   ;8BDF1C|        |      ;
                       db $07,$0A,$08,$09,$08,$07,$08,$06   ;8BDF24|        |      ;
                       db $08,$04,$08,$03,$08,$01,$08,$00   ;8BDF2C|        |      ;
                       db $08,$FF,$08,$FD,$08,$FC,$08,$FA   ;8BDF34|        |      ;
                       db $08,$F9,$08,$F7,$08,$F6,$08,$F4   ;8BDF3C|        |      ;
                       db $07,$F3,$07,$F1,$07,$F0,$07,$EE   ;8BDF44|        |      ;
                       db $07,$ED,$06,$EC,$06,$EB,$06,$EA   ;8BDF4C|        |      ;
                       db $06,$E8,$05,$E7,$05,$E6,$05,$E5   ;8BDF54|        |      ;
                       db $04,$E5,$04,$E4,$04,$E3,$03,$E2   ;8BDF5C|        |      ;
                       db $03,$E2,$02,$E1,$02,$E1,$02,$E1   ;8BDF64|        |      ;
                       db $01,$E0,$01,$E0,$00,$E0,$00,$E0   ;8BDF6C|        |      ;
                       db $00,$E0,$00,$E0,$00,$E0,$FF,$E1   ;8BDF74|        |      ;
                       db $FF,$E1,$FE,$E1,$FE,$E2,$FE,$E2   ;8BDF7C|        |      ;
                       db $FD,$E3,$FD,$E4,$FC,$E5,$FC,$E5   ;8BDF84|        |      ;
                       db $FC,$E6,$FB,$E7,$FB,$E8,$FB,$EA   ;8BDF8C|        |      ;
                       db $FA,$EB,$FA,$EC,$FA,$ED,$FA,$EE   ;8BDF94|        |      ;
                       db $F9,$F0,$F9,$F1,$F9,$F3,$F9,$F4   ;8BDF9C|        |      ;
                       db $F9,$F6,$F8,$F7,$F8,$F9,$F8,$FA   ;8BDFA4|        |      ;
                       db $F8,$FC,$F8,$FD,$F8,$FF,$F8,$00   ;8BDFAC|        |      ;
                       db $F8,$01,$F8,$03,$F8,$04,$F8,$06   ;8BDFB4|        |      ;
                       db $F8,$07,$F8,$09,$F8,$0A,$F8,$0C   ;8BDFBC|        |      ;
                       db $F9,$0D,$F9,$0F,$F9,$10,$F9,$12   ;8BDFC4|        |      ;
                       db $F9,$13,$FA,$14,$FA,$15,$FA,$16   ;8BDFCC|        |      ;
                       db $FA,$18,$FB,$19,$FB,$1A,$FB,$1B   ;8BDFD4|        |      ;
                       db $FC,$1B,$FC,$1C,$FC,$1D,$FD,$1E   ;8BDFDC|        |      ;
                       db $FD,$1E,$FE,$1F,$FE,$1F,$FE,$1F   ;8BDFE4|        |      ;
                       db $FF,$20,$FF,$20,$00,$20,$00       ;8BDFEC|        |      ;
 
       CODE_FN_8BDFF3:
                       LDA.W #$0004                         ;8BDFF3|A90400  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BDFF6|202AE5  |8BE52A;
                       LDA.W #$8900                         ;8BDFF9|A90089  |      ;
                       STA.B $D6                            ;8BDFFC|85D6    |0000D6;
                       LDA.W #$8900                         ;8BDFFE|A90089  |      ;
                       STA.B $D5                            ;8BE001|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BE003|A9FFC1  |      ;
                       STA.B $D8                            ;8BE006|85D8    |0000D8;
                       LDA.L $7ED509                        ;8BE008|AF09D57E|7ED509;
                       DEC A                                ;8BE00C|3A      |      ;
                       STA.L $7ED509                        ;8BE00D|8F09D57E|7ED509;
                       BPL +                                ;8BE011|1022    |8BE035;
                       JSL.L CODE_FL_8481D6                 ;8BE013|22D68184|8481D6;
                       AND.W #$000F                         ;8BE017|290F00  |      ;
                       TAX                                  ;8BE01A|AA      |      ;
                       LDA.L DATA8_8BE0D9,X                 ;8BE01B|BFD9E08B|8BE0D9;
                       AND.W #$00FF                         ;8BE01F|29FF00  |      ;
                       STA.L $7ED50B                        ;8BE022|8F0BD57E|7ED50B;
                       JSL.L CODE_FL_8481D6                 ;8BE026|22D68184|8481D6;
                       AND.W #$007F                         ;8BE02A|297F00  |      ;
                       CLC                                  ;8BE02D|18      |      ;
                       ADC.W #$000D                         ;8BE02E|690D00  |      ;
                       STA.L $7ED509                        ;8BE031|8F09D57E|7ED509;
 
                     + LDA.L $7ED509                        ;8BE035|AF09D57E|7ED509;
                       CMP.W #$000D                         ;8BE039|C90D00  |      ;
                       BPL +                                ;8BE03C|1041    |8BE07F;
                       ASL A                                ;8BE03E|0A      |      ;
                       TAX                                  ;8BE03F|AA      |      ;
                       LDA.L DATA8_8BE0E9,X                 ;8BE040|BFE9E08B|8BE0E9;
                       STA.B $D3                            ;8BE044|85D3    |0000D3;
                       LDA.L $7ED50B                        ;8BE046|AF0BD57E|7ED50B;
                       TAX                                  ;8BE04A|AA      |      ;
                       LDA.L DATA8_8BE103,X                 ;8BE04B|BF03E18B|8BE103;
                       CLC                                  ;8BE04F|18      |      ;
                       ADC.L $7ED505                        ;8BE050|6F05D57E|7ED505;
                       SEC                                  ;8BE054|38      |      ;
                       SBC.L $7ED250                        ;8BE055|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE059|85CF    |0000CF;
                       CPX.W #$0008                         ;8BE05B|E00800  |      ;
                       BPL ++                               ;8BE05E|100B    |8BE06B;
                       JSL.L CODE_FL_8480FD                 ;8BE060|22FD8084|8480FD;
                       CLC                                  ;8BE064|18      |      ;
                       ADC.L DATA8_8BE105,X                 ;8BE065|7F05E18B|8BE105;
                       BRA +++                              ;8BE069|8004    |8BE06F;
 
                    ++ LDA.L DATA8_8BE105,X                 ;8BE06B|BF05E18B|8BE105;
 
                   +++ CLC                                  ;8BE06F|18      |      ;
                       ADC.L $7ED507                        ;8BE070|6F07D57E|7ED507;
                       SEC                                  ;8BE074|38      |      ;
                       SBC.L $7ED252                        ;8BE075|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE079|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE07B|2255BC80|80BC55;
 
                     + LDA.W #$0024                         ;8BE07F|A92400  |      ;
                       CLC                                  ;8BE082|18      |      ;
                       ADC.L $7ED505                        ;8BE083|6F05D57E|7ED505;
                       SEC                                  ;8BE087|38      |      ;
                       SBC.L $7ED250                        ;8BE088|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE08C|85CF    |0000CF;
                       JSL.L CODE_FL_8480FD                 ;8BE08E|22FD8084|8480FD;
                       CLC                                  ;8BE092|18      |      ;
                       ADC.W #$0021                         ;8BE093|692100  |      ;
                       CLC                                  ;8BE096|18      |      ;
                       ADC.L $7ED507                        ;8BE097|6F07D57E|7ED507;
                       SEC                                  ;8BE09B|38      |      ;
                       SBC.L $7ED252                        ;8BE09C|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE0A0|85D1    |0000D1;
                       LDA.W #$0059                         ;8BE0A2|A95900  |      ;
                       STA.B $D3                            ;8BE0A5|85D3    |0000D3;
                       JSL.L CODE_FL_80BC55                 ;8BE0A7|2255BC80|80BC55;
                       JSL.L CODE_FL_8480FD                 ;8BE0AB|22FD8084|8480FD;
                       CLC                                  ;8BE0AF|18      |      ;
                       ADC.W #$0002                         ;8BE0B0|690200  |      ;
                       ASL A                                ;8BE0B3|0A      |      ;
                       TAX                                  ;8BE0B4|AA      |      ;
                       LDA.L DATA8_8BE0CF,X                 ;8BE0B5|BFCFE08B|8BE0CF;
                       STA.B $D3                            ;8BE0B9|85D3    |0000D3;
                       LDA.W #$0035                         ;8BE0BB|A93500  |      ;
                       CLC                                  ;8BE0BE|18      |      ;
                       ADC.L $7ED507                        ;8BE0BF|6F07D57E|7ED507;
                       SEC                                  ;8BE0C3|38      |      ;
                       SBC.L $7ED252                        ;8BE0C4|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE0C8|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE0CA|2255BC80|80BC55;
                       RTS                                  ;8BE0CE|60      |      ;
 
         DATA8_8BE0CF:
                       db $5C,$00,$5B,$00,$5A,$00,$5A,$00   ;8BE0CF|        |      ;
                       db $5A,$00                           ;8BE0D7|        |      ;
 
         DATA8_8BE0D9:
                       db $00,$04,$08,$0C,$00,$04,$08,$0C   ;8BE0D9|        |      ;
                       db $00,$04,$08,$0C,$00,$04,$08,$0C   ;8BE0E1|        |      ;
 
         DATA8_8BE0E9:
                       db $5D,$00,$5D,$00,$5F,$00,$5F,$00   ;8BE0E9|        |      ;
                       db $5F,$00,$5F,$00,$5E,$00,$5E,$00   ;8BE0F1|        |      ;
                       db $5E,$00,$5E,$00,$5D,$00,$5D,$00   ;8BE0F9|        |      ;
                       db $5D,$00                           ;8BE101|        |      ;
 
         DATA8_8BE103:
                       db $1C,$00                           ;8BE103|        |      ;
 
         DATA8_8BE105:
                       db $26,$00,$20,$00,$2A,$00,$3F,$00   ;8BE105|        |      ;
                       db $3E,$00,$1E,$00,$43,$00           ;8BE10D|        |      ;
 
       CODE_FN_8BE113:
                       PHP                                  ;8BE113|08      |      ;
                       REP #$30                             ;8BE114|C230    |      ;
                       PHB                                  ;8BE116|8B      |      ;
                       PHK                                  ;8BE117|4B      |      ;
                       PLB                                  ;8BE118|AB      |      ;
                       LDA.W #$0005                         ;8BE119|A90500  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BE11C|202AE5  |8BE52A;
                       LDA.W #$8900                         ;8BE11F|A90089  |      ;
                       STA.B $D6                            ;8BE122|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE124|A90089  |      ;
                       STA.B $D5                            ;8BE127|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BE129|A9FFC1  |      ;
                       STA.B $D8                            ;8BE12C|85D8    |0000D8;
                       LDA.L $7ED5B4                        ;8BE12E|AFB4D57E|7ED5B4;
                       DEC A                                ;8BE132|3A      |      ;
                       STA.L $7ED5B4                        ;8BE133|8FB4D57E|7ED5B4;
                       BPL +                                ;8BE137|1022    |8BE15B;
                       JSL.L CODE_FL_8481D6                 ;8BE139|22D68184|8481D6;
                       AND.W #$000F                         ;8BE13D|290F00  |      ;
                       TAX                                  ;8BE140|AA      |      ;
                       LDA.L DATA8_8BE214,X                 ;8BE141|BF14E28B|8BE214;
                       AND.W #$00FF                         ;8BE145|29FF00  |      ;
                       STA.L $7ED5B6                        ;8BE148|8FB6D57E|7ED5B6;
                       JSL.L CODE_FL_8481D6                 ;8BE14C|22D68184|8481D6;
                       AND.W #$007F                         ;8BE150|297F00  |      ;
                       CLC                                  ;8BE153|18      |      ;
                       ADC.W #$0025                         ;8BE154|692500  |      ;
                       STA.L $7ED5B4                        ;8BE157|8FB4D57E|7ED5B4;
 
                     + LDA.L $7ED5B4                        ;8BE15B|AFB4D57E|7ED5B4;
                       CMP.W #$0025                         ;8BE15F|C92500  |      ;
                       BPL +                                ;8BE162|1031    |8BE195;
                       ASL A                                ;8BE164|0A      |      ;
                       TAX                                  ;8BE165|AA      |      ;
                       LDA.L DATA8_8BE224,X                 ;8BE166|BF24E28B|8BE224;
                       STA.B $D3                            ;8BE16A|85D3    |0000D3;
                       LDA.L $7ED5B6                        ;8BE16C|AFB6D57E|7ED5B6;
                       TAX                                  ;8BE170|AA      |      ;
                       LDA.L DATA8_8BE26E,X                 ;8BE171|BF6EE28B|8BE26E;
                       CLC                                  ;8BE175|18      |      ;
                       ADC.L $7ED5AE                        ;8BE176|6FAED57E|7ED5AE;
                       SEC                                  ;8BE17A|38      |      ;
                       SBC.L $7ED250                        ;8BE17B|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE17F|85CF    |0000CF;
                       LDA.L DATA8_8BE270,X                 ;8BE181|BF70E28B|8BE270;
                       CLC                                  ;8BE185|18      |      ;
                       ADC.L $7ED5B0                        ;8BE186|6FB0D57E|7ED5B0;
                       SEC                                  ;8BE18A|38      |      ;
                       SBC.L $7ED252                        ;8BE18B|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE18F|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE191|2255BC80|80BC55;
 
                     + LDA.L $7ED5B2                        ;8BE195|AFB2D57E|7ED5B2;
                       CMP.W #$000E                         ;8BE199|C90E00  |      ;
                       BEQ +                                ;8BE19C|F002    |8BE1A0;
                       BPL ++                               ;8BE19E|1007    |8BE1A7;
 
                     + CMP.W #$0000                         ;8BE1A0|C90000  |      ;
                       BEQ ++                               ;8BE1A3|F002    |8BE1A7;
                       BPL +                                ;8BE1A5|1005    |8BE1AC;
 
                    ++ LDA.W #$000E                         ;8BE1A7|A90E00  |      ;
                       BRA ++                               ;8BE1AA|8001    |8BE1AD;
 
                     + DEC A                                ;8BE1AC|3A      |      ;
 
                    ++ STA.L $7ED5B2                        ;8BE1AD|8FB2D57E|7ED5B2;
                       ASL A                                ;8BE1B1|0A      |      ;
                       TAX                                  ;8BE1B2|AA      |      ;
                       LDA.L DATA8_8BE1F6,X                 ;8BE1B3|BFF6E18B|8BE1F6;
                       STA.B $D3                            ;8BE1B7|85D3    |0000D3;
                       LDX.W #$003A                         ;8BE1B9|A23A00  |      ;
                       LDY.W #$0020                         ;8BE1BC|A02000  |      ;
                       JSR.W CODE_FN_8BE1D7                 ;8BE1BF|20D7E1  |8BE1D7;
                       LDX.W #$001C                         ;8BE1C2|A21C00  |      ;
                       LDY.W #$0031                         ;8BE1C5|A03100  |      ;
                       JSR.W CODE_FN_8BE1D7                 ;8BE1C8|20D7E1  |8BE1D7;
                       LDX.W #$0044                         ;8BE1CB|A24400  |      ;
                       LDY.W #$002F                         ;8BE1CE|A02F00  |      ;
                       JSR.W CODE_FN_8BE1D7                 ;8BE1D1|20D7E1  |8BE1D7;
                       PLB                                  ;8BE1D4|AB      |      ;
                       PLP                                  ;8BE1D5|28      |      ;
                       RTS                                  ;8BE1D6|60      |      ;
 
       CODE_FN_8BE1D7:
                       TXA                                  ;8BE1D7|8A      |      ;
                       CLC                                  ;8BE1D8|18      |      ;
                       ADC.L $7ED5AE                        ;8BE1D9|6FAED57E|7ED5AE;
                       SEC                                  ;8BE1DD|38      |      ;
                       SBC.L $7ED250                        ;8BE1DE|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE1E2|85CF    |0000CF;
                       TYA                                  ;8BE1E4|98      |      ;
                       CLC                                  ;8BE1E5|18      |      ;
                       ADC.L $7ED5B0                        ;8BE1E6|6FB0D57E|7ED5B0;
                       SEC                                  ;8BE1EA|38      |      ;
                       SBC.L $7ED252                        ;8BE1EB|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE1EF|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE1F1|2255BC80|80BC55;
                       RTS                                  ;8BE1F5|60      |      ;
 
         DATA8_8BE1F6:
                       db $62,$00,$62,$00,$62,$00,$62,$00   ;8BE1F6|        |      ;
                       db $62,$00,$61,$00,$61,$00,$61,$00   ;8BE1FE|        |      ;
                       db $61,$00,$61,$00,$60,$00,$60,$00   ;8BE206|        |      ;
                       db $60,$00,$60,$00,$60,$00           ;8BE20E|        |      ;
 
         DATA8_8BE214:
                       db $00,$04,$08,$00,$04,$08,$00,$04   ;8BE214|        |      ;
                       db $08,$00,$04,$08,$00,$04,$08,$00   ;8BE21C|        |      ;
 
         DATA8_8BE224:
                       db $65,$00,$65,$00,$65,$00,$65,$00   ;8BE224|        |      ;
                       db $65,$00,$65,$00,$65,$00,$65,$00   ;8BE22C|        |      ;
                       db $65,$00,$64,$00,$64,$00,$64,$00   ;8BE234|        |      ;
                       db $64,$00,$64,$00,$64,$00,$64,$00   ;8BE23C|        |      ;
                       db $64,$00,$64,$00,$64,$00,$64,$00   ;8BE244|        |      ;
                       db $64,$00,$63,$00,$63,$00,$63,$00   ;8BE24C|        |      ;
                       db $63,$00,$63,$00,$63,$00,$63,$00   ;8BE254|        |      ;
                       db $63,$00,$63,$00,$63,$00,$63,$00   ;8BE25C|        |      ;
                       db $63,$00,$63,$00,$63,$00,$63,$00   ;8BE264|        |      ;
                       db $63,$00                           ;8BE26C|        |      ;
 
         DATA8_8BE26E:
                       db $24,$00                           ;8BE26E|        |      ;
 
         DATA8_8BE270:
                       db $3C,$00,$3A,$00,$38,$00,$3D,$00   ;8BE270|        |      ;
                       db $35,$00                           ;8BE278|        |      ;
 
       CODE_FN_8BE27A:
                       PHP                                  ;8BE27A|08      |      ;
                       REP #$30                             ;8BE27B|C230    |      ;
                       PHB                                  ;8BE27D|8B      |      ;
                       PHK                                  ;8BE27E|4B      |      ;
                       PLB                                  ;8BE27F|AB      |      ;
                       LDA.W #$0007                         ;8BE280|A90700  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BE283|202AE5  |8BE52A;
                       LDA.W #$8900                         ;8BE286|A90089  |      ;
                       STA.B $D6                            ;8BE289|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE28B|A90089  |      ;
                       STA.B $D5                            ;8BE28E|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BE290|A9FFC1  |      ;
                       STA.B $D8                            ;8BE293|85D8    |0000D8;
                       LDA.L $7ED5C2                        ;8BE295|AFC2D57E|7ED5C2;
                       CMP.W #$0000                         ;8BE299|C90000  |      ;
                       BMI +                                ;8BE29C|3005    |8BE2A3;
                       CMP.W #$003F                         ;8BE29E|C93F00  |      ;
                       BMI ++                               ;8BE2A1|3005    |8BE2A8;
 
                     + LDA.W #$0000                         ;8BE2A3|A90000  |      ;
                       BRA +                                ;8BE2A6|8001    |8BE2A9;
 
                    ++ INC A                                ;8BE2A8|1A      |      ;
 
                     + STA.L $7ED5C2                        ;8BE2A9|8FC2D57E|7ED5C2;
                       LDA.L $7ED5C4                        ;8BE2AD|AFC4D57E|7ED5C4;
                       CMP.W #$0000                         ;8BE2B1|C90000  |      ;
                       BMI +                                ;8BE2B4|3005    |8BE2BB;
                       CMP.W #$004F                         ;8BE2B6|C94F00  |      ;
                       BMI ++                               ;8BE2B9|3005    |8BE2C0;
 
                     + LDA.W #$0000                         ;8BE2BB|A90000  |      ;
                       BRA +                                ;8BE2BE|8001    |8BE2C1;
 
                    ++ INC A                                ;8BE2C0|1A      |      ;
 
                     + STA.L $7ED5C4                        ;8BE2C1|8FC4D57E|7ED5C4;
                       LDA.L $7ED5C2                        ;8BE2C5|AFC2D57E|7ED5C2;
                       LSR A                                ;8BE2C9|4A      |      ;
                       TAX                                  ;8BE2CA|AA      |      ;
                       LDA.W DATA8_8BE42B,X                 ;8BE2CB|BD2BE4  |8BE42B;
                       BIT.W #$0080                         ;8BE2CE|898000  |      ;
                       BNE +                                ;8BE2D1|D005    |8BE2D8;
                       AND.W #$007F                         ;8BE2D3|297F00  |      ;
                       BRA ++                               ;8BE2D6|8003    |8BE2DB;
 
                     + ORA.W #$FF80                         ;8BE2D8|0980FF  |      ;
 
                    ++ STA.B $00                            ;8BE2DB|8500    |000000;
                       TXA                                  ;8BE2DD|8A      |      ;
                       CLC                                  ;8BE2DE|18      |      ;
                       ADC.W #$0018                         ;8BE2DF|691800  |      ;
                       AND.W #$003F                         ;8BE2E2|293F00  |      ;
                       TAX                                  ;8BE2E5|AA      |      ;
                       LDA.W DATA8_8BE42B,X                 ;8BE2E6|BD2BE4  |8BE42B;
                       BIT.W #$0080                         ;8BE2E9|898000  |      ;
                       BNE +                                ;8BE2EC|D005    |8BE2F3;
                       AND.W #$007F                         ;8BE2EE|297F00  |      ;
                       BRA ++                               ;8BE2F1|8003    |8BE2F6;
 
                     + ORA.W #$FF80                         ;8BE2F3|0980FF  |      ;
 
                    ++ STA.B $02                            ;8BE2F6|8502    |000002;
                       LDA.L $7ED5C4                        ;8BE2F8|AFC4D57E|7ED5C4;
                       LSR A                                ;8BE2FC|4A      |      ;
                       TAX                                  ;8BE2FD|AA      |      ;
                       LDA.W DATA8_8BE44B,X                 ;8BE2FE|BD4BE4  |8BE44B;
                       BIT.W #$0080                         ;8BE301|898000  |      ;
                       BNE +                                ;8BE304|D005    |8BE30B;
                       AND.W #$007F                         ;8BE306|297F00  |      ;
                       BRA ++                               ;8BE309|8003    |8BE30E;
 
                     + ORA.W #$FF80                         ;8BE30B|0980FF  |      ;
 
                    ++ STA.B $04                            ;8BE30E|8504    |000004;
                       LDA.L $7ED5C6                        ;8BE310|AFC6D57E|7ED5C6;
                       DEC A                                ;8BE314|3A      |      ;
                       STA.L $7ED5C6                        ;8BE315|8FC6D57E|7ED5C6;
                       BPL +                                ;8BE319|1021    |8BE33C;
                       JSL.L CODE_FL_8481D6                 ;8BE31B|22D68184|8481D6;
                       AND.W #$000F                         ;8BE31F|290F00  |      ;
                       TAX                                  ;8BE322|AA      |      ;
                       LDA.W DATA8_8BE3E5,X                 ;8BE323|BDE5E3  |8BE3E5;
                       AND.W #$00FF                         ;8BE326|29FF00  |      ;
                       STA.L $7ED5C8                        ;8BE329|8FC8D57E|7ED5C8;
                       JSL.L CODE_FL_8481D6                 ;8BE32D|22D68184|8481D6;
                       AND.W #$001F                         ;8BE331|291F00  |      ;
                       CLC                                  ;8BE334|18      |      ;
                       ADC.W #$000B                         ;8BE335|690B00  |      ;
                       STA.L $7ED5C6                        ;8BE338|8FC6D57E|7ED5C6;
 
                     + LDA.L $7ED5C6                        ;8BE33C|AFC6D57E|7ED5C6;
                       CMP.W #$000B                         ;8BE340|C90B00  |      ;
                       BPL +                                ;8BE343|104D    |8BE392;
                       ASL A                                ;8BE345|0A      |      ;
                       TAX                                  ;8BE346|AA      |      ;
                       LDA.W DATA8_8BE415,X                 ;8BE347|BD15E4  |8BE415;
                       STA.B $D3                            ;8BE34A|85D3    |0000D3;
                       LDA.L $7ED5C8                        ;8BE34C|AFC8D57E|7ED5C8;
                       TAX                                  ;8BE350|AA      |      ;
                       LDA.W DATA8_8BE3F5,X                 ;8BE351|BDF5E3  |8BE3F5;
                       CLC                                  ;8BE354|18      |      ;
                       ADC.L $7ED5BE                        ;8BE355|6FBED57E|7ED5BE;
                       SEC                                  ;8BE359|38      |      ;
                       SBC.L $7ED250                        ;8BE35A|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE35E|85CF    |0000CF;
                       CPX.W #$0000                         ;8BE360|E00000  |      ;
                       BNE ++                               ;8BE363|D004    |8BE369;
                       LDA.B $00                            ;8BE365|A500    |000000;
                       BRA +++                              ;8BE367|8015    |8BE37E;
 
                    ++ CPX.W #$0004                         ;8BE369|E00400  |      ;
                       BNE ++                               ;8BE36C|D004    |8BE372;
                       LDA.B $02                            ;8BE36E|A502    |000002;
                       BRA +++                              ;8BE370|800C    |8BE37E;
 
                    ++ CPX.W #$0008                         ;8BE372|E00800  |      ;
                       BNE ++                               ;8BE375|D004    |8BE37B;
                       LDA.B $04                            ;8BE377|A504    |000004;
                       BRA +++                              ;8BE379|8003    |8BE37E;
 
                    ++ LDA.W #$0000                         ;8BE37B|A90000  |      ;
 
                   +++ CLC                                  ;8BE37E|18      |      ;
                       ADC.W DATA8_8BE3F7,X                 ;8BE37F|7DF7E3  |8BE3F7;
                       CLC                                  ;8BE382|18      |      ;
                       ADC.L $7ED5C0                        ;8BE383|6FC0D57E|7ED5C0;
                       SEC                                  ;8BE387|38      |      ;
                       SBC.L $7ED252                        ;8BE388|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE38C|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE38E|2255BC80|80BC55;
 
                     + LDA.W #$006C                         ;8BE392|A96C00  |      ;
                       STA.B $D3                            ;8BE395|85D3    |0000D3;
                       LDX.W DATA8_8BE409                   ;8BE397|AE09E4  |8BE409;
                       LDA.W DATA8_8BE40B                   ;8BE39A|AD0BE4  |8BE40B;
                       CLC                                  ;8BE39D|18      |      ;
                       ADC.B $00                            ;8BE39E|6500    |000000;
                       TAY                                  ;8BE3A0|A8      |      ;
                       JSR.W CODE_FN_8BE3C6                 ;8BE3A1|20C6E3  |8BE3C6;
                       LDX.W DATA8_8BE40D                   ;8BE3A4|AE0DE4  |8BE40D;
                       LDA.W DATA8_8BE40F                   ;8BE3A7|AD0FE4  |8BE40F;
                       CLC                                  ;8BE3AA|18      |      ;
                       ADC.B $02                            ;8BE3AB|6502    |000002;
                       TAY                                  ;8BE3AD|A8      |      ;
                       JSR.W CODE_FN_8BE3C6                 ;8BE3AE|20C6E3  |8BE3C6;
                       LDA.W #$006D                         ;8BE3B1|A96D00  |      ;
                       STA.B $D3                            ;8BE3B4|85D3    |0000D3;
                       LDX.W DATA8_8BE411                   ;8BE3B6|AE11E4  |8BE411;
                       LDA.W DATA8_8BE413                   ;8BE3B9|AD13E4  |8BE413;
                       CLC                                  ;8BE3BC|18      |      ;
                       ADC.B $04                            ;8BE3BD|6504    |000004;
                       TAY                                  ;8BE3BF|A8      |      ;
                       JSR.W CODE_FN_8BE3C6                 ;8BE3C0|20C6E3  |8BE3C6;
                       PLB                                  ;8BE3C3|AB      |      ;
                       PLP                                  ;8BE3C4|28      |      ;
                       RTS                                  ;8BE3C5|60      |      ;
 
       CODE_FN_8BE3C6:
                       TXA                                  ;8BE3C6|8A      |      ;
                       CLC                                  ;8BE3C7|18      |      ;
                       ADC.L $7ED5BE                        ;8BE3C8|6FBED57E|7ED5BE;
                       SEC                                  ;8BE3CC|38      |      ;
                       SBC.L $7ED250                        ;8BE3CD|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE3D1|85CF    |0000CF;
                       TYA                                  ;8BE3D3|98      |      ;
                       CLC                                  ;8BE3D4|18      |      ;
                       ADC.L $7ED5C0                        ;8BE3D5|6FC0D57E|7ED5C0;
                       SEC                                  ;8BE3D9|38      |      ;
                       SBC.L $7ED252                        ;8BE3DA|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE3DE|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE3E0|2255BC80|80BC55;
                       RTS                                  ;8BE3E4|60      |      ;
 
         DATA8_8BE3E5:
                       db $00,$04,$08,$0C,$10,$00,$04,$08   ;8BE3E5|        |      ;
                       db $0C,$10,$00,$04,$08,$0C,$10,$00   ;8BE3ED|        |      ;
 
         DATA8_8BE3F5:
                       db $12,$00                           ;8BE3F5|        |      ;
 
         DATA8_8BE3F7:
                       db $08,$00,$4F,$00,$13,$00,$35,$00   ;8BE3F7|        |      ;
                       db $FE,$FF,$3C,$00,$37,$00,$26,$00   ;8BE3FF|        |      ;
                       db $46,$00                           ;8BE407|        |      ;
 
         DATA8_8BE409:
                       db $0E,$00                           ;8BE409|        |      ;
 
         DATA8_8BE40B:
                       db $0D,$00                           ;8BE40B|        |      ;
 
         DATA8_8BE40D:
                       db $4B,$00                           ;8BE40D|        |      ;
 
         DATA8_8BE40F:
                       db $18,$00                           ;8BE40F|        |      ;
 
         DATA8_8BE411:
                       db $32,$00                           ;8BE411|        |      ;
 
         DATA8_8BE413:
                       db $02,$00                           ;8BE413|        |      ;
 
         DATA8_8BE415:
                       db $6A,$00,$6A,$00,$6B,$00,$6B,$00   ;8BE415|        |      ;
                       db $6B,$00,$6B,$00,$6A,$00,$6A,$00   ;8BE41D|        |      ;
                       db $6A,$00,$69,$00,$69,$00           ;8BE425|        |      ;
 
         DATA8_8BE42B:
                       db $00,$01,$01,$02,$02,$02,$02,$02   ;8BE42B|        |      ;
                       db $02,$02,$02,$02,$02,$02,$01,$01   ;8BE433|        |      ;
                       db $00,$FF,$FF,$FE,$FE,$FE,$FE,$FE   ;8BE43B|        |      ;
                       db $FE,$FE,$FE,$FE,$FE,$FE,$FF,$FF   ;8BE443|        |      ;
 
         DATA8_8BE44B:
                       db $00,$01,$01,$02,$02,$02,$02,$02   ;8BE44B|        |      ;
                       db $02,$02,$02,$02,$02,$02,$02,$02   ;8BE453|        |      ;
                       db $02,$02,$01,$01,$00,$FF,$FF,$FE   ;8BE45B|        |      ;
                       db $FE,$FE,$FE,$FE,$FE,$FE,$FE,$FE   ;8BE463|        |      ;
                       db $FE,$FE,$FE,$FE,$FE,$FE,$FF,$FF   ;8BE46B|        |      ;
 
       CODE_FN_8BE473:
                       PHP                                  ;8BE473|08      |      ;
                       REP #$30                             ;8BE474|C230    |      ;
                       PHB                                  ;8BE476|8B      |      ;
                       PHK                                  ;8BE477|4B      |      ;
                       PLB                                  ;8BE478|AB      |      ;
                       LDA.W #$0006                         ;8BE479|A90600  |      ;
                       JSR.W CODE_FN_8BE52A                 ;8BE47C|202AE5  |8BE52A;
                       LDA.W #$8900                         ;8BE47F|A90089  |      ;
                       STA.B $D6                            ;8BE482|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE484|A90089  |      ;
                       STA.B $D5                            ;8BE487|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BE489|A9FFC1  |      ;
                       STA.B $D8                            ;8BE48C|85D8    |0000D8;
                       LDA.L $7ED5BC                        ;8BE48E|AFBCD57E|7ED5BC;
                       CMP.W #$001D                         ;8BE492|C91D00  |      ;
                       BEQ +                                ;8BE495|F002    |8BE499;
                       BPL ++                               ;8BE497|1007    |8BE4A0;
 
                     + CMP.W #$0000                         ;8BE499|C90000  |      ;
                       BEQ ++                               ;8BE49C|F002    |8BE4A0;
                       BPL +                                ;8BE49E|1005    |8BE4A5;
 
                    ++ LDA.W #$001D                         ;8BE4A0|A91D00  |      ;
                       BRA ++                               ;8BE4A3|8001    |8BE4A6;
 
                     + DEC A                                ;8BE4A5|3A      |      ;
 
                    ++ STA.L $7ED5BC                        ;8BE4A6|8FBCD57E|7ED5BC;
                       ASL A                                ;8BE4AA|0A      |      ;
                       TAX                                  ;8BE4AB|AA      |      ;
                       LDA.W DATA8_8BE4EE,X                 ;8BE4AC|BDEEE4  |8BE4EE;
                       STA.B $D3                            ;8BE4AF|85D3    |0000D3;
                       LDX.W #$000B                         ;8BE4B1|A20B00  |      ;
                       LDY.W #$0028                         ;8BE4B4|A02800  |      ;
                       JSR.W CODE_FN_8BE4CF                 ;8BE4B7|20CFE4  |8BE4CF;
                       LDX.W #$001D                         ;8BE4BA|A21D00  |      ;
                       LDY.W #$0008                         ;8BE4BD|A00800  |      ;
                       JSR.W CODE_FN_8BE4CF                 ;8BE4C0|20CFE4  |8BE4CF;
                       LDX.W #$0040                         ;8BE4C3|A24000  |      ;
                       LDY.W #$0011                         ;8BE4C6|A01100  |      ;
                       JSR.W CODE_FN_8BE4CF                 ;8BE4C9|20CFE4  |8BE4CF;
                       PLB                                  ;8BE4CC|AB      |      ;
                       PLP                                  ;8BE4CD|28      |      ;
                       RTS                                  ;8BE4CE|60      |      ;
 
       CODE_FN_8BE4CF:
                       TXA                                  ;8BE4CF|8A      |      ;
                       CLC                                  ;8BE4D0|18      |      ;
                       ADC.L $7ED5B8                        ;8BE4D1|6FB8D57E|7ED5B8;
                       SEC                                  ;8BE4D5|38      |      ;
                       SBC.L $7ED250                        ;8BE4D6|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE4DA|85CF    |0000CF;
                       TYA                                  ;8BE4DC|98      |      ;
                       CLC                                  ;8BE4DD|18      |      ;
                       ADC.L $7ED5BA                        ;8BE4DE|6FBAD57E|7ED5BA;
                       SEC                                  ;8BE4E2|38      |      ;
                       SBC.L $7ED252                        ;8BE4E3|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE4E7|85D1    |0000D1;
                       JSL.L CODE_FL_80BC55                 ;8BE4E9|2255BC80|80BC55;
                       RTS                                  ;8BE4ED|60      |      ;
 
         DATA8_8BE4EE:
                       db $68,$00,$68,$00,$68,$00,$68,$00   ;8BE4EE|        |      ;
                       db $68,$00,$68,$00,$68,$00,$68,$00   ;8BE4F6|        |      ;
                       db $68,$00,$68,$00,$67,$00,$67,$00   ;8BE4FE|        |      ;
                       db $67,$00,$67,$00,$67,$00,$67,$00   ;8BE506|        |      ;
                       db $67,$00,$67,$00,$67,$00,$67,$00   ;8BE50E|        |      ;
                       db $66,$00,$66,$00,$66,$00,$66,$00   ;8BE516|        |      ;
                       db $66,$00,$66,$00,$66,$00,$66,$00   ;8BE51E|        |      ;
                       db $66,$00,$66,$00                   ;8BE526|        |      ;
 
       CODE_FN_8BE52A:
                       CMP.L $7ED39F                        ;8BE52A|CF9FD37E|7ED39F;
                       BEQ +                                ;8BE52E|F006    |8BE536;
                       CMP.L $7ED3A1                        ;8BE530|CFA1D37E|7ED3A1;
                       BEQ ++                               ;8BE534|F006    |8BE53C;
 
                     + LDA.W #$2A00                         ;8BE536|A9002A  |      ;
                       STA.B $DA                            ;8BE539|85DA    |0000DA;
                       RTS                                  ;8BE53B|60      |      ;
 
                    ++ LDA.W #$2C00                         ;8BE53C|A9002C  |      ;
                       STA.B $DA                            ;8BE53F|85DA    |0000DA;
                       RTS                                  ;8BE541|60      |      ;
 
       CODE_FN_8BE542:
                       TXA                                  ;8BE542|8A      |      ;
                       SEC                                  ;8BE543|38      |      ;
                       SBC.L $7ED250                        ;8BE544|EF50D27E|7ED250;
                       STA.B $CF                            ;8BE548|85CF    |0000CF;
                       TYA                                  ;8BE54A|98      |      ;
                       SEC                                  ;8BE54B|38      |      ;
                       SBC.L $7ED252                        ;8BE54C|EF52D27E|7ED252;
                       STA.B $D1                            ;8BE550|85D1    |0000D1;
                       LDA.W #$8900                         ;8BE552|A90089  |      ;
                       STA.B $D6                            ;8BE555|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE557|A90089  |      ;
                       STA.B $D5                            ;8BE55A|85D5    |0000D5;
                       LDA.W #$C1FF                         ;8BE55C|A9FFC1  |      ;
                       STA.B $D8                            ;8BE55F|85D8    |0000D8;
                       LDY.W #$0003                         ;8BE561|A00300  |      ;
                       LDA.B [$96],Y                        ;8BE564|B796    |000096;
                       STA.B $D3                            ;8BE566|85D3    |0000D3;
                       JSL.L CODE_FL_80BC55                 ;8BE568|2255BC80|80BC55;
                       RTS                                  ;8BE56C|60      |      ;
                       db $03,$47,$E7,$FF,$FF,$10,$47,$E8   ;8BE56D|        |      ;
                       db $81,$00,$0A,$47,$E8,$82,$00,$10   ;8BE575|        |      ;
                       db $47,$E8,$83,$00,$0A,$47,$E8,$82   ;8BE57D|        |      ;
                       db $00,$FF,$D6,$A4,$89,$72,$E5       ;8BE585|        |      ;
 
       CODE_FL_8BE58C:
                       LDA.B $96                            ;8BE58C|A596    |000096;
                       PHA                                  ;8BE58E|48      |      ;
                       LDA.W #$D5CA                         ;8BE58F|A9CAD5  |      ;
                       STA.B $96                            ;8BE592|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE594|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE598|222CA689|89A62C;
                       db $6D,$E5,$8B                       ;8BE59C|        |      ;
                       PLA                                  ;8BE59F|68      |      ;
                       STA.B $96                            ;8BE5A0|8596    |000096;
                       RTL                                  ;8BE5A2|6B      |      ;
 
       CODE_FL_8BE5A3:
                       LDA.B $96                            ;8BE5A3|A596    |000096;
                       PHA                                  ;8BE5A5|48      |      ;
                       LDA.W #$D5CA                         ;8BE5A6|A9CAD5  |      ;
                       STA.B $96                            ;8BE5A9|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE5AB|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE5AF|222CA689|89A62C;
                       db $72,$E5,$8B                       ;8BE5B3|        |      ;
                       PLA                                  ;8BE5B6|68      |      ;
                       STA.B $96                            ;8BE5B7|8596    |000096;
                       RTL                                  ;8BE5B9|6B      |      ;
                       db $03,$47,$E7,$FF,$FF,$10,$47,$E8   ;8BE5BA|        |      ;
                       db $84,$00,$0A,$47,$E8,$85,$00,$10   ;8BE5C2|        |      ;
                       db $47,$E8,$86,$00,$0A,$47,$E8,$85   ;8BE5CA|        |      ;
                       db $00,$FF,$D6,$A4,$89,$BF,$E5       ;8BE5D2|        |      ;
 
       CODE_FL_8BE5D9:
                       LDA.B $96                            ;8BE5D9|A596    |000096;
                       PHA                                  ;8BE5DB|48      |      ;
                       LDA.W #$D5CA                         ;8BE5DC|A9CAD5  |      ;
                       STA.B $96                            ;8BE5DF|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE5E1|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE5E5|222CA689|89A62C;
                       db $BA,$E5,$8B                       ;8BE5E9|        |      ;
                       PLA                                  ;8BE5EC|68      |      ;
                       STA.B $96                            ;8BE5ED|8596    |000096;
                       RTL                                  ;8BE5EF|6B      |      ;
 
       CODE_FL_8BE5F0:
                       LDA.B $96                            ;8BE5F0|A596    |000096;
                       PHA                                  ;8BE5F2|48      |      ;
                       LDA.W #$D5CA                         ;8BE5F3|A9CAD5  |      ;
                       STA.B $96                            ;8BE5F6|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE5F8|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE5FC|222CA689|89A62C;
                       db $BF,$E5,$8B                       ;8BE600|        |      ;
                       PLA                                  ;8BE603|68      |      ;
                       STA.B $96                            ;8BE604|8596    |000096;
                       RTL                                  ;8BE606|6B      |      ;
                       db $03,$47,$E7,$FF,$FF,$10,$9D,$E7   ;8BE607|        |      ;
                       db $78,$00,$FF,$D6,$A4,$89,$0C,$E6   ;8BE60F|        |      ;
 
       CODE_FL_8BE617:
                       LDA.B $96                            ;8BE617|A596    |000096;
                       PHA                                  ;8BE619|48      |      ;
                       LDA.W #$D5CA                         ;8BE61A|A9CAD5  |      ;
                       STA.B $96                            ;8BE61D|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE61F|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE623|222CA689|89A62C;
                       db $07,$E6,$8B                       ;8BE627|        |      ;
                       PLA                                  ;8BE62A|68      |      ;
                       STA.B $96                            ;8BE62B|8596    |000096;
                       RTL                                  ;8BE62D|6B      |      ;
 
       CODE_FL_8BE62E:
                       LDA.B $96                            ;8BE62E|A596    |000096;
                       PHA                                  ;8BE630|48      |      ;
                       LDA.W #$D5CA                         ;8BE631|A9CAD5  |      ;
                       STA.B $96                            ;8BE634|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE636|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE63A|222CA689|89A62C;
                       db $0C,$E6,$8B                       ;8BE63E|        |      ;
                       PLA                                  ;8BE641|68      |      ;
                       STA.B $96                            ;8BE642|8596    |000096;
                       RTL                                  ;8BE644|6B      |      ;
                       db $FF,$82,$F1,$8B,$FF,$5D,$A5,$89   ;8BE645|        |      ;
                       db $DF,$D5,$7E,$10,$01,$47,$E8,$81   ;8BE64D|        |      ;
                       db $00,$02,$10,$AA,$FF,$FF,$01,$47   ;8BE655|        |      ;
                       db $E8,$82,$00,$02,$10,$AA,$FF,$FF   ;8BE65D|        |      ;
                       db $FF,$A8,$A5,$89,$DF,$D5,$7E,$51   ;8BE665|        |      ;
                       db $E6,$FF,$6D,$A5,$89,$DB,$D5,$7E   ;8BE66D|        |      ;
                       db $00,$00,$FF,$6D,$A5,$89,$DD,$D5   ;8BE675|        |      ;
                       db $7E,$00,$00,$FF,$E9,$A4,$89       ;8BE67D|        |      ;
 
       CODE_FL_8BE684:
                       LDA.B $96                            ;8BE684|A596    |000096;
                       PHA                                  ;8BE686|48      |      ;
                       LDA.W #$D5CA                         ;8BE687|A9CAD5  |      ;
                       STA.B $96                            ;8BE68A|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE68C|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE690|222CA689|89A62C;
                       db $45,$E6,$8B                       ;8BE694|        |      ;
                       PLA                                  ;8BE697|68      |      ;
                       STA.B $96                            ;8BE698|8596    |000096;
                       RTL                                  ;8BE69A|6B      |      ;
                       db $FF,$82,$F1,$8B,$FF,$5D,$A5,$89   ;8BE69B|        |      ;
                       db $DF,$D5,$7E,$10,$01,$47,$E8,$84   ;8BE6A3|        |      ;
                       db $00,$02,$10,$AA,$FF,$FF,$01,$47   ;8BE6AB|        |      ;
                       db $E8,$85,$00,$02,$10,$AA,$FF,$FF   ;8BE6B3|        |      ;
                       db $FF,$A8,$A5,$89,$DF,$D5,$7E,$A7   ;8BE6BB|        |      ;
                       db $E6,$FF,$6D,$A5,$89,$DB,$D5,$7E   ;8BE6C3|        |      ;
                       db $00,$00,$FF,$6D,$A5,$89,$DD,$D5   ;8BE6CB|        |      ;
                       db $7E,$00,$00,$FF,$E9,$A4,$89       ;8BE6D3|        |      ;
 
       CODE_FL_8BE6DA:
                       LDA.B $96                            ;8BE6DA|A596    |000096;
                       PHA                                  ;8BE6DC|48      |      ;
                       LDA.W #$D5CA                         ;8BE6DD|A9CAD5  |      ;
                       STA.B $96                            ;8BE6E0|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE6E2|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE6E6|222CA689|89A62C;
                       db $9B,$E6,$8B                       ;8BE6EA|        |      ;
                       PLA                                  ;8BE6ED|68      |      ;
                       STA.B $96                            ;8BE6EE|8596    |000096;
                       RTL                                  ;8BE6F0|6B      |      ;
                       db $FF,$82,$F1,$8B,$FF,$5D,$A5,$89   ;8BE6F1|        |      ;
                       db $DF,$D5,$7E,$10,$01,$9D,$E7,$78   ;8BE6F9|        |      ;
                       db $00,$02,$10,$AA,$FF,$FF,$01,$9D   ;8BE701|        |      ;
                       db $E7,$78,$00,$02,$10,$AA,$FF,$FF   ;8BE709|        |      ;
                       db $FF,$A8,$A5,$89,$DF,$D5,$7E,$FD   ;8BE711|        |      ;
                       db $E6,$FF,$6D,$A5,$89,$DB,$D5,$7E   ;8BE719|        |      ;
                       db $00,$00,$FF,$6D,$A5,$89,$DD,$D5   ;8BE721|        |      ;
                       db $7E,$00,$00,$FF,$E9,$A4,$89       ;8BE729|        |      ;
 
       CODE_FL_8BE730:
                       LDA.B $96                            ;8BE730|A596    |000096;
                       PHA                                  ;8BE732|48      |      ;
                       LDA.W #$D5CA                         ;8BE733|A9CAD5  |      ;
                       STA.B $96                            ;8BE736|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BE738|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BE73C|222CA689|89A62C;
                       db $F1,$E6,$8B                       ;8BE740|        |      ;
                       PLA                                  ;8BE743|68      |      ;
                       STA.B $96                            ;8BE744|8596    |000096;
                       RTL                                  ;8BE746|6B      |      ;
                       LDY.W #$0005                         ;8BE747|A00500  |      ;
                       LDA.B [$96],Y                        ;8BE74A|B796    |000096;
                       DEC A                                ;8BE74C|3A      |      ;
                       AND.W #$00FF                         ;8BE74D|29FF00  |      ;
                       ASL A                                ;8BE750|0A      |      ;
                       TAX                                  ;8BE751|AA      |      ;
                       JMP.W (DATA8_8BE755,X)               ;8BE752|7C55E7  |8BE755;
 
         DATA8_8BE755:
                       db $5B,$E7,$71,$E7,$87,$E7           ;8BE755|        |      ;
                       PHB                                  ;8BE75B|8B      |      ;
                       PHK                                  ;8BE75C|4B      |      ;
                       PLB                                  ;8BE75D|AB      |      ;
                       LDY.W #$E768                         ;8BE75E|A068E7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BE761|22CAA080|80A0CA;
                       PLB                                  ;8BE765|AB      |      ;
                       BRA +                                ;8BE766|8008    |8BE770;
                       db $00,$41,$7F,$00,$02,$80,$00,$0D   ;8BE768|        |      ;
 
                     + RTL                                  ;8BE770|6B      |      ;
                       PHB                                  ;8BE771|8B      |      ;
                       PHK                                  ;8BE772|4B      |      ;
                       PLB                                  ;8BE773|AB      |      ;
                       LDY.W #$E77E                         ;8BE774|A07EE7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BE777|22CAA080|80A0CA;
                       PLB                                  ;8BE77B|AB      |      ;
                       BRA +                                ;8BE77C|8008    |8BE786;
                       db $00,$43,$7F,$00,$02,$80,$00,$0E   ;8BE77E|        |      ;
 
                     + RTL                                  ;8BE786|6B      |      ;
                       PHB                                  ;8BE787|8B      |      ;
                       PHK                                  ;8BE788|4B      |      ;
                       PLB                                  ;8BE789|AB      |      ;
                       LDY.W #$E794                         ;8BE78A|A094E7  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BE78D|22CAA080|80A0CA;
                       PLB                                  ;8BE791|AB      |      ;
                       BRA +                                ;8BE792|8008    |8BE79C;
                       db $00,$45,$7F,$00,$02,$80,$00,$0F   ;8BE794|        |      ;
 
                     + RTL                                  ;8BE79C|6B      |      ;
                       LDA.W #$0000                         ;8BE79D|A90000  |      ;
                       STA.B $CF                            ;8BE7A0|85CF    |0000CF;
                       JSL.L CODE_FL_8480FD                 ;8BE7A2|22FD8084|8480FD;
                       CLC                                  ;8BE7A6|18      |      ;
                       ADC.W #$0098                         ;8BE7A7|699800  |      ;
                       STA.B $D1                            ;8BE7AA|85D1    |0000D1;
                       LDY.W #$0003                         ;8BE7AC|A00300  |      ;
                       LDA.B [$96],Y                        ;8BE7AF|B796    |000096;
                       JSL.L CODE_FL_8BE85B                 ;8BE7B1|225BE88B|8BE85B;
                       LDA.W #$0000                         ;8BE7B5|A90000  |      ;
                       STA.B $CF                            ;8BE7B8|85CF    |0000CF;
                       LDA.W #$0098                         ;8BE7BA|A99800  |      ;
                       STA.B $D1                            ;8BE7BD|85D1    |0000D1;
                       JSL.L CODE_FL_8480FD                 ;8BE7BF|22FD8084|8480FD;
                       TAX                                  ;8BE7C3|AA      |      ;
                       BMI +                                ;8BE7C4|3005    |8BE7CB;
                       LDA.W #$007D                         ;8BE7C6|A97D00  |      ;
                       BRA ++                               ;8BE7C9|8003    |8BE7CE;
 
                     + LDA.W #$007E                         ;8BE7CB|A97E00  |      ;
 
                    ++ JSL.L CODE_FL_8BE85B                 ;8BE7CE|225BE88B|8BE85B;
                       LDX.W #$E82F                         ;8BE7D2|A22FE8  |      ;
                       JSR.W CODE_FN_8BE7E5                 ;8BE7D5|20E5E7  |8BE7E5;
                       LDX.W #$E837                         ;8BE7D8|A237E8  |      ;
                       JSR.W CODE_FN_8BE7E5                 ;8BE7DB|20E5E7  |8BE7E5;
                       LDX.W #$E83F                         ;8BE7DE|A23FE8  |      ;
                       JSR.W CODE_FN_8BE7E5                 ;8BE7E1|20E5E7  |8BE7E5;
                       RTL                                  ;8BE7E4|6B      |      ;
 
       CODE_FN_8BE7E5:
                       LDA.L $8B0000,X                      ;8BE7E5|BF00008B|8B0000;
                       STA.B $CF                            ;8BE7E9|85CF    |0000CF;
                       LDA.L $8B0004,X                      ;8BE7EB|BF04008B|8B0004;
                       JSL.L CODE_FL_84811F                 ;8BE7EF|221F8184|84811F;
                       CLC                                  ;8BE7F3|18      |      ;
                       ADC.L $8B0002,X                      ;8BE7F4|7F02008B|8B0002;
                       STA.B $D1                            ;8BE7F8|85D1    |0000D1;
                       LDA.B $A9                            ;8BE7FA|A5A9    |0000A9;
                       AND.W #$0003                         ;8BE7FC|290300  |      ;
                       CLC                                  ;8BE7FF|18      |      ;
                       ADC.W #$0079                         ;8BE800|697900  |      ;
                       PHX                                  ;8BE803|DA      |      ;
                       JSL.L CODE_FL_8BE85B                 ;8BE804|225BE88B|8BE85B;
                       PLX                                  ;8BE808|FA      |      ;
                       LDA.L $8B0004,X                      ;8BE809|BF04008B|8B0004;
                       JSL.L CODE_FL_84811F                 ;8BE80D|221F8184|84811F;
                       ROL A                                ;8BE811|2A      |      ;
                       ROL A                                ;8BE812|2A      |      ;
                       AND.W #$0001                         ;8BE813|290100  |      ;
                       CLC                                  ;8BE816|18      |      ;
                       ADC.W #$007F                         ;8BE817|697F00  |      ;
                       PHA                                  ;8BE81A|48      |      ;
                       LDA.L $8B0000,X                      ;8BE81B|BF00008B|8B0000;
                       STA.B $CF                            ;8BE81F|85CF    |0000CF;
                       LDA.L $8B0006,X                      ;8BE821|BF06008B|8B0006;
                       STA.B $D1                            ;8BE825|85D1    |0000D1;
                       PLA                                  ;8BE827|68      |      ;
                       PHX                                  ;8BE828|DA      |      ;
                       JSL.L CODE_FL_8BE85B                 ;8BE829|225BE88B|8BE85B;
                       PLX                                  ;8BE82D|FA      |      ;
                       RTS                                  ;8BE82E|60      |      ;
                       db $F0,$FF,$9C,$00,$20,$00,$AC,$00   ;8BE82F|        |      ;
                       db $D8,$FF,$94,$00,$75,$00,$A4,$00   ;8BE837|        |      ;
                       db $E4,$FF,$7C,$00,$CA,$00,$8C,$00   ;8BE83F|        |      ;
                       LDA.W #$0000                         ;8BE847|A90000  |      ;
                       STA.B $CF                            ;8BE84A|85CF    |0000CF;
                       LDA.W #$0098                         ;8BE84C|A99800  |      ;
                       STA.B $D1                            ;8BE84F|85D1    |0000D1;
                       LDY.W #$0003                         ;8BE851|A00300  |      ;
                       LDA.B [$96],Y                        ;8BE854|B796    |000096;
                       JSL.L CODE_FL_8BE85B                 ;8BE856|225BE88B|8BE85B;
                       RTL                                  ;8BE85A|6B      |      ;
 
       CODE_FL_8BE85B:
                       STA.B $D3                            ;8BE85B|85D3    |0000D3;
                       LDA.B $CF                            ;8BE85D|A5CF    |0000CF;
                       CLC                                  ;8BE85F|18      |      ;
                       ADC.L $7ED5DB                        ;8BE860|6FDBD57E|7ED5DB;
                       CLC                                  ;8BE864|18      |      ;
                       ADC.L $7ED348                        ;8BE865|6F48D37E|7ED348;
                       STA.B $CF                            ;8BE869|85CF    |0000CF;
                       LDA.B $D1                            ;8BE86B|A5D1    |0000D1;
                       CLC                                  ;8BE86D|18      |      ;
                       ADC.L $7ED5DD                        ;8BE86E|6FDDD57E|7ED5DD;
                       CLC                                  ;8BE872|18      |      ;
                       ADC.L $7ED34A                        ;8BE873|6F4AD37E|7ED34A;
                       CLC                                  ;8BE877|18      |      ;
                       ADC.L $7ED272                        ;8BE878|6F72D27E|7ED272;
                       STA.B $D1                            ;8BE87C|85D1    |0000D1;
                       LDA.W #$8900                         ;8BE87E|A90089  |      ;
                       STA.B $D6                            ;8BE881|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE883|A90089  |      ;
                       STA.B $D5                            ;8BE886|85D5    |0000D5;
                       LDA.W #$FFFF                         ;8BE888|A9FFFF  |      ;
                       STA.B $D8                            ;8BE88B|85D8    |0000D8;
                       LDA.W #$0000                         ;8BE88D|A90000  |      ;
                       STA.B $DA                            ;8BE890|85DA    |0000DA;
                       JSL.L CODE_FL_80BC55                 ;8BE892|2255BC80|80BC55;
                       RTL                                  ;8BE896|6B      |      ;
 
       CODE_FL_8BE897:
                       LDY.W #$0003                         ;8BE897|A00300  |      ;
                       LDA.B [$96],Y                        ;8BE89A|B796    |000096;
                       AND.W #$00FF                         ;8BE89C|29FF00  |      ;
                       CMP.W #$001F                         ;8BE89F|C91F00  |      ;
                       BEQ +                                ;8BE8A2|F02A    |8BE8CE;
                       CMP.W #$0000                         ;8BE8A4|C90000  |      ;
                       BCC ++                               ;8BE8A7|9005    |8BE8AE;
                       CMP.W #$000C                         ;8BE8A9|C90C00  |      ;
                       BCC +                                ;8BE8AC|9020    |8BE8CE;
 
                    ++ CMP.W #$0022                         ;8BE8AE|C92200  |      ;
                       BEQ ++                               ;8BE8B1|F00E    |8BE8C1;
                       CMP.W #$0028                         ;8BE8B3|C92800  |      ;
                       BEQ ++                               ;8BE8B6|F009    |8BE8C1;
                       LDA.W #$0014                         ;8BE8B8|A91400  |      ;
                       STA.L $7ED841                        ;8BE8BB|8F41D87E|7ED841;
                       BRA +++                              ;8BE8BF|8025    |8BE8E6;
 
                    ++ LDY.W #$0005                         ;8BE8C1|A00500  |      ;
                       LDA.B [$96],Y                        ;8BE8C4|B796    |000096;
                       AND.W #$00FF                         ;8BE8C6|29FF00  |      ;
                       DEC A                                ;8BE8C9|3A      |      ;
                       BNE +++                              ;8BE8CA|D01A    |8BE8E6;
                       BRA ++                               ;8BE8CC|8014    |8BE8E2;
 
                     + LDA.L $7ED841                        ;8BE8CE|AF41D87E|7ED841;
                       BEQ +                                ;8BE8D2|F007    |8BE8DB;
                       DEC A                                ;8BE8D4|3A      |      ;
                       STA.L $7ED841                        ;8BE8D5|8F41D87E|7ED841;
                       BRA +++                              ;8BE8D9|800B    |8BE8E6;
 
                     + LDA.W #$0014                         ;8BE8DB|A91400  |      ;
                       STA.L $7ED841                        ;8BE8DE|8F41D87E|7ED841;
 
                    ++ JSL.L CODE_FL_8BE8E7                 ;8BE8E2|22E7E88B|8BE8E7;
 
                   +++ RTL                                  ;8BE8E6|6B      |      ;
 
       CODE_FL_8BE8E7:
                       PHB                                  ;8BE8E7|8B      |      ;
                       PEA.W $7E00                          ;8BE8E8|F4007E  |8B7E00;
                       PLB                                  ;8BE8EB|AB      |      ;
                       PLB                                  ;8BE8EC|AB      |      ;
                       LDA.W #$8900                         ;8BE8ED|A90089  |      ;
                       STA.B $D6                            ;8BE8F0|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE8F2|A90089  |      ;
                       STA.B $D5                            ;8BE8F5|85D5    |0000D5;
                       LDY.W #$0004                         ;8BE8F7|A00400  |      ;
 
                     - LDA.W $D829,Y                        ;8BE8FA|B929D8  |7ED829;
                       BNE +                                ;8BE8FD|D036    |8BE935;
                       LDA.W #$0000                         ;8BE8FF|A90000  |      ;
                       STA.W $D839,Y                        ;8BE902|9939D8  |7ED839;
                       LDA.W $D344                          ;8BE905|AD44D3  |7ED344;
                       CLC                                  ;8BE908|18      |      ;
                       ADC.W #$008C                         ;8BE909|698C00  |      ;
                       CLC                                  ;8BE90C|18      |      ;
                       ADC.W $D358                          ;8BE90D|6D58D3  |7ED358;
                       STA.W $D831,Y                        ;8BE910|9931D8  |7ED831;
                       LDA.W $D346                          ;8BE913|AD46D3  |7ED346;
                       CLC                                  ;8BE916|18      |      ;
                       ADC.W #$0048                         ;8BE917|694800  |      ;
                       CLC                                  ;8BE91A|18      |      ;
                       ADC.W $D35A                          ;8BE91B|6D5AD3  |7ED35A;
                       STA.W $D829,Y                        ;8BE91E|9929D8  |7ED829;
                       LDA.W $D1E4                          ;8BE921|ADE4D1  |7ED1E4;
                       BIT.W #$8000                         ;8BE924|890080  |      ;
                       BEQ ++                               ;8BE927|F00A    |8BE933;
                       LDA.W $D829,Y                        ;8BE929|B929D8  |7ED829;
                       CLC                                  ;8BE92C|18      |      ;
                       ADC.W #$0010                         ;8BE92D|691000  |      ;
                       STA.W $D829,Y                        ;8BE930|9929D8  |7ED829;
 
                    ++ BRA ++                               ;8BE933|8004    |8BE939;
 
                     + DEY                                  ;8BE935|88      |      ;
                       DEY                                  ;8BE936|88      |      ;
                       BPL -                                ;8BE937|10C1    |8BE8FA;
 
                    ++ PLB                                  ;8BE939|AB      |      ;
                       RTL                                  ;8BE93A|6B      |      ;
 
       CODE_FL_8BE93B:
                       PHB                                  ;8BE93B|8B      |      ;
                       PEA.W $7E00                          ;8BE93C|F4007E  |7E7E00;
                       PLB                                  ;8BE93F|AB      |      ;
                       PLB                                  ;8BE940|AB      |      ;
                       LDA.W #$8900                         ;8BE941|A90089  |      ;
                       STA.B $D6                            ;8BE944|85D6    |0000D6;
                       LDA.W #$8900                         ;8BE946|A90089  |      ;
                       STA.B $D5                            ;8BE949|85D5    |0000D5;
                       LDY.W #$0004                         ;8BE94B|A00400  |      ;
 
                     - LDA.W $D829,Y                        ;8BE94E|B929D8  |7ED829;
                       BEQ +                                ;8BE951|F04B    |8BE99E;
                       LDX.W $D839,Y                        ;8BE953|BE39D8  |7ED839;
                       LDA.L DATA8_8BE9A4,X                 ;8BE956|BFA4E98B|8BE9A4;
                       BPL ++                               ;8BE95A|1008    |8BE964;
                       LDA.W #$0000                         ;8BE95C|A90000  |      ;
                       STA.W $D829,Y                        ;8BE95F|9929D8  |7ED829;
                       BRA +                                ;8BE962|803A    |8BE99E;
 
                    ++ AND.W #$00FF                         ;8BE964|29FF00  |      ;
                       STA.B $D3                            ;8BE967|85D3    |0000D3;
                       LDA.W $D839,Y                        ;8BE969|B939D8  |7ED839;
                       INC A                                ;8BE96C|1A      |      ;
                       STA.W $D839,Y                        ;8BE96D|9939D8  |7ED839;
                       LDA.L $0000A9                        ;8BE970|AFA90000|0000A9;
                       AND.W #$0007                         ;8BE974|290700  |      ;
                       BNE ++                               ;8BE977|D007    |8BE980;
                       LDA.W $D829,Y                        ;8BE979|B929D8  |7ED829;
                       DEC A                                ;8BE97C|3A      |      ;
                       STA.W $D829,Y                        ;8BE97D|9929D8  |7ED829;
 
                    ++ LDA.W $D831,Y                        ;8BE980|B931D8  |7ED831;
                       SEC                                  ;8BE983|38      |      ;
                       SBC.W $D250                          ;8BE984|ED50D2  |7ED250;
                       AND.W #$00FF                         ;8BE987|29FF00  |      ;
                       STA.B $CF                            ;8BE98A|85CF    |0000CF;
                       LDA.W $D829,Y                        ;8BE98C|B929D8  |7ED829;
                       SEC                                  ;8BE98F|38      |      ;
                       SBC.W $D252                          ;8BE990|ED52D2  |7ED252;
                       AND.W #$00FF                         ;8BE993|29FF00  |      ;
                       STA.B $D1                            ;8BE996|85D1    |0000D1;
                       PHY                                  ;8BE998|5A      |      ;
                       JSL.L CODE_FL_80BBAF                 ;8BE999|22AFBB80|80BBAF;
                       PLY                                  ;8BE99D|7A      |      ;
 
                     + DEY                                  ;8BE99E|88      |      ;
                       DEY                                  ;8BE99F|88      |      ;
                       BPL -                                ;8BE9A0|10AC    |8BE94E;
                       PLB                                  ;8BE9A2|AB      |      ;
                       RTL                                  ;8BE9A3|6B      |      ;
 
         DATA8_8BE9A4:
                       db $30,$30,$30,$30,$31,$31,$31,$31   ;8BE9A4|        |      ;
                       db $32,$32,$32,$32,$33,$33,$33,$33   ;8BE9AC|        |      ;
                       db $34,$34,$34,$34,$35,$35,$35,$35   ;8BE9B4|        |      ;
                       db $30,$30,$30,$30,$31,$31,$31,$31   ;8BE9BC|        |      ;
                       db $3D,$3D,$3D,$3D,$3E,$3E,$3E,$3E   ;8BE9C4|        |      ;
                       db $3F,$3F,$3F,$3F,$40,$40,$40,$40   ;8BE9CC|        |      ;
                       db $41,$41,$41,$41,$FF               ;8BE9D4|        |      ;
                       db $FF                               ;8BE9D9|        |D348AF;
                       LDA.L $7ED348                        ;8BE9DA|AF48D37E|7ED348;
                       INC A                                ;8BE9DE|1A      |      ;
                       STA.L $7ED348                        ;8BE9DF|8F48D37E|7ED348;
                       CMP.W #$0050                         ;8BE9E3|C95000  |      ;
                       BCC +                                ;8BE9E6|9004    |8BE9EC;
                       JSL.L CODE_FL_89A509                 ;8BE9E8|2209A589|89A509;
 
                     + RTL                                  ;8BE9EC|6B      |      ;
                       PHP                                  ;8BE9ED|08      |      ;
                       REP #$30                             ;8BE9EE|C230    |      ;
                       PHB                                  ;8BE9F0|8B      |      ;
                       PEA.W $7E00                          ;8BE9F1|F4007E  |8B7E00;
                       PLB                                  ;8BE9F4|AB      |      ;
                       PLB                                  ;8BE9F5|AB      |      ;
                       LDY.W #$D856                         ;8BE9F6|A056D8  |      ;
                       JSL.L CODE_FL_8BEC29                 ;8BE9F9|2229EC8B|8BEC29;
                       LDA.W #$8B00                         ;8BE9FD|A9008B  |      ;
                       STA.W $0001,Y                        ;8BEA00|990100  |7E0001;
                       LDA.W #$EA45                         ;8BEA03|A945EA  |      ;
                       STA.W $0000,Y                        ;8BEA06|990000  |7E0000;
                       LDA.W #$8B00                         ;8BEA09|A9008B  |      ;
                       STA.W $0004,Y                        ;8BEA0C|990400  |7E0004;
                       LDA.W #$EA5B                         ;8BEA0F|A95BEA  |      ;
                       STA.W $0003,Y                        ;8BEA12|990300  |7E0003;
                       LDA.W #$8B00                         ;8BEA15|A9008B  |      ;
                       STA.W $0007,Y                        ;8BEA18|990700  |7E0007;
                       LDA.W #$EA6A                         ;8BEA1B|A96AEA  |      ;
                       STA.W $0006,Y                        ;8BEA1E|990600  |7E0006;
                       LDA.W #$3000                         ;8BEA21|A90030  |      ;
                       STA.W $0011,Y                        ;8BEA24|991100  |7E0011;
                       LDA.W #$3400                         ;8BEA27|A90034  |      ;
                       STA.W $0013,Y                        ;8BEA2A|991300  |7E0013;
                       LDA.W #$1000                         ;8BEA2D|A90010  |      ;
                       STA.W $0015,Y                        ;8BEA30|991500  |7E0015;
                       LDA.W #$0000                         ;8BEA33|A90000  |      ;
                       STA.L $7ED871                        ;8BEA36|8F71D87E|7ED871;
                       STA.L $7ED7E3                        ;8BEA3A|8FE3D77E|7ED7E3;
                       JSL.L CODE_FL_8BF197                 ;8BEA3E|2297F18B|8BF197;
                       PLB                                  ;8BEA42|AB      |      ;
                       PLP                                  ;8BEA43|28      |      ;
                       RTL                                  ;8BEA44|6B      |      ;
                       db $3C,$00,$00,$3C,$80,$01,$3C,$80   ;8BEA45|        |      ;
                       db $01,$28,$00,$01,$28,$F0,$00,$28   ;8BEA4D|        |      ;
                       db $E0,$00,$01,$00,$80,$FF,$32,$00   ;8BEA55|        |      ;
                       db $05,$01,$05,$02,$3C,$03,$3C,$03   ;8BEA5D|        |      ;
                       db $3C,$02,$3C,$01,$FF,$3C,$D0,$10   ;8BEA65|        |      ;
                       db $14,$B0,$10,$1E,$C0,$58,$0A,$90   ;8BEA6D|        |      ;
                       db $58,$0A,$A0,$38,$0A,$A0,$18,$0A   ;8BEA75|        |      ;
                       db $70,$18,$14,$80,$58,$0A,$60,$58   ;8BEA7D|        |      ;
                       db $28,$68,$30,$28,$78,$40,$01,$40   ;8BEA85|        |      ;
                       db $34,$FF                           ;8BEA8D|        |      ;
                       PHP                                  ;8BEA8F|08      |      ;
                       REP #$30                             ;8BEA90|C230    |      ;
                       PHB                                  ;8BEA92|8B      |      ;
                       PEA.W $7E00                          ;8BEA93|F4007E  |8B7E00;
                       PLB                                  ;8BEA96|AB      |      ;
                       PLB                                  ;8BEA97|AB      |      ;
                       LDY.W #$D856                         ;8BEA98|A056D8  |      ;
                       JSL.L CODE_FL_8BEC42                 ;8BEA9B|2242EC8B|8BEC42;
                       PLB                                  ;8BEA9F|AB      |      ;
                       JSL.L CODE_FL_8BEAFC                 ;8BEAA0|22FCEA8B|8BEAFC;
                       LDA.L $7ED86D                        ;8BEAA4|AF6DD87E|7ED86D;
                       STA.L $0000CF                        ;8BEAA8|8FCF0000|0000CF;
                       LDA.L $7ED86F                        ;8BEAAC|AF6FD87E|7ED86F;
                       STA.L $0000D1                        ;8BEAB0|8FD10000|0000D1;
                       LDA.W #$0046                         ;8BEAB4|A94600  |      ;
                       STA.B $D3                            ;8BEAB7|85D3    |0000D3;
                       LDA.L $7ED871                        ;8BEAB9|AF71D87E|7ED871;
                       CMP.W #$00B4                         ;8BEABD|C9B400  |      ;
                       BCC +                                ;8BEAC0|9005    |8BEAC7;
                       LDA.W #$0045                         ;8BEAC2|A94500  |      ;
                       STA.B $D3                            ;8BEAC5|85D3    |0000D3;
 
                     + LDA.L $7ED871                        ;8BEAC7|AF71D87E|7ED871;
                       INC A                                ;8BEACB|1A      |      ;
                       STA.L $7ED871                        ;8BEACC|8F71D87E|7ED871;
                       LDA.W #$8900                         ;8BEAD0|A90089  |      ;
                       STA.B $D6                            ;8BEAD3|85D6    |0000D6;
                       LDA.W #$8900                         ;8BEAD5|A90089  |      ;
                       STA.B $D5                            ;8BEAD8|85D5    |0000D5;
                       LDA.W #$FFFF                         ;8BEADA|A9FFFF  |      ;
                       STA.B $D8                            ;8BEADD|85D8    |0000D8;
                       LDA.W #$0000                         ;8BEADF|A90000  |      ;
                       STA.B $DA                            ;8BEAE2|85DA    |0000DA;
                       JSL.L CODE_FL_80BC55                 ;8BEAE4|2255BC80|80BC55;
                       LDA.B $CF                            ;8BEAE8|A5CF    |0000CF;
                       CMP.W #$0040                         ;8BEAEA|C94000  |      ;
                       BNE +                                ;8BEAED|D00B    |8BEAFA;
                       LDA.B $D1                            ;8BEAEF|A5D1    |0000D1;
                       CMP.W #$0034                         ;8BEAF1|C93400  |      ;
                       BNE +                                ;8BEAF4|D004    |8BEAFA;
                       JSL.L CODE_FL_89A509                 ;8BEAF6|2209A589|89A509;
 
                     + PLP                                  ;8BEAFA|28      |      ;
                       RTL                                  ;8BEAFB|6B      |      ;
 
       CODE_FL_8BEAFC:
                       PHX                                  ;8BEAFC|DA      |      ;
                       PHY                                  ;8BEAFD|5A      |      ;
                       LDX.W #$0060                         ;8BEAFE|A26000  |      ;
 
                     - LDA.L $7ED6B9,X                      ;8BEB01|BFB9D67E|7ED6B9;
                       BNE +                                ;8BEB05|D062    |8BEB69;
                       JSL.L CODE_FL_8481D6                 ;8BEB07|22D68184|8481D6;
                       AND.W #$0007                         ;8BEB0B|290700  |      ;
                       SEC                                  ;8BEB0E|38      |      ;
                       SBC.W #$0004                         ;8BEB0F|E90400  |      ;
                       CLC                                  ;8BEB12|18      |      ;
                       ADC.L $7ED86D                        ;8BEB13|6F6DD87E|7ED86D;
                       CLC                                  ;8BEB17|18      |      ;
                       ADC.W #$FFFC                         ;8BEB18|69FCFF  |      ;
                       ASL A                                ;8BEB1B|0A      |      ;
                       ASL A                                ;8BEB1C|0A      |      ;
                       ASL A                                ;8BEB1D|0A      |      ;
                       ASL A                                ;8BEB1E|0A      |      ;
                       ASL A                                ;8BEB1F|0A      |      ;
                       ASL A                                ;8BEB20|0A      |      ;
                       STA.L $7ED657,X                      ;8BEB21|9F57D67E|7ED657;
                       JSL.L CODE_FL_8481D6                 ;8BEB25|22D68184|8481D6;
                       AND.W #$0007                         ;8BEB29|290700  |      ;
                       SEC                                  ;8BEB2C|38      |      ;
                       SBC.W #$0004                         ;8BEB2D|E90400  |      ;
                       CLC                                  ;8BEB30|18      |      ;
                       ADC.L $7ED86F                        ;8BEB31|6F6FD87E|7ED86F;
                       CLC                                  ;8BEB35|18      |      ;
                       ADC.W #$FFFC                         ;8BEB36|69FCFF  |      ;
                       ASL A                                ;8BEB39|0A      |      ;
                       ASL A                                ;8BEB3A|0A      |      ;
                       ASL A                                ;8BEB3B|0A      |      ;
                       ASL A                                ;8BEB3C|0A      |      ;
                       ASL A                                ;8BEB3D|0A      |      ;
                       ASL A                                ;8BEB3E|0A      |      ;
                       STA.L $7ED6B9,X                      ;8BEB3F|9FB9D67E|7ED6B9;
                       LDA.W #$000F                         ;8BEB43|A90F00  |      ;
                       STA.L $7ED77D,X                      ;8BEB46|9F7DD77E|7ED77D;
                       LDA.L $7ED7E3                        ;8BEB4A|AFE3D77E|7ED7E3;
                       CMP.W #$003C                         ;8BEB4E|C93C00  |      ;
                       BCS ++                               ;8BEB51|B00D    |8BEB60;
                       JSL.L CODE_FL_8481D6                 ;8BEB53|22D68184|8481D6;
                       AND.W #$003F                         ;8BEB57|293F00  |      ;
                       STA.L $7ED71B,X                      ;8BEB5A|9F1BD77E|7ED71B;
                       BRA +++                              ;8BEB5E|800D    |8BEB6D;
 
                    ++ LDA.W #$8000                         ;8BEB60|A90080  |      ;
                       STA.L $7ED71B,X                      ;8BEB63|9F1BD77E|7ED71B;
                       BRA +++                              ;8BEB67|8004    |8BEB6D;
 
                     + DEX                                  ;8BEB69|CA      |      ;
                       DEX                                  ;8BEB6A|CA      |      ;
                       BPL -                                ;8BEB6B|1094    |8BEB01;
 
                   +++ JSL.L CODE_FL_8BEB7D                 ;8BEB6D|227DEB8B|8BEB7D;
                       LDA.L $7ED7E3                        ;8BEB71|AFE3D77E|7ED7E3;
                       INC A                                ;8BEB75|1A      |      ;
                       STA.L $7ED7E3                        ;8BEB76|8FE3D77E|7ED7E3;
                       PLY                                  ;8BEB7A|7A      |      ;
                       PLX                                  ;8BEB7B|FA      |      ;
                       RTL                                  ;8BEB7C|6B      |      ;
 
       CODE_FL_8BEB7D:
                       PHX                                  ;8BEB7D|DA      |      ;
                       PHY                                  ;8BEB7E|5A      |      ;
                       LDX.W #$0060                         ;8BEB7F|A26000  |      ;
 
       CODE_JP_8BEB82:
                       LDA.L $7ED6B9,X                      ;8BEB82|BFB9D67E|7ED6B9;
                       BEQ +                                ;8BEB86|F077    |8BEBFF;
                       LDA.L $7ED77D,X                      ;8BEB88|BF7DD77E|7ED77D;
                       DEC A                                ;8BEB8C|3A      |      ;
                       STA.L $7ED77D,X                      ;8BEB8D|9F7DD77E|7ED77D;
                       BPL ++                               ;8BEB91|1009    |8BEB9C;
                       LDA.W #$0000                         ;8BEB93|A90000  |      ;
                       STA.L $7ED6B9,X                      ;8BEB96|9FB9D67E|7ED6B9;
                       BRA +                                ;8BEB9A|8063    |8BEBFF;
 
                    ++ LDA.L $7ED71B,X                      ;8BEB9C|BF1BD77E|7ED71B;
                       CMP.W #$8000                         ;8BEBA0|C90080  |      ;
                       BEQ ++                               ;8BEBA3|F030    |8BEBD5;
                       PHX                                  ;8BEBA5|DA      |      ;
                       LDA.L $7ED71B,X                      ;8BEBA6|BF1BD77E|7ED71B;
                       ASL A                                ;8BEBAA|0A      |      ;
                       ASL A                                ;8BEBAB|0A      |      ;
                       CLC                                  ;8BEBAC|18      |      ;
                       ADC.L DATA8_89C2E6                   ;8BEBAD|6FE6C289|89C2E6;
                       TAX                                  ;8BEBB1|AA      |      ;
                       LDA.L DATA8_89C2E2,X                 ;8BEBB2|BFE2C289|89C2E2;
                       STA.B $00                            ;8BEBB6|8500    |000000;
                       LDA.L DATA8_89C2E4,X                 ;8BEBB8|BFE4C289|89C2E4;
                       STA.B $02                            ;8BEBBC|8502    |000002;
                       PLX                                  ;8BEBBE|FA      |      ;
                       LDA.B $00                            ;8BEBBF|A500    |000000;
                       CLC                                  ;8BEBC1|18      |      ;
                       ADC.L $7ED657,X                      ;8BEBC2|7F57D67E|7ED657;
                       STA.L $7ED657,X                      ;8BEBC6|9F57D67E|7ED657;
                       LDA.B $02                            ;8BEBCA|A502    |000002;
                       CLC                                  ;8BEBCC|18      |      ;
                       ADC.L $7ED6B9,X                      ;8BEBCD|7FB9D67E|7ED6B9;
                       STA.L $7ED6B9,X                      ;8BEBD1|9FB9D67E|7ED6B9;
 
                    ++ LDA.L $7ED657,X                      ;8BEBD5|BF57D67E|7ED657;
                       LSR A                                ;8BEBD9|4A      |      ;
                       LSR A                                ;8BEBDA|4A      |      ;
                       LSR A                                ;8BEBDB|4A      |      ;
                       LSR A                                ;8BEBDC|4A      |      ;
                       LSR A                                ;8BEBDD|4A      |      ;
                       LSR A                                ;8BEBDE|4A      |      ;
                       STA.B $CF                            ;8BEBDF|85CF    |0000CF;
                       LDA.L $7ED6B9,X                      ;8BEBE1|BFB9D67E|7ED6B9;
                       LSR A                                ;8BEBE5|4A      |      ;
                       LSR A                                ;8BEBE6|4A      |      ;
                       LSR A                                ;8BEBE7|4A      |      ;
                       LSR A                                ;8BEBE8|4A      |      ;
                       LSR A                                ;8BEBE9|4A      |      ;
                       LSR A                                ;8BEBEA|4A      |      ;
                       STA.B $D1                            ;8BEBEB|85D1    |0000D1;
                       PHX                                  ;8BEBED|DA      |      ;
                       LDA.L $7ED77D,X                      ;8BEBEE|BF7DD77E|7ED77D;
                       ASL A                                ;8BEBF2|0A      |      ;
                       TAX                                  ;8BEBF3|AA      |      ;
                       LDA.L DATA8_8BEC09,X                 ;8BEBF4|BF09EC8B|8BEC09;
                       STA.B $D3                            ;8BEBF8|85D3    |0000D3;
                       JSL.L CODE_FL_85BB73                 ;8BEBFA|2273BB85|85BB73;
                       PLX                                  ;8BEBFE|FA      |      ;
 
                     + DEX                                  ;8BEBFF|CA      |      ;
                       DEX                                  ;8BEC00|CA      |      ;
                       BMI +                                ;8BEC01|3003    |8BEC06;
                       JMP.W CODE_JP_8BEB82                 ;8BEC03|4C82EB  |8BEB82;
 
                     + PLY                                  ;8BEC06|7A      |      ;
                       PLX                                  ;8BEC07|FA      |      ;
                       RTL                                  ;8BEC08|6B      |      ;
 
         DATA8_8BEC09:
                       db $EF,$23,$EF,$23,$EF,$23,$EE,$23   ;8BEC09|        |      ;
                       db $EE,$23,$EE,$23,$DF,$23,$DF,$23   ;8BEC11|        |      ;
                       db $DF,$23,$DE,$23,$EE,$23,$DE,$23   ;8BEC19|        |      ;
                       db $DF,$23,$DF,$23,$DE,$23           ;8BEC21|        |      ;
                       db $DE,$23                           ;8BEC27|        |000823;
 
       CODE_FL_8BEC29:
                       PHP                                  ;8BEC29|08      |      ;
                       REP #$30                             ;8BEC2A|C230    |      ;
                       PHX                                  ;8BEC2C|DA      |      ;
                       PHY                                  ;8BEC2D|5A      |      ;
                       SEP #$20                             ;8BEC2E|E220    |      ;
                       LDX.W #$001B                         ;8BEC30|A21B00  |      ;
                       LDA.B #$00                           ;8BEC33|A900    |      ;
 
                     - STA.W $0000,Y                        ;8BEC35|990000  |7E0000;
                       INY                                  ;8BEC38|C8      |      ;
                       DEX                                  ;8BEC39|CA      |      ;
                       BNE -                                ;8BEC3A|D0F9    |8BEC35;
                       REP #$30                             ;8BEC3C|C230    |      ;
                       PLY                                  ;8BEC3E|7A      |      ;
                       PLX                                  ;8BEC3F|FA      |      ;
                       PLP                                  ;8BEC40|28      |      ;
                       RTL                                  ;8BEC41|6B      |      ;
 
       CODE_FL_8BEC42:
                       PHP                                  ;8BEC42|08      |      ;
                       REP #$30                             ;8BEC43|C230    |      ;
                       PHX                                  ;8BEC45|DA      |      ;
                       PHY                                  ;8BEC46|5A      |      ;
                       LDA.W $0009,Y                        ;8BEC47|B90900  |7E0009;
                       AND.W #$00FF                         ;8BEC4A|29FF00  |      ;
                       BEQ +                                ;8BEC4D|F007    |8BEC56;
                       CMP.W #$00FF                         ;8BEC4F|C9FF00  |      ;
                       BEQ ++                               ;8BEC52|F032    |8BEC86;
                       BRA +++                              ;8BEC54|8027    |8BEC7D;
 
                     + LDA.W $0001,Y                        ;8BEC56|B90100  |7E0001;
                       STA.B $25                            ;8BEC59|8525    |000025;
                       LDA.W $0000,Y                        ;8BEC5B|B90000  |7E0000;
                       STA.B $24                            ;8BEC5E|8524    |000024;
                       SEP #$20                             ;8BEC60|E220    |      ;
                       LDA.B [$24]                          ;8BEC62|A724    |000024;
                       STA.W $0009,Y                        ;8BEC64|990900  |7E0009;
                       CMP.B #$FF                           ;8BEC67|C9FF    |      ;
                       BEQ ++                               ;8BEC69|F01B    |8BEC86;
                       REP #$20                             ;8BEC6B|C220    |      ;
                       INC.B $24                            ;8BEC6D|E624    |000024;
                       LDA.B [$24]                          ;8BEC6F|A724    |000024;
                       STA.W $000C,Y                        ;8BEC71|990C00  |7E000C;
                       LDA.W $0000,Y                        ;8BEC74|B90000  |7E0000;
                       INC A                                ;8BEC77|1A      |      ;
                       INC A                                ;8BEC78|1A      |      ;
                       INC A                                ;8BEC79|1A      |      ;
                       STA.W $0000,Y                        ;8BEC7A|990000  |7E0000;
 
                   +++ SEP #$20                             ;8BEC7D|E220    |      ;
                       LDA.W $0009,Y                        ;8BEC7F|B90900  |7E0009;
                       DEC A                                ;8BEC82|3A      |      ;
                       STA.W $0009,Y                        ;8BEC83|990900  |7E0009;
 
                    ++ REP #$20                             ;8BEC86|C220    |      ;
                       LDA.W $000A,Y                        ;8BEC88|B90A00  |7E000A;
                       AND.W #$00FF                         ;8BEC8B|29FF00  |      ;
                       BEQ +                                ;8BEC8E|F007    |8BEC97;
                       CMP.W #$00FF                         ;8BEC90|C9FF00  |      ;
                       BEQ ++                               ;8BEC93|F02E    |8BECC3;
                       BRA +++                              ;8BEC95|8023    |8BECBA;
 
                     + LDA.W $0004,Y                        ;8BEC97|B90400  |7E0004;
                       STA.B $25                            ;8BEC9A|8525    |000025;
                       LDA.W $0003,Y                        ;8BEC9C|B90300  |7E0003;
                       STA.B $24                            ;8BEC9F|8524    |000024;
                       LDA.B [$24]                          ;8BECA1|A724    |000024;
                       SEP #$20                             ;8BECA3|E220    |      ;
                       STA.W $000A,Y                        ;8BECA5|990A00  |7E000A;
                       CMP.B #$FF                           ;8BECA8|C9FF    |      ;
                       BEQ ++                               ;8BECAA|F017    |8BECC3;
                       XBA                                  ;8BECAC|EB      |      ;
                       STA.W $000E,Y                        ;8BECAD|990E00  |7E000E;
                       REP #$20                             ;8BECB0|C220    |      ;
                       LDA.W $0003,Y                        ;8BECB2|B90300  |7E0003;
                       INC A                                ;8BECB5|1A      |      ;
                       INC A                                ;8BECB6|1A      |      ;
                       STA.W $0003,Y                        ;8BECB7|990300  |7E0003;
 
                   +++ SEP #$20                             ;8BECBA|E220    |      ;
                       LDA.W $000A,Y                        ;8BECBC|B90A00  |7E000A;
                       DEC A                                ;8BECBF|3A      |      ;
                       STA.W $000A,Y                        ;8BECC0|990A00  |7E000A;
 
                    ++ REP #$20                             ;8BECC3|C220    |      ;
                       LDA.W $000B,Y                        ;8BECC5|B90B00  |7E000B;
                       AND.W #$00FF                         ;8BECC8|29FF00  |      ;
                       BEQ +                                ;8BECCB|F007    |8BECD4;
                       CMP.W #$00FF                         ;8BECCD|C9FF00  |      ;
                       BEQ ++                               ;8BECD0|F03A    |8BED0C;
                       BRA +++                              ;8BECD2|802F    |8BED03;
 
                     + LDA.W $0007,Y                        ;8BECD4|B90700  |7E0007;
                       STA.B $25                            ;8BECD7|8525    |000025;
                       LDA.W $0006,Y                        ;8BECD9|B90600  |7E0006;
                       STA.B $24                            ;8BECDC|8524    |000024;
                       LDA.B [$24]                          ;8BECDE|A724    |000024;
                       INC.B $24                            ;8BECE0|E624    |000024;
                       SEP #$20                             ;8BECE2|E220    |      ;
                       STA.W $000B,Y                        ;8BECE4|990B00  |7E000B;
                       CMP.B #$FF                           ;8BECE7|C9FF    |      ;
                       BEQ ++                               ;8BECE9|F021    |8BED0C;
                       REP #$20                             ;8BECEB|C220    |      ;
                       LDA.B [$24]                          ;8BECED|A724    |000024;
                       SEP #$20                             ;8BECEF|E220    |      ;
                       STA.W $000F,Y                        ;8BECF1|990F00  |7E000F;
                       XBA                                  ;8BECF4|EB      |      ;
                       STA.W $0010,Y                        ;8BECF5|991000  |7E0010;
                       REP #$20                             ;8BECF8|C220    |      ;
                       LDA.W $0006,Y                        ;8BECFA|B90600  |7E0006;
                       INC A                                ;8BECFD|1A      |      ;
                       INC A                                ;8BECFE|1A      |      ;
                       INC A                                ;8BECFF|1A      |      ;
                       STA.W $0006,Y                        ;8BED00|990600  |7E0006;
 
                   +++ SEP #$20                             ;8BED03|E220    |      ;
                       LDA.W $000B,Y                        ;8BED05|B90B00  |7E000B;
                       DEC A                                ;8BED08|3A      |      ;
                       STA.W $000B,Y                        ;8BED09|990B00  |7E000B;
 
                    ++ REP #$20                             ;8BED0C|C220    |      ;
                       LDA.W $0013,Y                        ;8BED0E|B91300  |7E0013;
                       BPL +                                ;8BED11|100E    |8BED21;
                       db $EB,$0A,$69,$00,$00,$0A,$69,$00   ;8BED13|        |      ;
                       db $00,$09,$00,$FC,$80,$0C           ;8BED1B|        |      ;
 
                     + XBA                                  ;8BED21|EB      |      ;
                       ASL A                                ;8BED22|0A      |      ;
                       ADC.W #$0000                         ;8BED23|690000  |      ;
                       ASL A                                ;8BED26|0A      |      ;
                       ADC.W #$0000                         ;8BED27|690000  |      ;
                       AND.W #$03FF                         ;8BED2A|29FF03  |      ;
                       STA.B $00                            ;8BED2D|8500    |000000;
                       LDA.W $0015,Y                        ;8BED2F|B91500  |7E0015;
                       BPL +                                ;8BED32|100E    |8BED42;
                       XBA                                  ;8BED34|EB      |      ;
                       ASL A                                ;8BED35|0A      |      ;
                       ADC.W #$0000                         ;8BED36|690000  |      ;
                       ASL A                                ;8BED39|0A      |      ;
                       ADC.W #$0000                         ;8BED3A|690000  |      ;
                       ORA.W #$FC00                         ;8BED3D|0900FC  |      ;
                       BRA ++                               ;8BED40|800C    |8BED4E;
 
                     + XBA                                  ;8BED42|EB      |      ;
                       ASL A                                ;8BED43|0A      |      ;
                       ADC.W #$0000                         ;8BED44|690000  |      ;
                       ASL A                                ;8BED47|0A      |      ;
                       ADC.W #$0000                         ;8BED48|690000  |      ;
                       AND.W #$03FF                         ;8BED4B|29FF03  |      ;
 
                    ++ STA.B $02                            ;8BED4E|8502    |000002;
                       LDA.W $000F,Y                        ;8BED50|B90F00  |7E000F;
                       AND.W #$00FF                         ;8BED53|29FF00  |      ;
                       STA.B $04                            ;8BED56|8504    |000004;
                       LDA.W $0010,Y                        ;8BED58|B91000  |7E0010;
                       AND.W #$00FF                         ;8BED5B|29FF00  |      ;
                       STA.B $06                            ;8BED5E|8506    |000006;
                       JSL.L CODE_FL_89BE42                 ;8BED60|2242BE89|89BE42;
                       XBA                                  ;8BED64|EB      |      ;
                       AND.W #$FF00                         ;8BED65|2900FF  |      ;
                       STA.B $00                            ;8BED68|8500    |000000;
                       LDA.W $000C,Y                        ;8BED6A|B90C00  |7E000C;
                       CMP.W #$8000                         ;8BED6D|C90080  |      ;
                       BEQ +                                ;8BED70|F02C    |8BED9E;
                       LDA.B $00                            ;8BED72|A500    |000000;
                       SEC                                  ;8BED74|38      |      ;
                       SBC.W $0011,Y                        ;8BED75|F91100  |7E0011;
                       AND.W #$3FFF                         ;8BED78|29FF3F  |      ;
                       CMP.W #$2000                         ;8BED7B|C90020  |      ;
                       BCS ++                               ;8BED7E|B00F    |8BED8F;
                       LDA.W $0011,Y                        ;8BED80|B91100  |7E0011;
                       CLC                                  ;8BED83|18      |      ;
                       ADC.W $000C,Y                        ;8BED84|790C00  |7E000C;
                       AND.W #$3FFF                         ;8BED87|29FF3F  |      ;
                       STA.W $0011,Y                        ;8BED8A|991100  |7E0011;
                       BRA +++                              ;8BED8D|8016    |8BEDA5;
 
                    ++ LDA.W $0011,Y                        ;8BED8F|B91100  |7E0011;
                       SEC                                  ;8BED92|38      |      ;
                       SBC.W $000C,Y                        ;8BED93|F90C00  |7E000C;
                       AND.W #$3FFF                         ;8BED96|29FF3F  |      ;
                       STA.W $0011,Y                        ;8BED99|991100  |7E0011;
                       BRA +++                              ;8BED9C|8007    |8BEDA5;
 
                     + LDA.B $00                            ;8BED9E|A500    |000000;
                       STA.W $0011,Y                        ;8BEDA0|991100  |7E0011;
                       BRA +++                              ;8BEDA3|8000    |8BEDA5;
 
                   +++ LDA.W $0011,Y                        ;8BEDA5|B91100  |7E0011;
                       XBA                                  ;8BEDA8|EB      |      ;
                       AND.W #$00FF                         ;8BEDA9|29FF00  |      ;
                       ASL A                                ;8BEDAC|0A      |      ;
                       ASL A                                ;8BEDAD|0A      |      ;
                       STA.B $00                            ;8BEDAE|8500    |000000;
                       LDA.W $000E,Y                        ;8BEDB0|B90E00  |7E000E;
                       AND.W #$00FF                         ;8BEDB3|29FF00  |      ;
                       ASL A                                ;8BEDB6|0A      |      ;
                       TAX                                  ;8BEDB7|AA      |      ;
                       LDA.L DATA8_89C2E2,X                 ;8BEDB8|BFE2C289|89C2E2;
                       CLC                                  ;8BEDBC|18      |      ;
                       ADC.B $00                            ;8BEDBD|6500    |000000;
                       TAX                                  ;8BEDBF|AA      |      ;
                       LDA.L DATA8_89C2E2,X                 ;8BEDC0|BFE2C289|89C2E2;
                       CLC                                  ;8BEDC4|18      |      ;
                       ADC.W $0013,Y                        ;8BEDC5|791300  |7E0013;
                       STA.W $0013,Y                        ;8BEDC8|991300  |7E0013;
                       LDA.L DATA8_89C2E4,X                 ;8BEDCB|BFE4C289|89C2E4;
                       CLC                                  ;8BEDCF|18      |      ;
                       ADC.W $0015,Y                        ;8BEDD0|791500  |7E0015;
                       STA.W $0015,Y                        ;8BEDD3|991500  |7E0015;
                       LDA.W $0013,Y                        ;8BEDD6|B91300  |7E0013;
                       LSR A                                ;8BEDD9|4A      |      ;
                       LSR A                                ;8BEDDA|4A      |      ;
                       LSR A                                ;8BEDDB|4A      |      ;
                       LSR A                                ;8BEDDC|4A      |      ;
                       LSR A                                ;8BEDDD|4A      |      ;
                       LSR A                                ;8BEDDE|4A      |      ;
                       STA.W $0017,Y                        ;8BEDDF|991700  |7E0017;
                       LDA.W $0015,Y                        ;8BEDE2|B91500  |7E0015;
                       LSR A                                ;8BEDE5|4A      |      ;
                       LSR A                                ;8BEDE6|4A      |      ;
                       LSR A                                ;8BEDE7|4A      |      ;
                       LSR A                                ;8BEDE8|4A      |      ;
                       LSR A                                ;8BEDE9|4A      |      ;
                       LSR A                                ;8BEDEA|4A      |      ;
                       STA.W $0019,Y                        ;8BEDEB|991900  |7E0019;
                       PLY                                  ;8BEDEE|7A      |      ;
                       PLX                                  ;8BEDEF|FA      |      ;
                       PLP                                  ;8BEDF0|28      |      ;
                       RTL                                  ;8BEDF1|6B      |      ;
 
       CODE_FL_8BEDF2:
                       PHX                                  ;8BEDF2|DA      |      ;
                       PHY                                  ;8BEDF3|5A      |      ;
                       LDA.B $A9                            ;8BEDF4|A5A9    |0000A9;
                       LSR A                                ;8BEDF6|4A      |      ;
                       BCC +                                ;8BEDF7|906B    |8BEE64;
                       LDX.W #$0060                         ;8BEDF9|A26000  |      ;
 
                     - LDA.L $7ED6B9,X                      ;8BEDFC|BFB9D67E|7ED6B9;
                       BNE ++                               ;8BEE00|D05E    |8BEE60;
                       LDA.W #$000F                         ;8BEE02|A90F00  |      ;
                       STA.L $7ED77D,X                      ;8BEE05|9F7DD77E|7ED77D;
                       PHX                                  ;8BEE09|DA      |      ;
 
                    -- REP #$20                             ;8BEE0A|C220    |      ;
                       JSL.L CODE_FL_8481D6                 ;8BEE0C|22D68184|8481D6;
                       AND.W #$00FF                         ;8BEE10|29FF00  |      ;
                       STA.B $00                            ;8BEE13|8500    |000000;
                       JSL.L CODE_FL_8481D6                 ;8BEE15|22D68184|8481D6;
                       AND.W #$007F                         ;8BEE19|297F00  |      ;
                       STA.B $02                            ;8BEE1C|8502    |000002;
                       LSR A                                ;8BEE1E|4A      |      ;
                       LSR A                                ;8BEE1F|4A      |      ;
                       AND.W #$3FFE                         ;8BEE20|29FE3F  |      ;
                       TAX                                  ;8BEE23|AA      |      ;
                       SEP #$20                             ;8BEE24|E220    |      ;
                       LDA.B $00                            ;8BEE26|A500    |000000;
                       CMP.L DATA8_8BEE6B,X                 ;8BEE28|DF6BEE8B|8BEE6B;
                       BCC --                               ;8BEE2C|90DC    |8BEE0A;
                       CMP.L DATA8_8BEE6C,X                 ;8BEE2E|DF6CEE8B|8BEE6C;
                       BCS --                               ;8BEE32|B0D6    |8BEE0A;
                       REP #$20                             ;8BEE34|C220    |      ;
                       PLX                                  ;8BEE36|FA      |      ;
                       LDA.B $00                            ;8BEE37|A500    |000000;
                       CLC                                  ;8BEE39|18      |      ;
                       ADC.W #$FFFC                         ;8BEE3A|69FCFF  |      ;
                       ASL A                                ;8BEE3D|0A      |      ;
                       ASL A                                ;8BEE3E|0A      |      ;
                       ASL A                                ;8BEE3F|0A      |      ;
                       ASL A                                ;8BEE40|0A      |      ;
                       ASL A                                ;8BEE41|0A      |      ;
                       ASL A                                ;8BEE42|0A      |      ;
                       STA.L $7ED657,X                      ;8BEE43|9F57D67E|7ED657;
                       LDA.B $02                            ;8BEE47|A502    |000002;
                       CLC                                  ;8BEE49|18      |      ;
                       ADC.W #$FFFC                         ;8BEE4A|69FCFF  |      ;
                       ASL A                                ;8BEE4D|0A      |      ;
                       ASL A                                ;8BEE4E|0A      |      ;
                       ASL A                                ;8BEE4F|0A      |      ;
                       ASL A                                ;8BEE50|0A      |      ;
                       ASL A                                ;8BEE51|0A      |      ;
                       ASL A                                ;8BEE52|0A      |      ;
                       STA.L $7ED6B9,X                      ;8BEE53|9FB9D67E|7ED6B9;
                       LDA.W #$8000                         ;8BEE57|A90080  |      ;
                       STA.L $7ED71B,X                      ;8BEE5A|9F1BD77E|7ED71B;
                       BRA +                                ;8BEE5E|8004    |8BEE64;
 
                    ++ DEX                                  ;8BEE60|CA      |      ;
                       DEX                                  ;8BEE61|CA      |      ;
                       BPL -                                ;8BEE62|1098    |8BEDFC;
 
                     + JSL.L CODE_FL_8BEB7D                 ;8BEE64|227DEB8B|8BEB7D;
                       PLY                                  ;8BEE68|7A      |      ;
                       PLX                                  ;8BEE69|FA      |      ;
                       RTL                                  ;8BEE6A|6B      |      ;
 
         DATA8_8BEE6B:
                       db $48                               ;8BEE6B|        |      ;
 
         DATA8_8BEE6C:
                       db $60,$48,$68,$48,$70,$48,$78,$50   ;8BEE6C|        |      ;
                       db $80,$50,$88,$50,$90,$58,$98,$58   ;8BEE74|        |      ;
                       db $A0,$58,$A8,$60,$B0,$60,$B8,$60   ;8BEE7C|        |      ;
                       db $C0,$68,$C8,$68,$D0,$68,$D8       ;8BEE84|        |      ;
 
       CODE_FL_8BEE8B:
                       PHX                                  ;8BEE8B|DA      |      ;
                       PHY                                  ;8BEE8C|5A      |      ;
                       LDX.W #$0060                         ;8BEE8D|A26000  |      ;
 
                     - LDA.L $7ED6B9,X                      ;8BEE90|BFB9D67E|7ED6B9;
                       BNE +                                ;8BEE94|D05D    |8BEEF3;
                       LDA.W #$000F                         ;8BEE96|A90F00  |      ;
                       STA.L $7ED77D,X                      ;8BEE99|9F7DD77E|7ED77D;
                       LDA.W #$8000                         ;8BEE9D|A90080  |      ;
                       STA.L $7ED71B,X                      ;8BEEA0|9F1BD77E|7ED71B;
                       JSL.L CODE_FL_8481D6                 ;8BEEA4|22D68184|8481D6;
                       LSR A                                ;8BEEA8|4A      |      ;
                       BCS ++                               ;8BEEA9|B00C    |8BEEB7;
                       LDA.W #$00B4                         ;8BEEAB|A9B400  |      ;
                       STA.B $00                            ;8BEEAE|8500    |000000;
                       LDA.W #$0048                         ;8BEEB0|A94800  |      ;
                       STA.B $02                            ;8BEEB3|8502    |000002;
                       BRA +++                              ;8BEEB5|800A    |8BEEC1;
 
                    ++ LDA.W #$0034                         ;8BEEB7|A93400  |      ;
                       STA.B $00                            ;8BEEBA|8500    |000000;
                       LDA.W #$0030                         ;8BEEBC|A93000  |      ;
                       STA.B $02                            ;8BEEBF|8502    |000002;
 
                   +++ JSL.L CODE_FL_8481D6                 ;8BEEC1|22D68184|8481D6;
                       AND.W #$003F                         ;8BEEC5|293F00  |      ;
                       SEC                                  ;8BEEC8|38      |      ;
                       SBC.W #$0020                         ;8BEEC9|E92000  |      ;
                       CLC                                  ;8BEECC|18      |      ;
                       ADC.B $00                            ;8BEECD|6500    |000000;
                       ASL A                                ;8BEECF|0A      |      ;
                       ASL A                                ;8BEED0|0A      |      ;
                       ASL A                                ;8BEED1|0A      |      ;
                       ASL A                                ;8BEED2|0A      |      ;
                       ASL A                                ;8BEED3|0A      |      ;
                       ASL A                                ;8BEED4|0A      |      ;
                       STA.L $7ED657,X                      ;8BEED5|9F57D67E|7ED657;
                       JSL.L CODE_FL_8481D6                 ;8BEED9|22D68184|8481D6;
                       AND.W #$003F                         ;8BEEDD|293F00  |      ;
                       SEC                                  ;8BEEE0|38      |      ;
                       SBC.W #$0020                         ;8BEEE1|E92000  |      ;
                       CLC                                  ;8BEEE4|18      |      ;
                       ADC.B $02                            ;8BEEE5|6502    |000002;
                       ASL A                                ;8BEEE7|0A      |      ;
                       ASL A                                ;8BEEE8|0A      |      ;
                       ASL A                                ;8BEEE9|0A      |      ;
                       ASL A                                ;8BEEEA|0A      |      ;
                       ASL A                                ;8BEEEB|0A      |      ;
                       ASL A                                ;8BEEEC|0A      |      ;
                       STA.L $7ED6B9,X                      ;8BEEED|9FB9D67E|7ED6B9;
                       BRA ++                               ;8BEEF1|8004    |8BEEF7;
 
                     + DEX                                  ;8BEEF3|CA      |      ;
                       DEX                                  ;8BEEF4|CA      |      ;
                       BPL -                                ;8BEEF5|1099    |8BEE90;
 
                    ++ PLY                                  ;8BEEF7|7A      |      ;
                       PLX                                  ;8BEEF8|FA      |      ;
                       RTL                                  ;8BEEF9|6B      |      ;
                       LDA.W #$0000                         ;8BEEFA|A90000  |      ;
                       STA.L $7ED854                        ;8BEEFD|8F54D87E|7ED854;
                       RTL                                  ;8BEF01|6B      |      ;
                       LDA.L $7ED854                        ;8BEF02|AF54D87E|7ED854;
                       ASL A                                ;8BEF06|0A      |      ;
                       TAX                                  ;8BEF07|AA      |      ;
                       JSR.W (DATA8_8BEF15,X)               ;8BEF08|FC15EF  |8BEF15;
                       LDA.L $7ED854                        ;8BEF0B|AF54D87E|7ED854;
                       INC A                                ;8BEF0F|1A      |      ;
                       STA.L $7ED854                        ;8BEF10|8F54D87E|7ED854;
                       RTL                                  ;8BEF14|6B      |      ;
 
         DATA8_8BEF15:
                       db $44,$EF,$62,$EF,$74,$EF,$79,$EF   ;8BEF15|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BEF1D|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BEF25|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BEF2D|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BEF35|        |      ;
                       db $3F,$EF                           ;8BEF3D|        |      ;
                       JSL.L CODE_FL_89A509                 ;8BEF3F|2209A589|89A509;
                       RTS                                  ;8BEF43|60      |      ;
                       LDX.W #$01FE                         ;8BEF44|A2FE01  |      ;
 
                     - LDA.L $7FC160,X                      ;8BEF47|BF60C17F|7FC160;
                       STA.L $7E86F6,X                      ;8BEF4B|9FF6867E|7E86F6;
                       DEX                                  ;8BEF4F|CA      |      ;
                       DEX                                  ;8BEF50|CA      |      ;
                       BPL -                                ;8BEF51|10F4    |8BEF47;
                       SEP #$20                             ;8BEF53|E220    |      ;
                       LDA.L $0001E2                        ;8BEF55|AFE20100|0001E2;
                       AND.B #$FE                           ;8BEF59|29FE    |      ;
                       STA.L $0001E2                        ;8BEF5B|8FE20100|0001E2;
                       REP #$20                             ;8BEF5F|C220    |      ;
                       RTS                                  ;8BEF61|60      |      ;
                       LDX.W #$03FC                         ;8BEF62|A2FC03  |      ;
 
                     - LDA.L $7F8882,X                      ;8BEF65|BF82887F|7F8882;
                       STA.L $7E4C1E,X                      ;8BEF69|9F1E4C7E|7E4C1E;
                       DEX                                  ;8BEF6D|CA      |      ;
                       DEX                                  ;8BEF6E|CA      |      ;
                       DEX                                  ;8BEF6F|CA      |      ;
                       DEX                                  ;8BEF70|CA      |      ;
                       BPL -                                ;8BEF71|10F2    |8BEF65;
                       RTS                                  ;8BEF73|60      |      ;
                       JSL.L CODE_FL_8BEFDC                 ;8BEF74|22DCEF8B|8BEFDC;
                       RTS                                  ;8BEF78|60      |      ;
                       SEP #$20                             ;8BEF79|E220    |      ;
                       LDA.B #$7F                           ;8BEF7B|A97F    |      ;
                       STA.L $7ED875                        ;8BEF7D|8F75D87E|7ED875;
                       LDA.B #$80                           ;8BEF81|A980    |      ;
                       STA.L $7ED878                        ;8BEF83|8F78D87E|7ED878;
                       REP #$20                             ;8BEF87|C220    |      ;
                       LDA.W #$A160                         ;8BEF89|A960A1  |      ;
                       STA.L $7ED873                        ;8BEF8C|8F73D87E|7ED873;
                       LDA.W #$0200                         ;8BEF90|A90002  |      ;
                       STA.L $7ED876                        ;8BEF93|8F76D87E|7ED876;
                       LDA.W #$5000                         ;8BEF97|A90050  |      ;
                       STA.L $7ED879                        ;8BEF9A|8F79D87E|7ED879;
                       RTS                                  ;8BEF9E|60      |      ;
                       PHB                                  ;8BEF9F|8B      |      ;
                       PEA.W $7E00                          ;8BEFA0|F4007E  |007E00;
                       PLB                                  ;8BEFA3|AB      |      ;
                       PLB                                  ;8BEFA4|AB      |      ;
                       LDY.W #$D873                         ;8BEFA5|A073D8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BEFA8|22CAA080|80A0CA;
                       PLB                                  ;8BEFAC|AB      |      ;
                       LDA.L $7ED873                        ;8BEFAD|AF73D87E|7ED873;
                       CLC                                  ;8BEFB1|18      |      ;
                       ADC.W #$0200                         ;8BEFB2|690002  |      ;
                       STA.L $7ED873                        ;8BEFB5|8F73D87E|7ED873;
                       LDA.L $7ED879                        ;8BEFB9|AF79D87E|7ED879;
                       CLC                                  ;8BEFBD|18      |      ;
                       ADC.W #$0100                         ;8BEFBE|690001  |      ;
                       STA.L $7ED879                        ;8BEFC1|8F79D87E|7ED879;
                       RTS                                  ;8BEFC5|60      |      ;
 
                    -- PHB                                  ;8BEFC6|8B      |      ;
                       PHK                                  ;8BEFC7|4B      |      ;
                       PLB                                  ;8BEFC8|AB      |      ;
                       LDY.W #$EFD3                         ;8BEFC9|A0D3EF  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BEFCC|22CAA080|80A0CA;
                       PLB                                  ;8BEFD0|AB      |      ;
                       BRA +                                ;8BEFD1|8008    |8BEFDB;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8BEFD3|        |      ;
 
                     + RTL                                  ;8BEFDB|6B      |      ;
 
       CODE_FL_8BEFDC:
                       LDX.W #$03BE                         ;8BEFDC|A2BE03  |      ;
 
                     - LDA.L $7F9160,X                      ;8BEFDF|BF60917F|7F9160;
                       STA.L $7E2800,X                      ;8BEFE3|9F00287E|7E2800;
                       DEX                                  ;8BEFE7|CA      |      ;
                       DEX                                  ;8BEFE8|CA      |      ;
                       BPL -                                ;8BEFE9|10F4    |8BEFDF;
                       BRA --                               ;8BEFEB|80D9    |8BEFC6;
 
                     - LDX.W #$03BE                         ;8BEFED|A2BE03  |      ;
 
                   --- LDA.L $7F9960,X                      ;8BEFF0|BF60997F|7F9960;
                       STA.L $7E2800,X                      ;8BEFF4|9F00287E|7E2800;
                       DEX                                  ;8BEFF8|CA      |      ;
                       DEX                                  ;8BEFF9|CA      |      ;
                       BPL ---                              ;8BEFFA|10F4    |8BEFF0;
                       BRA --                               ;8BEFFC|80C8    |8BEFC6;
                       db $A5,$A9,$4A,$90,$D9,$80,$E8       ;8BEFFE|        |0000A9;
                       LDA.B $A9                            ;8BF005|A5A9    |0000A9;
                       AND.W #$0003                         ;8BF007|290300  |      ;
                       BNE CODE_FL_8BEFDC                   ;8BF00A|D0D0    |8BEFDC;
                       BRA -                                ;8BF00C|80DF    |8BEFED;
                       LDA.B $A9                            ;8BF00E|A5A9    |0000A9;
                       AND.W #$0003                         ;8BF010|290300  |      ;
                       BEQ CODE_FL_8BEFDC                   ;8BF013|F0C7    |8BEFDC;
                       BRA -                                ;8BF015|80D6    |8BEFED;
                       LDA.L $7ED1E4                        ;8BF017|AFE4D17E|7ED1E4;
                       AND.W #$7FFF                         ;8BF01B|29FF7F  |      ;
                       STA.L $7ED1E4                        ;8BF01E|8FE4D17E|7ED1E4;
                       RTL                                  ;8BF022|6B      |      ;
                       LDA.L $7ED854                        ;8BF023|AF54D87E|7ED854;
                       ASL A                                ;8BF027|0A      |      ;
                       TAX                                  ;8BF028|AA      |      ;
                       JSR.W (DATA8_8BF036,X)               ;8BF029|FC36F0  |8BF036;
                       LDA.L $7ED854                        ;8BF02C|AF54D87E|7ED854;
                       INC A                                ;8BF030|1A      |      ;
                       STA.L $7ED854                        ;8BF031|8F54D87E|7ED854;
                       RTL                                  ;8BF035|6B      |      ;
 
         DATA8_8BF036:
                       db $85,$F0,$5F,$F0,$9F,$EF,$9F,$EF   ;8BF036|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BF03E|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BF046|        |      ;
                       db $9F,$EF,$9F,$EF,$9F,$EF,$9F,$EF   ;8BF04E|        |      ;
                       db $91,$F0,$5A,$F0                   ;8BF056|        |      ;
                       JSL.L CODE_FL_89A509                 ;8BF05A|2209A589|89A509;
                       RTS                                  ;8BF05E|60      |      ;
                       SEP #$20                             ;8BF05F|E220    |      ;
                       LDA.B #$7F                           ;8BF061|A97F    |      ;
                       STA.L $7ED875                        ;8BF063|8F75D87E|7ED875;
                       LDA.B #$80                           ;8BF067|A980    |      ;
                       STA.L $7ED878                        ;8BF069|8F78D87E|7ED878;
                       REP #$20                             ;8BF06D|C220    |      ;
                       LDA.W #$0200                         ;8BF06F|A90002  |      ;
                       STA.L $7ED876                        ;8BF072|8F76D87E|7ED876;
                       LDA.W #$C360                         ;8BF076|A960C3  |      ;
                       STA.L $7ED873                        ;8BF079|8F73D87E|7ED873;
                       LDA.W #$1000                         ;8BF07D|A90010  |      ;
                       STA.L $7ED879                        ;8BF080|8F79D87E|7ED879;
                       RTS                                  ;8BF084|60      |      ;
                       LDA.L $7ED1E4                        ;8BF085|AFE4D17E|7ED1E4;
                       AND.W #$7FFF                         ;8BF089|29FF7F  |      ;
                       STA.L $7ED1E4                        ;8BF08C|8FE4D17E|7ED1E4;
                       RTS                                  ;8BF090|60      |      ;
                       SEP #$20                             ;8BF091|E220    |      ;
                       LDA.W $01E2                          ;8BF093|ADE201  |0001E2;
                       AND.B #$FE                           ;8BF096|29FE    |      ;
                       STA.W $01E2                          ;8BF098|8DE201  |0001E2;
                       REP #$20                             ;8BF09B|C220    |      ;
                       LDA.W #$0000                         ;8BF09D|A90000  |      ;
                       STA.L $7ED348                        ;8BF0A0|8F48D37E|7ED348;
                       STA.L $7ED34A                        ;8BF0A4|8F4AD37E|7ED34A;
                       STA.L $7ED344                        ;8BF0A8|8F44D37E|7ED344;
                       STA.L $7ED346                        ;8BF0AC|8F46D37E|7ED346;
                       LDA.L $7ED1E4                        ;8BF0B0|AFE4D17E|7ED1E4;
                       ORA.W #$0400                         ;8BF0B4|090004  |      ;
                       STA.L $7ED1E4                        ;8BF0B7|8FE4D17E|7ED1E4;
                       LDA.W #$0070                         ;8BF0BB|A97000  |      ;
                       STA.L $7ED250                        ;8BF0BE|8F50D27E|7ED250;
                       JSL.L CODE_FL_8BF0C7                 ;8BF0C2|22C7F08B|8BF0C7;
                       RTS                                  ;8BF0C6|60      |      ;
 
       CODE_FL_8BF0C7:
                       LDA.W #$007E                         ;8BF0C7|A97E00  |      ;
                       STA.L $7ED252                        ;8BF0CA|8F52D27E|7ED252;
                       LDA.L $7ED4B5                        ;8BF0CE|AFB5D47E|7ED4B5;
                       CMP.W #$000B                         ;8BF0D2|C90B00  |      ;
                       BNE +                                ;8BF0D5|D015    |8BF0EC;
                       db $A9,$00,$00,$8F,$7B,$D8,$7E,$A9   ;8BF0D7|        |      ;
                       db $0B,$00,$22,$07,$91,$8B,$A9,$01   ;8BF0DF|        |      ;
                       db $00,$8F,$B3,$D4,$7E               ;8BF0E7|        |      ;
 
                     + RTL                                  ;8BF0EC|6B      |      ;
                       LDA.W #$0001                         ;8BF0ED|A90100  |      ;
                       STA.L $7ED87B                        ;8BF0F0|8F7BD87E|7ED87B;
                       LDX.W #$001E                         ;8BF0F4|A21E00  |      ;
 
                     - LDA.L $7FE120,X                      ;8BF0F7|BF20E17F|7FE120;
                       STA.L $7E8AB6,X                      ;8BF0FB|9FB68A7E|7E8AB6;
                       DEX                                  ;8BF0FF|CA      |      ;
                       DEX                                  ;8BF100|CA      |      ;
                       BPL -                                ;8BF101|10F4    |8BF0F7;
                       RTL                                  ;8BF103|6B      |      ;
                       LDA.W #$000B                         ;8BF104|A90B00  |      ;
                       STA.W $1988                          ;8BF107|8D8819  |8B1988;
                       RTL                                  ;8BF10A|6B      |      ;
                       db $A9,$FF,$00,$8D,$88,$19,$6B       ;8BF10B|        |      ;
                       LDA.W #$00D2                         ;8BF112|A9D200  |      ;
                       STA.W $1986                          ;8BF115|8D8619  |8B1986;
                       RTL                                  ;8BF118|6B      |      ;
 
       CODE_FL_8BF119:
                       LDA.W #$00D1                         ;8BF119|A9D100  |      ;
                       STA.W $1986                          ;8BF11C|8D8619  |8B1986;
                       RTL                                  ;8BF11F|6B      |      ;
                       LDA.W #$00D3                         ;8BF120|A9D300  |      ;
                       STA.W $1986                          ;8BF123|8D8619  |001986;
                       RTL                                  ;8BF126|6B      |      ;
                       LDA.W #$00C0                         ;8BF127|A9C000  |      ;
                       STA.W $1986                          ;8BF12A|8D8619  |001986;
                       RTL                                  ;8BF12D|6B      |      ;
 
       CODE_FL_8BF12E:
                       LDA.W #$00E0                         ;8BF12E|A9E000  |      ;
                       STA.W $1986                          ;8BF131|8D8619  |001986;
                       RTL                                  ;8BF134|6B      |      ;
 
       CODE_FL_8BF135:
                       LDA.W #$00E1                         ;8BF135|A9E100  |      ;
                       STA.W $1986                          ;8BF138|8D8619  |8A1986;
                       RTL                                  ;8BF13B|6B      |      ;
 
       CODE_FL_8BF13C:
                       LDA.W #$00E2                         ;8BF13C|A9E200  |      ;
                       STA.W $1986                          ;8BF13F|8D8619  |8B1986;
                       RTL                                  ;8BF142|6B      |      ;
                       LDA.W #$00E3                         ;8BF143|A9E300  |      ;
                       STA.W $1986                          ;8BF146|8D8619  |001986;
                       RTL                                  ;8BF149|6B      |      ;
 
       CODE_FL_8BF14A:
                       LDA.W #$0001                         ;8BF14A|A90100  |      ;
                       STA.W $1988                          ;8BF14D|8D8819  |8B1988;
                       RTL                                  ;8BF150|6B      |      ;
 
       CODE_FL_8BF151:
                       LDA.W #$0004                         ;8BF151|A90400  |      ;
                       STA.W $1988                          ;8BF154|8D8819  |8A1988;
                       RTL                                  ;8BF157|6B      |      ;
 
       CODE_FL_8BF158:
                       LDA.W #$0005                         ;8BF158|A90500  |      ;
                       STA.W $1988                          ;8BF15B|8D8819  |8B1988;
                       RTL                                  ;8BF15E|6B      |      ;
                       LDA.W #$00C1                         ;8BF15F|A9C100  |      ;
                       STA.W $198C                          ;8BF162|8D8C19  |8B198C;
                       RTL                                  ;8BF165|6B      |      ;
                       LDA.W #$004F                         ;8BF166|A94F00  |      ;
                       STA.W $198C                          ;8BF169|8D8C19  |8B198C;
                       RTL                                  ;8BF16C|6B      |      ;
 
       CODE_FL_8BF16D:
                       LDA.W #$004C                         ;8BF16D|A94C00  |      ;
                       STA.W $198C                          ;8BF170|8D8C19  |7E198C;
                       RTL                                  ;8BF173|6B      |      ;
                       LDA.W #$004D                         ;8BF174|A94D00  |      ;
                       STA.W $198C                          ;8BF177|8D8C19  |7E198C;
                       RTL                                  ;8BF17A|6B      |      ;
                       LDA.W #$004E                         ;8BF17B|A94E00  |      ;
                       STA.W $198C                          ;8BF17E|8D8C19  |7E198C;
                       RTL                                  ;8BF181|6B      |      ;
                       LDA.W #$0019                         ;8BF182|A91900  |      ;
                       STA.W $198A                          ;8BF185|8D8A19  |8B198A;
                       RTL                                  ;8BF188|6B      |      ;
                       LDA.W #$001A                         ;8BF189|A91A00  |      ;
                       STA.W $198A                          ;8BF18C|8D8A19  |00198A;
                       RTL                                  ;8BF18F|6B      |      ;
                       LDA.W #$001B                         ;8BF190|A91B00  |      ;
                       STA.W $198A                          ;8BF193|8D8A19  |00198A;
                       RTL                                  ;8BF196|6B      |      ;
 
       CODE_FL_8BF197:
                       LDA.W #$000C                         ;8BF197|A90C00  |      ;
                       STA.W $1988                          ;8BF19A|8D8819  |7E1988;
                       RTL                                  ;8BF19D|6B      |      ;
                       LDA.W #$0006                         ;8BF19E|A90600  |      ;
                       STA.W $198C                          ;8BF1A1|8D8C19  |8B198C;
                       RTL                                  ;8BF1A4|6B      |      ;
                       LDA.W #$0010                         ;8BF1A5|A91000  |      ;
                       STA.W $198C                          ;8BF1A8|8D8C19  |8B198C;
                       RTL                                  ;8BF1AB|6B      |      ;
                       LDA.W #$000F                         ;8BF1AC|A90F00  |      ;
                       STA.W $198C                          ;8BF1AF|8D8C19  |8B198C;
                       RTL                                  ;8BF1B2|6B      |      ;
 
       CODE_FL_8BF1B3:
                       PHP                                  ;8BF1B3|08      |      ;
                       SEP #$20                             ;8BF1B4|E220    |      ;
                       LDA.B #$81                           ;8BF1B6|A981    |      ;
                       STA.L NMITIMEN                       ;8BF1B8|8F004200|004200;
                       LDA.B #$00                           ;8BF1BC|A900    |      ;
                       STA.L $0001B6                        ;8BF1BE|8FB60100|0001B6;
                       REP #$20                             ;8BF1C2|C220    |      ;
                       JSL.L CODE_FL_80A145                 ;8BF1C4|2245A180|80A145;
                       JSL.L CODE_FL_809115                 ;8BF1C8|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8BF1CC|22F79C80|809CF7;
                       LDA.W #$0000                         ;8BF1D0|A90000  |      ;
                       STA.L $7ED1E0                        ;8BF1D3|8FE0D17E|7ED1E0;
                       LDA.W #$000B                         ;8BF1D7|A90B00  |      ;
                       STA.L Game_State-$7E0000             ;8BF1DA|8FA00200|0002A0;
                       PLP                                  ;8BF1DE|28      |      ;
                       RTL                                  ;8BF1DF|6B      |      ;
                       SEP #$20                             ;8BF1E0|E220    |      ;
                       LDA.B #$81                           ;8BF1E2|A981    |      ;
                       STA.L NMITIMEN                       ;8BF1E4|8F004200|004200;
                       LDA.B #$00                           ;8BF1E8|A900    |      ;
                       STA.L $0001B6                        ;8BF1EA|8FB60100|0001B6;
                       JSL.L CODE_FL_80A145                 ;8BF1EE|2245A180|80A145;
                       REP #$20                             ;8BF1F2|C220    |      ;
                       JSL.L CODE_FL_809115                 ;8BF1F4|22159180|809115;
                       JSL.L CODE_FL_809CF7                 ;8BF1F8|22F79C80|809CF7;
                       JSL.L CODE_FL_8B94F1                 ;8BF1FC|22F1948B|8B94F1;
                       LDA.W #$0000                         ;8BF200|A90000  |      ;
                       STA.L $7ED1E0                        ;8BF203|8FE0D17E|7ED1E0;
                       LDA.L Game_State-$7E0000             ;8BF207|AFA00200|0002A0;
                       INC A                                ;8BF20B|1A      |      ;
                       STA.L Game_State-$7E0000             ;8BF20C|8FA00200|0002A0;
                       RTL                                  ;8BF210|6B      |      ;
                       PHP                                  ;8BF211|08      |      ;
                       REP #$30                             ;8BF212|C230    |      ;
                       PHB                                  ;8BF214|8B      |      ;
                       PEA.W $7E00                          ;8BF215|F4007E  |007E00;
                       PLB                                  ;8BF218|AB      |      ;
                       PLB                                  ;8BF219|AB      |      ;
                       LDA.L $7ED1E0                        ;8BF21A|AFE0D17E|7ED1E0;
                       ASL A                                ;8BF21E|0A      |      ;
                       TAX                                  ;8BF21F|AA      |      ;
                       JSR.W (DATA8_8BF226,X)               ;8BF220|FC26F2  |8BF226;
                       PLB                                  ;8BF223|AB      |      ;
                       PLP                                  ;8BF224|28      |      ;
                       RTL                                  ;8BF225|6B      |      ;
 
         DATA8_8BF226:
                       db $02,$81,$34,$81,$3B,$F2,$10,$81   ;8BF226|        |      ;
                       db $1E,$81,$8E,$F2,$02,$81,$7A,$F4   ;8BF22E|        |      ;
                       db $10,$81,$0B,$F6,$60               ;8BF236|        |8BF1B9;
                       JSL.L CODE_FL_8B93B4                 ;8BF23B|22B4938B|8B93B4;
                       SEP #$20                             ;8BF23F|E220    |      ;
                       LDA.B #$04                           ;8BF241|A904    |      ;
                       TSB.W $01E2                          ;8BF243|0CE201  |0001E2;
                       LDA.B #$08                           ;8BF246|A908    |      ;
                       TSB.W $01BA                          ;8BF248|0CBA01  |0001BA;
                       LDA.B #$01                           ;8BF24B|A901    |      ;
                       TSB.W $01BE                          ;8BF24D|0CBE01  |0001BE;
                       REP #$20                             ;8BF250|C220    |      ;
                       LDA.L $7ED1E4                        ;8BF252|AFE4D17E|7ED1E4;
                       AND.W #$FBFF                         ;8BF256|29FFFB  |      ;
                       STA.L $7ED1E4                        ;8BF259|8FE4D17E|7ED1E4;
                       JSL.L CODE_FL_8BF312                 ;8BF25D|2212F38B|8BF312;
                       JSL.L CODE_FL_8BF303                 ;8BF261|2203F38B|8BF303;
                       SEP #$20                             ;8BF265|E220    |      ;
                       LDA.B #$00                           ;8BF267|A900    |      ;
                       STA.L $0001B6                        ;8BF269|8FB60100|0001B6;
                       LDA.B #$00                           ;8BF26D|A900    |      ;
                       STA.L $7ED24E                        ;8BF26F|8F4ED27E|7ED24E;
                       STA.L $7ED25C                        ;8BF273|8F5CD27E|7ED25C;
                       REP #$20                             ;8BF277|C220    |      ;
                       LDA.W #$0018                         ;8BF279|A91800  |      ;
                       STA.L $7ED272                        ;8BF27C|8F72D27E|7ED272;
                       JSL.L CODE_FL_8B92C2                 ;8BF280|22C2928B|8B92C2;
                       LDA.L $7ED1E0                        ;8BF284|AFE0D17E|7ED1E0;
                       INC A                                ;8BF288|1A      |      ;
                       STA.L $7ED1E0                        ;8BF289|8FE0D17E|7ED1E0;
                       RTS                                  ;8BF28D|60      |      ;
                       JSL.L CODE_FL_8B92C2                 ;8BF28E|22C2928B|8B92C2;
                       JSR.W CODE_FN_8B9261                 ;8BF292|206192  |8B9261;
                       JSR.W CODE_FN_8B9EBB                 ;8BF295|20BB9E  |8B9EBB;
                       JSR.W CODE_FN_8B91F4                 ;8BF298|20F491  |8B91F4;
                       LDA.W #$7E00                         ;8BF29B|A9007E  |      ;
                       STA.B $97                            ;8BF29E|8597    |000097;
                       LDA.W #$D843                         ;8BF2A0|A943D8  |      ;
                       STA.B $96                            ;8BF2A3|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BF2A5|2266A389|89A366;
                       LDA.W #$D32F                         ;8BF2A9|A92FD3  |      ;
                       STA.B $96                            ;8BF2AC|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BF2AE|2266A389|89A366;
                       JSL.L CODE_FL_8BE93B                 ;8BF2B2|223BE98B|8BE93B;
                       LDA.W #$D3AD                         ;8BF2B6|A9ADD3  |      ;
                       STA.B $96                            ;8BF2B9|8596    |000096;
                       JSL.L LittleGuy_FrameCountdown       ;8BF2BB|2266A389|89A366;
                       LDA.W #$7E00                         ;8BF2BF|A9007E  |      ;
                       STA.W $19BD                          ;8BF2C2|8DBD19  |0019BD;
                       LDA.W #$533B                         ;8BF2C5|A93B53  |      ;
                       STA.W $19BC                          ;8BF2C8|8DBC19  |0019BC;
                       JSL.L CODE_FL_899E69                 ;8BF2CB|22699E89|899E69;
                       PHB                                  ;8BF2CF|8B      |      ;
                       PHK                                  ;8BF2D0|4B      |      ;
                       PLB                                  ;8BF2D1|AB      |      ;
                       LDY.W #$F2DC                         ;8BF2D2|A0DCF2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF2D5|22CAA080|80A0CA;
                       PLB                                  ;8BF2D9|AB      |      ;
                       BRA +                                ;8BF2DA|8008    |8BF2E4;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8BF2DC|        |      ;
 
                     + PHB                                  ;8BF2E4|8B      |      ;
                       PHK                                  ;8BF2E5|4B      |      ;
                       PLB                                  ;8BF2E6|AB      |      ;
                       LDY.W #$F2F1                         ;8BF2E7|A0F1F2  |      ;
                       JSL.L CODE_FL_80A07F                 ;8BF2EA|227FA080|80A07F;
                       PLB                                  ;8BF2EE|AB      |      ;
                       BRA +                                ;8BF2EF|8006    |8BF2F7;
                       db $F6,$86,$7E,$00,$02,$00           ;8BF2F1|        |      ;
 
                     + LDA.L $7ED854                        ;8BF2F7|AF54D87E|7ED854;
                       BEQ +                                ;8BF2FB|F001    |8BF2FE;
                       db $3A                               ;8BF2FD|        |      ;
 
                     + STA.L $7ED854                        ;8BF2FE|8F54D87E|7ED854;
                       RTS                                  ;8BF302|60      |      ;
 
       CODE_FL_8BF303:
                       LDA.W #$0015                         ;8BF303|A91500  |      ;
                       STA.W $199C                          ;8BF306|8D9C19  |00199C;
                       JSL.L CODE_FL_8091B2                 ;8BF309|22B29180|8091B2;
                       JSL.L CODE_FL_8BF119                 ;8BF30D|2219F18B|8BF119;
                       RTL                                  ;8BF311|6B      |      ;
 
       CODE_FL_8BF312:
                       LDA.W #$0000                         ;8BF312|A90000  |      ;
                       LDY.W #$3000                         ;8BF315|A00030  |      ;
                       LDX.W #$0000                         ;8BF318|A20000  |      ;
 
                     - STA.L $7F9160,X                      ;8BF31B|9F60917F|7F9160;
                       INX                                  ;8BF31F|E8      |      ;
                       DEY                                  ;8BF320|88      |      ;
                       INX                                  ;8BF321|E8      |      ;
                       DEY                                  ;8BF322|88      |      ;
                       BNE -                                ;8BF323|D0F6    |8BF31B;
                       PHB                                  ;8BF325|8B      |      ;
                       PHK                                  ;8BF326|4B      |      ;
                       PLB                                  ;8BF327|AB      |      ;
                       LDY.W #$F332                         ;8BF328|A032F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF32B|22CAA080|80A0CA;
                       PLB                                  ;8BF32F|AB      |      ;
                       BRA +                                ;8BF330|8008    |8BF33A;
                       db $60,$91,$7F,$00,$30,$80,$00,$68   ;8BF332|        |      ;
 
                     + JSL.L CODE_FL_80A1CF                 ;8BF33A|22CFA180|80A1CF;
                       JSL.L CODE_FL_80A1E0                 ;8BF33E|22E0A180|80A1E0;
                       JSL.L CODE_FL_80A1F1                 ;8BF342|22F1A180|80A1F1;
                       JSL.L CODE_FL_80BB2D                 ;8BF346|222DBB80|80BB2D;
                       db $70,$EC,$92,$F6,$86,$7E           ;8BF34A|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;8BF350|222DBB80|80BB2D;
                       db $2D,$EA,$92,$1C,$4C,$7E           ;8BF354|        |      ;
                       JSL.L CODE_FL_8B9277                 ;8BF35A|2277928B|8B9277;
                       JSL.L CODE_FL_80BB2D                 ;8BF35E|222DBB80|80BB2D;
                       db $D2,$84,$92,$60,$91,$7F           ;8BF362|        |      ;
                       PHB                                  ;8BF368|8B      |      ;
                       PHK                                  ;8BF369|4B      |      ;
                       PLB                                  ;8BF36A|AB      |      ;
                       LDY.W #$F375                         ;8BF36B|A075F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF36E|22CAA080|80A0CA;
                       PLB                                  ;8BF372|AB      |      ;
                       BRA +                                ;8BF373|8008    |8BF37D;
                       db $60,$91,$7F,$00,$20,$80,$00,$10   ;8BF375|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8BF37D|222DBB80|80BB2D;
                       db $7A,$99,$92,$60,$91,$7F           ;8BF381|        |      ;
                       PHB                                  ;8BF387|8B      |      ;
                       PHK                                  ;8BF388|4B      |      ;
                       PLB                                  ;8BF389|AB      |      ;
                       LDY.W #$F394                         ;8BF38A|A094F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF38D|22CAA080|80A0CA;
                       PLB                                  ;8BF391|AB      |      ;
                       BRA +                                ;8BF392|8008    |8BF39C;
                       db $60,$91,$7F,$00,$20,$80,$00,$50   ;8BF394|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8BF39C|222DBB80|80BB2D;
                       db $05,$AA,$92,$60,$91,$7F           ;8BF3A0|        |      ;
                       PHB                                  ;8BF3A6|8B      |      ;
                       PHK                                  ;8BF3A7|4B      |      ;
                       PLB                                  ;8BF3A8|AB      |      ;
                       LDY.W #$F3B3                         ;8BF3A9|A0B3F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF3AC|22CAA080|80A0CA;
                       PLB                                  ;8BF3B0|AB      |      ;
                       BRA +                                ;8BF3B1|8008    |8BF3BB;
                       db $60,$91,$7F,$00,$08,$80,$00,$3C   ;8BF3B3|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8BF3BB|222DBB80|80BB2D;
                       db $67,$AC,$92,$60,$91,$7F           ;8BF3BF|        |      ;
                       PHB                                  ;8BF3C5|8B      |      ;
                       PHK                                  ;8BF3C6|4B      |      ;
                       PLB                                  ;8BF3C7|AB      |      ;
                       LDY.W #$F3D2                         ;8BF3C8|A0D2F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF3CB|22CAA080|80A0CA;
                       PLB                                  ;8BF3CF|AB      |      ;
                       BRA +                                ;8BF3D0|8008    |8BF3DA;
                       db $60,$91,$7F,$00,$06,$80,$00,$0D   ;8BF3D2|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8BF3DA|222DBB80|80BB2D;
                       db $3B,$F1,$92,$00,$28,$7E           ;8BF3DE|        |      ;
                       PHB                                  ;8BF3E4|8B      |      ;
                       PHK                                  ;8BF3E5|4B      |      ;
                       PLB                                  ;8BF3E6|AB      |      ;
                       LDY.W #$F3F1                         ;8BF3E7|A0F1F3  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF3EA|22CAA080|80A0CA;
                       PLB                                  ;8BF3EE|AB      |      ;
                       BRA +                                ;8BF3EF|8008    |8BF3F9;
                       db $00,$28,$7E,$C0,$03,$80,$00,$78   ;8BF3F1|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;8BF3F9|222DBB80|80BB2D;
                       db $52,$85,$93,$3B,$53,$7E           ;8BF3FD|        |      ;
                       LDA.W #$7E00                         ;8BF403|A9007E  |      ;
                       STA.W $19BD                          ;8BF406|8DBD19  |0019BD;
                       LDA.W #$533B                         ;8BF409|A93B53  |      ;
                       STA.W $19BC                          ;8BF40C|8DBC19  |0019BC;
                       JSL.L CODE_FL_899DE6                 ;8BF40F|22E69D89|899DE6;
                       JSL.L CODE_FL_899E12                 ;8BF413|22129E89|899E12;
                       LDA.W #$0012                         ;8BF417|A91200  |      ;
 
                     - JSL.L CODE_FL_8BD586                 ;8BF41A|2286D58B|8BD586;
                       DEC A                                ;8BF41E|3A      |      ;
                       DEC A                                ;8BF41F|3A      |      ;
                       BPL -                                ;8BF420|10F8    |8BF41A;
                       LDA.W #$003F                         ;8BF422|A93F00  |      ;
 
                     - JSL.L CODE_FL_8BD67E                 ;8BF425|227ED68B|8BD67E;
                       DEC A                                ;8BF429|3A      |      ;
                       BPL -                                ;8BF42A|10F9    |8BF425;
                       LDA.L $7ED1E4                        ;8BF42C|AFE4D17E|7ED1E4;
                       AND.W #$7FFF                         ;8BF430|29FF7F  |      ;
                       STA.L $7ED1E4                        ;8BF433|8FE4D17E|7ED1E4;
                       JSL.L CODE_FL_8BF626                 ;8BF437|2226F68B|8BF626;
                       LDX.W #$003E                         ;8BF43B|A23E00  |      ;
 
                     - LDA.L DATA8_84F726,X                 ;8BF43E|BF26F784|84F726;
                       STA.L $7E86F6,X                      ;8BF442|9FF6867E|7E86F6;
                       DEX                                  ;8BF446|CA      |      ;
                       DEX                                  ;8BF447|CA      |      ;
                       BPL -                                ;8BF448|10F4    |8BF43E;
                       LDA.W #$0000                         ;8BF44A|A90000  |      ;
                       STA.W LOOSE_OP_00D352                ;8BF44D|8D52D3  |00D352;
                       LDA.W #$0080                         ;8BF450|A98000  |      ;
                       STA.W LOOSE_OP_00D354                ;8BF453|8D54D3  |00D354;
                       LDA.W #$0800                         ;8BF456|A90008  |      ;
                       STA.W CODE_00D356                    ;8BF459|8D56D3  |00D356;
                       LDA.W #$7E00                         ;8BF45C|A9007E  |      ;
                       STA.B $97                            ;8BF45F|8597    |000097;
                       JSL.L CODE_FL_8BF8DC                 ;8BF461|22DCF88B|8BF8DC;
                       JSL.L CODE_FL_8BCABC                 ;8BF465|22BCCA8B|8BCABC;
                       LDA.W #$D3AD                         ;8BF469|A9ADD3  |      ;
                       STA.B $96                            ;8BF46C|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BF46E|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BF472|222CA689|89A62C;
                       db $0A,$D5,$8B                       ;8BF476|        |      ;
                       RTL                                  ;8BF479|6B      |      ;
                       JSL.L CODE_FL_80A145                 ;8BF47A|2245A180|80A145;
                       JSL.L CODE_FL_809115                 ;8BF47E|22159180|809115;
                       JSL.L CODE_FL_8B93B4                 ;8BF482|22B4938B|8B93B4;
                       JSL.L CODE_FL_80A1CF                 ;8BF486|22CFA180|80A1CF;
                       LDA.L $001A80                        ;8BF48A|AF801A00|001A80;
                       CMP.W #$0001                         ;8BF48E|C90100  |      ;
                       BNE +                                ;8BF491|D005    |8BF498;
                       db $22,$97,$F7,$8B,$60               ;8BF493|        |8BF797;
 
                     + LDA.L $001A80                        ;8BF498|AF801A00|001A80;
                       CMP.W #$0002                         ;8BF49C|C90200  |      ;
                       BNE UNREACH_8BF4A6                   ;8BF49F|D005    |8BF4A6;
                       JSL.L CODE_FL_86D8C6                 ;8BF4A1|22C6D886|86D8C6;
                       RTS                                  ;8BF4A5|60      |      ;
 
       UNREACH_8BF4A6:
                       db $AF,$80,$1A,$00,$C9,$03,$00,$D0   ;8BF4A6|        |001A80;
                       db $0E,$AF,$02,$D2,$7E,$29,$FF,$00   ;8BF4AE|        |0002AF;
                       db $F0,$05,$22,$CE,$D8,$86,$60,$E2   ;8BF4B6|        |8BF4BD;
                       db $20,$A9,$01,$8F,$E2,$01,$00,$A9   ;8BF4BE|        |8B01A9;
                       db $BF,$8F,$E7,$01,$00,$A9,$FF,$8F   ;8BF4C6|        |01E78F;
                       db $EA,$01,$00,$C2,$20,$A9,$43,$D8   ;8BF4CE|        |      ;
                       db $85,$96,$22,$50,$A4,$89,$22,$2C   ;8BF4D6|        |000096;
                       db $A6,$89,$44,$FA,$8B,$22,$2D,$BB   ;8BF4DE|        |000089;
                       db $80,$59,$89,$93,$60,$91,$7F,$8B   ;8BF4E6|        |8BF541;
                       db $4B,$AB,$A0,$FA,$F4,$22,$CA,$A0   ;8BF4EE|        |      ;
                       db $80,$AB,$80,$08,$60,$91,$7F,$00   ;8BF4F6|        |8BF4A3;
                       db $08,$80,$00,$20,$22,$2D,$BB,$80   ;8BF4FE|        |      ;
                       db $0B,$8E,$93,$C0,$22,$7E,$8B,$4B   ;8BF506|        |      ;
                       db $AB,$A0,$19,$F5,$22,$CA,$A0,$80   ;8BF50E|        |      ;
                       db $AB,$80,$08,$00,$20,$7E,$00,$08   ;8BF516|        |      ;
                       db $80,$00,$70,$22,$2D,$BB,$80,$AC   ;8BF51E|        |8BF520;
                       db $8E,$93,$A2,$91,$7F,$A9,$2B,$5D   ;8BF526|        |00A293;
                       db $8F,$60,$91,$7F,$8B,$4B,$AB,$A0   ;8BF52E|        |7F9160;
                       db $3F,$F5,$22,$7F,$A0,$80,$AB,$80   ;8BF536|        |7F22F5;
                       db $06,$60,$91,$7F,$00,$02,$00,$8B   ;8BF53E|        |000060;
                       db $4B,$AB,$E2,$20,$A9,$00,$8D,$70   ;8BF546|        |      ;
                       db $43,$A9,$32,$8D,$71,$43,$A9,$88   ;8BF54E|        |0000A9;
                       db $8D,$72,$43,$A9,$F5,$8D,$73,$43   ;8BF556|        |004372;
                       db $A9,$8B,$8D,$74,$43,$C2,$20,$E2   ;8BF55E|        |      ;
                       db $20,$A9,$80,$8D,$1E,$02,$8D,$F1   ;8BF566|        |8B80A9;
                       db $01,$C2,$20,$AB,$A9,$07,$00,$8D   ;8BF56E|        |0000C2;
                       db $9C,$19,$A9,$D1,$00,$8D,$86,$19   ;8BF576|        |00A919;
                       db $AF,$E0,$D1,$7E,$1A,$8F,$E0,$D1   ;8BF57E|        |7ED1E0;
                       db $7E,$60,$03,$FF,$03,$FE,$03,$FD   ;8BF586|        |000360;
                       db $03,$FC,$03,$FB,$03,$FA,$03,$F9   ;8BF58E|        |0000FC;
                       db $03,$F8,$03,$F7,$03,$F6,$03,$F5   ;8BF596|        |0000F8;
                       db $03,$F4,$03,$F3,$03,$F2,$03,$F1   ;8BF59E|        |0000F4;
                       db $03,$F0,$03,$EF,$03,$EE,$03,$ED   ;8BF5A6|        |0000F0;
                       db $03,$EC,$03,$EB,$03,$EA,$03,$E9   ;8BF5AE|        |0000EC;
                       db $03,$E8,$03,$E7,$03,$E6,$03,$E5   ;8BF5B6|        |0000E8;
                       db $03,$E4,$03,$E3,$03,$E2,$03,$E1   ;8BF5BE|        |0000E4;
                       db $03,$E0,$20,$E0,$03,$E0,$03,$E1   ;8BF5C6|        |0000E0;
                       db $03,$E2,$03,$E3,$03,$E4,$03,$E5   ;8BF5CE|        |0000E2;
                       db $03,$E6,$03,$E7,$03,$E8,$03,$E9   ;8BF5D6|        |0000E6;
                       db $03,$EA,$03,$EB,$03,$EC,$03,$ED   ;8BF5DE|        |0000EA;
                       db $03,$EE,$03,$EF,$03,$F0,$03,$F1   ;8BF5E6|        |0000EE;
                       db $03,$F2,$03,$F3,$03,$F4,$03,$F5   ;8BF5EE|        |0000F2;
                       db $03,$F6,$03,$F7,$03,$F8,$03,$F9   ;8BF5F6|        |0000F6;
                       db $03,$FA,$03,$FB,$03,$FC,$03,$FD   ;8BF5FE|        |0000FA;
                       db $03,$FE,$03,$FF,$00,$22,$BC,$80   ;8BF606|        |0000FE;
                       db $84,$E2,$20,$8F,$0E,$21,$00,$EB   ;8BF60E|        |0000E2;
                       db $8F,$0E,$21,$00,$C2,$20,$A9,$43   ;8BF616|        |00210E;
                       db $D8,$85,$96,$22,$66,$A3,$89,$60   ;8BF61E|        |      ;
 
       CODE_FL_8BF626:
                       LDA.W #$0000                         ;8BF626|A90000  |      ;
                       LDY.W #$1000                         ;8BF629|A00010  |      ;
                       LDX.W #$0000                         ;8BF62C|A20000  |      ;
 
                     - STA.L $7F9160,X                      ;8BF62F|9F60917F|7F9160;
                       INX                                  ;8BF633|E8      |      ;
                       DEY                                  ;8BF634|88      |      ;
                       INX                                  ;8BF635|E8      |      ;
                       DEY                                  ;8BF636|88      |      ;
                       BNE -                                ;8BF637|D0F6    |8BF62F;
                       PHB                                  ;8BF639|8B      |      ;
                       PHK                                  ;8BF63A|4B      |      ;
                       PLB                                  ;8BF63B|AB      |      ;
                       LDY.W #$F646                         ;8BF63C|A046F6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF63F|22CAA080|80A0CA;
                       PLB                                  ;8BF643|AB      |      ;
                       BRA +                                ;8BF644|8008    |8BF64E;
                       db $60,$91,$7F,$00,$10,$80,$00,$60   ;8BF646|        |      ;
 
                     + LDA.W #$00FF                         ;8BF64E|A9FF00  |      ;
                       LDY.W #$0800                         ;8BF651|A00008  |      ;
                       LDX.W #$0000                         ;8BF654|A20000  |      ;
 
                     - STA.L $7E3000,X                      ;8BF657|9F00307E|7E3000;
                       INX                                  ;8BF65B|E8      |      ;
                       DEY                                  ;8BF65C|88      |      ;
                       INX                                  ;8BF65D|E8      |      ;
                       DEY                                  ;8BF65E|88      |      ;
                       BNE -                                ;8BF65F|D0F6    |8BF657;
                       PHB                                  ;8BF661|8B      |      ;
                       PHK                                  ;8BF662|4B      |      ;
                       PLB                                  ;8BF663|AB      |      ;
                       LDY.W #$F66E                         ;8BF664|A06EF6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF667|22CAA080|80A0CA;
                       PLB                                  ;8BF66B|AB      |      ;
                       BRA +                                ;8BF66C|8008    |8BF676;
                       db $00,$30,$7E,$00,$08,$80,$00,$6C   ;8BF66E|        |      ;
 
                     + LDA.W #$7E00                         ;8BF676|A9007E  |      ;
                       STA.B $25                            ;8BF679|8525    |000025;
                       LDA.W #$33C0                         ;8BF67B|A9C033  |      ;
                       STA.B $24                            ;8BF67E|8524    |000024;
                       LDA.W #$20FF                         ;8BF680|A9FF20  |      ;
                       STA.B $00                            ;8BF683|8500    |000000;
                       LDX.W #$0010                         ;8BF685|A21000  |      ;
 
                     - LDY.W #$001E                         ;8BF688|A01E00  |      ;
 
                    -- LDA.B $00                            ;8BF68B|A500    |000000;
                       STA.B [$24],Y                        ;8BF68D|9724    |000024;
                       DEC.B $00                            ;8BF68F|C600    |000000;
                       DEY                                  ;8BF691|88      |      ;
                       DEY                                  ;8BF692|88      |      ;
                       BPL --                               ;8BF693|10F6    |8BF68B;
                       LDA.B $24                            ;8BF695|A524    |000024;
                       SEC                                  ;8BF697|38      |      ;
                       SBC.W #$0040                         ;8BF698|E94000  |      ;
                       STA.B $24                            ;8BF69B|8524    |000024;
                       DEX                                  ;8BF69D|CA      |      ;
                       BNE -                                ;8BF69E|D0E8    |8BF688;
                       PHB                                  ;8BF6A0|8B      |      ;
                       PHK                                  ;8BF6A1|4B      |      ;
                       PLB                                  ;8BF6A2|AB      |      ;
                       LDY.W #$F6AD                         ;8BF6A3|A0ADF6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;8BF6A6|22CAA080|80A0CA;
                       PLB                                  ;8BF6AA|AB      |      ;
                       BRA +                                ;8BF6AB|8008    |8BF6B5;
                       db $00,$30,$7E,$00,$08,$80,$00,$68   ;8BF6AD|        |      ;
 
                     + RTL                                  ;8BF6B5|6B      |      ;
                       db $A9,$00,$00,$4C,$E6,$F6,$A9,$00   ;8BF6B6|        |      ;
                       db $04,$4C,$E6,$F6,$A9,$00,$08,$4C   ;8BF6BE|        |00004C;
                       db $E6,$F6,$A9,$00,$0C,$4C,$E6,$F6   ;8BF6C6|        |0000F6;
                       db $A9,$00,$10,$4C,$E6,$F6,$A9,$00   ;8BF6CE|        |      ;
                       db $14,$4C,$E6,$F6,$A9,$00,$18,$4C   ;8BF6D6|        |00004C;
                       db $E6,$F6,$A9,$00,$1C,$4C,$E6,$F6   ;8BF6DE|        |0000F6;
                       db $6B                               ;8BF6E6|        |      ;
                       SEP #$20                             ;8BF6E7|E220    |      ;
                       LDA.L $0000A9                        ;8BF6E9|AFA90000|0000A9;
                       AND.B #$07                           ;8BF6ED|2907    |      ;
                       BNE +                                ;8BF6EF|D00D    |8BF6FE;
                       LDA.L $7ED24E                        ;8BF6F1|AF4ED27E|7ED24E;
                       BEQ ++                               ;8BF6F5|F06A    |8BF761;
                       DEC A                                ;8BF6F7|3A      |      ;
                       AND.B #$0F                           ;8BF6F8|290F    |      ;
                       STA.L $7ED24E                        ;8BF6FA|8F4ED27E|7ED24E;
 
                     + REP #$20                             ;8BF6FE|C220    |      ;
                       RTL                                  ;8BF700|6B      |      ;
                       SEP #$20                             ;8BF701|E220    |      ;
                       LDA.L $0000A9                        ;8BF703|AFA90000|0000A9;
                       AND.B #$07                           ;8BF707|2907    |      ;
                       BNE +                                ;8BF709|D00F    |8BF71A;
                       LDA.L $7ED24E                        ;8BF70B|AF4ED27E|7ED24E;
                       CMP.B #$0F                           ;8BF70F|C90F    |      ;
                       BEQ ++                               ;8BF711|F04E    |8BF761;
                       INC A                                ;8BF713|1A      |      ;
                       AND.B #$0F                           ;8BF714|290F    |      ;
                       STA.L $7ED24E                        ;8BF716|8F4ED27E|7ED24E;
 
                     + REP #$20                             ;8BF71A|C220    |      ;
                       RTL                                  ;8BF71C|6B      |      ;
                       db $E2,$20,$AF,$A9,$00,$00,$29,$07   ;8BF71D|        |      ;
                       db $D0,$0F,$AF,$B6,$01,$00,$C9,$0F   ;8BF725|        |8BF736;
                       db $F0,$32,$1A,$29,$0F,$8F,$B6,$01   ;8BF72D|        |8BF761;
                       db $00,$C2,$20,$6B,$E2,$20,$AF,$A9   ;8BF735|        |      ;
                       db $00,$00,$29,$07,$D0,$0D,$AF,$B6   ;8BF73D|        |      ;
                       db $01,$00,$F0,$18,$3A,$29,$0F,$8F   ;8BF745|        |000000;
                       db $B6,$01,$00,$C2,$20,$6B,$AF,$B7   ;8BF74D|        |000001;
                       db $00,$00,$0F,$B9,$00,$00,$89,$C0   ;8BF755|        |      ;
                       db $F0,$D0,$01,$6B                   ;8BF75D|        |8BF72F;
 
                    ++ REP #$20                             ;8BF761|C220    |      ;
                       JSL.L CODE_FL_89A509                 ;8BF763|2209A589|89A509;
                       RTL                                  ;8BF767|6B      |      ;
                       JSL.L CODE_FL_809115                 ;8BF768|22159180|809115;
                       JSL.L CODE_FL_80A145                 ;8BF76C|2245A180|80A145;
                       LDA.L $7ED1E0                        ;8BF770|AFE0D17E|7ED1E0;
                       INC A                                ;8BF774|1A      |      ;
                       STA.L $7ED1E0                        ;8BF775|8FE0D17E|7ED1E0;
                       RTL                                  ;8BF779|6B      |      ;
                       LDA.L $001A80                        ;8BF77A|AF801A00|001A80;
                       CMP.W #$0001                         ;8BF77E|C90100  |      ;
                       BEQ UNREACH_8BF788                   ;8BF781|F005    |8BF788;
                       JSL.L CODE_FL_89A509                 ;8BF783|2209A589|89A509;
                       RTL                                  ;8BF787|6B      |      ;
 
       UNREACH_8BF788:
                       db $A5,$B7,$89,$80,$90,$F0,$07,$22   ;8BF788|        |0000B7;
                       db $2C,$A6,$89,$34,$FA,$8B,$6B,$22   ;8BF790|        |0089A6;
                       db $45,$A1,$80,$22,$15,$91,$80,$22   ;8BF798|        |0000A1;
                       db $CB,$AD,$80,$6B                   ;8BF7A0|        |      ;
 
       CODE_FL_8BF7A4:
                       PHB                                  ;8BF7A4|8B      |      ;
                       PEA.W $7E00                          ;8BF7A5|F4007E  |007E00;
                       PLB                                  ;8BF7A8|AB      |      ;
                       PLB                                  ;8BF7A9|AB      |      ;
                       LDY.W #$D27C                         ;8BF7AA|A07CD2  |      ;
                       JSL.L CODE_FL_84AD73                 ;8BF7AD|2273AD84|84AD73;
                       JSL.L CODE_FL_84ADF2                 ;8BF7B1|22F2AD84|84ADF2;
                       db $15,$EE,$88                       ;8BF7B5|        |      ;
                       JSL.L CODE_FL_8493FF                 ;8BF7B8|22FF9384|8493FF;
                       PLB                                  ;8BF7BC|AB      |      ;
                       RTL                                  ;8BF7BD|6B      |      ;
                       LDA.W #$0100                         ;8BF7BE|A90001  |      ;
                       STA.L $7ED258                        ;8BF7C1|8F58D27E|7ED258;
                       LDA.W #$0000                         ;8BF7C5|A90000  |      ;
                       STA.L $7ED25A                        ;8BF7C8|8F5AD27E|7ED25A;
                       RTL                                  ;8BF7CC|6B      |      ;
                       LDA.W #$FFF0                         ;8BF7CD|A9F0FF  |      ;
                       STA.L $7ED25A                        ;8BF7D0|8F5AD27E|7ED25A;
                       JSR.W CODE_FN_8BF899                 ;8BF7D4|2099F8  |8BF899;
                       ASL A                                ;8BF7D7|0A      |      ;
                       EOR.W #$FFFF                         ;8BF7D8|49FFFF  |      ;
                       INC A                                ;8BF7DB|1A      |      ;
                       CLC                                  ;8BF7DC|18      |      ;
                       ADC.W #$FF90                         ;8BF7DD|6990FF  |      ;
                       STA.L $7ED258                        ;8BF7E0|8F58D27E|7ED258;
                       RTL                                  ;8BF7E4|6B      |      ;
                       LDA.W #$FFF0                         ;8BF7E5|A9F0FF  |      ;
                       STA.L $7ED25A                        ;8BF7E8|8F5AD27E|7ED25A;
                       JSR.W CODE_FN_8BF899                 ;8BF7EC|2099F8  |8BF899;
                       ASL A                                ;8BF7EF|0A      |      ;
                       CLC                                  ;8BF7F0|18      |      ;
                       ADC.W #$FFF0                         ;8BF7F1|69F0FF  |      ;
                       STA.L $7ED258                        ;8BF7F4|8F58D27E|7ED258;
                       RTL                                  ;8BF7F8|6B      |      ;
                       LDA.W #$FFF0                         ;8BF7F9|A9F0FF  |      ;
                       STA.L $7ED25A                        ;8BF7FC|8F5AD27E|7ED25A;
                       JSR.W CODE_FN_8BF899                 ;8BF800|2099F8  |8BF899;
                       EOR.W #$FFFF                         ;8BF803|49FFFF  |      ;
                       INC A                                ;8BF806|1A      |      ;
                       CLC                                  ;8BF807|18      |      ;
                       ADC.W #$0045                         ;8BF808|694500  |      ;
                       ASL A                                ;8BF80B|0A      |      ;
                       CLC                                  ;8BF80C|18      |      ;
                       ADC.W #$FFF0                         ;8BF80D|69F0FF  |      ;
                       STA.L $7ED258                        ;8BF810|8F58D27E|7ED258;
                       RTL                                  ;8BF814|6B      |      ;
                       LDA.W #$FFF0                         ;8BF815|A9F0FF  |      ;
                       STA.L $7ED25A                        ;8BF818|8F5AD27E|7ED25A;
                       JSR.W CODE_FN_8BF899                 ;8BF81C|2099F8  |8BF899;
                       EOR.W #$FFFF                         ;8BF81F|49FFFF  |      ;
                       INC A                                ;8BF822|1A      |      ;
                       CLC                                  ;8BF823|18      |      ;
                       ADC.W #$0045                         ;8BF824|694500  |      ;
                       ASL A                                ;8BF827|0A      |      ;
                       EOR.W #$FFFF                         ;8BF828|49FFFF  |      ;
                       INC A                                ;8BF82B|1A      |      ;
                       CLC                                  ;8BF82C|18      |      ;
                       ADC.W #$FF90                         ;8BF82D|6990FF  |      ;
                       STA.L $7ED258                        ;8BF830|8F58D27E|7ED258;
                       RTL                                  ;8BF834|6B      |      ;
                       LDA.W #$FFC0                         ;8BF835|A9C0FF  |      ;
                       STA.L $7ED258                        ;8BF838|8F58D27E|7ED258;
                       JSR.W CODE_FN_8BF899                 ;8BF83C|2099F8  |8BF899;
                       EOR.W #$FFFF                         ;8BF83F|49FFFF  |      ;
                       INC A                                ;8BF842|1A      |      ;
                       CLC                                  ;8BF843|18      |      ;
                       ADC.W #$FFF0                         ;8BF844|69F0FF  |      ;
                       STA.L $7ED25A                        ;8BF847|8F5AD27E|7ED25A;
                       RTL                                  ;8BF84B|6B      |      ;
                       LDA.W #$FFC0                         ;8BF84C|A9C0FF  |      ;
                       STA.L $7ED258                        ;8BF84F|8F58D27E|7ED258;
                       JSR.W CODE_FN_8BF899                 ;8BF853|2099F8  |8BF899;
                       CLC                                  ;8BF856|18      |      ;
                       ADC.W #$FFF0                         ;8BF857|69F0FF  |      ;
                       STA.L $7ED25A                        ;8BF85A|8F5AD27E|7ED25A;
                       RTL                                  ;8BF85E|6B      |      ;
                       LDA.W #$FFC0                         ;8BF85F|A9C0FF  |      ;
                       STA.L $7ED258                        ;8BF862|8F58D27E|7ED258;
                       JSR.W CODE_FN_8BF899                 ;8BF866|2099F8  |8BF899;
                       EOR.W #$FFFF                         ;8BF869|49FFFF  |      ;
                       INC A                                ;8BF86C|1A      |      ;
                       CLC                                  ;8BF86D|18      |      ;
                       ADC.W #$007F                         ;8BF86E|697F00  |      ;
                       CLC                                  ;8BF871|18      |      ;
                       ADC.W #$FFF0                         ;8BF872|69F0FF  |      ;
                       STA.L $7ED25A                        ;8BF875|8F5AD27E|7ED25A;
                       RTL                                  ;8BF879|6B      |      ;
                       db $A9,$C0,$FF,$8F,$58,$D2,$7E,$20   ;8BF87A|        |      ;
                       db $99,$F8,$49,$FF,$FF,$1A,$18,$69   ;8BF882|        |0049F8;
                       db $7F,$00,$49,$FF,$FF,$1A,$18,$69   ;8BF88A|        |FF4900;
                       db $F0,$FF,$8F,$5A,$D2,$7E,$6B       ;8BF892|        |8BF893;
 
       CODE_FN_8BF899:
                       LDY.W #$0005                         ;8BF899|A00500  |      ;
                       LDA.B [$96],Y                        ;8BF89C|B796    |000096;
                       AND.W #$00FF                         ;8BF89E|29FF00  |      ;
                       DEC A                                ;8BF8A1|3A      |      ;
                       RTS                                  ;8BF8A2|60      |      ;
                       db $AF,$54,$D8,$7E,$F0,$01,$6B,$00   ;8BF8A3|        |7ED854;
                       db $AF,$54,$D8,$7E,$D0,$04,$22,$09   ;8BF8AB|        |7ED854;
                       db $A5,$89,$6B                       ;8BF8B3|        |000089;
                       PEA.W $7E00                          ;8BF8B6|F4007E  |007E00;
                       PLB                                  ;8BF8B9|AB      |      ;
                       PLB                                  ;8BF8BA|AB      |      ;
                       LDY.W #$D27C                         ;8BF8BB|A07CD2  |      ;
                       JSL.L CODE_FL_849406                 ;8BF8BE|22069484|849406;
                       BCS +                                ;8BF8C2|B004    |8BF8C8;
                       JSL.L CODE_FL_89A509                 ;8BF8C4|2209A589|89A509;
 
                     + RTL                                  ;8BF8C8|6B      |      ;
                       PEA.W $7E00                          ;8BF8C9|F4007E  |007E00;
                       PLB                                  ;8BF8CC|AB      |      ;
                       PLB                                  ;8BF8CD|AB      |      ;
                       LDY.W #$D27C                         ;8BF8CE|A07CD2  |      ;
                       JSL.L CODE_FL_8499C4                 ;8BF8D1|22C49984|8499C4;
                       BCS +                                ;8BF8D5|B004    |8BF8DB;
                       JSL.L CODE_FL_89A509                 ;8BF8D7|2209A589|89A509;
 
                     + RTL                                  ;8BF8DB|6B      |      ;
 
       CODE_FL_8BF8DC:
                       REP #$30                             ;8BF8DC|C230    |      ;
                       LDA.W #$D843                         ;8BF8DE|A943D8  |      ;
                       STA.B $96                            ;8BF8E1|8596    |000096;
                       JSL.L CODE_FL_89A450                 ;8BF8E3|2250A489|89A450;
                       JSL.L CODE_FL_89A62C                 ;8BF8E7|222CA689|89A62C;
                       db $F3,$F8,$8B                       ;8BF8EB|        |      ;
                       JSL.L CODE_FL_8BF7A4                 ;8BF8EE|22A4F78B|8BF7A4;
                       RTL                                  ;8BF8F2|6B      |      ;
                       db $FF,$26,$A5,$89,$01,$F7,$FF,$C5   ;8BF8F3|        |      ;
                       db $A5,$89,$EB,$FA                   ;8BF8FB|        |      ;
                       db $8B                               ;8BF8FF|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF900|        |      ;
                       db $8B                               ;8BF906|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF907|        |      ;
                       db $8B                               ;8BF90D|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF90E|        |      ;
                       db $8B                               ;8BF914|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF915|        |      ;
                       db $8B                               ;8BF91B|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF91C|        |      ;
                       db $8B                               ;8BF922|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF923|        |      ;
                       db $8B                               ;8BF929|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF92A|        |      ;
                       db $8B                               ;8BF930|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF931|        |      ;
                       db $8B                               ;8BF937|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF938|        |      ;
                       db $8B                               ;8BF93E|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF93F|        |      ;
                       db $8B                               ;8BF945|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF946|        |      ;
                       db $8B                               ;8BF94C|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF94D|        |      ;
                       db $8B                               ;8BF953|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF954|        |      ;
                       db $8B                               ;8BF95A|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF95B|        |      ;
                       db $8B                               ;8BF961|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF962|        |      ;
                       db $8B                               ;8BF968|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF969|        |      ;
                       db $8B                               ;8BF96F|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF970|        |      ;
                       db $8B                               ;8BF976|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF977|        |      ;
                       db $8B                               ;8BF97D|        |      ;
                       db $FF,$C5,$A5,$89,$7B,$FA           ;8BF97E|        |      ;
                       db $8B                               ;8BF984|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF985|        |      ;
                       db $8B                               ;8BF98B|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF98C|        |      ;
                       db $8B                               ;8BF992|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF993|        |      ;
                       db $8B                               ;8BF999|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF99A|        |      ;
                       db $8B                               ;8BF9A0|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9A1|        |      ;
                       db $8B                               ;8BF9A7|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF9A8|        |      ;
                       db $8B                               ;8BF9AE|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF9AF|        |      ;
                       db $8B                               ;8BF9B5|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF9B6|        |      ;
                       db $8B                               ;8BF9BC|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF9BD|        |      ;
                       db $8B                               ;8BF9C3|        |      ;
                       db $FF,$C5,$A5,$89,$97,$FA           ;8BF9C4|        |      ;
                       db $8B                               ;8BF9CA|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9CB|        |      ;
                       db $8B                               ;8BF9D1|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9D2|        |      ;
                       db $8B                               ;8BF9D8|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9D9|        |      ;
                       db $8B                               ;8BF9DF|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9E0|        |      ;
                       db $8B                               ;8BF9E6|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9E7|        |      ;
                       db $8B                               ;8BF9ED|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9EE|        |      ;
                       db $8B                               ;8BF9F4|        |      ;
                       db $FF,$C5,$A5,$89,$EB,$FA           ;8BF9F5|        |      ;
                       db $8B                               ;8BF9FB|        |      ;
                       db $FF,$C5,$A5,$89,$CF,$FA           ;8BF9FC|        |      ;
                       db $8B                               ;8BFA02|        |      ;
                       db $FF,$C5,$A5,$89,$07,$FB           ;8BFA03|        |      ;
                       db $8B                               ;8BFA09|        |      ;
                       db $FF,$26,$A5,$89,$7A,$F7,$F0,$17   ;8BFA0A|        |      ;
                       db $FB,$FF,$FF,$F0,$17,$FB,$FF,$FF   ;8BFA12|        |      ;
                       db $F0,$17,$FB,$FF,$FF,$F0,$17,$FB   ;8BFA1A|        |      ;
                       db $FF,$FF,$FF,$43,$F1,$8B,$FF,$26   ;8BFA22|        |      ;
                       db $A5,$89,$E7,$F6,$FF,$26,$A5,$89   ;8BFA2A|        |      ;
                       db $68,$F7                           ;8BFA32|        |      ;
                       db $FF,$43,$F1,$8B,$FF,$26,$A5,$89   ;8BFA34|        |8BF143;
                       db $E7,$F6,$FF,$26,$A5,$89,$68,$F7   ;8BFA3C|        |0000F6;
                       db $FF,$26,$A5,$89,$1D,$F7,$FF,$26   ;8BFA44|        |89A526;
                       db $A5,$89,$53,$F7,$FF,$43,$F1,$8B   ;8BFA4C|        |000089;
                       db $FF,$26,$A5,$89,$39,$F7,$FF,$97   ;8BFA54|        |89A526;
                       db $F7,$8B                           ;8BFA5C|        |00008B;
                       db $FF,$BE,$F7,$8B,$FF,$26,$A5,$89   ;8BFA5E|        |      ;
                       db $C9,$F8,$FF,$26,$A5,$89,$B6,$F8   ;8BFA66|        |      ;
                       db $FF,$F9,$A5,$89,$B4,$17,$FB,$FF   ;8BFA6E|        |      ;
                       db $FF,$FF,$F9,$A5,$89,$FF,$C5,$A5   ;8BFA76|        |      ;
                       db $89,$5E,$FA                       ;8BFA7E|        |      ;
                       db $8B                               ;8BFA81|        |      ;
                       db $46,$CD,$F7,$FF,$FF,$FF,$C5,$A5   ;8BFA82|        |      ;
                       db $89,$72,$FA                       ;8BFA8A|        |      ;
                       db $8B                               ;8BFA8D|        |      ;
                       db $46,$15,$F8,$FF,$FF,$FF,$F9,$A5   ;8BFA8E|        |      ;
                       db $89,$FF,$C5,$A5,$89,$5E,$FA       ;8BFA96|        |      ;
                       db $8B                               ;8BFA9D|        |      ;
                       db $46,$E5,$F7,$FF,$FF,$FF,$C5,$A5   ;8BFA9E|        |      ;
                       db $89,$72,$FA                       ;8BFAA6|        |      ;
                       db $8B                               ;8BFAA9|        |      ;
                       db $46,$F9,$F7,$FF,$FF,$FF,$F9,$A5   ;8BFAAA|        |      ;
                       db $89                               ;8BFAB2|        |      ;
                       db $FF,$C5,$A5,$89,$5E,$FA,$8B,$80   ;8BFAB3|        |89A5C5;
                       db $35,$F8,$FF,$FF,$FF,$C5,$A5,$89   ;8BFABB|        |0000F8;
                       db $72,$FA,$8B,$80,$7A,$F8,$FF,$FF   ;8BFAC3|        |0000FA;
                       db $FF,$F9,$A5,$89                   ;8BFACB|        |89A5F9;
                       db $FF,$C5,$A5,$89,$5E,$FA           ;8BFACF|        |      ;
                       db $8B                               ;8BFAD5|        |      ;
                       db $80,$4C,$F8,$FF,$FF,$FF,$C5,$A5   ;8BFAD6|        |      ;
                       db $89,$72,$FA                       ;8BFADE|        |      ;
                       db $8B                               ;8BFAE1|        |      ;
                       db $80,$5F,$F8,$FF,$FF,$FF,$F9,$A5   ;8BFAE2|        |      ;
                       db $89,$FF,$C5,$A5,$89,$5E,$FA       ;8BFAEA|        |      ;
                       db $8B                               ;8BFAF1|        |      ;
                       db $80,$35,$F8,$FF,$FF,$FF,$C5,$A5   ;8BFAF2|        |      ;
                       db $89,$72,$FA                       ;8BFAFA|        |      ;
                       db $8B                               ;8BFAFD|        |      ;
                       db $80,$5F,$F8,$FF,$FF,$FF,$F9,$A5   ;8BFAFE|        |      ;
                       db $89,$FF,$C5,$A5,$89,$5E,$FA       ;8BFB06|        |      ;
                       db $8B                               ;8BFB0D|        |      ;
                       db $80,$35,$F8,$FF,$FF,$FF,$F9,$A5   ;8BFB0E|        |      ;
                       db $89                               ;8BFB16|        |      ;
                       RTL                                  ;8BFB17|6B      |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFB98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFBF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFC98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFCF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFD98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFDF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFE98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFED0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFED8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFEF8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF00|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF08|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF10|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF18|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF20|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF28|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF30|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF38|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF40|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF48|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF50|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF58|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF60|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF68|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF70|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF78|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF80|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF88|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF90|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFF98|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFA0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFA8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFB0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFB8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFC0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFC8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFD0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFD8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFE0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFE8|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFF0|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;8BFFF8|        |      ;
