 
                       ORG $808000
 
 
          CODE_808000:
                       BRA CODE_808000                      ;808000|80FE    |808000;
 
 
                Reset:
                       SEI                                  ;808002|78      |      ;
                       CLC                                  ;808003|18      |      ;
                       XCE                                  ;808004|FB      |      ;
                       BCC CODE_JL_808018                   ;808005|9011    |808018;
                       REP #$30                             ;808007|C230    |      ;
                       TDC                                  ;808009|7B      |      ;
                       BNE CODE_JL_808018                   ;80800A|D00C    |808018;
                       LDX.W #$8002                         ;80800C|A20280  |      ;
                       CPX.W PTR16_00FFFC                   ;80800F|ECFCFF  |00FFFC;
                       BNE CODE_JL_808018                   ;808012|D004    |808018;
                       JML.L CODE_JL_808018                 ;808014|5C188080|808018;
 
       CODE_JL_808018:
                       REP #$30                             ;808018|C230    |      ;
                       TSX                                  ;80801A|BA      |      ;
                       TXY                                  ;80801B|9B      |      ;
                       LDX.W #$1FF7                         ;80801C|A2F71F  |      ;
                       TXS                                  ;80801F|9A      |      ;
                       SEP #$20                             ;808020|E220    |      ;
                       LDA.B #$01                           ;808022|A901    |      ;
                       STA.W MEMSEL                         ;808024|8D0D42  |00420D;
                       LDA.B #$80                           ;808027|A980    |      ;
                       STA.W $01B6                          ;808029|8DB601  |0001B6;
                       STA.W INIDISP                        ;80802C|8D0021  |002100;
                       STZ.W $01EC                          ;80802F|9CEC01  |0001EC;
                       STZ.W NMITIMEN                       ;808032|9C0042  |004200;
                       STZ.W MDMAEN                         ;808035|9C0B42  |00420B;
                       STZ.W HDMAEN                         ;808038|9C0C42  |00420C;
                       STZ.W APUIO0                         ;80803B|9C4021  |002140;
                       STZ.W APUIO1                         ;80803E|9C4121  |002141;
                       STZ.W APUIO2                         ;808041|9C4221  |002142;
                       STZ.W APUIO3                         ;808044|9C4321  |002143;
                       REP #$30                             ;808047|C230    |      ;
                       LDA.W $1FFC                          ;808049|ADFC1F  |001FFC; checks for "magic" PDEP string
                       CMP.W #$4450                         ;80804C|C95044  |      ; PDEP comes from the ascii values being checked,
                       BNE +                                ;80804F|D008    |808059; it presumably stands for Panel de Pon
                       LDA.W $1FFE                          ;808051|ADFE1F  |001FFE;
                       CMP.W #$5045                         ;808054|C94550  |      ;
                       BEQ ++                               ;808057|F028    |808081;
 
                     + DEY                                  ;808059|88      |      ;
                       LDA.W $0000,Y                        ;80805A|B90000  |000000;
                       INC A                                ;80805D|1A      |      ;
                       CMP.W PTR16_00FFFC                   ;80805E|CDFCFF  |00FFFC;
                       BEQ UNREACH_808088                   ;808061|F025    |808088;
                       LDX.W #$0000                         ;808063|A20000  |      ;
 
                    -- LDA.W $0000,X                        ;808066|BD0000  |000000;
                       AND.W #$00FF                         ;808069|29FF00  |      ;
                       CMP.W #$006C                         ;80806C|C96C00  |      ;
                       BEQ +                                ;80806F|F01F    |808090;
                       CMP.W #$004C                         ;808071|C94C00  |      ;
                       BEQ +++                              ;808074|F031    |8080A7;
                       CMP.W #$0060                         ;808076|C96000  |      ;
                       BEQ ++++                             ;808079|F036    |8080B1;
 
                     - INX                                  ;80807B|E8      |      ;
                       CPX.W #$1FFE                         ;80807C|E0FE1F  |      ;
                       BNE --                               ;80807F|D0E5    |808066;
 
                    ++ PHK                                  ;808081|4B      |      ;
                       PHK                                  ;808082|4B      |      ;
                       PLA                                  ;808083|68      |      ;
                       BEQ UNREACH_808088                   ;808084|F002    |808088;
                       BRA ++                               ;808086|8049    |8080D1;
 
       UNREACH_808088:
                       db $A9,$00,$00,$5B,$22,$28,$8C,$80   ;808088|        |      ;
 
                     + LDY.W $0001,X                        ;808090|BC0100  |000001;
                       CPY.W #$FFFC                         ;808093|C0FCFF  |      ;
                       BEQ UNREACH_808088                   ;808096|F0F0    |808088;
                       CPY.W #$1FFF                         ;808098|C0FF1F  |      ;
                       BCS -                                ;80809B|B0DE    |80807B;
                       db $B9,$00,$00,$C9,$02,$80,$F0,$E3   ;80809D|        |000000;
                       db $80,$D4                           ;8080A5|        |80807B;
 
                   +++ LDY.W $0001,X                        ;8080A7|BC0100  |000001;
                       CPY.W #$8002                         ;8080AA|C00280  |      ;
                       BEQ UNREACH_808088                   ;8080AD|F0D9    |808088;
                       BRA -                                ;8080AF|80CA    |80807B;
 
                  ++++ TXA                                  ;8080B1|8A      |      ;
                       TCD                                  ;8080B2|5B      |      ;
                       LDY.W #$0000                         ;8080B3|A00000  |      ;
                       LDA.W #$6160                         ;8080B6|A96061  |      ;
                       CMP.W $0000,X                        ;8080B9|DD0000  |000000;
                       BNE +                                ;8080BC|D00F    |8080CD;
                       db $18,$69,$02,$02,$E8,$E8,$C8,$C8   ;8080BE|        |      ;
                       db $C0,$20,$00,$D0,$EE,$80,$BB       ;8080C6|        |      ;
 
                     + TDC                                  ;8080CD|7B      |      ;
                       TAX                                  ;8080CE|AA      |      ;
                       BRA -                                ;8080CF|80AA    |80807B;
 
                    ++ LDA.W #$0000                         ;8080D1|A90000  |      ;
                       TCD                                  ;8080D4|5B      |      ;
                       JSL.L CODE_FL_808C14                 ;8080D5|22148C80|808C14;
                       STA.W $1FF8                          ;8080D9|8DF81F  |001FF8;
                       STA.W $1FFA                          ;8080DC|8DFA1F  |001FFA;
                       LDA.W #$4450                         ;8080DF|A95044  |      ;
                       STA.W $1FFC                          ;8080E2|8DFC1F  |001FFC;
                       LDA.W #$5045                         ;8080E5|A94550  |      ;
                       STA.W $1FFE                          ;8080E8|8DFE1F  |001FFE;
                       LDX.W #$1FFE                         ;8080EB|A2FE1F  |      ;
 
                     - STZ.B $00,X                          ;8080EE|7400    |000000;
                       DEX                                  ;8080F0|CA      |      ;
                       DEX                                  ;8080F1|CA      |      ;
                       BPL -                                ;8080F2|10FA    |8080EE;
                       JSR.W CODE_FN_8086C5                 ;8080F4|20C586  |8086C5;
                       LDA.B $02                            ;8080F7|A502    |000002;
                       BNE +                                ;8080F9|D01B    |808116;
                       SEP #$20                             ;8080FB|E220    |      ;
                       REP #$10                             ;8080FD|C210    |      ;
                       LDX.W #$D147                         ;8080FF|A247D1  |      ;
                       LDA.B #$00                           ;808102|A900    |      ;
 
                     - STA.L $7E2000,X                      ;808104|9F00207E|7E2000;
                       DEX                                  ;808108|CA      |      ;
                       BNE -                                ;808109|D0F9    |808104;
                       STA.L $7E2000                        ;80810B|8F00207E|7E2000;
                       REP #$30                             ;80810F|C230    |      ;
                       JSR.W CODE_FN_80872B                 ;808111|202B87  |80872B;
                       BRA ++                               ;808114|8011    |808127;
 
                     + LDX.W #$2000                         ;808116|A20020  |      ;
                       LDA.W #$0000                         ;808119|A90000  |      ;
 
                     - STA.L $7E0000,X                      ;80811C|9F00007E|7E0000;
                       INX                                  ;808120|E8      |      ;
                       INX                                  ;808121|E8      |      ;
                       BNE -                                ;808122|D0F8    |80811C;
                       JSR.W CODE_FN_80851D                 ;808124|201D85  |80851D;
 
                    ++ LDX.W #$0000                         ;808127|A20000  |      ;
                       LDA.W #$0000                         ;80812A|A90000  |      ;
 
                     - STA.L $7F0000,X                      ;80812D|9F00007F|7F0000;
                       INX                                  ;808131|E8      |      ;
                       INX                                  ;808132|E8      |      ;
                       BNE -                                ;808133|D0F8    |80812D;
                       REP #$30                             ;808135|C230    |      ;
                       LDX.W #$0014                         ;808137|A21400  |      ;
 
                     - LDA.W DATA8_008715,X                 ;80813A|BD1587  |008715;
                       STA.L $7EFF00,X                      ;80813D|9F00FF7E|7EFF00;
                       DEX                                  ;808141|CA      |      ;
                       DEX                                  ;808142|CA      |      ;
                       BNE -                                ;808143|D0F5    |80813A;
                       LDA.W DATA8_008715                   ;808145|AD1587  |008715;
                       STA.L $7EFF00                        ;808148|8F00FF7E|7EFF00;
                       JSR.W SetDefaultOptions              ;80814C|205386  |808653;
                       BRA +                                ;80814F|8068    |8081B9;
 
       CODE_JP_808151:
                       SEI                                  ;808151|78      |      ;
                       CLC                                  ;808152|18      |      ;
                       XCE                                  ;808153|FB      |      ;
                       JML.L CODE_JL_808158                 ;808154|5C588180|808158;
 
       CODE_JL_808158:
                       PEA.W $0000                          ;808158|F40000  |000000;
                       PLB                                  ;80815B|AB      |      ;
                       PLB                                  ;80815C|AB      |      ;
                       SEP #$20                             ;80815D|E220    |      ;
                       LDA.B #$80                           ;80815F|A980    |      ;
                       STA.W $01B6                          ;808161|8DB601  |0001B6;
                       STA.W INIDISP                        ;808164|8D0021  |002100;
                       STZ.W $01EC                          ;808167|9CEC01  |0001EC;
                       STZ.W NMITIMEN                       ;80816A|9C0042  |004200;
                       STZ.W MDMAEN                         ;80816D|9C0B42  |00420B;
                       STZ.W HDMAEN                         ;808170|9C0C42  |00420C;
                       STZ.W APUIO0                         ;808173|9C4021  |002140;
                       STZ.W APUIO1                         ;808176|9C4121  |002141;
                       STZ.W APUIO2                         ;808179|9C4221  |002142;
                       STZ.W APUIO3                         ;80817C|9C4321  |002143;
                       LDA.B #$01                           ;80817F|A901    |      ;
                       STA.W MEMSEL                         ;808181|8D0D42  |00420D;
                       REP #$30                             ;808184|C230    |      ;
                       LDX.W #$1FF7                         ;808186|A2F71F  |      ;
                       TXS                                  ;808189|9A      |      ;
                       LDA.W #$0000                         ;80818A|A90000  |      ;
                       TCD                                  ;80818D|5B      |      ;
                       LDX.W #$1FFE                         ;80818E|A2FE1F  |      ;
 
                     - STZ.B $00,X                          ;808191|7400    |000000;
                       DEX                                  ;808193|CA      |      ;
                       DEX                                  ;808194|CA      |      ;
                       BPL -                                ;808195|10FA    |808191;
                       LDX.W #$0000                         ;808197|A20000  |      ;
                       LDA.W #$0000                         ;80819A|A90000  |      ;
 
                     - STA.L $7F0000,X                      ;80819D|9F00007F|7F0000;
                       INX                                  ;8081A1|E8      |      ;
                       INX                                  ;8081A2|E8      |      ;
                       BNE -                                ;8081A3|D0F8    |80819D;
                       SEP #$20                             ;8081A5|E220    |      ;
                       LDX.W #$7437                         ;8081A7|A23774  |      ;
                       LDA.B #$00                           ;8081AA|A900    |      ;
 
                     - STA.L $7E2000,X                      ;8081AC|9F00207E|7E2000;
                       DEX                                  ;8081B0|CA      |      ;
                       BNE -                                ;8081B1|D0F9    |8081AC;
                       STA.L $7E2000                        ;8081B3|8F00207E|7E2000;
                       REP #$20                             ;8081B7|C220    |      ;
 
                     + REP #$20                             ;8081B9|C220    |      ;
                       JSL.L CODE_FL_809125                 ;8081BB|22259180|809125;
                       JSR.W CODE_FN_808333                 ;8081BF|203383  |808333;
                       JSR.W CODE_FN_808217                 ;8081C2|201782  |808217;
                       JSR.W CODE_FN_80A1A9                 ;8081C5|20A9A1  |80A1A9;
                       JSL.L CODE_FL_809C8A                 ;8081C8|228A9C80|809C8A;
                       JSL.L CODE_FL_809E38                 ;8081CC|22389E80|809E38;
                       JSL.L EnableNMI                      ;8081D0|22D79C80|809CD7;
                       JSL.L CODE_FL_84B5A9                 ;8081D4|22A9B584|84B5A9;
                       SEP #$20                             ;8081D8|E220    |      ;
                       LDA.B #$FF                           ;8081DA|A9FF    |      ;
                       STA.W $029E                          ;8081DC|8D9E02  |00029E;
                       REP #$20                             ;8081DF|C220    |      ;
                       LDA.W #$000A                         ;8081E1|A90A00  |      ;
                       STA.B $AF                            ;8081E4|85AF    |0000AF;
                       LDA.W #$0001                         ;8081E6|A90100  |      ;
                       STA.B $B1                            ;8081E9|85B1    |0000B1;
                       LDA.W #$FFFF                         ;8081EB|A9FFFF  |      ;
                       STA.W $02A8                          ;8081EE|8DA802  |0002A8;
                       JSR.W CheckRegion                    ;8081F1|208786  |808687;
                       JSR.W CheckCopier                    ;8081F4|209986  |808699;
                       LDA.W #$0011                         ;8081F7|A91100  |      ;
                       STA.W Game_State                     ;8081FA|8DA002  |0002A0;
                       STZ.W Game_State_State               ;8081FD|9CA202  |0002A2;
                       LDA.L $7E3900                        ;808200|AF00397E|7E3900;
                       BEQ +                                ;808204|F006    |80820C;
                       LDA.W #$0008                         ;808206|A90800  |      ;
                       STA.W Game_State_State               ;808209|8DA202  |0002A2;
 
                     + JSR.W CODE_FN_808638                 ;80820C|203886  |808638;
                       LDA.W #$0001                         ;80820F|A90100  |      ;
                       STA.B $A3                            ;808212|85A3    |0000A3;
                       JMP.W CODE_JP_80A6F0                 ;808214|4CF0A6  |80A6F0;
 
       CODE_FN_808217:
                       PHP                                  ;808217|08      |      ;
                       REP #$10                             ;808218|C210    |      ;
                       SEP #$20                             ;80821A|E220    |      ;
                       STZ.W HDMAEN                         ;80821C|9C0C42  |00420C;
                       STZ.W $01F1                          ;80821F|9CF101  |0001F1;
                       STZ.W $021E                          ;808222|9C1E02  |00021E;
                       LDX.W #$000B                         ;808225|A20B00  |      ;
 
                     - STZ.W DMA0PARAM,X                    ;808228|9E0043  |004300;
                       STZ.W DMA1PARAM,X                    ;80822B|9E1043  |004310;
                       STZ.W DMA2PARAM,X                    ;80822E|9E2043  |004320;
                       STZ.W DMA3PARAM,X                    ;808231|9E3043  |004330;
                       STZ.W DMA4PARAM,X                    ;808234|9E4043  |004340;
                       STZ.W DMA5PARAM,X                    ;808237|9E5043  |004350;
                       STZ.W DMA6PARAM,X                    ;80823A|9E6043  |004360;
                       STZ.W DMA7PARAM,X                    ;80823D|9E7043  |004370;
                       STZ.W $4380,X                        ;808240|9E8043  |004380;
                       DEX                                  ;808243|CA      |      ;
                       BNE -                                ;808244|D0E2    |808228;
                       REP #$20                             ;808246|C220    |      ;
                       SEP #$20                             ;808248|E220    |      ;
                       LDA.B #$80                           ;80824A|A980    |      ;
                       STA.W DMA0PARAM                      ;80824C|8D0043  |004300;
                       LDA.B #$13                           ;80824F|A913    |      ;
                       STA.W DMA0REG                        ;808251|8D0143  |004301;
                       LDA.B #$32                           ;808254|A932    |      ;
                       STA.W DMA0ADDRL                      ;808256|8D0243  |004302;
                       LDA.B #$83                           ;808259|A983    |      ;
                       STA.W DMA0ADDRM                      ;80825B|8D0343  |004303;
                       LDA.B #$80                           ;80825E|A980    |      ;
                       STA.W DMA0ADDRH                      ;808260|8D0443  |004304;
                       REP #$20                             ;808263|C220    |      ;
                       SEP #$20                             ;808265|E220    |      ;
                       LDA.B #$80                           ;808267|A980    |      ;
                       STA.W DMA1PARAM                      ;808269|8D1043  |004310;
                       LDA.B #$13                           ;80826C|A913    |      ;
                       STA.W DMA1REG                        ;80826E|8D1143  |004311;
                       LDA.B #$32                           ;808271|A932    |      ;
                       STA.W DMA1ADDRL                      ;808273|8D1243  |004312;
                       LDA.B #$83                           ;808276|A983    |      ;
                       STA.W DMA1ADDRM                      ;808278|8D1343  |004313;
                       LDA.B #$80                           ;80827B|A980    |      ;
                       STA.W DMA1ADDRH                      ;80827D|8D1443  |004314;
                       REP #$20                             ;808280|C220    |      ;
                       SEP #$20                             ;808282|E220    |      ;
                       LDA.B #$80                           ;808284|A980    |      ;
                       STA.W DMA2PARAM                      ;808286|8D2043  |004320;
                       LDA.B #$13                           ;808289|A913    |      ;
                       STA.W DMA2REG                        ;80828B|8D2143  |004321;
                       LDA.B #$32                           ;80828E|A932    |      ;
                       STA.W DMA2ADDRL                      ;808290|8D2243  |004322;
                       LDA.B #$83                           ;808293|A983    |      ;
                       STA.W DMA2ADDRM                      ;808295|8D2343  |004323;
                       LDA.B #$80                           ;808298|A980    |      ;
                       STA.W DMA2ADDRH                      ;80829A|8D2443  |004324;
                       REP #$20                             ;80829D|C220    |      ;
                       SEP #$20                             ;80829F|E220    |      ;
                       LDA.B #$80                           ;8082A1|A980    |      ;
                       STA.W DMA3PARAM                      ;8082A3|8D3043  |004330;
                       LDA.B #$13                           ;8082A6|A913    |      ;
                       STA.W DMA3REG                        ;8082A8|8D3143  |004331;
                       LDA.B #$32                           ;8082AB|A932    |      ;
                       STA.W DMA3ADDRL                      ;8082AD|8D3243  |004332;
                       LDA.B #$83                           ;8082B0|A983    |      ;
                       STA.W DMA3ADDRM                      ;8082B2|8D3343  |004333;
                       LDA.B #$80                           ;8082B5|A980    |      ;
                       STA.W DMA3ADDRH                      ;8082B7|8D3443  |004334;
                       REP #$20                             ;8082BA|C220    |      ;
                       SEP #$20                             ;8082BC|E220    |      ;
                       LDA.B #$80                           ;8082BE|A980    |      ;
                       STA.W DMA4PARAM                      ;8082C0|8D4043  |004340;
                       LDA.B #$13                           ;8082C3|A913    |      ;
                       STA.W DMA4REG                        ;8082C5|8D4143  |004341;
                       LDA.B #$32                           ;8082C8|A932    |      ;
                       STA.W DMA4ADDRL                      ;8082CA|8D4243  |004342;
                       LDA.B #$83                           ;8082CD|A983    |      ;
                       STA.W DMA4ADDRM                      ;8082CF|8D4343  |004343;
                       LDA.B #$80                           ;8082D2|A980    |      ;
                       STA.W DMA4ADDRH                      ;8082D4|8D4443  |004344;
                       REP #$20                             ;8082D7|C220    |      ;
                       SEP #$20                             ;8082D9|E220    |      ;
                       LDA.B #$80                           ;8082DB|A980    |      ;
                       STA.W DMA5PARAM                      ;8082DD|8D5043  |004350;
                       LDA.B #$13                           ;8082E0|A913    |      ;
                       STA.W DMA5REG                        ;8082E2|8D5143  |004351;
                       LDA.B #$32                           ;8082E5|A932    |      ;
                       STA.W DMA5ADDRL                      ;8082E7|8D5243  |004352;
                       LDA.B #$83                           ;8082EA|A983    |      ;
                       STA.W DMA5ADDRM                      ;8082EC|8D5343  |004353;
                       LDA.B #$80                           ;8082EF|A980    |      ;
                       STA.W DMA5ADDRH                      ;8082F1|8D5443  |004354;
                       REP #$20                             ;8082F4|C220    |      ;
                       SEP #$20                             ;8082F6|E220    |      ;
                       LDA.B #$80                           ;8082F8|A980    |      ;
                       STA.W DMA6PARAM                      ;8082FA|8D6043  |004360;
                       LDA.B #$13                           ;8082FD|A913    |      ;
                       STA.W DMA6REG                        ;8082FF|8D6143  |004361;
                       LDA.B #$32                           ;808302|A932    |      ;
                       STA.W DMA6ADDRL                      ;808304|8D6243  |004362;
                       LDA.B #$83                           ;808307|A983    |      ;
                       STA.W DMA6ADDRM                      ;808309|8D6343  |004363;
                       LDA.B #$80                           ;80830C|A980    |      ;
                       STA.W DMA6ADDRH                      ;80830E|8D6443  |004364;
                       REP #$20                             ;808311|C220    |      ;
                       SEP #$20                             ;808313|E220    |      ;
                       LDA.B #$80                           ;808315|A980    |      ;
                       STA.W DMA7PARAM                      ;808317|8D7043  |004370;
                       LDA.B #$13                           ;80831A|A913    |      ;
                       STA.W DMA7REG                        ;80831C|8D7143  |004371;
                       LDA.B #$32                           ;80831F|A932    |      ;
                       STA.W DMA7ADDRL                      ;808321|8D7243  |004372;
                       LDA.B #$83                           ;808324|A983    |      ;
                       STA.W DMA7ADDRM                      ;808326|8D7343  |004373;
                       LDA.B #$80                           ;808329|A980    |      ;
                       STA.W DMA7ADDRH                      ;80832B|8D7443  |004374;
                       REP #$20                             ;80832E|C220    |      ;
                       PLP                                  ;808330|28      |      ;
                       RTS                                  ;808331|60      |      ;
                       db $00                               ;808332|        |      ;
 
       CODE_FN_808333:
                       PHP                                  ;808333|08      |      ;
                       SEP #$30                             ;808334|E230    |      ;
                       LDA.B #$01                           ;808336|A901    |      ;
                       STA.W NMITIMEN                       ;808338|8D0042  |004200;
                       STA.W $01EC                          ;80833B|8DEC01  |0001EC;
                       STZ.W WRIO                           ;80833E|9C0142  |004201;
                       STZ.W WRMPYA                         ;808341|9C0242  |004202;
                       STZ.W WRMPYB                         ;808344|9C0342  |004203;
                       STZ.W WRDIVL                         ;808347|9C0442  |004204;
                       STZ.W WRDIVH                         ;80834A|9C0542  |004205;
                       STZ.W WRDIVB                         ;80834D|9C0642  |004206;
                       STZ.W HTIMEL                         ;808350|9C0742  |004207;
                       STZ.W $01EF                          ;808353|9CEF01  |0001EF;
                       STZ.W HTIMEH                         ;808356|9C0842  |004208;
                       STZ.W $01F0                          ;808359|9CF001  |0001F0;
                       STZ.W VTIMEL                         ;80835C|9C0942  |004209;
                       STZ.W $01ED                          ;80835F|9CED01  |0001ED;
                       STZ.W VTIMEH                         ;808362|9C0A42  |00420A;
                       STZ.W $01EE                          ;808365|9CEE01  |0001EE;
                       STZ.W MDMAEN                         ;808368|9C0B42  |00420B;
                       STZ.W HDMAEN                         ;80836B|9C0C42  |00420C;
                       STZ.W $01F1                          ;80836E|9CF101  |0001F1;
                       LDA.B #$01                           ;808371|A901    |      ;
                       STA.W MEMSEL                         ;808373|8D0D42  |00420D;
                       STA.W $01F2                          ;808376|8DF201  |0001F2;
                       STZ.W RDNMI                          ;808379|9C1042  |004210;
                       STZ.W TIMEUP                         ;80837C|9C1142  |004211;
                       STZ.W HVBJOY                         ;80837F|9C1242  |004212;
                       STZ.W RDIO                           ;808382|9C1342  |004213;
                       STZ.W RDDIVL                         ;808385|9C1442  |004214;
                       STZ.W RDDIVH                         ;808388|9C1542  |004215;
                       STZ.W RDMPYL                         ;80838B|9C1642  |004216;
                       STZ.W RDMPYH                         ;80838E|9C1742  |004217;
                       LDA.B #$80                           ;808391|A980    |      ;
                       STA.W INIDISP                        ;808393|8D0021  |002100;
                       STA.W $01B6                          ;808396|8DB601  |0001B6;
                       STZ.W OBJSEL                         ;808399|9C0121  |002101;
                       STZ.W $01B7                          ;80839C|9CB701  |0001B7;
                       STZ.W OAMADDL                        ;80839F|9C0221  |002102;
                       STZ.W $01B8                          ;8083A2|9CB801  |0001B8;
                       LDA.B #$80                           ;8083A5|A980    |      ;
                       STA.W OAMADDH                        ;8083A7|8D0321  |002103;
                       STA.W $01B9                          ;8083AA|8DB901  |0001B9;
                       STZ.W OAMDATA                        ;8083AD|9C0421  |002104;
                       STZ.W OAMDATA                        ;8083B0|9C0421  |002104;
                       STZ.W BGMODE                         ;8083B3|9C0521  |002105;
                       STZ.W $01BA                          ;8083B6|9CBA01  |0001BA;
                       STZ.W MOSAIC                         ;8083B9|9C0621  |002106;
                       STZ.W $01BB                          ;8083BC|9CBB01  |0001BB;
                       STZ.W BG1SC                          ;8083BF|9C0721  |002107;
                       STZ.W $01BC                          ;8083C2|9CBC01  |0001BC;
                       STZ.W BG2SC                          ;8083C5|9C0821  |002108;
                       STZ.W $01BD                          ;8083C8|9CBD01  |0001BD;
                       STZ.W BG3SC                          ;8083CB|9C0921  |002109;
                       STZ.W $01BE                          ;8083CE|9CBE01  |0001BE;
                       STZ.W BG4SC                          ;8083D1|9C0A21  |00210A;
                       STZ.W $01BF                          ;8083D4|9CBF01  |0001BF;
                       STZ.W BG12NBA                        ;8083D7|9C0B21  |00210B;
                       STZ.W $01C0                          ;8083DA|9CC001  |0001C0;
                       STZ.W BG34NBA                        ;8083DD|9C0C21  |00210C;
                       STZ.W $01C1                          ;8083E0|9CC101  |0001C1;
                       STZ.W BG1HOFS                        ;8083E3|9C0D21  |00210D;
                       STZ.W BG1HOFS                        ;8083E6|9C0D21  |00210D;
                       STZ.W _BG1VOFS                       ;8083E9|9C0E21  |00210E;
                       STZ.W _BG1VOFS                       ;8083EC|9C0E21  |00210E;
                       STZ.W $01CB                          ;8083EF|9CCB01  |0001CB;
                       STZ.W $01CC                          ;8083F2|9CCC01  |0001CC;
                       STZ.W $01CD                          ;8083F5|9CCD01  |0001CD;
                       STZ.W $01CE                          ;8083F8|9CCE01  |0001CE;
                       STZ.W BG2HOFS                        ;8083FB|9C0F21  |00210F;
                       STZ.W BG2HOFS                        ;8083FE|9C0F21  |00210F;
                       STZ.W BG2VOFS                        ;808401|9C1021  |002110;
                       STZ.W BG2VOFS                        ;808404|9C1021  |002110;
                       STZ.W $01CF                          ;808407|9CCF01  |0001CF;
                       STZ.W $01D0                          ;80840A|9CD001  |0001D0;
                       STZ.W $01D1                          ;80840D|9CD101  |0001D1;
                       STZ.W $01D2                          ;808410|9CD201  |0001D2;
                       STZ.W BG3HOFS                        ;808413|9C1121  |002111;
                       STZ.W BG3HOFS                        ;808416|9C1121  |002111;
                       STZ.W BG3VOFS                        ;808419|9C1221  |002112;
                       STZ.W BG3VOFS                        ;80841C|9C1221  |002112;
                       STZ.W $01D3                          ;80841F|9CD301  |0001D3;
                       STZ.W $01D4                          ;808422|9CD401  |0001D4;
                       STZ.W $01D5                          ;808425|9CD501  |0001D5;
                       STZ.W $01D6                          ;808428|9CD601  |0001D6;
                       STZ.W BG4HOFS                        ;80842B|9C1321  |002113;
                       STZ.W BG4HOFS                        ;80842E|9C1321  |002113;
                       STZ.W BG4VOFS                        ;808431|9C1421  |002114;
                       STZ.W BG4VOFS                        ;808434|9C1421  |002114;
                       STZ.W $01D7                          ;808437|9CD701  |0001D7;
                       STZ.W $01D8                          ;80843A|9CD801  |0001D8;
                       STZ.W $01D9                          ;80843D|9CD901  |0001D9;
                       STZ.W $01DA                          ;808440|9CDA01  |0001DA;
                       STZ.W VMAINC                         ;808443|9C1521  |002115;
                       STZ.W VMADDL                         ;808446|9C1621  |002116;
                       STZ.W VMADDH                         ;808449|9C1721  |002117;
                       STZ.W VMDATAL                        ;80844C|9C1821  |002118;
                       STZ.W VMDATAH                        ;80844F|9C1921  |002119;
                       STZ.W M7SEL                          ;808452|9C1A21  |00211A;
                       STZ.W $01C2                          ;808455|9CC201  |0001C2;
                       STZ.W M7A                            ;808458|9C1B21  |00211B;
                       STZ.W M7B                            ;80845B|9C1C21  |00211C;
                       STZ.W M7C                            ;80845E|9C1D21  |00211D;
                       STZ.W M7D                            ;808461|9C1E21  |00211E;
                       STZ.W M7X                            ;808464|9C1F21  |00211F;
                       STZ.W M7Y                            ;808467|9C2021  |002120;
                       STZ.W W12SEL                         ;80846A|9C2321  |002123;
                       STZ.W $01C9                          ;80846D|9CC901  |0001C9;
                       STZ.W W34SEL                         ;808470|9C2421  |002124;
                       STZ.W $01CA                          ;808473|9CCA01  |0001CA;
                       STZ.W WOBJSEL                        ;808476|9C2521  |002125;
                       STZ.W $01DB                          ;808479|9CDB01  |0001DB;
                       STZ.W WH0                            ;80847C|9C2621  |002126;
                       STZ.W $01DC                          ;80847F|9CDC01  |0001DC;
                       STZ.W WH1                            ;808482|9C2721  |002127;
                       STZ.W $01DD                          ;808485|9CDD01  |0001DD;
                       STZ.W WH2                            ;808488|9C2821  |002128;
                       STZ.W $01DE                          ;80848B|9CDE01  |0001DE;
                       STZ.W WH3                            ;80848E|9C2921  |002129;
                       STZ.W $01DF                          ;808491|9CDF01  |0001DF;
                       STZ.W WBGLOG                         ;808494|9C2A21  |00212A;
                       STZ.W $01E0                          ;808497|9CE001  |0001E0;
                       STZ.W WOBJLOG                        ;80849A|9C2B21  |00212B;
                       STZ.W $01E1                          ;80849D|9CE101  |0001E1;
                       STZ.W TM                             ;8084A0|9C2C21  |00212C;
                       STZ.W $01E2                          ;8084A3|9CE201  |0001E2;
                       STZ.W TMW                            ;8084A6|9C2E21  |00212E;
                       STZ.W $01E4                          ;8084A9|9CE401  |0001E4;
                       STZ.W TS                             ;8084AC|9C2D21  |00212D;
                       STZ.W $01E3                          ;8084AF|9CE301  |0001E3;
                       STZ.W TSW                            ;8084B2|9C2F21  |00212F;
                       STZ.W $01E5                          ;8084B5|9CE501  |0001E5;
                       STZ.W CGADD                          ;8084B8|9C2121  |002121;
                       STZ.W CGDATA                         ;8084BB|9C2221  |002122;
                       STZ.W CGSWSEL                        ;8084BE|9C3021  |002130;
                       STZ.W $01E6                          ;8084C1|9CE601  |0001E6;
                       STZ.W CGADSUB                        ;8084C4|9C3121  |002131;
                       STZ.W $01E7                          ;8084C7|9CE701  |0001E7;
                       LDA.B #$80                           ;8084CA|A980    |      ;
                       STA.W COLDATA                        ;8084CC|8D3221  |002132;
                       STA.W $01E8                          ;8084CF|8DE801  |0001E8;
                       LDA.B #$40                           ;8084D2|A940    |      ;
                       STA.W COLDATA                        ;8084D4|8D3221  |002132;
                       STA.W $01E9                          ;8084D7|8DE901  |0001E9;
                       LDA.B #$20                           ;8084DA|A920    |      ;
                       STA.W COLDATA                        ;8084DC|8D3221  |002132;
                       STA.W $01EA                          ;8084DF|8DEA01  |0001EA;
                       STZ.W SETINI                         ;8084E2|9C3321  |002133;
                       STZ.W $01EB                          ;8084E5|9CEB01  |0001EB;
                       STZ.W MPYL                           ;8084E8|9C3421  |002134;
                       STZ.W MPYM                           ;8084EB|9C3521  |002135;
                       STZ.W MPYH                           ;8084EE|9C3621  |002136;
                       STZ.W SLHV                           ;8084F1|9C3721  |002137;
                       STZ.W ROAMDATA                       ;8084F4|9C3821  |002138;
                       STZ.W RVMDATAL                       ;8084F7|9C3921  |002139;
                       STZ.W RVMDATAH                       ;8084FA|9C3A21  |00213A;
                       STZ.W RCGDATA                        ;8084FD|9C3B21  |00213B;
                       STZ.W OPHCT                          ;808500|9C3C21  |00213C;
                       STZ.W OPVCT                          ;808503|9C3D21  |00213D;
                       STZ.W STAT77                         ;808506|9C3E21  |00213E;
                       STZ.W STAT78                         ;808509|9C3F21  |00213F;
                       STZ.W WMDATA                         ;80850C|9C8021  |002180;
                       STZ.W WMADDL                         ;80850F|9C8121  |002181;
                       STZ.W WMADDM                         ;808512|9C8221  |002182;
                       STZ.W WMADDH                         ;808515|9C8321  |002183;
                       STZ.W $021E                          ;808518|9C1E02  |00021E;
                       PLP                                  ;80851B|28      |      ;
                       RTS                                  ;80851C|60      |      ;
 
       CODE_FN_80851D:
                       REP #$30                             ;80851D|C230    |      ;
                       LDA.W #$07D0                         ;80851F|A9D007  |      ;
                       STA.L $7EF184                        ;808522|8F84F17E|7EF184;
                       LDA.W #$0000                         ;808526|A90000  |      ;
                       STA.L $7EF186                        ;808529|8F86F17E|7EF186;
                       LDA.W #$05DC                         ;80852D|A9DC05  |      ;
                       STA.L $7EF188                        ;808530|8F88F17E|7EF188;
                       LDA.W #$0000                         ;808534|A90000  |      ;
                       STA.L $7EF18A                        ;808537|8F8AF17E|7EF18A;
                       LDA.W #$0514                         ;80853B|A91405  |      ;
                       STA.L $7EF18C                        ;80853E|8F8CF17E|7EF18C;
                       LDA.W #$0000                         ;808542|A90000  |      ;
                       STA.L $7EF18E                        ;808545|8F8EF17E|7EF18E;
                       LDA.W #$03E8                         ;808549|A9E803  |      ;
                       STA.L $7EF190                        ;80854C|8F90F17E|7EF190;
                       LDA.W #$0000                         ;808550|A90000  |      ;
                       STA.L $7EF192                        ;808553|8F92F17E|7EF192;
                       LDA.W #$0320                         ;808557|A92003  |      ;
                       STA.L $7EF194                        ;80855A|8F94F17E|7EF194;
                       LDA.W #$0000                         ;80855E|A90000  |      ;
                       STA.L $7EF196                        ;808561|8F96F17E|7EF196;
                       LDA.W #$07D0                         ;808565|A9D007  |      ;
                       STA.L $7EF148                        ;808568|8F48F17E|7EF148;
                       LDA.W #$0000                         ;80856C|A90000  |      ;
                       STA.L $7EF14A                        ;80856F|8F4AF17E|7EF14A;
                       LDA.W #$05DC                         ;808573|A9DC05  |      ;
                       STA.L $7EF14C                        ;808576|8F4CF17E|7EF14C;
                       LDA.W #$0000                         ;80857A|A90000  |      ;
                       STA.L $7EF14E                        ;80857D|8F4EF17E|7EF14E;
                       LDA.W #$0514                         ;808581|A91405  |      ;
                       STA.L $7EF150                        ;808584|8F50F17E|7EF150;
                       LDA.W #$0000                         ;808588|A90000  |      ;
                       STA.L $7EF152                        ;80858B|8F52F17E|7EF152;
                       LDA.W #$03E8                         ;80858F|A9E803  |      ;
                       STA.L $7EF154                        ;808592|8F54F17E|7EF154;
                       LDA.W #$0000                         ;808596|A90000  |      ;
                       STA.L $7EF156                        ;808599|8F56F17E|7EF156;
                       LDA.W #$0320                         ;80859D|A92003  |      ;
                       STA.L $7EF158                        ;8085A0|8F58F17E|7EF158;
                       LDA.W #$0000                         ;8085A4|A90000  |      ;
                       STA.L $7EF15A                        ;8085A7|8F5AF17E|7EF15A;
                       LDA.W #$0013                         ;8085AB|A91300  |      ;
                       STA.L $7EF15C                        ;8085AE|8F5CF17E|7EF15C;
                       LDA.W #$0009                         ;8085B2|A90900  |      ;
                       STA.L $7EF15E                        ;8085B5|8F5EF17E|7EF15E;
                       LDA.W #$000D                         ;8085B9|A90D00  |      ;
                       STA.L $7EF160                        ;8085BC|8F60F17E|7EF160;
                       LDA.W #$00FF                         ;8085C0|A9FF00  |      ;
                       STA.L $7EF162                        ;8085C3|8F62F17E|7EF162;
                       LDA.W #$000A                         ;8085C7|A90A00  |      ;
                       STA.L $7EF164                        ;8085CA|8F64F17E|7EF164;
                       LDA.W #$0019                         ;8085CE|A91900  |      ;
                       STA.L $7EF166                        ;8085D1|8F66F17E|7EF166;
                       LDA.W #$000C                         ;8085D5|A90C00  |      ;
                       STA.L $7EF168                        ;8085D8|8F68F17E|7EF168;
                       LDA.W #$00FF                         ;8085DC|A9FF00  |      ;
                       STA.L $7EF16A                        ;8085DF|8F6AF17E|7EF16A;
                       LDA.W #$000C                         ;8085E3|A90C00  |      ;
                       STA.L $7EF16C                        ;8085E6|8F6CF17E|7EF16C;
                       LDA.W #$000C                         ;8085EA|A90C00  |      ;
                       STA.L $7EF16E                        ;8085ED|8F6EF17E|7EF16E;
                       LDA.W #$0013                         ;8085F1|A91300  |      ;
                       STA.L $7EF170                        ;8085F4|8F70F17E|7EF170;
                       LDA.W #$00FF                         ;8085F8|A9FF00  |      ;
                       STA.L $7EF172                        ;8085FB|8F72F17E|7EF172;
                       LDA.W #$000D                         ;8085FF|A90D00  |      ;
                       STA.L $7EF174                        ;808602|8F74F17E|7EF174;
                       LDA.W #$0008                         ;808606|A90800  |      ;
                       STA.L $7EF176                        ;808609|8F76F17E|7EF176;
                       LDA.W #$0012                         ;80860D|A91200  |      ;
                       STA.L $7EF178                        ;808610|8F78F17E|7EF178;
                       LDA.W #$00FF                         ;808614|A9FF00  |      ;
                       STA.L $7EF17A                        ;808617|8F7AF17E|7EF17A;
                       LDA.W #$0018                         ;80861B|A91800  |      ;
                       STA.L $7EF17C                        ;80861E|8F7CF17E|7EF17C;
                       LDA.W #$0000                         ;808622|A90000  |      ;
                       STA.L $7EF17E                        ;808625|8F7EF17E|7EF17E;
                       LDA.W #$000C                         ;808629|A90C00  |      ;
                       STA.L $7EF180                        ;80862C|8F80F17E|7EF180;
                       LDA.W #$00FF                         ;808630|A9FF00  |      ;
                       STA.L $7EF182                        ;808633|8F82F17E|7EF182;
                       RTS                                  ;808637|60      |      ;
 
       CODE_FN_808638:
                       LDA.W #$0000                         ;808638|A90000  |      ;
                       STA.L $7E934B                        ;80863B|8F4B937E|7E934B;
                       STA.L $7E935B                        ;80863F|8F5B937E|7E935B;
                       STA.L $7E934D                        ;808643|8F4D937E|7E934D;
                       STA.L $7E934F                        ;808647|8F4F937E|7E934F;
                       LDA.W #$0001                         ;80864B|A90100  |      ;
                       STA.L $7E933D                        ;80864E|8F3D937E|7E933D;
                       RTS                                  ;808652|60      |      ;
 
    SetDefaultOptions:
                       LDA.W #$0000                         ;808653|A90000  |      ;
                       STA.L BALL_Active                    ;808656|8F60947E|7E9460;
                       STA.L TimeSet_Selection              ;80865A|8F62947E|7E9462;
                       STA.L CPU_Selection_1P               ;80865E|8F64947E|7E9464;
                       STA.L CPU_Selection_2P               ;808662|8F66947E|7E9466;
                       LDA.W #$0002                         ;808666|A90200  |      ;
                       STA.L Match_Points_Selection         ;808669|8F6C947E|7E946C;
                       LDA.W #$0002                         ;80866D|A90200  |      ;
                       STA.L VSLevelAdj_Easy_Selection      ;808670|8F70947E|7E9470;
                       LDA.W #$0004                         ;808674|A90400  |      ;
                       STA.L VSLevelAdj_Normal_Selection    ;808677|8F72947E|7E9472;
                       LDA.W #$0006                         ;80867B|A90600  |      ;
                       STA.L VSLevelAdj_Hard_Selection      ;80867E|8F74947E|7E9474;
                       STA.L $7E9476                        ;808682|8F76947E|7E9476;
                       RTS                                  ;808686|60      |      ;
 
          CheckRegion:
                       PHP                                  ;808687|08      |      ;
                       SEP #$20                             ;808688|E220    |      ;
                       LDA.W STAT78                         ;80868A|AD3F21  |00213F;
                       BIT.B #$10                           ;80868D|8910    |      ; checks for PAL SNES
                       BEQ +                                ;80868F|F006    |808697;
                       LDA.B #$02                           ;808691|A902    |      ;
                       STA.L $7E3900                        ;808693|8F00397E|7E3900;
 
                     + PLP                                  ;808697|28      |      ;
                       RTS                                  ;808698|60      |      ;
 
          CheckCopier:
                       PHP                                  ;808699|08      |      ;
                       REP #$20                             ;80869A|C220    |      ;
                       LDA.W #$5555                         ;80869C|A95555  |      ;
                       STA.L $700000                        ;80869F|8F000070|700000; writes to $700000 in SRAM, then reads from there
                       LDA.L $700000                        ;8086A3|AF000070|700000; legit cart has no SRAM, so if successful, indicates copier
                       CMP.W #$5555                         ;8086A7|C95555  |      ;
                       BNE +                                ;8086AA|D017    |8086C3;
                       db $A9,$AA,$AA,$8F,$00,$00,$70,$AF   ;8086AC|        |      ;
                       db $00,$00,$70,$C9,$AA,$AA,$D0,$07   ;8086B4|        |      ;
                       db $A9,$01,$00,$8F,$00,$39,$7E       ;8086BC|        |      ;
 
                     + PLP                                  ;8086C3|28      |      ;
                       RTS                                  ;8086C4|60      |      ;
 
       CODE_FN_8086C5:
                       PHP                                  ;8086C5|08      |      ;
                       PHB                                  ;8086C6|8B      |      ;
                       PHK                                  ;8086C7|4B      |      ;
                       PLB                                  ;8086C8|AB      |      ;
                       REP #$30                             ;8086C9|C230    |      ;
                       LDX.W #$0014                         ;8086CB|A21400  |      ;
 
                     - LDA.L $7EFF00,X                      ;8086CE|BF00FF7E|7EFF00;
                       CMP.W RAMInit_String,X               ;8086D2|DD1587  |808715;
                       BNE CODE_8086DD                      ;8086D5|D006    |8086DD;
                       DEX                                  ;8086D7|CA      |      ;
                       DEX                                  ;8086D8|CA      |      ;
                       BEQ +                                ;8086D9|F006    |8086E1;
                       BRA -                                ;8086DB|80F1    |8086CE;
 
          CODE_8086DD:
                       INC.B $02                            ;8086DD|E602    |000002;
                       BRA ++                               ;8086DF|8031    |808712;
 
                     + LDA.L $7EFF00                        ;8086E1|AF00FF7E|7EFF00;
                       CMP.W RAMInit_String                 ;8086E5|CD1587  |808715;
                       BNE CODE_8086DD                      ;8086E8|D0F3    |8086DD;
                       SEP #$20                             ;8086EA|E220    |      ;
                       STZ.B $00                            ;8086EC|6400    |000000;
                       STZ.B $02                            ;8086EE|6402    |000002;
                       LDX.W #$008B                         ;8086F0|A28B00  |      ;
 
                     - LDA.L $7EF148,X                      ;8086F3|BF48F17E|7EF148;
                       CLC                                  ;8086F7|18      |      ;
                       ADC.B $00                            ;8086F8|6500    |000000;
                       STA.B $00                            ;8086FA|8500    |000000;
                       DEX                                  ;8086FC|CA      |      ;
                       BNE -                                ;8086FD|D0F4    |8086F3;
                       REP #$20                             ;8086FF|C220    |      ;
                       LDA.L $7EF148                        ;808701|AF48F17E|7EF148;
                       CLC                                  ;808705|18      |      ;
                       ADC.B $00                            ;808706|6500    |000000;
                       STA.B $00                            ;808708|8500    |000000;
                       CMP.L $7EFFFE                        ;80870A|CFFEFF7E|7EFFFE;
                       BEQ ++                               ;80870E|F002    |808712;
                       db $E6,$02                           ;808710|        |000002;
 
                    ++ PLB                                  ;808712|AB      |      ;
                       PLP                                  ;808713|28      |      ;
                       RTS                                  ;808714|60      |      ;
 
       RAMInit_String:
                       db $CA,$DF,$C8,$D9,$20,$C3,$DE,$20   ;808715|        |      ; used to initiate RAM after a soft reset
                       db $CE,$DF,$DD,$20,$42,$59,$20,$42   ;80871D|        |      ;
                       db $2D,$43,$52,$41,$53,$48           ;808725|        |      ;
 
       CODE_FN_80872B:
                       PHP                                  ;80872B|08      |      ;
                       PHB                                  ;80872C|8B      |      ;
                       PHK                                  ;80872D|4B      |      ;
                       PLB                                  ;80872E|AB      |      ;
                       SEC                                  ;80872F|38      |      ;
                       LDA.L $7EF184                        ;808730|AF84F17E|7EF184;
                       SBC.W #$869F                         ;808734|E99F86  |      ;
                       STA.B $56                            ;808737|8556    |000056;
                       LDA.L $7EF186                        ;808739|AF86F17E|7EF186;
                       SBC.W #$0001                         ;80873D|E90100  |      ;
                       STA.B $54                            ;808740|8554    |000054;
                       ORA.B $56                            ;808742|0556    |000056;
                       BEQ +                                ;808744|F004    |80874A;
                       LDA.B $54                            ;808746|A554    |000054;
                       REP #$02                             ;808748|C202    |      ;
 
                     + BCC +                                ;80874A|900E    |80875A;
                       db $A9,$9F,$86,$8F,$84,$F1,$7E,$A9   ;80874C|        |      ;
                       db $01,$00,$8F,$86,$F1,$7E           ;808754|        |000000;
 
                     + SEC                                  ;80875A|38      |      ;
                       LDA.L $7EF188                        ;80875B|AF88F17E|7EF188;
                       SBC.W #$869F                         ;80875F|E99F86  |      ;
                       STA.B $56                            ;808762|8556    |000056;
                       LDA.L $7EF18A                        ;808764|AF8AF17E|7EF18A;
                       SBC.W #$0001                         ;808768|E90100  |      ;
                       STA.B $54                            ;80876B|8554    |000054;
                       ORA.B $56                            ;80876D|0556    |000056;
                       BEQ +                                ;80876F|F004    |808775;
                       LDA.B $54                            ;808771|A554    |000054;
                       REP #$02                             ;808773|C202    |      ;
 
                     + BCC +                                ;808775|900E    |808785;
                       db $A9,$9F,$86,$8F,$88,$F1,$7E,$A9   ;808777|        |      ;
                       db $01,$00,$8F,$8A,$F1,$7E           ;80877F|        |000000;
 
                     + SEC                                  ;808785|38      |      ;
                       LDA.L $7EF18C                        ;808786|AF8CF17E|7EF18C;
                       SBC.W #$869F                         ;80878A|E99F86  |      ;
                       STA.B $56                            ;80878D|8556    |000056;
                       LDA.L $7EF18E                        ;80878F|AF8EF17E|7EF18E;
                       SBC.W #$0001                         ;808793|E90100  |      ;
                       STA.B $54                            ;808796|8554    |000054;
                       ORA.B $56                            ;808798|0556    |000056;
                       BEQ +                                ;80879A|F004    |8087A0;
                       LDA.B $54                            ;80879C|A554    |000054;
                       REP #$02                             ;80879E|C202    |      ;
 
                     + BCC +                                ;8087A0|900E    |8087B0;
                       db $A9,$9F,$86,$8F,$8C,$F1,$7E,$A9   ;8087A2|        |      ;
                       db $01,$00,$8F,$8E,$F1,$7E           ;8087AA|        |000000;
 
                     + SEC                                  ;8087B0|38      |      ;
                       LDA.L $7EF190                        ;8087B1|AF90F17E|7EF190;
                       SBC.W #$869F                         ;8087B5|E99F86  |      ;
                       STA.B $56                            ;8087B8|8556    |000056;
                       LDA.L $7EF192                        ;8087BA|AF92F17E|7EF192;
                       SBC.W #$0001                         ;8087BE|E90100  |      ;
                       STA.B $54                            ;8087C1|8554    |000054;
                       ORA.B $56                            ;8087C3|0556    |000056;
                       BEQ +                                ;8087C5|F004    |8087CB;
                       LDA.B $54                            ;8087C7|A554    |000054;
                       REP #$02                             ;8087C9|C202    |      ;
 
                     + BCC +                                ;8087CB|900E    |8087DB;
                       db $A9,$9F,$86,$8F,$90,$F1,$7E,$A9   ;8087CD|        |      ;
                       db $01,$00,$8F,$92,$F1,$7E           ;8087D5|        |000000;
 
                     + SEC                                  ;8087DB|38      |      ;
                       LDA.L $7EF194                        ;8087DC|AF94F17E|7EF194;
                       SBC.W #$869F                         ;8087E0|E99F86  |      ;
                       STA.B $56                            ;8087E3|8556    |000056;
                       LDA.L $7EF196                        ;8087E5|AF96F17E|7EF196;
                       SBC.W #$0001                         ;8087E9|E90100  |      ;
                       STA.B $54                            ;8087EC|8554    |000054;
                       ORA.B $56                            ;8087EE|0556    |000056;
                       BEQ +                                ;8087F0|F004    |8087F6;
                       LDA.B $54                            ;8087F2|A554    |000054;
                       REP #$02                             ;8087F4|C202    |      ;
 
                     + BCC +                                ;8087F6|900E    |808806;
                       db $A9,$9F,$86,$8F,$94,$F1,$7E,$A9   ;8087F8|        |      ;
                       db $01,$00,$8F,$96,$F1,$7E           ;808800|        |000000;
 
                     + SEC                                  ;808806|38      |      ;
                       LDA.L $7EF148                        ;808807|AF48F17E|7EF148;
                       SBC.W #$869F                         ;80880B|E99F86  |      ;
                       STA.B $56                            ;80880E|8556    |000056;
                       LDA.L $7EF14A                        ;808810|AF4AF17E|7EF14A;
                       SBC.W #$0001                         ;808814|E90100  |      ;
                       STA.B $54                            ;808817|8554    |000054;
                       ORA.B $56                            ;808819|0556    |000056;
                       BEQ +                                ;80881B|F004    |808821;
                       LDA.B $54                            ;80881D|A554    |000054;
                       REP #$02                             ;80881F|C202    |      ;
 
                     + BCC +                                ;808821|900E    |808831;
                       db $A9,$9F,$86,$8F,$48,$F1,$7E,$A9   ;808823|        |      ;
                       db $01,$00,$8F,$4A,$F1,$7E           ;80882B|        |000000;
 
                     + SEC                                  ;808831|38      |      ;
                       LDA.L $7EF14C                        ;808832|AF4CF17E|7EF14C;
                       SBC.W #$869F                         ;808836|E99F86  |      ;
                       STA.B $56                            ;808839|8556    |000056;
                       LDA.L $7EF14E                        ;80883B|AF4EF17E|7EF14E;
                       SBC.W #$0001                         ;80883F|E90100  |      ;
                       STA.B $54                            ;808842|8554    |000054;
                       ORA.B $56                            ;808844|0556    |000056;
                       BEQ +                                ;808846|F004    |80884C;
                       LDA.B $54                            ;808848|A554    |000054;
                       REP #$02                             ;80884A|C202    |      ;
 
                     + BCC +                                ;80884C|900E    |80885C;
                       db $A9,$9F                           ;80884E|        |      ;
                       db $86,$8F                           ;808850|        |00008F;
                       db $4C,$F1                           ;808852|        |      ;
                       db $7E,$A9                           ;808854|        |0001A9;
                       db $01,$00                           ;808856|        |      ;
                       db $8F,$4E                           ;808858|        |7EF14E;
                       db $F1,$7E                           ;80885A|        |      ;
 
                     + SEC                                  ;80885C|38      |      ;
                       LDA.L $7EF150                        ;80885D|AF50F17E|7EF150;
                       SBC.W #$869F                         ;808861|E99F86  |      ;
                       STA.B $56                            ;808864|8556    |000056;
                       LDA.L $7EF152                        ;808866|AF52F17E|7EF152;
                       SBC.W #$0001                         ;80886A|E90100  |      ;
                       STA.B $54                            ;80886D|8554    |000054;
                       ORA.B $56                            ;80886F|0556    |000056;
                       BEQ +                                ;808871|F004    |808877;
                       LDA.B $54                            ;808873|A554    |000054;
                       REP #$02                             ;808875|C202    |      ;
 
                     + BCC +                                ;808877|900E    |808887;
                       db $A9                               ;808879|        |      ;
                       db $9F,$86                           ;80887A|        |      ;
                       db $8F,$50                           ;80887C|        |7EF150;
                       db $F1,$7E                           ;80887E|        |      ;
                       db $A9,$01,$00,$8F,$52,$F1,$7E       ;808880|        |      ;
 
                     + SEC                                  ;808887|38      |      ;
                       LDA.L $7EF154                        ;808888|AF54F17E|7EF154;
                       SBC.W #$869F                         ;80888C|E99F86  |      ;
                       STA.B $56                            ;80888F|8556    |000056;
                       LDA.L $7EF156                        ;808891|AF56F17E|7EF156;
                       SBC.W #$0001                         ;808895|E90100  |      ;
                       STA.B $54                            ;808898|8554    |000054;
                       ORA.B $56                            ;80889A|0556    |000056;
                       BEQ +                                ;80889C|F004    |8088A2;
                       LDA.B $54                            ;80889E|A554    |000054;
                       REP #$02                             ;8088A0|C202    |      ;
 
                     + BCC +                                ;8088A2|900E    |8088B2;
                       db $A9,$9F,$86,$8F,$54,$F1,$7E,$A9   ;8088A4|        |      ;
                       db $01,$00,$8F,$56,$F1,$7E           ;8088AC|        |000000;
 
                     + SEC                                  ;8088B2|38      |      ;
                       LDA.L $7EF158                        ;8088B3|AF58F17E|7EF158;
                       SBC.W #$869F                         ;8088B7|E99F86  |      ;
                       STA.B $56                            ;8088BA|8556    |000056;
                       LDA.L $7EF15A                        ;8088BC|AF5AF17E|7EF15A;
                       SBC.W #$0001                         ;8088C0|E90100  |      ;
                       STA.B $54                            ;8088C3|8554    |000054;
                       ORA.B $56                            ;8088C5|0556    |000056;
                       BEQ +                                ;8088C7|F004    |8088CD;
                       LDA.B $54                            ;8088C9|A554    |000054;
                       REP #$02                             ;8088CB|C202    |      ;
 
                     + BCC +                                ;8088CD|900E    |8088DD;
                       db $A9,$9F,$86,$8F,$58,$F1,$7E,$A9   ;8088CF|        |      ;
                       db $01,$00,$8F,$5A,$F1,$7E           ;8088D7|        |000000;
 
                     + LDA.L $7EF15C                        ;8088DD|AF5CF17E|7EF15C;
                       CMP.W #$001D                         ;8088E1|C91D00  |      ;
                       BCC +                                ;8088E4|9007    |8088ED;
                       db $A9,$1C,$00,$8F,$5C,$F1,$7E       ;8088E6|        |      ;
 
                     + LDA.L $7EF15E                        ;8088ED|AF5EF17E|7EF15E;
                       CMP.W #$001D                         ;8088F1|C91D00  |      ;
                       BCC +                                ;8088F4|9007    |8088FD;
                       db $A9,$1C,$00,$8F,$5E,$F1,$7E       ;8088F6|        |      ;
 
                     + LDA.L $7EF160                        ;8088FD|AF60F17E|7EF160;
                       CMP.W #$001D                         ;808901|C91D00  |      ;
                       BCC +                                ;808904|9007    |80890D;
                       db $A9,$1C,$00,$8F,$60,$F1,$7E       ;808906|        |      ;
 
                     + LDA.W #$00FF                         ;80890D|A9FF00  |      ;
                       STA.L $7EF162                        ;808910|8F62F17E|7EF162;
                       LDA.L $7EF164                        ;808914|AF64F17E|7EF164;
                       CMP.W #$001D                         ;808918|C91D00  |      ;
                       BCC +                                ;80891B|9007    |808924;
                       db $A9,$1C,$00,$8F,$64,$F1,$7E       ;80891D|        |      ;
 
                     + LDA.L $7EF166                        ;808924|AF66F17E|7EF166;
                       CMP.W #$001D                         ;808928|C91D00  |      ;
                       BCC +                                ;80892B|9007    |808934;
                       db $A9,$1C,$00,$8F,$66,$F1,$7E       ;80892D|        |      ;
 
                     + LDA.L $7EF168                        ;808934|AF68F17E|7EF168;
                       CMP.W #$001D                         ;808938|C91D00  |      ;
                       BCC +                                ;80893B|9007    |808944;
                       db $A9,$1C,$00,$8F,$68,$F1,$7E       ;80893D|        |      ;
 
                     + LDA.W #$00FF                         ;808944|A9FF00  |      ;
                       STA.L $7EF16A                        ;808947|8F6AF17E|7EF16A;
                       LDA.L $7EF16C                        ;80894B|AF6CF17E|7EF16C;
                       CMP.W #$001D                         ;80894F|C91D00  |      ;
                       BCC +                                ;808952|9007    |80895B;
                       db $A9,$1C,$00,$8F,$6C,$F1,$7E       ;808954|        |      ;
 
                     + LDA.L $7EF16E                        ;80895B|AF6EF17E|7EF16E;
                       CMP.W #$001D                         ;80895F|C91D00  |      ;
                       BCC +                                ;808962|9007    |80896B;
                       db $A9,$1C,$00,$8F,$6E,$F1,$7E       ;808964|        |      ;
 
                     + LDA.L $7EF170                        ;80896B|AF70F17E|7EF170;
                       CMP.W #$001D                         ;80896F|C91D00  |      ;
                       BCC +                                ;808972|9007    |80897B;
                       db $A9,$1C,$00,$8F,$70,$F1,$7E       ;808974|        |      ;
 
                     + LDA.W #$00FF                         ;80897B|A9FF00  |      ;
                       STA.L $7EF172                        ;80897E|8F72F17E|7EF172;
                       LDA.L $7EF174                        ;808982|AF74F17E|7EF174;
                       CMP.W #$001D                         ;808986|C91D00  |      ;
                       BCC +                                ;808989|9007    |808992;
                       db $A9,$1C,$00,$8F,$74,$F1,$7E       ;80898B|        |      ;
 
                     + LDA.L $7EF176                        ;808992|AF76F17E|7EF176;
                       CMP.W #$001D                         ;808996|C91D00  |      ;
                       BCC +                                ;808999|9007    |8089A2;
                       db $A9,$1C,$00,$8F,$76,$F1,$7E       ;80899B|        |      ;
 
                     + LDA.L $7EF178                        ;8089A2|AF78F17E|7EF178;
                       CMP.W #$001D                         ;8089A6|C91D00  |      ;
                       BCC +                                ;8089A9|9007    |8089B2;
                       db $A9,$1C,$00,$8F,$78,$F1,$7E       ;8089AB|        |      ;
 
                     + LDA.W #$00FF                         ;8089B2|A9FF00  |      ;
                       STA.L $7EF17A                        ;8089B5|8F7AF17E|7EF17A;
                       LDA.L $7EF17C                        ;8089B9|AF7CF17E|7EF17C;
                       CMP.W #$001D                         ;8089BD|C91D00  |      ;
                       BCC +                                ;8089C0|9007    |8089C9;
                       db $A9,$1C,$00,$8F,$7C,$F1,$7E       ;8089C2|        |      ;
 
                     + LDA.L $7EF17E                        ;8089C9|AF7EF17E|7EF17E;
                       CMP.W #$001D                         ;8089CD|C91D00  |      ;
                       BCC +                                ;8089D0|9007    |8089D9;
                       db $A9,$1C,$00,$8F,$7E,$F1,$7E       ;8089D2|        |      ;
 
                     + LDA.L $7EF180                        ;8089D9|AF80F17E|7EF180;
                       CMP.W #$001D                         ;8089DD|C91D00  |      ;
                       BCC +                                ;8089E0|9007    |8089E9;
                       db $A9,$1C,$00,$8F,$80,$F1,$7E       ;8089E2|        |      ;
 
                     + LDA.W #$00FF                         ;8089E9|A9FF00  |      ;
                       STA.L $7EF182                        ;8089EC|8F82F17E|7EF182;
                       LDA.L $7EF19A                        ;8089F0|AF9AF17E|7EF19A;
                       BEQ +                                ;8089F4|F03F    |808A35;
                       db $A9,$04,$00,$8F,$9E,$F1,$7E,$8F   ;8089F6|        |      ;
                       db $F2,$94,$7E,$A9,$01,$00,$8F,$AE   ;8089FE|        |000094;
                       db $F1,$7E,$8F,$E6,$94,$7E,$A9,$00   ;808A06|        |00007E;
                       db $00,$8F,$A4,$F1,$7E,$8F,$A6,$F1   ;808A0E|        |      ;
                       db $7E,$8F,$A8,$F1,$7E,$AF,$B0,$F1   ;808A16|        |00A88F;
                       db $7E,$8F,$02,$95,$7E,$AF,$B2,$F1   ;808A1E|        |00028F;
                       db $7E,$8F,$04,$95,$7E,$AF,$B4,$F1   ;808A26|        |00048F;
                       db $7E,$8F,$06,$95,$7E,$80,$1F       ;808A2E|        |00068F;
 
                     + LDA.W #$0000                         ;808A35|A90000  |      ;
                       STA.L $7EF19E                        ;808A38|8F9EF17E|7EF19E;
                       STA.L $7E94F2                        ;808A3C|8FF2947E|7E94F2;
                       STA.L $7EF1AE                        ;808A40|8FAEF17E|7EF1AE;
                       STA.L $7E94E6                        ;808A44|8FE6947E|7E94E6;
                       STA.L $7EF1B0                        ;808A48|8FB0F17E|7EF1B0;
                       STA.L $7EF1B2                        ;808A4C|8FB2F17E|7EF1B2;
                       STA.L $7EF1B4                        ;808A50|8FB4F17E|7EF1B4;
                       LDA.L $7EF198                        ;808A54|AF98F17E|7EF198;
                       CMP.W #$0007                         ;808A58|C90700  |      ;
                       BCC +                                ;808A5B|9007    |808A64;
                       db $A9,$00,$00,$8F,$98,$F1,$7E       ;808A5D|        |      ;
 
                     + STA.L $7E94EC                        ;808A64|8FEC947E|7E94EC;
                       LDA.L $7EF19A                        ;808A68|AF9AF17E|7EF19A;
                       CMP.W #$0006                         ;808A6C|C90600  |      ;
                       BCC +                                ;808A6F|9007    |808A78;
                       db $A9,$00,$00,$8F,$9A,$F1,$7E       ;808A71|        |      ;
 
                     + STA.L $7E94EE                        ;808A78|8FEE947E|7E94EE;
                       LDA.L $7EF19C                        ;808A7C|AF9CF17E|7EF19C;
                       CMP.W #$0007                         ;808A80|C90700  |      ;
                       BCC +                                ;808A83|9007    |808A8C;
                       db $A9,$00,$00,$8F,$9C,$F1,$7E       ;808A85|        |      ;
 
                     + STA.L $7E94F0                        ;808A8C|8FF0947E|7E94F0;
                       LDA.L $7EF1A0                        ;808A90|AFA0F17E|7EF1A0;
                       CMP.W #$0003                         ;808A94|C90300  |      ;
                       BCC +                                ;808A97|9007    |808AA0;
                       db $A9,$00,$00,$8F,$A0,$F1,$7E       ;808A99|        |      ;
 
                     + STA.L $7E94F4                        ;808AA0|8FF4947E|7E94F4;
                       LDA.L $7EF1A2                        ;808AA4|AFA2F17E|7EF1A2;
                       CMP.W #$0002                         ;808AA8|C90200  |      ;
                       BCC +                                ;808AAB|9007    |808AB4;
                       db $A9,$00,$00,$8F,$A2,$F1,$7E       ;808AAD|        |      ;
 
                     + STA.L $7E94F6                        ;808AB4|8FF6947E|7E94F6;
                       SEC                                  ;808AB8|38      |      ;
                       LDA.L $7EF1AA                        ;808AB9|AFAAF17E|7EF1AA;
                       SBC.W #$869F                         ;808ABD|E99F86  |      ;
                       STA.B $56                            ;808AC0|8556    |000056;
                       LDA.L $7EF1AC                        ;808AC2|AFACF17E|7EF1AC;
                       SBC.W #$0001                         ;808AC6|E90100  |      ;
                       STA.B $54                            ;808AC9|8554    |000054;
                       ORA.B $56                            ;808ACB|0556    |000056;
                       BEQ +                                ;808ACD|F004    |808AD3;
                       LDA.B $54                            ;808ACF|A554    |000054;
                       REP #$02                             ;808AD1|C202    |      ;
 
                     + BCC +                                ;808AD3|900E    |808AE3;
                       db $A9,$9F,$86,$8F,$AA,$F1,$7E,$A9   ;808AD5|        |      ;
                       db $01,$00,$8F,$AC,$F1,$7E           ;808ADD|        |000000;
 
                     + LDA.L $7EF1AA                        ;808AE3|AFAAF17E|7EF1AA;
                       STA.L $7E94FE                        ;808AE7|8FFE947E|7E94FE;
                       LDA.L $7EF1AC                        ;808AEB|AFACF17E|7EF1AC;
                       STA.L $7E9500                        ;808AEF|8F00957E|7E9500;
                       LDA.L $7EF1B8                        ;808AF3|AFB8F17E|7EF1B8;
                       BEQ +                                ;808AF7|F030    |808B29;
                       db $A9,$04,$00,$8F,$BC,$F1,$7E,$8F   ;808AF9|        |      ;
                       db $DE,$94,$7E,$A9,$01,$00,$8F,$D6   ;808B01|        |007E94;
                       db $94,$7E,$8F,$C4,$F1,$7E,$AF,$C6   ;808B09|        |00007E;
                       db $F1,$7E,$8F,$0E,$95,$7E,$AF,$C8   ;808B11|        |00007E;
                       db $F1,$7E,$8F,$10,$95,$7E,$AF,$CA   ;808B19|        |00007E;
                       db $F1,$7E,$8F,$12,$95,$7E,$80,$1F   ;808B21|        |00007E;
 
                     + LDA.W #$0000                         ;808B29|A90000  |      ;
                       STA.L $7EF1BC                        ;808B2C|8FBCF17E|7EF1BC;
                       STA.L $7E94DE                        ;808B30|8FDE947E|7E94DE;
                       STA.L $7E94D6                        ;808B34|8FD6947E|7E94D6;
                       STA.L $7EF1C4                        ;808B38|8FC4F17E|7EF1C4;
                       STA.L $7EF1C6                        ;808B3C|8FC6F17E|7EF1C6;
                       STA.L $7EF1C8                        ;808B40|8FC8F17E|7EF1C8;
                       STA.L $7EF1CA                        ;808B44|8FCAF17E|7EF1CA;
                       LDA.L $7EF1B6                        ;808B48|AFB6F17E|7EF1B6;
                       CMP.W #$003D                         ;808B4C|C93D00  |      ;
                       BCC +                                ;808B4F|9007    |808B58;
                       db $A9,$00,$00,$8F,$B6,$F1,$7E       ;808B51|        |      ;
 
                     + STA.L $7E94D8                        ;808B58|8FD8947E|7E94D8;
                       LDA.L $7EF1B8                        ;808B5C|AFB8F17E|7EF1B8;
                       CMP.W #$003D                         ;808B60|C93D00  |      ;
                       BCC +                                ;808B63|9007    |808B6C;
                       db $A9,$00,$00,$8F,$B8,$F1,$7E       ;808B65|        |      ;
 
                     + STA.L $7E94DA                        ;808B6C|8FDA947E|7E94DA;
                       LDA.L $7EF1BA                        ;808B70|AFBAF17E|7EF1BA;
                       CMP.W #$0002                         ;808B74|C90200  |      ;
                       BCC +                                ;808B77|9007    |808B80;
                       db $A9,$00,$00,$8F,$BA,$F1,$7E       ;808B79|        |      ;
 
                     + STA.L $7E94DC                        ;808B80|8FDC947E|7E94DC;
                       LDA.L $7EF1BE                        ;808B84|AFBEF17E|7EF1BE;
                       CMP.W #$000A                         ;808B88|C90A00  |      ;
                       BCC +                                ;808B8B|9007    |808B94;
                       db $A9,$00,$00,$8F,$BE,$F1,$7E       ;808B8D|        |      ;
 
                     + STA.L $7E94E0                        ;808B94|8FE0947E|7E94E0;
                       LDA.L $7EF1C0                        ;808B98|AFC0F17E|7EF1C0;
                       CMP.W #$003C                         ;808B9C|C93C00  |      ;
                       BCC +                                ;808B9F|9007    |808BA8;
                       db $A9,$00,$00,$8F,$C0,$F1,$7E       ;808BA1|        |      ;
 
                     + STA.L $7E94E2                        ;808BA8|8FE2947E|7E94E2;
                       LDA.L $7EF1C2                        ;808BAC|AFC2F17E|7EF1C2;
                       CMP.W #$003C                         ;808BB0|C93C00  |      ;
                       BCC +                                ;808BB3|9007    |808BBC;
                       db $A9,$00,$00,$8F,$C2,$F1,$7E       ;808BB5|        |      ;
 
                     + STA.L $7E94E4                        ;808BBC|8FE4947E|7E94E4;
                       LDA.L $7EF1CC                        ;808BC0|AFCCF17E|7EF1CC;
                       BEQ +                                ;808BC4|F021    |808BE7;
                       LDA.W #$0001                         ;808BC6|A90100  |      ;
                       STA.L $7E9526                        ;808BC9|8F26957E|7E9526;
                       LDA.L $7EF1CE                        ;808BCD|AFCEF17E|7EF1CE;
                       STA.L $7E951A                        ;808BD1|8F1A957E|7E951A;
                       LDA.L $7EF1D0                        ;808BD5|AFD0F17E|7EF1D0;
                       STA.L $7E951C                        ;808BD9|8F1C957E|7E951C;
                       LDA.L $7EF1D2                        ;808BDD|AFD2F17E|7EF1D2;
                       STA.L $7E951E                        ;808BE1|8F1E957E|7E951E;
                       BRA ++                               ;808BE5|8017    |808BFE;
 
                     + LDA.W #$0000                         ;808BE7|A90000  |      ;
                       STA.L $7E9526                        ;808BEA|8F26957E|7E9526;
                       STA.L $7EF1CC                        ;808BEE|8FCCF17E|7EF1CC;
                       STA.L $7EF1CE                        ;808BF2|8FCEF17E|7EF1CE;
                       STA.L $7EF1D0                        ;808BF6|8FD0F17E|7EF1D0;
                       STA.L $7EF1D2                        ;808BFA|8FD2F17E|7EF1D2;
 
                    ++ PLB                                  ;808BFE|AB      |      ;
                       PLP                                  ;808BFF|28      |      ;
                       RTS                                  ;808C00|60      |      ;
                       db $A2,$00,$00,$BF,$90,$90,$90,$9F   ;808C01|        |      ;
                       db $24,$1F,$00,$E8,$E8,$E0,$10,$00   ;808C09|        |00001F;
                       db $D0,$F1                           ;808C11|        |808C04;
 
                     - RTL                                  ;808C13|6B      |      ;
 
       CODE_FL_808C14:
                       LDX.W #$0000                         ;808C14|A20000  |      ;
                       LDA.L DATA8_909090,X                 ;808C17|BF909090|909090;
                       CMP.L $001F24,X                      ;808C1B|DF241F00|001F24;
                       BNE -                                ;808C1F|D0F2    |808C13;
                       db $E8,$E8,$E0,$10,$00,$D0,$EF,$A9   ;808C21|        |      ;
                       db $00,$00,$8F,$FC,$1F,$00,$8F,$FE   ;808C29|        |      ;
                       db $1F,$00,$20,$39,$8C,$80,$FE,$6B   ;808C31|        |392000;
                       db $E2,$20,$A9,$01,$8D,$EC,$01,$8D   ;808C39|        |      ;
                       db $00,$42,$C2,$30,$4B               ;808C41|        |      ;
                       db $AB,$A2                           ;808C46|        |      ;
                       db $F7,$1F                           ;808C48|        |00001F;
                       db $9A,$A9                           ;808C4A|        |      ;
                       db $00,$00                           ;808C4C|        |      ;
                       db $5B,$A2                           ;808C4E|        |      ;
                       db $FE,$1F                           ;808C50|        |009E1F;
                       db $9E,$00                           ;808C52|        |      ;
                       db $00,$CA                           ;808C54|        |      ;
                       db $CA,$10                           ;808C56|        |      ;
                       db $F9,$22                           ;808C58|        |000122;
                       db $01,$8C                           ;808C5A|        |      ;
                       db $80,$E2                           ;808C5C|        |808C40;
                       db $20,$A9                           ;808C5E|        |      ;
                       db $80,$8D                           ;808C60|        |808BEF;
                       db $B6,$01                           ;808C62|        |      ;
                       db $8D,$00                           ;808C64|        |002100;
                       db $21,$A9                           ;808C66|        |      ;
                       db $01,$85                           ;808C68|        |000085;
                       db $A3,$C2                           ;808C6A|        |      ;
                       db $20,$A9                           ;808C6C|        |8018A9;
                       db $18,$00                           ;808C6E|        |      ;
                       db $8D,$A0                           ;808C70|        |0002A0;
                       db $02,$9C                           ;808C72|        |      ;
                       db $A2,$02                           ;808C74|        |      ;
                       db $20,$33                           ;808C76|        |      ;
                       db $83,$20                           ;808C78|        |000020;
                       db $17,$82                           ;808C7A|        |      ;
                       db $20,$E8                           ;808C7C|        |808CE8;
                       db $8C,$22                           ;808C7E|        |      ;
                       db $2D,$BB,$80,$CB,$B9,$94,$00,$5D   ;808C80|        |0080BB;
                       db $7F,$8B,$4B,$AB,$A0,$96,$8C,$22   ;808C88|        |AB4B8B;
                       db $CA,$A0,$80,$AB,$80,$08,$00,$5D   ;808C90|        |      ;
                       db $7F,$80,$08,$80,$00,$20,$22,$2D   ;808C98|        |800880;
                       db $BB,$80,$6E,$BE,$94,$F6,$86,$7E   ;808CA0|        |      ;
                       db $8B,$4B,$AB,$A0,$B5,$8C,$22,$7F   ;808CA8|        |      ;
                       db $A0,$80,$AB,$80,$06,$F6,$86,$7E   ;808CB0|        |      ;
                       db $00,$02,$00,$22,$2D,$BB,$80,$7B   ;808CB8|        |      ;
                       db $BE,$94,$00,$20,$7E,$8B,$4B,$AB   ;808CC0|        |000094;
                       db $A0,$D2,$8C,$22,$CA,$A0,$80,$AB   ;808CC8|        |      ;
                       db $80,$08,$00,$20,$7E,$00,$08,$80   ;808CD0|        |808CDA;
                       db $00,$70,$E2,$20,$A9,$0F,$8D,$B6   ;808CD8|        |      ;
                       db $01,$8D,$00,$21,$C2,$20,$80,$FE   ;808CE0|        |00008D;
                       db $C2,$30,$A9,$00,$00,$22,$CF,$A1   ;808CE8|        |      ;
                       db $80,$A9,$00,$00,$22,$E0,$A1,$80   ;808CF0|        |808C9B;
                       db $A9,$00,$00,$22,$F1,$A1,$80,$E2   ;808CF8|        |      ;
                       db $30,$A9,$80,$8D,$B6,$01,$8D,$00   ;808D00|        |808CAB;
                       db $21,$A9,$00,$8D,$BA,$01,$8D,$05   ;808D08|        |0000A9;
                       db $21,$A9,$70,$8D,$BC,$01,$8D,$07   ;808D10|        |0000A9;
                       db $21,$9C,$BD,$01,$9C,$BE,$01,$9C   ;808D18|        |00009C;
                       db $BF,$01,$A9,$02,$8D,$C0,$01,$8D   ;808D20|        |02A901;
                       db $0B,$21,$9C,$C1,$01,$9C,$B7,$01   ;808D28|        |      ;
                       db $9C,$0D,$21,$9C,$0D,$21,$9C,$0E   ;808D30|        |00210D;
                       db $21,$9C,$0E,$21,$9C,$0F,$21,$9C   ;808D38|        |00009C;
                       db $0F,$21,$9C,$10,$21,$9C,$10,$21   ;808D40|        |109C21;
                       db $9C,$11,$21,$9C,$11,$21,$9C,$12   ;808D48|        |002111;
                       db $21,$9C,$12,$21,$9C,$13,$21,$9C   ;808D50|        |00009C;
                       db $13,$21,$9C,$14,$21,$9C,$14,$21   ;808D58|        |000021;
                       db $9C,$15,$21,$9C,$C2,$01,$9C,$C3   ;808D60|        |002115;
                       db $01,$9C,$C4,$01,$9C,$C5,$01,$9C   ;808D68|        |00009C;
                       db $C6,$01,$9C,$C7,$01,$9C,$C8,$01   ;808D70|        |000001;
                       db $9C,$C9,$01,$9C,$23,$21,$9C,$CA   ;808D78|        |0001C9;
                       db $01,$9C,$DB,$01,$9C,$E0,$01,$9C   ;808D80|        |00009C;
                       db $2A,$21,$9C,$E1,$01,$9C,$E4,$01   ;808D88|        |      ;
                       db $9C,$2E,$21,$9C,$E5,$01,$9C,$2F   ;808D90|        |00212E;
                       db $21,$A9,$01,$8D,$E2,$01,$8D,$2C   ;808D98|        |0000A9;
                       db $21,$9C,$E3,$01,$9C,$2D,$21,$9C   ;808DA0|        |00009C;
                       db $DC,$01,$9C,$26,$21,$9C,$DE,$01   ;808DA8|        |009C01;
                       db $9C,$28,$21,$9C,$DD,$01,$9C,$27   ;808DB0|        |002128;
                       db $21,$9C,$DF,$01,$9C,$29,$21,$A9   ;808DB8|        |00009C;
                       db $12,$8D,$E6,$01,$8D,$30,$21,$A9   ;808DC0|        |00008D;
                       db $B6,$8D,$E7,$01,$8D,$31,$21,$A9   ;808DC8|        |00008D;
                       db $E0,$8D,$E8,$01,$8D,$E9,$01,$8D   ;808DD0|        |      ;
                       db $EA,$01,$8D,$32,$21,$9C,$21,$21   ;808DD8|        |      ;
                       db $9C,$EB,$01,$9C,$33,$21,$A9,$01   ;808DE0|        |0001EB;
                       db $8D,$EC,$01,$8D,$00,$42,$9C,$0B   ;808DE8|        |0001EC;
                       db $42,$9C,$F1,$01,$9C,$0C,$42,$9C   ;808DF0|        |      ;
                       db $1E,$02,$9C,$0B,$42,$9C,$0C,$42   ;808DF8|        |009C02;
                       db $9C,$F1,$01,$9C,$1E,$02,$9C,$0A   ;808E00|        |0001F1;
                       db $43,$9C,$1A,$43,$9C,$2A,$43,$9C   ;808E08|        |00009C;
                       db $3A,$43,$9C,$4A,$43,$9C,$5A,$43   ;808E10|        |      ;
                       db $9C,$6A,$43,$9C,$7A,$43,$C2,$30   ;808E18|        |00436A;
                       db $60                               ;808E20|        |      ;
 
          CODE_808E21:
                       JML.L CODE_JL_808E25                 ;808E21|5C258E80|808E25;
 
       CODE_JL_808E25:
                       REP #$30                             ;808E25|C230    |      ;
                       PHB                                  ;808E27|8B      |      ;
                       PHD                                  ;808E28|0B      |      ;
                       PHA                                  ;808E29|48      |      ;
                       PHX                                  ;808E2A|DA      |      ;
                       PHY                                  ;808E2B|5A      |      ;
                       PHK                                  ;808E2C|4B      |      ;
                       PLB                                  ;808E2D|AB      |      ;
                       LDA.W #$0000                         ;808E2E|A90000  |      ;
                       TCD                                  ;808E31|5B      |      ;
                       SEP #$30                             ;808E32|E230    |      ;
                       LDA.W RDNMI                          ;808E34|AD1042  |804210;
                       STZ.W HDMAEN                         ;808E37|9C0C42  |80420C;
                       STZ.W MDMAEN                         ;808E3A|9C0B42  |80420B;
                       LDA.B $A5                            ;808E3D|A5A5    |0000A5;
                       BEQ +                                ;808E3F|F028    |808E69;
                       JSL.L CODE_FL_809BDE                 ;808E41|22DE9B80|809BDE;
                       JSL.L CODE_FL_809D94                 ;808E45|22949D80|809D94;
                       JSL.L CODE_FL_80A11C                 ;808E49|221CA180|80A11C;
                       JSL.L CODE_FL_8090F3                 ;808E4D|22F39080|8090F3;
                       JSL.L CODE_FL_809B1F                 ;808E51|221F9B80|809B1F;
                       JSL.L CODE_FL_809C04                 ;808E55|22049C80|809C04;
                       JSL.L CODE_FL_809357                 ;808E59|22579380|809357;
                       INC.B $A9                            ;808E5D|E6A9    |0000A9;
                       STZ.B $A5                            ;808E5F|64A5    |0000A5;
                       REP #$30                             ;808E61|C230    |      ;
                       PLY                                  ;808E63|7A      |      ;
                       PLX                                  ;808E64|FA      |      ;
                       PLA                                  ;808E65|68      |      ;
                       PLD                                  ;808E66|2B      |      ;
                       PLB                                  ;808E67|AB      |      ;
                       RTI                                  ;808E68|40      |      ;
 
                     + LDA.B $A3                            ;808E69|A5A3    |0000A3;
                       BEQ +                                ;808E6B|F034    |808EA1;
                       STZ.B $A3                            ;808E6D|64A3    |0000A3;
                       JSL.L CODE_FL_809BDE                 ;808E6F|22DE9B80|809BDE;
                       JSL.L CODE_FL_809D94                 ;808E73|22949D80|809D94;
                       JSL.L CODE_FL_80A11C                 ;808E77|221CA180|80A11C;
                       JSL.L CODE_FL_8090F3                 ;808E7B|22F39080|8090F3;
                       JSL.L CODE_FL_809B1F                 ;808E7F|221F9B80|809B1F;
                       JSL.L CODE_FL_809C04                 ;808E83|22049C80|809C04;
                       JSL.L CODE_FL_80A773                 ;808E87|2273A780|80A773;
                       JSL.L CODE_FL_809357                 ;808E8B|22579380|809357;
                       SEP #$30                             ;808E8F|E230    |      ;
                       INC.B $A9                            ;808E91|E6A9    |0000A9;
                       LDA.B #$01                           ;808E93|A901    |      ;
                       STZ.B $A5                            ;808E95|64A5    |0000A5;
                       STA.B $A3                            ;808E97|85A3    |0000A3;
                       REP #$30                             ;808E99|C230    |      ;
                       PLY                                  ;808E9B|7A      |      ;
                       PLX                                  ;808E9C|FA      |      ;
                       PLA                                  ;808E9D|68      |      ;
                       PLD                                  ;808E9E|2B      |      ;
                       PLB                                  ;808E9F|AB      |      ;
                       RTI                                  ;808EA0|40      |      ;
 
                     + JSL.L CODE_FL_8090F3                 ;808EA1|22F39080|8090F3;
                       JSL.L CODE_FL_80A11C                 ;808EA5|221CA180|80A11C;
                       JSL.L CODE_FL_80A7C3                 ;808EA9|22C3A780|80A7C3;
                       SEP #$30                             ;808EAD|E230    |      ;
                       STZ.B $A5                            ;808EAF|64A5    |0000A5;
                       REP #$30                             ;808EB1|C230    |      ;
                       PLY                                  ;808EB3|7A      |      ;
                       PLX                                  ;808EB4|FA      |      ;
                       PLA                                  ;808EB5|68      |      ;
                       PLD                                  ;808EB6|2B      |      ;
                       PLB                                  ;808EB7|AB      |      ;
                       RTI                                  ;808EB8|40      |      ;
 
          CODE_808EB9:
                       JML.L CODE_JL_808EBD                 ;808EB9|5CBD8E80|808EBD;
 
       CODE_JL_808EBD:
                       REP #$30                             ;808EBD|C230    |      ;
                       PHA                                  ;808EBF|48      |      ;
                       PHX                                  ;808EC0|DA      |      ;
                       PHY                                  ;808EC1|5A      |      ;
                       PHD                                  ;808EC2|0B      |      ;
                       PHB                                  ;808EC3|8B      |      ;
                       LDA.W #$0000                         ;808EC4|A90000  |      ;
                       TCD                                  ;808EC7|5B      |      ;
                       PHK                                  ;808EC8|4B      |      ;
                       PLB                                  ;808EC9|AB      |      ;
                       SEP #$30                             ;808ECA|E230    |      ;
                       LDA.W TIMEUP                         ;808ECC|AD1142  |804211;
                       BPL +                                ;808ECF|1020    |808EF1;
                       REP #$30                             ;808ED1|C230    |      ;
                       LDX.B $9F                            ;808ED3|A69F    |00009F;
                       JSR.W (DATA8_808EF9,X)               ;808ED5|FCF98E  |808EF9;
                       REP #$30                             ;808ED8|C230    |      ;
                       LDA.B $9F                            ;808EDA|A59F    |00009F;
                       CMP.W #$0010                         ;808EDC|C91000  |      ;
                       BNE ++                               ;808EDF|D005    |808EE6;
                       LDA.W #$0000                         ;808EE1|A90000  |      ;
                       BRA +++                              ;808EE4|8004    |808EEA;
 
                    ++ CLC                                  ;808EE6|18      |      ;
                       ADC.W #$0004                         ;808EE7|690400  |      ;
 
                   +++ STA.B $9F                            ;808EEA|859F    |00009F;
                       LDX.B $9F                            ;808EEC|A69F    |00009F;
                       JSR.W (DATA8_808EFB,X)               ;808EEE|FCFB8E  |808EFB;
 
                     + REP #$30                             ;808EF1|C230    |      ;
                       PLB                                  ;808EF3|AB      |      ;
                       PLD                                  ;808EF4|2B      |      ;
                       PLY                                  ;808EF5|7A      |      ;
                       PLX                                  ;808EF6|FA      |      ;
                       PLA                                  ;808EF7|68      |      ;
                       RTI                                  ;808EF8|40      |      ;
 
         DATA8_808EF9:
                       db $0D,$8F                           ;808EF9|        |      ;
 
         DATA8_808EFB:
                       db $75,$8F,$7F,$8F,$89,$8F,$97,$8F   ;808EFB|        |      ;
                       db $48,$90,$56,$90,$60,$90,$6E,$90   ;808F03|        |      ;
                       db $78,$90                           ;808F0B|        |      ;
                       SEP #$20                             ;808F0D|E220    |      ;
                       LDA.B #$00                           ;808F0F|A900    |      ;
                       STA.W INIDISP                        ;808F11|8D0021  |802100;
                       SEP #$20                             ;808F14|E220    |      ;
                       LDA.L $7ED222                        ;808F16|AF22D27E|7ED222;
                       STA.W BG1HOFS                        ;808F1A|8D0D21  |80210D;
                       LDA.L $7ED223                        ;808F1D|AF23D27E|7ED223;
                       STA.W BG1HOFS                        ;808F21|8D0D21  |80210D;
                       LDA.L $7ED224                        ;808F24|AF24D27E|7ED224;
                       STA.W _BG1VOFS                       ;808F28|8D0E21  |80210E;
                       LDA.L $7ED225                        ;808F2B|AF25D27E|7ED225;
                       STA.W _BG1VOFS                       ;808F2F|8D0E21  |80210E;
                       LDA.L $7ED226                        ;808F32|AF26D27E|7ED226;
                       STA.W BG2HOFS                        ;808F36|8D0F21  |80210F;
                       LDA.L $7ED227                        ;808F39|AF27D27E|7ED227;
                       STA.W BG2HOFS                        ;808F3D|8D0F21  |80210F;
                       LDA.L $7ED228                        ;808F40|AF28D27E|7ED228;
                       STA.W BG2VOFS                        ;808F44|8D1021  |802110;
                       LDA.L $7ED229                        ;808F47|AF29D27E|7ED229;
                       STA.W BG2VOFS                        ;808F4B|8D1021  |802110;
                       LDA.L $7ED22A                        ;808F4E|AF2AD27E|7ED22A;
                       STA.W BG3HOFS                        ;808F52|8D1121  |802111;
                       LDA.L $7ED22B                        ;808F55|AF2BD27E|7ED22B;
                       STA.W BG3HOFS                        ;808F59|8D1121  |802111;
                       LDA.L $7ED22C                        ;808F5C|AF2CD27E|7ED22C;
                       STA.W BG3VOFS                        ;808F60|8D1221  |802112;
                       LDA.L $7ED22D                        ;808F63|AF2DD27E|7ED22D;
                       STA.W BG3VOFS                        ;808F67|8D1221  |802112;
                       LDA.B #$71                           ;808F6A|A971    |      ;
                       STA.W BG1SC                          ;808F6C|8D0721  |802107;
                       LDA.B #$79                           ;808F6F|A979    |      ;
                       STA.W BG2SC                          ;808F71|8D0821  |802108;
                       RTS                                  ;808F74|60      |      ;
                       LDX.W #$0000                         ;808F75|A20000  |      ;
                       STX.W VTIMEL                         ;808F78|8E0942  |804209;
                       STX.W HTIMEL                         ;808F7B|8E0742  |804207;
                       RTS                                  ;808F7E|60      |      ;
                       SEP #$20                             ;808F7F|E220    |      ;
                       LDA.L $7ED220                        ;808F81|AF20D27E|7ED220;
                       STA.W INIDISP                        ;808F85|8D0021  |802100;
                       RTS                                  ;808F88|60      |      ;
                       LDA.L $7ED246                        ;808F89|AF46D27E|7ED246;
                       STA.W VTIMEL                         ;808F8D|8D0942  |804209;
                       LDA.W #$0090                         ;808F90|A99000  |      ;
                       STA.W HTIMEL                         ;808F93|8D0742  |804207;
                       RTS                                  ;808F96|60      |      ;
                       SEP #$20                             ;808F97|E220    |      ;
                       LDA.B #$80                           ;808F99|A980    |      ;
                       STA.W INIDISP                        ;808F9B|8D0021  |802100;
                       STZ.W HDMAEN                         ;808F9E|9C0C42  |80420C;
                       STZ.W MDMAEN                         ;808FA1|9C0B42  |80420B;
                       LDX.W #$2200                         ;808FA4|A20022  |      ;
                       STX.W DMA0PARAM                      ;808FA7|8E0043  |804300;
                       LDX.W #$88F6                         ;808FAA|A2F688  |      ;
                       STX.W DMA0ADDRL                      ;808FAD|8E0243  |804302;
                       LDA.B #$7E                           ;808FB0|A97E    |      ;
                       STA.W DMA0ADDRH                      ;808FB2|8D0443  |804304;
                       LDX.W #$0200                         ;808FB5|A20002  |      ;
                       STX.W DMA0CNTL                       ;808FB8|8E0543  |804305;
                       STZ.W CGADD                          ;808FBB|9C2121  |802121;
                       LDA.B #$01                           ;808FBE|A901    |      ;
                       STA.W MDMAEN                         ;808FC0|8D0B42  |80420B;
                       STZ.W MDMAEN                         ;808FC3|9C0B42  |80420B;
                       SEP #$20                             ;808FC6|E220    |      ;
                       LDA.L $7ED232                        ;808FC8|AF32D27E|7ED232;
                       STA.W BG1HOFS                        ;808FCC|8D0D21  |80210D;
                       LDA.L $7ED233                        ;808FCF|AF33D27E|7ED233;
                       STA.W BG1HOFS                        ;808FD3|8D0D21  |80210D;
                       LDA.L $7ED234                        ;808FD6|AF34D27E|7ED234;
                       STA.W _BG1VOFS                       ;808FDA|8D0E21  |80210E;
                       LDA.L $7ED235                        ;808FDD|AF35D27E|7ED235;
                       STA.W _BG1VOFS                       ;808FE1|8D0E21  |80210E;
                       LDA.L $7ED236                        ;808FE4|AF36D27E|7ED236;
                       STA.W BG2HOFS                        ;808FE8|8D0F21  |80210F;
                       LDA.L $7ED237                        ;808FEB|AF37D27E|7ED237;
                       STA.W BG2HOFS                        ;808FEF|8D0F21  |80210F;
                       LDA.L $7ED238                        ;808FF2|AF38D27E|7ED238;
                       STA.W BG2VOFS                        ;808FF6|8D1021  |802110;
                       LDA.L $7ED239                        ;808FF9|AF39D27E|7ED239;
                       STA.W BG2VOFS                        ;808FFD|8D1021  |802110;
                       LDA.L $7ED23A                        ;809000|AF3AD27E|7ED23A;
                       STA.W BG3HOFS                        ;809004|8D1121  |802111;
                       LDA.L $7ED23B                        ;809007|AF3BD27E|7ED23B;
                       STA.W BG3HOFS                        ;80900B|8D1121  |802111;
                       LDA.L $7ED23C                        ;80900E|AF3CD27E|7ED23C;
                       STA.W BG3VOFS                        ;809012|8D1221  |802112;
                       LDA.L $7ED23D                        ;809015|AF3DD27E|7ED23D;
                       STA.W BG3VOFS                        ;809019|8D1221  |802112;
                       LDA.B #$79                           ;80901C|A979    |      ;
                       STA.W BG1SC                          ;80901E|8D0721  |802107;
                       LDA.B #$6C                           ;809021|A96C    |      ;
                       STA.W BG2SC                          ;809023|8D0821  |802108;
                       LDA.L $7ED23E                        ;809026|AF3ED27E|7ED23E;
                       STA.W TM                             ;80902A|8D2C21  |80212C;
                       LDA.L $7ED240                        ;80902D|AF40D27E|7ED240;
                       STA.W TS                             ;809031|8D2D21  |80212D;
                       LDA.L $7ED242                        ;809034|AF42D27E|7ED242;
                       STA.W CGSWSEL                        ;809038|8D3021  |802130;
                       LDA.L $7ED244                        ;80903B|AF44D27E|7ED244;
                       STA.W CGADSUB                        ;80903F|8D3121  |802131;
                       LDA.B #$00                           ;809042|A900    |      ;
                       STA.W INIDISP                        ;809044|8D0021  |802100;
                       RTS                                  ;809047|60      |      ;
                       LDA.L $7ED248                        ;809048|AF48D27E|7ED248;
                       STA.W VTIMEL                         ;80904C|8D0942  |804209;
                       LDA.W #$0090                         ;80904F|A99000  |      ;
                       STA.W HTIMEL                         ;809052|8D0742  |804207;
                       RTS                                  ;809055|60      |      ;
                       SEP #$20                             ;809056|E220    |      ;
                       LDA.L $7ED22E                        ;809058|AF2ED27E|7ED22E;
                       STA.W INIDISP                        ;80905C|8D0021  |802100;
                       RTS                                  ;80905F|60      |      ;
                       LDA.L $7ED24A                        ;809060|AF4AD27E|7ED24A;
                       STA.W VTIMEL                         ;809064|8D0942  |804209;
                       LDA.W #$0090                         ;809067|A99000  |      ;
                       STA.W HTIMEL                         ;80906A|8D0742  |804207;
                       RTS                                  ;80906D|60      |      ;
                       SEP #$20                             ;80906E|E220    |      ;
                       LDA.L $7ED230                        ;809070|AF30D27E|7ED230;
                       STA.W INIDISP                        ;809074|8D0021  |802100;
                       RTS                                  ;809077|60      |      ;
                       LDA.L $7ED24C                        ;809078|AF4CD27E|7ED24C;
                       STA.W VTIMEL                         ;80907C|8D0942  |804209;
                       LDA.W #$0090                         ;80907F|A99000  |      ;
                       STA.W HTIMEL                         ;809082|8D0742  |804207;
                       RTS                                  ;809085|60      |      ;
 
       CODE_FL_809086:
                       PHP                                  ;809086|08      |      ;
                       REP #$20                             ;809087|C220    |      ;
                       LDA.L $0000A1                        ;809089|AFA10000|0000A1;
                       BIT.W #$4000                         ;80908D|890040  |      ;
                       BNE +                                ;809090|D007    |809099;
                       BIT.W #$2000                         ;809092|890020  |      ;
                       BNE ++                               ;809095|D02F    |8090C6;
                       PLP                                  ;809097|28      |      ;
                       RTL                                  ;809098|6B      |      ;
 
                     + AND.W #$BFFF                         ;809099|29FFBF  |      ;
                       STA.L $0000A1                        ;80909C|8FA10000|0000A1;
                       BIT.W #$8000                         ;8090A0|890080  |      ;
                       BNE +                                ;8090A3|D01E    |8090C3;
                       ORA.W #$8000                         ;8090A5|090080  |      ;
                       STA.L $0000A1                        ;8090A8|8FA10000|0000A1;
                       LDA.W #$0000                         ;8090AC|A90000  |      ;
                       STA.L $00009F                        ;8090AF|8F9F0000|00009F;
                       STA.L VTIMEL                         ;8090B3|8F094200|004209;
                       STA.L HTIMEL                         ;8090B7|8F074200|004207;
                       SEP #$20                             ;8090BB|E220    |      ;
                       LDA.B #$B1                           ;8090BD|A9B1    |      ;
                       STA.L NMITIMEN                       ;8090BF|8F004200|004200;
 
                     + PLP                                  ;8090C3|28      |      ;
                       CLI                                  ;8090C4|58      |      ;
                       RTL                                  ;8090C5|6B      |      ;
 
                    ++ AND.W #$DFFF                         ;8090C6|29FFDF  |      ;
                       STA.L $0000A1                        ;8090C9|8FA10000|0000A1;
                       BIT.W #$8000                         ;8090CD|890080  |      ;
                       BEQ +                                ;8090D0|F01E    |8090F0;
                       AND.W #$7FFF                         ;8090D2|29FF7F  |      ;
                       STA.L $0000A1                        ;8090D5|8FA10000|0000A1;
                       LDA.W #$0000                         ;8090D9|A90000  |      ;
                       STA.L $00009F                        ;8090DC|8F9F0000|00009F;
                       STA.L VTIMEL                         ;8090E0|8F094200|004209;
                       STA.L HTIMEL                         ;8090E4|8F074200|004207;
                       SEP #$20                             ;8090E8|E220    |      ;
                       LDA.B #$81                           ;8090EA|A981    |      ;
                       STA.L NMITIMEN                       ;8090EC|8F004200|004200;
 
                     + PLP                                  ;8090F0|28      |      ;
                       SEI                                  ;8090F1|78      |      ;
                       RTL                                  ;8090F2|6B      |      ;
 
       CODE_FL_8090F3:
                       PHP                                  ;8090F3|08      |      ;
                       REP #$20                             ;8090F4|C220    |      ;
                       LDA.L $0000A1                        ;8090F6|AFA10000|0000A1;
                       BIT.W #$8000                         ;8090FA|890080  |      ;
                       BNE +                                ;8090FD|D003    |809102;
                       PLP                                  ;8090FF|28      |      ;
                       SEI                                  ;809100|78      |      ;
                       RTL                                  ;809101|6B      |      ;
 
                     + PLP                                  ;809102|28      |      ;
                       CLI                                  ;809103|58      |      ;
                       RTL                                  ;809104|6B      |      ;
 
       CODE_FL_809105:
                       PHP                                  ;809105|08      |      ;
                       REP #$20                             ;809106|C220    |      ;
                       LDA.L $0000A1                        ;809108|AFA10000|0000A1;
                       ORA.W #$4000                         ;80910C|090040  |      ;
                       STA.L $0000A1                        ;80910F|8FA10000|0000A1;
                       PLP                                  ;809113|28      |      ;
                       RTL                                  ;809114|6B      |      ;
 
       CODE_FL_809115:
                       PHP                                  ;809115|08      |      ;
                       REP #$20                             ;809116|C220    |      ;
                       LDA.L $0000A1                        ;809118|AFA10000|0000A1;
                       ORA.W #$2000                         ;80911C|090020  |      ;
                       STA.L $0000A1                        ;80911F|8FA10000|0000A1;
                       PLP                                  ;809123|28      |      ;
                       RTL                                  ;809124|6B      |      ;
 
       CODE_FL_809125:
                       PHP                                  ;809125|08      |      ;
                       PHB                                  ;809126|8B      |      ;
                       PHK                                  ;809127|4B      |      ;
                       PLB                                  ;809128|AB      |      ;
                       REP #$30                             ;809129|C230    |      ;
                       PHX                                  ;80912B|DA      |      ;
                       PHY                                  ;80912C|5A      |      ;
                       LDA.B $24                            ;80912D|A524    |000024;
                       PHA                                  ;80912F|48      |      ;
                       LDA.B $25                            ;809130|A525    |000025;
                       PHA                                  ;809132|48      |      ;
                       LDA.W #$9A00                         ;809133|A9009A  |      ;
                       STA.W $197E                          ;809136|8D7E19  |80197E;
                       LDA.W #$8000                         ;809139|A90080  |      ;
                       STA.W $197C                          ;80913C|8D7C19  |80197C;
                       LDY.W $197C                          ;80913F|AC7C19  |80197C;
                       LDA.W $197E                          ;809142|AD7E19  |80197E;
                       STA.B $25                            ;809145|8525    |000025;
                       STZ.B $24                            ;809147|6424    |000024;
                       LDA.B [$24],Y                        ;809149|B724    |000024;
                       PHA                                  ;80914B|48      |      ;
                       INY                                  ;80914C|C8      |      ;
                       LDA.B [$24],Y                        ;80914D|B724    |000024;
                       AND.W #$FF00                         ;80914F|2900FF  |      ;
                       CLC                                  ;809152|18      |      ;
                       ADC.B $25                            ;809153|6525    |000025;
                       STA.B $25                            ;809155|8525    |000025;
                       PLY                                  ;809157|7A      |      ;
                       JSR.W Audio_InitSPC                  ;809158|200094  |809400;
                       REP #$30                             ;80915B|C230    |      ;
                       LDX.W #$0034                         ;80915D|A23400  |      ;
                       LDA.W #$0000                         ;809160|A90000  |      ;
 
                     - STA.W $1986,X                        ;809163|9D8619  |801986;
                       DEX                                  ;809166|CA      |      ;
                       DEX                                  ;809167|CA      |      ;
                       BPL -                                ;809168|10F9    |809163;
                       JSL.L CODE_FL_809179                 ;80916A|22799180|809179;
                       PLA                                  ;80916E|68      |      ;
                       STA.B $25                            ;80916F|8525    |000025;
                       PLA                                  ;809171|68      |      ;
                       STA.B $24                            ;809172|8524    |000024;
                       PLY                                  ;809174|7A      |      ;
                       PLX                                  ;809175|FA      |      ;
                       PLB                                  ;809176|AB      |      ;
                       PLP                                  ;809177|28      |      ;
                       RTL                                  ;809178|6B      |      ;
 
       CODE_FL_809179:
                       PHP                                  ;809179|08      |      ;
                       PHB                                  ;80917A|8B      |      ;
                       PHK                                  ;80917B|4B      |      ;
                       PLB                                  ;80917C|AB      |      ;
                       REP #$30                             ;80917D|C230    |      ;
                       PHY                                  ;80917F|5A      |      ;
                       LDA.B $24                            ;809180|A524    |000024;
                       PHA                                  ;809182|48      |      ;
                       LDA.B $25                            ;809183|A525    |000025;
                       PHA                                  ;809185|48      |      ;
                       LDA.W $197E                          ;809186|AD7E19  |80197E;
                       STA.B $25                            ;809189|8525    |000025;
                       LDA.W $197C                          ;80918B|AD7C19  |80197C;
                       STA.B $24                            ;80918E|8524    |000024;
                       LDY.W #$0004                         ;809190|A00400  |      ;
                       LDA.B [$24],Y                        ;809193|B724    |000024;
                       STA.W $1980                          ;809195|8D8019  |801980;
                       LDY.W #$0008                         ;809198|A00800  |      ;
                       LDA.B [$24],Y                        ;80919B|B724    |000024;
                       STA.W $1982                          ;80919D|8D8219  |801982;
                       LDY.W #$000C                         ;8091A0|A00C00  |      ;
                       LDA.B [$24],Y                        ;8091A3|B724    |000024;
                       STA.W $1984                          ;8091A5|8D8419  |801984;
                       PLA                                  ;8091A8|68      |      ;
                       STA.B $25                            ;8091A9|8525    |000025;
                       PLA                                  ;8091AB|68      |      ;
                       STA.B $24                            ;8091AC|8524    |000024;
                       PLY                                  ;8091AE|7A      |      ;
                       PLB                                  ;8091AF|AB      |      ;
                       PLP                                  ;8091B0|28      |      ;
                       RTL                                  ;8091B1|6B      |      ;
 
       CODE_FL_8091B2:
                       PHP                                  ;8091B2|08      |      ;
                       PHB                                  ;8091B3|8B      |      ;
                       PHK                                  ;8091B4|4B      |      ;
                       PLB                                  ;8091B5|AB      |      ;
                       REP #$30                             ;8091B6|C230    |      ;
                       PHA                                  ;8091B8|48      |      ;
                       PHX                                  ;8091B9|DA      |      ;
                       PHY                                  ;8091BA|5A      |      ;
                       JSR.W CODE_FN_809236                 ;8091BB|203692  |809236;
                       JSR.W CODE_FN_8091C7                 ;8091BE|20C791  |8091C7;
                       PLY                                  ;8091C1|7A      |      ;
                       PLX                                  ;8091C2|FA      |      ;
                       PLA                                  ;8091C3|68      |      ;
                       PLB                                  ;8091C4|AB      |      ;
                       PLP                                  ;8091C5|28      |      ;
                       RTL                                  ;8091C6|6B      |      ;
 
       CODE_FN_8091C7:
                       REP #$20                             ;8091C7|C220    |      ;
                       SEP #$10                             ;8091C9|E210    |      ;
                       LDA.W $1986                          ;8091CB|AD8619  |801986;
                       LDX.W $198E                          ;8091CE|AE8E19  |80198E;
                       BNE +                                ;8091D1|D006    |8091D9;
                       TAX                                  ;8091D3|AA      |      ;
                       STX.W $198E                          ;8091D4|8E8E19  |80198E;
                       BRA ++                               ;8091D7|8009    |8091E2;
 
                     + LDX.W $198F                          ;8091D9|AE8F19  |80198F;
                       BNE +                                ;8091DC|D007    |8091E5;
                       TAX                                  ;8091DE|AA      |      ;
                       STX.W $198F                          ;8091DF|8E8F19  |80198F;
 
                    ++ STZ.W $1986                          ;8091E2|9C8619  |801986;
 
                     + LDA.W $1988                          ;8091E5|AD8819  |801988;
                       LDX.W $1990                          ;8091E8|AE9019  |801990;
                       BNE +                                ;8091EB|D006    |8091F3;
                       TAX                                  ;8091ED|AA      |      ;
                       STX.W $1990                          ;8091EE|8E9019  |801990;
                       BRA ++                               ;8091F1|8009    |8091FC;
 
                     + LDX.W $1991                          ;8091F3|AE9119  |801991;
                       BNE +                                ;8091F6|D007    |8091FF;
                       TAX                                  ;8091F8|AA      |      ;
                       STX.W $1991                          ;8091F9|8E9119  |801991;
 
                    ++ STZ.W $1988                          ;8091FC|9C8819  |801988;
 
                     + LDA.W $198A                          ;8091FF|AD8A19  |80198A;
                       LDX.W $1992                          ;809202|AE9219  |801992;
                       BNE +                                ;809205|D006    |80920D;
                       TAX                                  ;809207|AA      |      ;
                       STX.W $1992                          ;809208|8E9219  |801992;
                       BRA ++                               ;80920B|8009    |809216;
 
                     + LDX.W $1993                          ;80920D|AE9319  |801993;
                       BNE +                                ;809210|D007    |809219;
                       TAX                                  ;809212|AA      |      ;
                       STX.W $1993                          ;809213|8E9319  |801993;
 
                    ++ STZ.W $198A                          ;809216|9C8A19  |80198A;
 
                     + LDA.W $198C                          ;809219|AD8C19  |80198C;
                       LDX.W $1994                          ;80921C|AE9419  |801994;
                       BNE +                                ;80921F|D006    |809227;
                       TAX                                  ;809221|AA      |      ;
                       STX.W $1994                          ;809222|8E9419  |801994;
                       BRA ++                               ;809225|8009    |809230;
 
                     + LDX.W $1995                          ;809227|AE9519  |801995;
                       BNE +                                ;80922A|D007    |809233;
                       TAX                                  ;80922C|AA      |      ;
                       STX.W $1995                          ;80922D|8E9519  |801995;
 
                    ++ STZ.W $198C                          ;809230|9C8C19  |80198C;
 
                     + REP #$30                             ;809233|C230    |      ;
                       RTS                                  ;809235|60      |      ;
 
       CODE_FN_809236:
                       REP #$30                             ;809236|C230    |      ;
                       LDA.B $24                            ;809238|A524    |000024;
                       PHA                                  ;80923A|48      |      ;
                       LDA.B $25                            ;80923B|A525    |000025;
                       PHA                                  ;80923D|48      |      ;
                       LDA.W $197E                          ;80923E|AD7E19  |80197E;
                       STA.B $25                            ;809241|8525    |000025;
                       LDX.W #$0000                         ;809243|A20000  |      ;
 
                     - LDA.W $199C,X                        ;809246|BD9C19  |80199C;
                       BNE +                                ;809249|D005    |809250;
                       STA.W $19AA,X                        ;80924B|9DAA19  |8019AA;
                       BRA ++                               ;80924E|8038    |809288;
 
                     + STX.W $19AE                          ;809250|8EAE19  |8019AE;
                       CMP.W $19AA,X                        ;809253|DDAA19  |8019AA;
                       BEQ +                                ;809256|F018    |809270;
                       STA.W $19AA,X                        ;809258|9DAA19  |8019AA;
                       AND.W #$01FF                         ;80925B|29FF01  |      ;
                       DEC A                                ;80925E|3A      |      ;
                       ASL A                                ;80925F|0A      |      ;
                       TAY                                  ;809260|A8      |      ;
                       LDA.W #$0001                         ;809261|A90100  |      ;
                       STA.W $19A6,X                        ;809264|9DA619  |8019A6;
                       LDA.W $1980                          ;809267|AD8019  |801980;
                       STA.B $24                            ;80926A|8524    |000024;
                       LDA.B [$24],Y                        ;80926C|B724    |000024;
                       BRA +++                              ;80926E|8003    |809273;
 
                     + LDA.W $19A0,X                        ;809270|BDA019  |8019A0;
 
                   +++ TAY                                  ;809273|A8      |      ;
                       LDA.W $199C,X                        ;809274|BD9C19  |80199C;
                       AND.W #$8000                         ;809277|290080  |      ;
                       XBA                                  ;80927A|EB      |      ;
                       SEP #$20                             ;80927B|E220    |      ;
                       STA.W $19B3                          ;80927D|8DB319  |8019B3;
                       REP #$20                             ;809280|C220    |      ;
                       JSR.W CODE_FN_809296                 ;809282|209692  |809296;
                       LDX.W $19AE                          ;809285|AEAE19  |8019AE;
 
                    ++ INX                                  ;809288|E8      |      ;
                       INX                                  ;809289|E8      |      ;
                       CPX.W #$0004                         ;80928A|E00400  |      ;
                       BNE -                                ;80928D|D0B7    |809246;
                       PLA                                  ;80928F|68      |      ;
                       STA.B $25                            ;809290|8525    |000025;
                       PLA                                  ;809292|68      |      ;
                       STA.B $24                            ;809293|8524    |000024;
                       RTS                                  ;809295|60      |      ;
 
       CODE_FN_809296:
                       DEC.W $19A6,X                        ;809296|DEA619  |8019A6;
                       BNE +                                ;809299|D036    |8092D1;
                       STZ.B $24                            ;80929B|6424    |000024;
 
                     - LDA.B [$24],Y                        ;80929D|B724    |000024;
                       BNE ++                               ;80929F|D00B    |8092AC;
                       LDX.W $19AE                          ;8092A1|AEAE19  |8019AE;
                       STA.W $199C,X                        ;8092A4|9D9C19  |80199C;
                       STA.W $19AA,X                        ;8092A7|9DAA19  |8019AA;
                       BRA +                                ;8092AA|8025    |8092D1;
 
                    ++ INY                                  ;8092AC|C8      |      ;
                       INY                                  ;8092AD|C8      |      ;
                       PHA                                  ;8092AE|48      |      ;
                       AND.W #$FC00                         ;8092AF|2900FC  |      ;
                       BEQ ++                               ;8092B2|F00D    |8092C1;
                       XBA                                  ;8092B4|EB      |      ;
                       LSR A                                ;8092B5|4A      |      ;
                       LSR A                                ;8092B6|4A      |      ;
                       DEC A                                ;8092B7|3A      |      ;
                       ASL A                                ;8092B8|0A      |      ;
                       TAX                                  ;8092B9|AA      |      ;
                       LDA.B [$24],Y                        ;8092BA|B724    |000024;
                       INY                                  ;8092BC|C8      |      ;
                       INY                                  ;8092BD|C8      |      ;
                       JSR.W (Audio_CommandHandlers,X)      ;8092BE|FCD292  |8092D2;
 
                    ++ PLA                                  ;8092C1|68      |      ;
                       AND.W #$03FF                         ;8092C2|29FF03  |      ;
                       BEQ -                                ;8092C5|F0D6    |80929D;
                       LDX.W $19AE                          ;8092C7|AEAE19  |8019AE;
                       STA.W $19A6,X                        ;8092CA|9DA619  |8019A6;
                       TYA                                  ;8092CD|98      |      ;
                       STA.W $19A0,X                        ;8092CE|9DA019  |8019A0;
 
                     + RTS                                  ;8092D1|60      |      ;
 
Audio_CommandHandlers:
                       db $E4,$92                           ;8092D2|        |      ;
                       db $E8,$92,$EC,$92,$F0,$92,$F2,$92   ;8092D4|        |      ;
                       db $F6,$92,$13,$93                   ;8092DC|        |      ;
                       db $F6,$92,$EA,$60                   ;8092E0|        |000092;
                       STA.W $1988                          ;8092E4|8D8819  |801988;
                       RTS                                  ;8092E7|60      |      ;
                       db $8D,$8A,$19,$60,$8D,$8C,$19,$60   ;8092E8|        |00198A;
                       db $EA,$60,$8D,$86,$19,$60           ;8092F0|        |      ;
                       PHY                                  ;8092F6|5A      |      ;
                       LDY.B $24                            ;8092F7|A424    |000024;
                       PHY                                  ;8092F9|5A      |      ;
                       LDY.B $25                            ;8092FA|A425    |000025;
                       PHY                                  ;8092FC|5A      |      ;
                       STA.B $24                            ;8092FD|8524    |000024;
                       LDA.B [$24]                          ;8092FF|A724    |000024;
                       STY.W $19B1                          ;809301|8CB119  |8019B1;
                       STA.W $19B0                          ;809304|8DB019  |8019B0;
                       JSL.L Audio_TransfertoSPC            ;809307|229D9480|80949D;
                       PLY                                  ;80930B|7A      |      ;
                       STY.B $25                            ;80930C|8425    |000025;
                       PLY                                  ;80930E|7A      |      ;
                       STY.B $24                            ;80930F|8424    |000024;
                       PLY                                  ;809311|7A      |      ;
                       RTS                                  ;809312|60      |      ;
                       STA.W $19B4                          ;809313|8DB419  |8019B4;
                       TYA                                  ;809316|98      |      ;
                       SEC                                  ;809317|38      |      ;
                       SBC.W $19B4                          ;809318|EDB419  |8019B4;
                       TAY                                  ;80931B|A8      |      ;
                       RTS                                  ;80931C|60      |      ;
                       db $08,$8B,$4B,$AB,$C2,$30,$5A,$DA   ;80931D|        |      ;
                       db $A4,$24,$5A,$A4,$25,$5A,$AC,$7E   ;809325|        |000024;
                       db $19,$84,$25,$AC,$82,$19,$84,$24   ;80932D|        |002584;
                       db $29,$FF,$00,$F0,$12,$3A,$0A,$A8   ;809335|        |      ;
                       db $B7,$24,$AC,$7E,$19,$8C,$B1,$19   ;80933D|        |000024;
                       db $8D,$B0,$19,$22,$9D,$94,$80,$7A   ;809345|        |0019B0;
                       db $84,$25,$7A,$84,$24,$FA,$7A,$AB   ;80934D|        |000025;
                       db $28,$6B                           ;809355|        |      ;
 
       CODE_FL_809357:
                       PHP                                  ;809357|08      |      ;
                       PHB                                  ;809358|8B      |      ;
                       PHK                                  ;809359|4B      |      ;
                       PLB                                  ;80935A|AB      |      ;
                       SEP #$20                             ;80935B|E220    |      ;
                       LDA.W $199A                          ;80935D|AD9A19  |80199A;
                       BEQ CODE_809365                      ;809360|F003    |809365;
                       db $82,$98,$00                       ;809362|        |8093FD;
 
          CODE_809365:
                       LDA.W APUIO0                         ;809365|AD4021  |802140;
                       CMP.W APUIO0                         ;809368|CD4021  |802140;
                       BNE CODE_809365                      ;80936B|D0F8    |809365;
                       CMP.W $1996                          ;80936D|CD9619  |801996;
                       BEQ +                                ;809370|F005    |809377;
                       LDA.W $1996                          ;809372|AD9619  |801996;
                       BRA ++                               ;809375|8011    |809388;
 
                     + LDA.W $198E                          ;809377|AD8E19  |80198E;
                       STA.W $1996                          ;80937A|8D9619  |801996;
                       XBA                                  ;80937D|EB      |      ;
                       LDA.W $198F                          ;80937E|AD8F19  |80198F;
                       STA.W $198E                          ;809381|8D8E19  |80198E;
                       STZ.W $198F                          ;809384|9C8F19  |80198F;
                       XBA                                  ;809387|EB      |      ;
 
                    ++ STA.W APUIO0                         ;809388|8D4021  |802140;
 
                     - LDA.W APUIO1                         ;80938B|AD4121  |802141;
                       CMP.W APUIO1                         ;80938E|CD4121  |802141;
                       BNE -                                ;809391|D0F8    |80938B;
                       CMP.W $1997                          ;809393|CD9719  |801997;
                       BEQ +                                ;809396|F005    |80939D;
                       LDA.W $1997                          ;809398|AD9719  |801997;
                       BRA ++                               ;80939B|8011    |8093AE;
 
                     + LDA.W $1990                          ;80939D|AD9019  |801990;
                       STA.W $1997                          ;8093A0|8D9719  |801997;
                       XBA                                  ;8093A3|EB      |      ;
                       LDA.W $1991                          ;8093A4|AD9119  |801991;
                       STA.W $1990                          ;8093A7|8D9019  |801990;
                       STZ.W $1991                          ;8093AA|9C9119  |801991;
                       XBA                                  ;8093AD|EB      |      ;
 
                    ++ STA.W APUIO1                         ;8093AE|8D4121  |802141;
 
                     - LDA.W APUIO2                         ;8093B1|AD4221  |802142;
                       CMP.W APUIO2                         ;8093B4|CD4221  |802142;
                       BNE -                                ;8093B7|D0F8    |8093B1;
                       CMP.W $1998                          ;8093B9|CD9819  |801998;
                       BEQ +                                ;8093BC|F005    |8093C3;
                       LDA.W $1998                          ;8093BE|AD9819  |801998;
                       BRA ++                               ;8093C1|8011    |8093D4;
 
                     + LDA.W $1992                          ;8093C3|AD9219  |801992;
                       STA.W $1998                          ;8093C6|8D9819  |801998;
                       XBA                                  ;8093C9|EB      |      ;
                       LDA.W $1993                          ;8093CA|AD9319  |801993;
                       STA.W $1992                          ;8093CD|8D9219  |801992;
                       STZ.W $1993                          ;8093D0|9C9319  |801993;
                       XBA                                  ;8093D3|EB      |      ;
 
                    ++ STA.W APUIO2                         ;8093D4|8D4221  |802142;
 
                     - LDA.W APUIO3                         ;8093D7|AD4321  |802143;
                       CMP.W APUIO3                         ;8093DA|CD4321  |802143;
                       BNE -                                ;8093DD|D0F8    |8093D7;
                       CMP.W $1999                          ;8093DF|CD9919  |801999;
                       BEQ +                                ;8093E2|F005    |8093E9;
                       LDA.W $1999                          ;8093E4|AD9919  |801999;
                       BRA ++                               ;8093E7|8011    |8093FA;
 
                     + LDA.W $1994                          ;8093E9|AD9419  |801994;
                       STA.W $1999                          ;8093EC|8D9919  |801999;
                       XBA                                  ;8093EF|EB      |      ;
                       LDA.W $1995                          ;8093F0|AD9519  |801995;
                       STA.W $1994                          ;8093F3|8D9419  |801994;
                       STZ.W $1995                          ;8093F6|9C9519  |801995;
                       XBA                                  ;8093F9|EB      |      ;
 
                    ++ STA.W APUIO3                         ;8093FA|8D4321  |802143;
                       PLB                                  ;8093FD|AB      |      ;
                       PLP                                  ;8093FE|28      |      ;
                       RTL                                  ;8093FF|6B      |      ;
 
        Audio_InitSPC:
                       PHP                                  ;809400|08      |      ;
                       SEP #$20                             ;809401|E220    |      ;
                       LDA.B #$01                           ;809403|A901    |      ;
                       STA.W $199A                          ;809405|8D9A19  |80199A;
                       LDA.B #$CC                           ;809408|A9CC    |      ;
                       BRA +                                ;80940A|8008    |809414;
 
                     - LDX.W #$00FC                         ;80940C|A2FC00  |      ;
                       STX.W APUIO0                         ;80940F|8E4021  |002140;
                       REP #$10                             ;809412|C210    |      ;
 
                     + LDX.W #$BBAA                         ;809414|A2AABB  |      ;
                       CPX.W APUIO0                         ;809417|EC4021  |802140;
                       BNE -                                ;80941A|D0F0    |80940C;
                       BRA +                                ;80941C|8026    |809444;
 
                     - JSR.W CODE_FN_809492                 ;80941E|209294  |809492;
                       XBA                                  ;809421|EB      |      ;
                       LDA.B #$00                           ;809422|A900    |      ;
                       BRA ++                               ;809424|800B    |809431;
 
                    -- XBA                                  ;809426|EB      |      ;
                       JSR.W CODE_FN_809492                 ;809427|209294  |809492;
                       XBA                                  ;80942A|EB      |      ;
 
                   --- CMP.W APUIO0                         ;80942B|CD4021  |802140;
                       BNE ---                              ;80942E|D0FB    |80942B;
                       INC A                                ;809430|1A      |      ;
 
                    ++ REP #$20                             ;809431|C220    |      ;
                       STA.W APUIO0                         ;809433|8D4021  |802140;
                       SEP #$20                             ;809436|E220    |      ;
                       DEX                                  ;809438|CA      |      ;
                       BNE --                               ;809439|D0EB    |809426;
 
                    -- CMP.W APUIO0                         ;80943B|CD4021  |802140;
                       BNE --                               ;80943E|D0FB    |80943B;
 
                    -- ADC.B #$03                           ;809440|6903    |      ;
                       BEQ --                               ;809442|F0FC    |809440;
 
                     + PHA                                  ;809444|48      |      ;
                       JSR.W CODE_FN_809492                 ;809445|209294  |809492;
                       XBA                                  ;809448|EB      |      ;
                       JSR.W CODE_FN_809492                 ;809449|209294  |809492;
                       XBA                                  ;80944C|EB      |      ;
                       REP #$20                             ;80944D|C220    |      ;
                       TAX                                  ;80944F|AA      |      ;
                       SEP #$20                             ;809450|E220    |      ;
                       JSR.W CODE_FN_809492                 ;809452|209294  |809492;
                       XBA                                  ;809455|EB      |      ;
                       JSR.W CODE_FN_809492                 ;809456|209294  |809492;
                       XBA                                  ;809459|EB      |      ;
                       REP #$20                             ;80945A|C220    |      ;
                       STA.W APUIO2                         ;80945C|8D4221  |802142;
                       SEP #$20                             ;80945F|E220    |      ;
                       CPX.W #$0001                         ;809461|E00100  |      ;
                       LDA.B #$00                           ;809464|A900    |      ;
                       ROL A                                ;809466|2A      |      ;
                       STA.W APUIO1                         ;809467|8D4121  |802141;
                       ADC.B #$7F                           ;80946A|697F    |      ;
                       PLA                                  ;80946C|68      |      ;
                       STA.W APUIO0                         ;80946D|8D4021  |802140;
 
                    -- CMP.W APUIO0                         ;809470|CD4021  |802140;
                       BNE --                               ;809473|D0FB    |809470;
                       BVS -                                ;809475|70A7    |80941E;
                       SEP #$20                             ;809477|E220    |      ;
 
                     - LDA.W APUIO0                         ;809479|AD4021  |802140;
                       BNE -                                ;80947C|D0FB    |809479;
                       LDA.W APUIO1                         ;80947E|AD4121  |802141;
                       BNE -                                ;809481|D0F6    |809479;
                       LDA.W APUIO2                         ;809483|AD4221  |802142;
                       BNE -                                ;809486|D0F1    |809479;
                       LDA.W APUIO3                         ;809488|AD4321  |802143;
                       BNE -                                ;80948B|D0EC    |809479;
                       STA.W $199A                          ;80948D|8D9A19  |80199A;
                       PLP                                  ;809490|28      |      ;
                       RTS                                  ;809491|60      |      ;
 
       CODE_FN_809492:
                       LDA.B [$24],Y                        ;809492|B724    |000024;
                       INY                                  ;809494|C8      |      ;
                       BNE +                                ;809495|D005    |80949C;
                       INC.B $26                            ;809497|E626    |000026;
                       LDY.W #$8000                         ;809499|A00080  |      ;
 
                     + RTS                                  ;80949C|60      |      ;
 
  Audio_TransfertoSPC:
                       PHP                                  ;80949D|08      |      ;
                       PHB                                  ;80949E|8B      |      ;
                       PHK                                  ;80949F|4B      |      ;
                       PLB                                  ;8094A0|AB      |      ;
                       SEP #$20                             ;8094A1|E220    |      ;
                       LDA.W $19B3                          ;8094A3|ADB319  |8019B3;
                       BEQ +                                ;8094A6|F004    |8094AC;
                       db $22,$E7,$9C,$80                   ;8094A8|        |809CE7;
 
                     + LDA.B #$FE                           ;8094AC|A9FE    |      ;
                       STA.W $199B                          ;8094AE|8D9B19  |80199B;
                       LDA.B #$01                           ;8094B1|A901    |      ;
                       STA.W $199A                          ;8094B3|8D9A19  |80199A;
                       REP #$10                             ;8094B6|C210    |      ;
                       LDX.W #$0000                         ;8094B8|A20000  |      ;
                       STX.W APUIO2                         ;8094BB|8E4221  |802142;
                       LDA.W $199B                          ;8094BE|AD9B19  |80199B;
                       STA.W APUIO0                         ;8094C1|8D4021  |802140;
 
                     - CMP.W APUIO0                         ;8094C4|CD4021  |802140;
                       BNE -                                ;8094C7|D0FB    |8094C4;
                       CMP.W APUIO0                         ;8094C9|CD4021  |802140;
                       BNE -                                ;8094CC|D0F6    |8094C4;
                       REP #$20                             ;8094CE|C220    |      ;
                       LDA.W APUIO2                         ;8094D0|AD4221  |802142;
                       BRA +                                ;8094D3|8029    |8094FE;
 
                    -- CMP.W APUIO2                         ;8094D5|CD4221  |802142;
                       BNE --                               ;8094D8|D0FB    |8094D5;
                       CMP.W APUIO2                         ;8094DA|CD4221  |802142;
                       BNE --                               ;8094DD|D0F6    |8094D5;
                       INC A                                ;8094DF|1A      |      ;
                       AND.W #$FF7F                         ;8094E0|297FFF  |      ;
                       STX.W APUIO0                         ;8094E3|8E4021  |802140;
                       STA.W APUIO2                         ;8094E6|8D4221  |802142;
                       DEC.W $19B4                          ;8094E9|CEB419  |8019B4;
                       BEQ +                                ;8094EC|F010    |8094FE;
 
                     - PHA                                  ;8094EE|48      |      ;
                       LDA.B [$24],Y                        ;8094EF|B724    |000024;
                       TAX                                  ;8094F1|AA      |      ;
                       PLA                                  ;8094F2|68      |      ;
                       INY                                  ;8094F3|C8      |      ;
                       INY                                  ;8094F4|C8      |      ;
                       BNE --                               ;8094F5|D0DE    |8094D5;
                       INC.B $26                            ;8094F7|E626    |000026;
                       LDY.W #$8000                         ;8094F9|A00080  |      ;
                       BRA --                               ;8094FC|80D7    |8094D5;
 
                     + TAX                                  ;8094FE|AA      |      ;
                       LDA.W $19B1                          ;8094FF|ADB119  |8019B1;
                       STA.B $25                            ;809502|8525    |000025;
                       STZ.B $24                            ;809504|6424    |000024;
                       LDY.W $19B0                          ;809506|ACB019  |8019B0;
                       LDA.B [$24],Y                        ;809509|B724    |000024;
                       INY                                  ;80950B|C8      |      ;
                       INY                                  ;80950C|C8      |      ;
                       STY.W $19B0                          ;80950D|8CB019  |8019B0;
                       AND.W #$07FF                         ;809510|29FF07  |      ;
                       BEQ +                                ;809513|F053    |809568;
                       PHX                                  ;809515|DA      |      ;
                       STA.W $19B4                          ;809516|8DB419  |8019B4;
                       XBA                                  ;809519|EB      |      ;
                       AND.W #$0006                         ;80951A|290600  |      ;
                       TAX                                  ;80951D|AA      |      ;
                       LDA.W $197E,X                        ;80951E|BD7E19  |80197E;
                       STA.B $25                            ;809521|8525    |000025;
                       LDA.W $19B4                          ;809523|ADB419  |8019B4;
                       AND.W #$01FF                         ;809526|29FF01  |      ;
                       DEC A                                ;809529|3A      |      ;
                       ASL A                                ;80952A|0A      |      ;
                       ASL A                                ;80952B|0A      |      ;
                       ASL A                                ;80952C|0A      |      ;
                       CLC                                  ;80952D|18      |      ;
                       ADC.W $1984,X                        ;80952E|7D8419  |801984;
                       TAY                                  ;809531|A8      |      ;
                       LDA.B [$24],Y                        ;809532|B724    |000024;
                       PHA                                  ;809534|48      |      ;
                       INY                                  ;809535|C8      |      ;
                       INY                                  ;809536|C8      |      ;
                       LDA.B [$24],Y                        ;809537|B724    |000024;
                       XBA                                  ;809539|EB      |      ;
                       CLC                                  ;80953A|18      |      ;
                       ADC.W $197E,X                        ;80953B|7D7E19  |80197E;
                       AND.W #$FF00                         ;80953E|2900FF  |      ;
                       PHA                                  ;809541|48      |      ;
                       INY                                  ;809542|C8      |      ;
                       LDA.B [$24],Y                        ;809543|B724    |000024;
                       INC A                                ;809545|1A      |      ;
                       LSR A                                ;809546|4A      |      ;
                       STA.W $19B4                          ;809547|8DB419  |8019B4;
                       INY                                  ;80954A|C8      |      ;
                       INY                                  ;80954B|C8      |      ;
                       LDA.B [$24],Y                        ;80954C|B724    |000024;
                       PLY                                  ;80954E|7A      |      ;
                       STY.B $25                            ;80954F|8425    |000025;
                       PLY                                  ;809551|7A      |      ;
                       PLX                                  ;809552|FA      |      ;
 
                    -- CPX.W APUIO2                         ;809553|EC4221  |802142;
                       BNE --                               ;809556|D0FB    |809553;
                       CPX.W APUIO2                         ;809558|EC4221  |802142;
                       BNE --                               ;80955B|D0F6    |809553;
                       STA.W APUIO0                         ;80955D|8D4021  |802140;
                       LDA.W #$0080                         ;809560|A98000  |      ;
                       STA.W APUIO2                         ;809563|8D4221  |802142;
                       BRA -                                ;809566|8086    |8094EE;
 
                     + LDA.W #$00FE                         ;809568|A9FE00  |      ;
                       LDY.W #$0000                         ;80956B|A00000  |      ;
 
                     - CPX.W APUIO2                         ;80956E|EC4221  |802142;
                       BNE -                                ;809571|D0FB    |80956E;
                       CPX.W APUIO2                         ;809573|EC4221  |802142;
                       BNE -                                ;809576|D0F6    |80956E;
                       STY.W APUIO0                         ;809578|8C4021  |802140;
                       STA.W APUIO2                         ;80957B|8D4221  |802142;
                       SEP #$20                             ;80957E|E220    |      ;
 
                     - LDA.W APUIO0                         ;809580|AD4021  |802140;
                       BNE -                                ;809583|D0FB    |809580;
                       LDA.W APUIO0                         ;809585|AD4021  |802140;
                       BNE -                                ;809588|D0F6    |809580;
                       STY.W APUIO2                         ;80958A|8C4221  |802142;
                       LDA.B #$00                           ;80958D|A900    |      ;
                       STA.W $199A                          ;80958F|8D9A19  |80199A;
                       LDA.W $19B3                          ;809592|ADB319  |8019B3;
                       BEQ +                                ;809595|F004    |80959B;
                       db $22,$D7,$9C,$80                   ;809597|        |809CD7;
 
                     + PLB                                  ;80959B|AB      |      ;
                       PLP                                  ;80959C|28      |      ;
                       RTL                                  ;80959D|6B      |      ;
 
       CODE_FL_80959E:
                       PHD                                  ;80959E|0B      |      ;
                       SEP #$30                             ;80959F|E230    |      ;
                       LDA.W $1F21                          ;8095A1|AD211F  |831F21;
                       ASL A                                ;8095A4|0A      |      ;
                       TAX                                  ;8095A5|AA      |      ;
                       JSR.W (DATA8_8095B0,X)               ;8095A6|FCB095  |8095B0;
                       REP #$30                             ;8095A9|C230    |      ;
                       STZ.W $1F20                          ;8095AB|9C201F  |831F20;
                       PLD                                  ;8095AE|2B      |      ;
                       RTL                                  ;8095AF|6B      |      ;
 
         DATA8_8095B0:
                       db $B8,$95,$D6,$95                   ;8095B0|        |      ;
                       db $6C,$96,$6C,$96                   ;8095B4|        |006C96;
                       REP #$20                             ;8095B8|C220    |      ;
                       LDX.B #$F0                           ;8095BA|A2F0    |      ;
                       PHD                                  ;8095BC|0B      |      ;
                       LDA.W #$1E00                         ;8095BD|A9001E  |      ;
                       TCD                                  ;8095C0|5B      |      ;
                       JSR.W CODE_FN_8095EB                 ;8095C1|20EB95  |8095EB;
                       PLD                                  ;8095C4|2B      |      ;
                       LDA.W $1F20                          ;8095C5|AD201F  |831F20;
                       LSR A                                ;8095C8|4A      |      ;
                       CLC                                  ;8095C9|18      |      ;
                       ADC.W #$95EB                         ;8095CA|69EB95  |      ;
                       STA.B $4C                            ;8095CD|854C    |00004C;
                       LDA.W #$1D00                         ;8095CF|A9001D  |      ;
                       TCD                                  ;8095D2|5B      |      ;
                       JMP.W ($004C)                        ;8095D3|6C4C00  |00004C;
                       REP #$20                             ;8095D6|C220    |      ;
                       LDX.B #$F0                           ;8095D8|A2F0    |      ;
                       LDA.W $1F20                          ;8095DA|AD201F  |821F20;
                       LSR A                                ;8095DD|4A      |      ;
                       CLC                                  ;8095DE|18      |      ;
                       ADC.W #$956B                         ;8095DF|696B95  |      ;
                       STA.B $4C                            ;8095E2|854C    |00004C;
                       LDA.W #$1E00                         ;8095E4|A9001E  |      ;
                       TCD                                  ;8095E7|5B      |      ;
                       JMP.W ($004C)                        ;8095E8|6C4C00  |00004C;
 
       CODE_FN_8095EB:
                       STX.B $01                            ;8095EB|8601    |001E01;
                       STX.B $05                            ;8095ED|8605    |001E05;
                       STX.B $09                            ;8095EF|8609    |001E09;
                       STX.B $0D                            ;8095F1|860D    |001E0D;
                       STX.B $11                            ;8095F3|8611    |001E11;
                       STX.B $15                            ;8095F5|8615    |001E15;
                       STX.B $19                            ;8095F7|8619    |001E19;
                       STX.B $1D                            ;8095F9|861D    |001E1D;
                       STX.B $21                            ;8095FB|8621    |001E21;
                       STX.B $25                            ;8095FD|8625    |001E25;
                       STX.B $29                            ;8095FF|8629    |001E29;
                       STX.B $2D                            ;809601|862D    |001E2D;
                       STX.B $31                            ;809603|8631    |001E31;
                       STX.B $35                            ;809605|8635    |001E35;
                       STX.B $39                            ;809607|8639    |001E39;
                       STX.B $3D                            ;809609|863D    |001E3D;
                       STX.B $41                            ;80960B|8641    |001E41;
                       STX.B $45                            ;80960D|8645    |001E45;
                       STX.B $49                            ;80960F|8649    |001E49;
                       STX.B $4D                            ;809611|864D    |001E4D;
                       STX.B $51                            ;809613|8651    |001E51;
                       STX.B $55                            ;809615|8655    |001E55;
                       STX.B $59                            ;809617|8659    |001E59;
                       STX.B $5D                            ;809619|865D    |001E5D;
                       STX.B $61                            ;80961B|8661    |001E61;
                       STX.B $65                            ;80961D|8665    |001E65;
                       STX.B $69                            ;80961F|8669    |001E69;
                       STX.B $6D                            ;809621|866D    |001E6D;
                       STX.B $71                            ;809623|8671    |001E71;
                       STX.B $75                            ;809625|8675    |001E75;
                       STX.B $79                            ;809627|8679    |001E79;
                       STX.B $7D                            ;809629|867D    |001E7D;
                       STX.B $81                            ;80962B|8681    |001E81;
                       STX.B $85                            ;80962D|8685    |001E85;
                       STX.B $89                            ;80962F|8689    |001E89;
                       STX.B $8D                            ;809631|868D    |001E8D;
                       STX.B $91                            ;809633|8691    |001E91;
                       STX.B $95                            ;809635|8695    |001E95;
                       STX.B $99                            ;809637|8699    |001E99;
                       STX.B $9D                            ;809639|869D    |001E9D;
                       STX.B $A1                            ;80963B|86A1    |001EA1;
                       STX.B $A5                            ;80963D|86A5    |001EA5;
                       STX.B $A9                            ;80963F|86A9    |001EA9;
                       STX.B $AD                            ;809641|86AD    |001EAD;
                       STX.B $B1                            ;809643|86B1    |001EB1;
                       STX.B $B5                            ;809645|86B5    |001EB5;
                       STX.B $B9                            ;809647|86B9    |001EB9;
                       STX.B $BD                            ;809649|86BD    |001EBD;
                       STX.B $C1                            ;80964B|86C1    |001DC1;
                       STX.B $C5                            ;80964D|86C5    |001DC5;
                       STX.B $C9                            ;80964F|86C9    |001DC9;
                       STX.B $CD                            ;809651|86CD    |001DCD;
                       STX.B $D1                            ;809653|86D1    |001DD1;
                       STX.B $D5                            ;809655|86D5    |001DD5;
                       STX.B $D9                            ;809657|86D9    |001DD9;
                       STX.B $DD                            ;809659|86DD    |001DDD;
                       STX.B $E1                            ;80965B|86E1    |001DE1;
                       STX.B $E5                            ;80965D|86E5    |001DE5;
                       STX.B $E9                            ;80965F|86E9    |001DE9;
                       STX.B $ED                            ;809661|86ED    |001DED;
                       STX.B $F1                            ;809663|86F1    |001DF1;
                       STX.B $F5                            ;809665|86F5    |001DF5;
                       STX.B $F9                            ;809667|86F9    |001DF9;
                       STX.B $FD                            ;809669|86FD    |001DFD;
                       RTS                                  ;80966B|60      |      ;
                       db $C2,$30,$AD,$20,$1F,$C9,$00,$02   ;80966C|        |      ;
                       db $F0,$01,$00,$60                   ;809674|        |809677;
 
       CODE_FL_809678:
                       REP #$20                             ;809678|C220    |      ;
                       STZ.W $1F00                          ;80967A|9C001F  |801F00;
                       STZ.W $1F02                          ;80967D|9C021F  |801F02;
                       STZ.W $1F04                          ;809680|9C041F  |801F04;
                       STZ.W $1F06                          ;809683|9C061F  |801F06;
                       STZ.W $1F08                          ;809686|9C081F  |801F08;
                       STZ.W $1F0A                          ;809689|9C0A1F  |801F0A;
                       STZ.W $1F0C                          ;80968C|9C0C1F  |801F0C;
                       STZ.W $1F0E                          ;80968F|9C0E1F  |801F0E;
                       STZ.W $1F10                          ;809692|9C101F  |801F10;
                       STZ.W $1F12                          ;809695|9C121F  |801F12;
                       STZ.W $1F14                          ;809698|9C141F  |801F14;
                       STZ.W $1F16                          ;80969B|9C161F  |801F16;
                       STZ.W $1F18                          ;80969E|9C181F  |801F18;
                       STZ.W $1F1A                          ;8096A1|9C1A1F  |801F1A;
                       STZ.W $1F1C                          ;8096A4|9C1C1F  |801F1C;
                       STZ.W $1F1E                          ;8096A7|9C1E1F  |801F1E;
                       RTL                                  ;8096AA|6B      |      ;
 
         DATA8_8096AB:
                       db $01,$00                           ;8096AB|        |      ;
 
         DATA8_8096AD:
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;8096AD|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;8096B5|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;8096BD|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;8096C5|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;8096CD|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;8096D5|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;8096DD|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;8096E5|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;8096ED|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;8096F5|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;8096FD|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;809705|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;80970D|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;809715|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;80971D|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;809725|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;80972D|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;809735|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;80973D|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;809745|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;80974D|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;809755|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;80975D|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;809765|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;80976D|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;809775|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;80977D|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;809785|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;80978D|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;809795|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;80979D|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;8097A5|        |      ;
                       db $02,$00,$04,$00,$08,$00,$10,$00   ;8097AD|        |      ;
                       db $20,$00,$40,$00,$80,$00,$00,$01   ;8097B5|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;8097BD|        |      ;
                       db $00,$20,$00,$40,$00,$80,$01,$00   ;8097C5|        |      ;
                       db $02,$00,$04,$00,$08,$00           ;8097CD|        |      ;
                       db $10,$00                           ;8097D3|        |8097D5;
                       db $20,$00                           ;8097D5|        |      ;
                       db $40,$00                           ;8097D7|        |      ;
                       db $80,$00                           ;8097D9|        |      ;
                       db $00,$01                           ;8097DB|        |      ;
                       db $00,$02,$00,$04,$00,$08,$00,$10   ;8097DD|        |      ;
                       db $00,$20                           ;8097E5|        |      ;
                       db $00,$40                           ;8097E7|        |      ;
                       db $00,$80                           ;8097E9|        |      ;
                       db $01,$00                           ;8097EB|        |000000;
                       db $02,$00,$04,$00                   ;8097ED|        |      ;
                       db $08,$00,$10,$00,$20,$00,$40,$00   ;8097F1|        |      ;
                       db $80,$00,$00,$01,$00,$02,$00,$04   ;8097F9|        |8097FB;
                       db $00,$08,$00,$10,$00,$20,$00,$40   ;809801|        |      ;
                       db $00,$80                           ;809809|        |      ;
                       db $01,$00                           ;80980B|        |000000;
                       db $02,$00                           ;80980D|        |      ;
                       db $04,$00,$08,$00,$10,$00,$20,$00   ;80980F|        |000000;
                       db $40,$00,$80,$00,$00,$01,$00,$02   ;809817|        |      ;
                       db $00,$04,$00,$08,$00,$10,$00,$20   ;80981F|        |      ;
                       db $00,$40                           ;809827|        |      ;
                       db $00,$80                           ;809829|        |      ;
                       db $01,$00,$02,$00,$04,$00,$08,$00   ;80982B|        |000000;
                       db $10,$00,$20,$00,$40,$00           ;809833|        |809835;
                       db $80,$00                           ;809839|        |      ;
                       db $00,$01,$00,$02,$00,$04,$00,$08   ;80983B|        |      ;
                       db $00,$10,$00,$20,$00,$40,$00,$80   ;809843|        |      ;
                       db $01,$00,$02,$00,$04,$00,$08,$00   ;80984B|        |000000;
                       db $10,$00,$20,$00,$40,$00,$80,$00   ;809853|        |809855;
                       db $00,$01,$00,$02,$00,$04,$00,$08   ;80985B|        |      ;
                       db $00,$10,$00,$20,$00,$40,$00,$80   ;809863|        |      ;
                       db $01,$00,$02,$00,$04,$00,$08,$00   ;80986B|        |000000;
                       db $10,$00,$20,$00,$40,$00,$80,$00   ;809873|        |809875;
                       db $00,$01,$00,$02,$00,$04,$00,$08   ;80987B|        |      ;
                       db $00,$10,$00,$20,$00,$40,$00,$80   ;809883|        |      ;
                       db $01,$00,$02,$00,$04,$00,$08,$00   ;80988B|        |000000;
                       db $10,$00,$20,$00,$40,$00,$80,$00   ;809893|        |809895;
                       db $00,$01,$00,$02,$00,$04,$00,$08   ;80989B|        |      ;
                       db $00,$10,$00,$20,$00,$40,$00,$80   ;8098A3|        |      ;
 
         DATA8_8098AB:
                       db $00,$1F                           ;8098AB|        |      ;
                       db $03,$00                           ;8098AD|        |000000;
                       db $00,$1F                           ;8098AF|        |      ;
                       db $0C,$00                           ;8098B1|        |000000;
                       db $00,$1F                           ;8098B3|        |      ;
                       db $30,$00                           ;8098B5|        |8098B7;
                       db $00,$1F                           ;8098B7|        |      ;
                       db $C0,$00                           ;8098B9|        |      ;
                       db $00,$1F                           ;8098BB|        |      ;
                       db $00,$03                           ;8098BD|        |      ;
                       db $00,$1F                           ;8098BF|        |      ;
                       db $00,$0C                           ;8098C1|        |      ;
                       db $00,$1F                           ;8098C3|        |      ;
                       db $00,$30                           ;8098C5|        |      ;
                       db $00,$1F                           ;8098C7|        |      ;
                       db $00,$C0                           ;8098C9|        |      ;
                       db $02,$1F                           ;8098CB|        |      ;
                       db $03,$00                           ;8098CD|        |000000;
                       db $02,$1F                           ;8098CF|        |      ;
                       db $0C,$00                           ;8098D1|        |000200;
                       db $02,$1F                           ;8098D3|        |      ;
                       db $30,$00                           ;8098D5|        |8098D7;
                       db $02,$1F                           ;8098D7|        |      ;
                       db $C0,$00                           ;8098D9|        |      ;
                       db $02,$1F                           ;8098DB|        |      ;
                       db $00,$03                           ;8098DD|        |      ;
                       db $02,$1F                           ;8098DF|        |      ;
                       db $00,$0C                           ;8098E1|        |      ;
                       db $02,$1F                           ;8098E3|        |      ;
                       db $00,$30                           ;8098E5|        |      ;
                       db $02,$1F                           ;8098E7|        |      ;
                       db $00,$C0                           ;8098E9|        |      ;
                       db $04,$1F                           ;8098EB|        |      ;
                       db $03,$00                           ;8098ED|        |000000;
                       db $04,$1F                           ;8098EF|        |      ;
                       db $0C,$00                           ;8098F1|        |000400;
                       db $04,$1F                           ;8098F3|        |      ;
                       db $30,$00                           ;8098F5|        |8098F7;
                       db $04,$1F                           ;8098F7|        |      ;
                       db $C0,$00                           ;8098F9|        |      ;
                       db $04,$1F                           ;8098FB|        |      ;
                       db $00,$03                           ;8098FD|        |      ;
                       db $04,$1F                           ;8098FF|        |      ;
                       db $00,$0C                           ;809901|        |      ;
                       db $04,$1F                           ;809903|        |      ;
                       db $00,$30                           ;809905|        |      ;
                       db $04,$1F                           ;809907|        |      ;
                       db $00,$C0                           ;809909|        |      ;
                       db $06,$1F                           ;80990B|        |      ;
                       db $03,$00                           ;80990D|        |000000;
                       db $06,$1F                           ;80990F|        |      ;
                       db $0C,$00                           ;809911|        |000600;
                       db $06,$1F                           ;809913|        |      ;
                       db $30,$00                           ;809915|        |809917;
                       db $06,$1F                           ;809917|        |      ;
                       db $C0,$00                           ;809919|        |      ;
                       db $06,$1F                           ;80991B|        |      ;
                       db $00,$03                           ;80991D|        |      ;
                       db $06,$1F                           ;80991F|        |      ;
                       db $00,$0C                           ;809921|        |      ;
                       db $06,$1F                           ;809923|        |      ;
                       db $00,$30                           ;809925|        |      ;
                       db $06,$1F                           ;809927|        |      ;
                       db $00,$C0                           ;809929|        |      ;
                       db $08,$1F                           ;80992B|        |      ;
                       db $03,$00                           ;80992D|        |000000;
                       db $08,$1F                           ;80992F|        |      ;
                       db $0C,$00                           ;809931|        |000800;
                       db $08,$1F                           ;809933|        |      ;
                       db $30,$00                           ;809935|        |809937;
                       db $08,$1F                           ;809937|        |      ;
                       db $C0,$00                           ;809939|        |      ;
                       db $08,$1F                           ;80993B|        |      ;
                       db $00,$03                           ;80993D|        |      ;
                       db $08,$1F                           ;80993F|        |      ;
                       db $00,$0C                           ;809941|        |      ;
                       db $08,$1F                           ;809943|        |      ;
                       db $00,$30                           ;809945|        |      ;
                       db $08,$1F                           ;809947|        |      ;
                       db $00,$C0                           ;809949|        |      ;
                       db $0A,$1F                           ;80994B|        |      ;
                       db $03,$00                           ;80994D|        |000000;
                       db $0A,$1F                           ;80994F|        |      ;
                       db $0C,$00                           ;809951|        |000A00;
                       db $0A,$1F                           ;809953|        |      ;
                       db $30,$00                           ;809955|        |809957;
                       db $0A,$1F                           ;809957|        |      ;
                       db $C0,$00                           ;809959|        |      ;
                       db $0A,$1F                           ;80995B|        |      ;
                       db $00,$03                           ;80995D|        |      ;
                       db $0A,$1F                           ;80995F|        |      ;
                       db $00,$0C                           ;809961|        |      ;
                       db $0A,$1F                           ;809963|        |      ;
                       db $00,$30                           ;809965|        |      ;
                       db $0A,$1F                           ;809967|        |      ;
                       db $00,$C0                           ;809969|        |      ;
                       db $0C,$1F                           ;80996B|        |      ;
                       db $03,$00                           ;80996D|        |000000;
                       db $0C,$1F                           ;80996F|        |      ;
                       db $0C,$00                           ;809971|        |000C00;
                       db $0C,$1F                           ;809973|        |      ;
                       db $30,$00                           ;809975|        |809977;
                       db $0C,$1F                           ;809977|        |      ;
                       db $C0,$00                           ;809979|        |      ;
                       db $0C,$1F                           ;80997B|        |      ;
                       db $00,$03                           ;80997D|        |      ;
                       db $0C,$1F                           ;80997F|        |      ;
                       db $00,$0C                           ;809981|        |      ;
                       db $0C,$1F                           ;809983|        |      ;
                       db $00,$30                           ;809985|        |      ;
                       db $0C,$1F                           ;809987|        |      ;
                       db $00,$C0                           ;809989|        |      ;
                       db $0E,$1F                           ;80998B|        |      ;
                       db $03,$00                           ;80998D|        |000000;
                       db $0E,$1F                           ;80998F|        |      ;
                       db $0C,$00                           ;809991|        |000E00;
                       db $0E,$1F                           ;809993|        |      ;
                       db $30,$00                           ;809995|        |809997;
                       db $0E,$1F                           ;809997|        |      ;
                       db $C0,$00                           ;809999|        |      ;
                       db $0E,$1F                           ;80999B|        |      ;
                       db $00,$03                           ;80999D|        |      ;
                       db $0E,$1F                           ;80999F|        |      ;
                       db $00,$0C                           ;8099A1|        |      ;
                       db $0E,$1F                           ;8099A3|        |      ;
                       db $00,$30                           ;8099A5|        |      ;
                       db $0E,$1F                           ;8099A7|        |      ;
                       db $00,$C0                           ;8099A9|        |      ;
                       db $10,$1F                           ;8099AB|        |      ;
                       db $03,$00                           ;8099AD|        |000000;
                       db $10,$1F                           ;8099AF|        |      ;
                       db $0C,$00                           ;8099B1|        |001000;
                       db $10,$1F                           ;8099B3|        |      ;
                       db $30,$00                           ;8099B5|        |8099B7;
                       db $10,$1F                           ;8099B7|        |      ;
                       db $C0,$00                           ;8099B9|        |      ;
                       db $10,$1F                           ;8099BB|        |      ;
                       db $00,$03                           ;8099BD|        |      ;
                       db $10,$1F                           ;8099BF|        |      ;
                       db $00,$0C                           ;8099C1|        |      ;
                       db $10,$1F                           ;8099C3|        |      ;
                       db $00,$30                           ;8099C5|        |      ;
                       db $10,$1F                           ;8099C7|        |      ;
                       db $00,$C0                           ;8099C9|        |      ;
                       db $12,$1F                           ;8099CB|        |      ;
                       db $03,$00                           ;8099CD|        |000000;
                       db $12,$1F                           ;8099CF|        |      ;
                       db $0C,$00                           ;8099D1|        |001200;
                       db $12,$1F                           ;8099D3|        |      ;
                       db $30,$00                           ;8099D5|        |8099D7;
                       db $12,$1F                           ;8099D7|        |      ;
                       db $C0,$00                           ;8099D9|        |      ;
                       db $12,$1F                           ;8099DB|        |      ;
                       db $00,$03                           ;8099DD|        |      ;
                       db $12,$1F                           ;8099DF|        |      ;
                       db $00,$0C                           ;8099E1|        |      ;
                       db $12,$1F                           ;8099E3|        |      ;
                       db $00,$30                           ;8099E5|        |      ;
                       db $12,$1F                           ;8099E7|        |      ;
                       db $00,$C0                           ;8099E9|        |      ;
                       db $14,$1F                           ;8099EB|        |      ;
                       db $03,$00                           ;8099ED|        |000000;
                       db $14,$1F                           ;8099EF|        |      ;
                       db $0C,$00,$14,$1F,$30,$00,$14,$1F   ;8099F1|        |001400;
                       db $C0,$00,$14,$1F,$00,$03,$14,$1F   ;8099F9|        |      ;
                       db $00,$0C,$14,$1F,$00,$30           ;809A01|        |      ;
                       db $14,$1F                           ;809A07|        |      ;
                       db $00,$C0                           ;809A09|        |      ;
                       db $16,$1F                           ;809A0B|        |      ;
                       db $03,$00,$16,$1F,$0C,$00,$16,$1F   ;809A0D|        |000000;
                       db $30,$00,$16,$1F,$C0,$00,$16,$1F   ;809A15|        |809A17;
                       db $00,$03,$16,$1F,$00,$0C,$16,$1F   ;809A1D|        |      ;
                       db $00,$30                           ;809A25|        |      ;
                       db $16,$1F                           ;809A27|        |      ;
                       db $00,$C0,$18,$1F,$03,$00,$18,$1F   ;809A29|        |      ;
                       db $0C,$00,$18,$1F,$30,$00           ;809A31|        |001800;
                       db $18,$1F                           ;809A37|        |      ;
                       db $C0,$00,$18,$1F,$00,$03,$18,$1F   ;809A39|        |      ;
                       db $00,$0C,$18,$1F,$00,$30,$18,$1F   ;809A41|        |      ;
                       db $00,$C0,$1A,$1F,$03,$00,$1A,$1F   ;809A49|        |      ;
                       db $0C,$00,$1A,$1F,$30,$00,$1A,$1F   ;809A51|        |001A00;
                       db $C0,$00,$1A,$1F,$00,$03,$1A,$1F   ;809A59|        |      ;
                       db $00,$0C,$1A,$1F,$00,$30,$1A,$1F   ;809A61|        |      ;
                       db $00,$C0,$1C,$1F,$03,$00,$1C,$1F   ;809A69|        |      ;
                       db $0C,$00,$1C,$1F,$30,$00,$1C,$1F   ;809A71|        |001C00;
                       db $C0,$00,$1C,$1F,$00,$03,$1C,$1F   ;809A79|        |      ;
                       db $00,$0C,$1C,$1F,$00,$30,$1C,$1F   ;809A81|        |      ;
                       db $00,$C0,$1E,$1F,$03,$00,$1E,$1F   ;809A89|        |      ;
                       db $0C,$00,$1E,$1F,$30,$00,$1E,$1F   ;809A91|        |001E00;
                       db $C0,$00,$1E,$1F,$00,$03,$1E,$1F   ;809A99|        |      ;
                       db $00,$0C,$1E,$1F,$00,$30,$1E,$1F   ;809AA1|        |      ;
                       db $00,$C0                           ;809AA9|        |      ;
 
       CODE_FL_809AAB:
                       LDA.W $0000,Y                        ;809AAB|B90000  |800000;
                       BNE +                                ;809AAE|D001    |809AB1;
 
       UNREACH_809AB0:
                       db $6B                               ;809AB0|        |      ;
 
                     + STA.B $8A                            ;809AB1|858A    |00008A;
                       ASL A                                ;809AB3|0A      |      ;
                       ASL A                                ;809AB4|0A      |      ;
                       CLC                                  ;809AB5|18      |      ;
                       ADC.W $1F20                          ;809AB6|6D201F  |801F20;
                       CMP.W #$0200                         ;809AB9|C90002  |      ;
                       BCS UNREACH_809AB0                   ;809ABC|B0F2    |809AB0;
                       INY                                  ;809ABE|C8      |      ;
                       INY                                  ;809ABF|C8      |      ;
                       LDX.W $1F20                          ;809AC0|AE201F  |801F20;
                       CLC                                  ;809AC3|18      |      ;
 
                     - LDA.W $0000,Y                        ;809AC4|B90000  |800000;
                       CLC                                  ;809AC7|18      |      ;
                       ADC.B $86                            ;809AC8|6586    |000086;
                       STA.W $1D00,X                        ;809ACA|9D001D  |801D00;
                       BIT.W #$0100                         ;809ACD|890001  |      ;
                       BEQ +                                ;809AD0|F00E    |809AE0;
                       LDA.L DATA8_8098AB,X                 ;809AD2|BFAB9880|8098AB;
                       STA.B $8C                            ;809AD6|858C    |00008C;
                       LDA.B ($8C)                          ;809AD8|B28C    |00008C;
                       ORA.L DATA8_8096AB,X                 ;809ADA|1FAB9680|8096AB;
                       STA.B ($8C)                          ;809ADE|928C    |00008C;
 
                     + SEP #$20                             ;809AE0|E220    |      ;
                       CLC                                  ;809AE2|18      |      ;
                       LDA.W $0002,Y                        ;809AE3|B90200  |800002;
                       ADC.B $88                            ;809AE6|6588    |000088;
                       STA.W $1D01,X                        ;809AE8|9D011D  |801D01;
                       REP #$21                             ;809AEB|C221    |      ;
                       LDA.W $0000,Y                        ;809AED|B90000  |800000;
                       BPL +                                ;809AF0|100E    |809B00;
                       LDA.L DATA8_8098AB,X                 ;809AF2|BFAB9880|8098AB;
                       STA.B $8C                            ;809AF6|858C    |00008C;
                       LDA.B ($8C)                          ;809AF8|B28C    |00008C;
                       ORA.L DATA8_8096AD,X                 ;809AFA|1FAD9680|8096AD;
                       STA.B ($8C)                          ;809AFE|928C    |00008C;
 
                     + LDA.W $0003,Y                        ;809B00|B90300  |800003;
                       ADC.B $8E                            ;809B03|658E    |00008E;
                       ORA.B $90                            ;809B05|0590    |000090;
                       STA.W $1D02,X                        ;809B07|9D021D  |801D02;
                       TXA                                  ;809B0A|8A      |      ;
                       ADC.W #$0004                         ;809B0B|690400  |      ;
                       AND.W #$01FF                         ;809B0E|29FF01  |      ;
                       TAX                                  ;809B11|AA      |      ;
                       TYA                                  ;809B12|98      |      ;
                       ADC.W #$0005                         ;809B13|690500  |      ;
                       TAY                                  ;809B16|A8      |      ;
                       DEC.B $8A                            ;809B17|C68A    |00008A;
                       BNE -                                ;809B19|D0A9    |809AC4;
                       STX.W $1F20                          ;809B1B|8E201F  |801F20;
                       RTL                                  ;809B1E|6B      |      ;
 
       CODE_FL_809B1F:
                       PHP                                  ;809B1F|08      |      ;
                       SEP #$20                             ;809B20|E220    |      ;
                       LDA.W $01B7                          ;809B22|ADB701  |8001B7;
                       STA.W OBJSEL                         ;809B25|8D0121  |802101;
                       LDA.W $01BA                          ;809B28|ADBA01  |8001BA;
                       STA.W BGMODE                         ;809B2B|8D0521  |802105;
                       LDA.W $01BC                          ;809B2E|ADBC01  |8001BC;
                       STA.W BG1SC                          ;809B31|8D0721  |802107;
                       LDA.W $01BD                          ;809B34|ADBD01  |8001BD;
                       STA.W BG2SC                          ;809B37|8D0821  |802108;
                       LDA.W $01BE                          ;809B3A|ADBE01  |8001BE;
                       STA.W BG3SC                          ;809B3D|8D0921  |802109;
                       LDA.W $01C0                          ;809B40|ADC001  |8001C0;
                       STA.W BG12NBA                        ;809B43|8D0B21  |80210B;
                       LDA.W $01C1                          ;809B46|ADC101  |8001C1;
                       STA.W BG34NBA                        ;809B49|8D0C21  |80210C;
                       LDA.W $01C9                          ;809B4C|ADC901  |8001C9;
                       STA.W W12SEL                         ;809B4F|8D2321  |802123;
                       LDA.W $01CA                          ;809B52|ADCA01  |8001CA;
                       STA.W W34SEL                         ;809B55|8D2421  |802124;
                       LDA.W $01DB                          ;809B58|ADDB01  |8001DB;
                       STA.W WOBJSEL                        ;809B5B|8D2521  |802125;
                       LDA.W $01DC                          ;809B5E|ADDC01  |8001DC;
                       STA.W WH0                            ;809B61|8D2621  |802126;
                       LDA.W $01DD                          ;809B64|ADDD01  |8001DD;
                       STA.W WH1                            ;809B67|8D2721  |802127;
                       LDA.W $01DE                          ;809B6A|ADDE01  |8001DE;
                       STA.W WH2                            ;809B6D|8D2821  |802128;
                       LDA.W $01DF                          ;809B70|ADDF01  |8001DF;
                       STA.W WH3                            ;809B73|8D2921  |802129;
                       LDA.W $01E0                          ;809B76|ADE001  |8001E0;
                       STA.W WBGLOG                         ;809B79|8D2A21  |80212A;
                       LDA.W $01E1                          ;809B7C|ADE101  |8001E1;
                       STA.W WOBJLOG                        ;809B7F|8D2B21  |80212B;
                       LDA.W $01E2                          ;809B82|ADE201  |8001E2;
                       STA.W TM                             ;809B85|8D2C21  |80212C;
                       LDA.W $01E4                          ;809B88|ADE401  |8001E4;
                       STA.W TMW                            ;809B8B|8D2E21  |80212E;
                       LDA.W $01E3                          ;809B8E|ADE301  |8001E3;
                       STA.W TS                             ;809B91|8D2D21  |80212D;
                       LDA.W $01E5                          ;809B94|ADE501  |8001E5;
                       STA.W TSW                            ;809B97|8D2F21  |80212F;
                       LDA.W $01E6                          ;809B9A|ADE601  |8001E6;
                       STA.W CGSWSEL                        ;809B9D|8D3021  |802130;
                       LDA.W $01E7                          ;809BA0|ADE701  |8001E7;
                       STA.W CGADSUB                        ;809BA3|8D3121  |802131;
                       LDA.W $01E8                          ;809BA6|ADE801  |8001E8;
                       STA.W COLDATA                        ;809BA9|8D3221  |802132;
                       LDA.W $01E9                          ;809BAC|ADE901  |8001E9;
                       STA.W COLDATA                        ;809BAF|8D3221  |802132;
                       LDA.W $01EA                          ;809BB2|ADEA01  |8001EA;
                       STA.W COLDATA                        ;809BB5|8D3221  |802132;
                       LDA.W $01EB                          ;809BB8|ADEB01  |8001EB;
                       STA.W SETINI                         ;809BBB|8D3321  |802133;
                       LDA.W $01D3                          ;809BBE|ADD301  |8001D3;
                       STA.W BG3HOFS                        ;809BC1|8D1121  |802111;
                       LDA.W $01D4                          ;809BC4|ADD401  |8001D4;
                       STA.W BG3HOFS                        ;809BC7|8D1121  |802111;
                       LDA.W $01D5                          ;809BCA|ADD501  |8001D5;
                       STA.W BG3VOFS                        ;809BCD|8D1221  |802112;
                       LDA.W $01D6                          ;809BD0|ADD601  |8001D6;
                       STA.W BG3VOFS                        ;809BD3|8D1221  |802112;
                       LDA.W $01B6                          ;809BD6|ADB601  |8001B6;
                       STA.W INIDISP                        ;809BD9|8D0021  |802100;
                       PLP                                  ;809BDC|28      |      ;
                       RTL                                  ;809BDD|6B      |      ;
 
       CODE_FL_809BDE:
                       PHP                                  ;809BDE|08      |      ;
                       SEP #$10                             ;809BDF|E210    |      ;
                       REP #$20                             ;809BE1|C220    |      ;
                       LDA.W #$0400                         ;809BE3|A90004  |      ;
                       STA.W DMA0PARAM                      ;809BE6|8D0043  |804300;
                       LDA.W #$1D00                         ;809BE9|A9001D  |      ;
                       STA.W DMA0ADDRL                      ;809BEC|8D0243  |804302;
                       LDX.B #$00                           ;809BEF|A200    |      ;
                       STX.W DMA0ADDRH                      ;809BF1|8E0443  |804304;
                       LDA.W #$0220                         ;809BF4|A92002  |      ;
                       STA.W DMA0CNTL                       ;809BF7|8D0543  |804305;
                       STZ.W OAMADDL                        ;809BFA|9C0221  |802102;
                       LDX.B #$01                           ;809BFD|A201    |      ;
                       STX.W MDMAEN                         ;809BFF|8E0B42  |80420B;
                       PLP                                  ;809C02|28      |      ;
                       RTL                                  ;809C03|6B      |      ;
 
       CODE_FL_809C04:
                       PHP                                  ;809C04|08      |      ;
                       SEP #$20                             ;809C05|E220    |      ;
 
                     - LDA.W HVBJOY                         ;809C07|AD1242  |804212;
                       AND.B #$01                           ;809C0A|2901    |      ;
                       BNE -                                ;809C0C|D0F9    |809C07;
                       REP #$20                             ;809C0E|C220    |      ;
                       LDA.W CNTRL1L                        ;809C10|AD1842  |804218;
                       BIT.W #$000F                         ;809C13|890F00  |      ;
                       BNE +                                ;809C16|D002    |809C1A;
                       STA.B $B3                            ;809C18|85B3    |0000B3;
 
                     + EOR.B $BF                            ;809C1A|45BF    |0000BF;
                       AND.B $B3                            ;809C1C|25B3    |0000B3;
                       STA.B $B7                            ;809C1E|85B7    |0000B7;
                       STA.B $BB                            ;809C20|85BB    |0000BB;
                       LDA.B $B3                            ;809C22|A5B3    |0000B3;
                       BEQ +                                ;809C24|F012    |809C38;
                       CMP.B $BF                            ;809C26|C5BF    |0000BF;
                       BNE +                                ;809C28|D00E    |809C38;
                       DEC.B $C5                            ;809C2A|C6C5    |0000C5;
                       BNE ++                               ;809C2C|D00E    |809C3C;
                       LDA.B $B3                            ;809C2E|A5B3    |0000B3;
                       STA.B $BB                            ;809C30|85BB    |0000BB;
                       LDA.B $B1                            ;809C32|A5B1    |0000B1;
                       STA.B $C5                            ;809C34|85C5    |0000C5;
                       BRA ++                               ;809C36|8004    |809C3C;
 
                     + LDA.B $AF                            ;809C38|A5AF    |0000AF;
                       STA.B $C5                            ;809C3A|85C5    |0000C5;
 
                    ++ LDA.B $B3                            ;809C3C|A5B3    |0000B3;
                       STA.B $BF                            ;809C3E|85BF    |0000BF;
                       LDA.W $02A8                          ;809C40|ADA802  |8002A8;
                       BMI +                                ;809C43|300B    |809C50;
                       BNE +                                ;809C45|D009    |809C50;
                       LDA.L $7E9349                        ;809C47|AF49937E|7E9349;
                       BNE +                                ;809C4B|D003    |809C50;
                       JMP.W CODE_JP_809C82                 ;809C4D|4C829C  |809C82;
 
                     + LDA.W CNTRL2L                        ;809C50|AD1A42  |80421A;
                       BIT.W #$000F                         ;809C53|890F00  |      ;
                       BNE +                                ;809C56|D002    |809C5A;
                       STA.B $B5                            ;809C58|85B5    |0000B5;
 
                     + EOR.B $C7                            ;809C5A|45C7    |0000C7;
                       AND.B $B5                            ;809C5C|25B5    |0000B5;
                       STA.B $B9                            ;809C5E|85B9    |0000B9;
                       STA.B $BD                            ;809C60|85BD    |0000BD;
                       LDA.B $B5                            ;809C62|A5B5    |0000B5;
                       BEQ +                                ;809C64|F012    |809C78;
                       CMP.B $C7                            ;809C66|C5C7    |0000C7;
                       BNE +                                ;809C68|D00E    |809C78;
                       DEC.B $CD                            ;809C6A|C6CD    |0000CD;
                       BNE ++                               ;809C6C|D00E    |809C7C;
                       LDA.B $B5                            ;809C6E|A5B5    |0000B5;
                       STA.B $BD                            ;809C70|85BD    |0000BD;
                       LDA.B $B1                            ;809C72|A5B1    |0000B1;
                       STA.B $CD                            ;809C74|85CD    |0000CD;
                       BRA ++                               ;809C76|8004    |809C7C;
 
 
                     + LDA.B $AF                            ;809C78|A5AF    |0000AF;
                       STA.B $CD                            ;809C7A|85CD    |0000CD;
 
                    ++ LDA.B $B5                            ;809C7C|A5B5    |0000B5;
                       STA.B $C7                            ;809C7E|85C7    |0000C7;
                       PLP                                  ;809C80|28      |      ;
                       RTL                                  ;809C81|6B      |      ;
 
       CODE_JP_809C82:
                       STZ.B $B5                            ;809C82|64B5    |0000B5;
                       STZ.B $B9                            ;809C84|64B9    |0000B9;
                       STZ.B $BD                            ;809C86|64BD    |0000BD;
                       PLP                                  ;809C88|28      |      ;
                       RTL                                  ;809C89|6B      |      ;
 
       CODE_FL_809C8A:
                       PHP                                  ;809C8A|08      |      ;
                       REP #$30                             ;809C8B|C230    |      ;
                       LDA.W #$0080                         ;809C8D|A98000  |      ;
                       STA.W VMAINC                         ;809C90|8D1521  |892115;
                       STZ.W VMADDL                         ;809C93|9C1621  |892116;
                       STZ.W VMADDH                         ;809C96|9C1721  |892117;
                       SEP #$20                             ;809C99|E220    |      ;
                       LDA.B #$09                           ;809C9B|A909    |      ;
                       STA.W DMA0PARAM                      ;809C9D|8D0043  |894300;
                       LDA.B #$18                           ;809CA0|A918    |      ;
                       STA.W DMA0REG                        ;809CA2|8D0143  |894301;
                       LDA.B #$C8                           ;809CA5|A9C8    |      ;
                       STA.W DMA0ADDRL                      ;809CA7|8D0243  |894302;
                       LDA.B #$9C                           ;809CAA|A99C    |      ;
                       STA.W DMA0ADDRM                      ;809CAC|8D0343  |894303;
                       LDA.B #$80                           ;809CAF|A980    |      ;
                       STA.W DMA0ADDRH                      ;809CB1|8D0443  |894304;
                       LDA.B #$00                           ;809CB4|A900    |      ;
                       STA.W DMA0CNTL                       ;809CB6|8D0543  |894305;
                       LDA.B #$00                           ;809CB9|A900    |      ;
                       STA.W DMA0CNTH                       ;809CBB|8D0643  |894306;
                       REP #$20                             ;809CBE|C220    |      ;
                       LDA.W #$0001                         ;809CC0|A90100  |      ;
                       STA.W MDMAEN                         ;809CC3|8D0B42  |89420B;
                       PLP                                  ;809CC6|28      |      ;
                       RTL                                  ;809CC7|6B      |      ;
                       db $00,$00                           ;809CC8|        |      ;
 
       CODE_FL_809CCA:
                       PHP                                  ;809CCA|08      |      ;
                       SEP #$20                             ;809CCB|E220    |      ;
                       LDA.B #$01                           ;809CCD|A901    |      ;
                       STA.B $A5                            ;809CCF|85A5    |0000A5;
 
                     - LDA.B $A5                            ;809CD1|A5A5    |0000A5;
                       BNE -                                ;809CD3|D0FC    |809CD1;
                       PLP                                  ;809CD5|28      |      ;
                       RTL                                  ;809CD6|6B      |      ;
 
            EnableNMI:
                       PHP                                  ;809CD7|08      |      ;
                       SEP #$20                             ;809CD8|E220    |      ;
                       LDA.W $01EC                          ;809CDA|ADEC01  |0001EC;
                       ORA.B #$80                           ;809CDD|0980    |      ;
                       STA.W NMITIMEN                       ;809CDF|8D0042  |004200;
                       STA.W $01EC                          ;809CE2|8DEC01  |0001EC;
                       PLP                                  ;809CE5|28      |      ;
                       RTL                                  ;809CE6|6B      |      ;
 
           DisableNMI:
                       PHP                                  ;809CE7|08      |      ;
                       SEP #$20                             ;809CE8|E220    |      ;
                       LDA.W $01EC                          ;809CEA|ADEC01  |0001EC;
                       AND.B #$7F                           ;809CED|297F    |      ;
                       STA.W NMITIMEN                       ;809CEF|8D0042  |004200;
                       STA.W $01EC                          ;809CF2|8DEC01  |0001EC;
                       PLP                                  ;809CF5|28      |      ;
                       RTL                                  ;809CF6|6B      |      ;
 
 
       CODE_FL_809CF7:
                       PHP                                  ;809CF7|08      |      ;
                       SEP #$20                             ;809CF8|E220    |      ;
                       LDA.W $01B6                          ;809CFA|ADB601  |8301B6;
                       ORA.B #$80                           ;809CFD|0980    |      ;
                       STA.W $01B6                          ;809CFF|8DB601  |8301B6;
                       STA.W INIDISP                        ;809D02|8D0021  |832100;
                       JSL.L CODE_FL_809CCA                 ;809D05|22CA9C80|809CCA;
                       PLP                                  ;809D09|28      |      ;
                       RTL                                  ;809D0A|6B      |      ;
 
       CODE_FL_809D0B:
                       PHP                                  ;809D0B|08      |      ;
                       SEP #$20                             ;809D0C|E220    |      ;
                       LDA.W $01B6                          ;809D0E|ADB601  |8701B6;
                       AND.B #$7F                           ;809D11|297F    |      ;
                       STA.W $01B6                          ;809D13|8DB601  |8701B6;
                       STA.W INIDISP                        ;809D16|8D0021  |872100;
                       JSL.L CODE_FL_809CCA                 ;809D19|22CA9C80|809CCA;
                       PLP                                  ;809D1D|28      |      ;
                       RTL                                  ;809D1E|6B      |      ;
                       PHP                                  ;809D1F|08      |      ;
                       SEP #$20                             ;809D20|E220    |      ;
                       LDA.W $01EC                          ;809D22|ADEC01  |8701EC;
                       ORA.B #$10                           ;809D25|0910    |      ;
                       STA.W $01EC                          ;809D27|8DEC01  |8701EC;
                       STA.W NMITIMEN                       ;809D2A|8D0042  |874200;
                       PLP                                  ;809D2D|28      |      ;
                       RTL                                  ;809D2E|6B      |      ;
 
                       db $08,$E2,$20,$AD,$EC,$01,$29,$EF   ;809D2F|        |      ;
                       db $8D,$00,$42,$8D,$EC,$01,$28,$6B   ;809D37|        |      ;
                       db $08,$E2,$20,$AD,$EC,$01,$09,$20   ;809D3F|        |      ;
                       db $8D,$00,$42,$8D,$EC,$01,$28,$6B   ;809D47|        |      ;
                       db $08,$E2,$20,$AD,$EC,$01,$29,$DF   ;809D4F|        |      ;
                       db $8D,$00,$42,$8D,$EC,$01,$28,$6B   ;809D57|        |      ;
                       db $A9,$00,$8D,$00,$43,$A9,$04,$8D   ;809D5F|        |      ;
                       db $01,$43,$A9,$00,$8D,$02,$43,$A9   ;809D67|        |      ;
                       db $1D,$8D,$03                       ;809D6F|        |      ;
                       db $43                               ;809D72|        |0000A9;
                       db $A9,$00,$8D,$04,$43,$A9,$20,$8D   ;809D73|        |      ;
                       db $05,$43,$A9,$02,$8D,$06,$43,$A9   ;809D7B|        |      ;
                       db $01,$8D,$0B,$42,$AD,$B9,$01,$8D   ;809D83|        |      ;
                       db $03                               ;809D8B|        |      ;
                       db $21                               ;809D8C|        |0000AD;
                       db $AD,$B8,$01,$8D,$02,$21           ;809D8D|        |      ;
 
                     - RTL                                  ;809D93|6B      |      ;
 
       CODE_FL_809D94:
                       LDA.W $01B2                          ;809D94|ADB201  |8001B2;
                       BEQ -                                ;809D97|F0FA    |809D93;
                       STZ.W $01B2                          ;809D99|9CB201  |8001B2;
                       STZ.W $01B0                          ;809D9C|9CB001  |8001B0;
                       STZ.W $01B1                          ;809D9F|9CB101  |8001B1;
                       STZ.W HDMAEN                         ;809DA2|9C0C42  |80420C;
                       STZ.W MDMAEN                         ;809DA5|9C0B42  |80420B;
                       LDY.B #$00                           ;809DA8|A000    |      ;
 
       CODE_JP_809DAA:
                       LDA.W $00F0,Y                        ;809DAA|B9F000  |8000F0;
                       BEQ +                                ;809DAD|F007    |809DB6;
                       DEC A                                ;809DAF|3A      |      ;
                       BEQ ++                               ;809DB0|F005    |809DB7;
                       DEC A                                ;809DB2|3A      |      ;
                       BEQ +++                              ;809DB3|F03B    |809DF0;
                       db $00                               ;809DB5|        |      ;
 
                     + RTL                                  ;809DB6|6B      |      ;
 
                    ++ LDA.W $00F1,Y                        ;809DB7|B9F100  |8000F1;
                       STA.W DMA0ADDRL                      ;809DBA|8D0243  |804302;
                       LDA.W $00F2,Y                        ;809DBD|B9F200  |8000F2;
                       STA.W DMA0ADDRM                      ;809DC0|8D0343  |804303;
                       LDA.W $00F3,Y                        ;809DC3|B9F300  |8000F3;
                       STA.W DMA0ADDRH                      ;809DC6|8D0443  |804304;
                       LDA.W $00F4,Y                        ;809DC9|B9F400  |8000F4;
                       STA.W DMA0CNTL                       ;809DCC|8D0543  |804305;
                       LDA.W $00F5,Y                        ;809DCF|B9F500  |8000F5;
                       STA.W DMA0CNTH                       ;809DD2|8D0643  |804306;
                       LDA.W $00F6,Y                        ;809DD5|B9F600  |8000F6;
                       STA.W CGADD                          ;809DD8|8D2121  |802121;
                       STZ.W DMA0PARAM                      ;809DDB|9C0043  |804300;
                       LDA.B #$22                           ;809DDE|A922    |      ;
                       STA.W DMA0REG                        ;809DE0|8D0143  |804301;
                       LDA.B #$01                           ;809DE3|A901    |      ;
                       STA.W MDMAEN                         ;809DE5|8D0B42  |80420B;
                       TYA                                  ;809DE8|98      |      ;
                       CLC                                  ;809DE9|18      |      ;
                       ADC.B #$07                           ;809DEA|6907    |      ;
                       TAY                                  ;809DEC|A8      |      ;
                       JMP.W CODE_JP_809DAA                 ;809DED|4CAA9D  |809DAA;
 
                   +++ LDA.W $00F1,Y                        ;809DF0|B9F100  |8000F1;
                       STA.W DMA0ADDRL                      ;809DF3|8D0243  |804302;
                       LDA.W $00F2,Y                        ;809DF6|B9F200  |8000F2;
                       STA.W DMA0ADDRM                      ;809DF9|8D0343  |804303;
                       LDA.W $00F3,Y                        ;809DFC|B9F300  |8000F3;
                       STA.W DMA0ADDRH                      ;809DFF|8D0443  |804304;
                       LDA.W $00F4,Y                        ;809E02|B9F400  |8000F4;
                       STA.W DMA0CNTL                       ;809E05|8D0543  |804305;
                       LDA.W $00F5,Y                        ;809E08|B9F500  |8000F5;
                       STA.W DMA0CNTH                       ;809E0B|8D0643  |804306;
                       LDA.W $00F6,Y                        ;809E0E|B9F600  |8000F6;
                       STA.W VMAINC                         ;809E11|8D1521  |802115;
                       LDA.W $00F7,Y                        ;809E14|B9F700  |8000F7;
                       STA.W VMADDL                         ;809E17|8D1621  |802116;
                       LDA.W $00F8,Y                        ;809E1A|B9F800  |8000F8;
                       STA.W VMADDH                         ;809E1D|8D1721  |802117;
                       LDA.B #$01                           ;809E20|A901    |      ;
                       STA.W DMA0PARAM                      ;809E22|8D0043  |804300;
                       LDA.B #$18                           ;809E25|A918    |      ;
                       STA.W DMA0REG                        ;809E27|8D0143  |804301;
                       LDA.B #$01                           ;809E2A|A901    |      ;
                       STA.W MDMAEN                         ;809E2C|8D0B42  |80420B;
                       TYA                                  ;809E2F|98      |      ;
                       CLC                                  ;809E30|18      |      ;
                       ADC.B #$09                           ;809E31|6909    |      ;
                       TAY                                  ;809E33|A8      |      ;
                       JMP.W CODE_JP_809DAA                 ;809E34|4CAA9D  |809DAA;
                       db $6B                               ;809E37|        |      ;
 
       CODE_FL_809E38:
                       PHP                                  ;809E38|08      |      ;
                       PHB                                  ;809E39|8B      |      ;
                       PHK                                  ;809E3A|4B      |      ;
                       PLB                                  ;809E3B|AB      |      ;
                       REP #$30                             ;809E3C|C230    |      ;
                       STZ.W $0292                          ;809E3E|9C9202  |800292;
                       LDY.W #$0000                         ;809E41|A00000  |      ;
                       LDA.W #$F400                         ;809E44|A900F4  |      ;
                       CPY.W $0292                          ;809E47|CC9202  |800292;
                       BCS +                                ;809E4A|B011    |809E5D;
                       db $C0,$00,$02,$B0,$0C,$99,$00,$1D   ;809E4C|        |      ;
                       db $99,$02,$1D,$C8,$C8,$C8,$C8,$80   ;809E54|        |      ;
                       db $EA                               ;809E5C|        |      ;
 
                     + LDA.W $0292                          ;809E5D|AD9202  |800292;
                       LSR A                                ;809E60|4A      |      ;
                       LSR A                                ;809E61|4A      |      ;
                       STA.W WRDIVL                         ;809E62|8D0442  |804204;
                       XBA                                  ;809E65|EB      |      ;
                       AND.W #$00FF                         ;809E66|29FF00  |      ;
                       ORA.W #$0800                         ;809E69|090008  |      ;
                       STA.W WRDIVH                         ;809E6C|8D0542  |804205;
                       NOP                                  ;809E6F|EA      |      ;
                       NOP                                  ;809E70|EA      |      ;
                       NOP                                  ;809E71|EA      |      ;
                       NOP                                  ;809E72|EA      |      ;
                       NOP                                  ;809E73|EA      |      ;
                       NOP                                  ;809E74|EA      |      ;
                       NOP                                  ;809E75|EA      |      ;
                       LDA.W RDDIVL                         ;809E76|AD1442  |804214;
                       ASL A                                ;809E79|0A      |      ;
                       STA.B $00                            ;809E7A|8500    |000000;
                       LDA.W RDMPYL                         ;809E7C|AD1642  |804216;
                       STA.B $02                            ;809E7F|8502    |000002;
                       LDX.W #$0000                         ;809E81|A20000  |      ;
                       CPX.B $00                            ;809E84|E400    |000000;
                       BCS +                                ;809E86|B007    |809E8F;
                       db $9E,$00,$1F,$E8,$E8,$80,$F5       ;809E88|        |001F00;
 
                     + LDA.B $02                            ;809E8F|A502    |000002;
                       BEQ +                                ;809E91|F010    |809EA3;
                       db $A4,$00,$A5,$02,$3A,$0A,$AA,$B9   ;809E93|        |000000;
                       db $00,$1F,$3D,$0D,$9F,$99,$00,$1F   ;809E9B|        |      ;
 
                     + LDY.W $0294                          ;809EA3|AC9402  |800294;
                       LDA.W #$F400                         ;809EA6|A900F4  |      ;
 
                     - CPY.W #$0200                         ;809EA9|C00002  |      ;
                       BCS +                                ;809EAC|B00C    |809EBA;
                       STA.W $1D00,Y                        ;809EAE|99001D  |801D00;
                       STA.W $1D02,Y                        ;809EB1|99021D  |801D02;
                       INY                                  ;809EB4|C8      |      ;
                       INY                                  ;809EB5|C8      |      ;
                       INY                                  ;809EB6|C8      |      ;
                       INY                                  ;809EB7|C8      |      ;
                       BRA -                                ;809EB8|80EF    |809EA9;
 
                     + LDA.W $0294                          ;809EBA|AD9402  |800294;
                       LSR A                                ;809EBD|4A      |      ;
                       LSR A                                ;809EBE|4A      |      ;
                       STA.W WRDIVL                         ;809EBF|8D0442  |804204;
                       XBA                                  ;809EC2|EB      |      ;
                       AND.W #$00FF                         ;809EC3|29FF00  |      ;
                       ORA.W #$0800                         ;809EC6|090008  |      ;
                       STA.W WRDIVH                         ;809EC9|8D0542  |804205;
                       NOP                                  ;809ECC|EA      |      ;
                       NOP                                  ;809ECD|EA      |      ;
                       NOP                                  ;809ECE|EA      |      ;
                       NOP                                  ;809ECF|EA      |      ;
                       NOP                                  ;809ED0|EA      |      ;
                       NOP                                  ;809ED1|EA      |      ;
                       NOP                                  ;809ED2|EA      |      ;
                       LDA.W RDDIVL                         ;809ED3|AD1442  |804214;
                       ASL A                                ;809ED6|0A      |      ;
                       STA.B $00                            ;809ED7|8500    |000000;
                       LDA.W RDMPYL                         ;809ED9|AD1642  |804216;
                       STA.B $02                            ;809EDC|8502    |000002;
                       LDX.B $00                            ;809EDE|A600    |000000;
 
                     - CPX.W #$0020                         ;809EE0|E02000  |      ;
                       BCS +                                ;809EE3|B007    |809EEC;
                       STZ.W $1F00,X                        ;809EE5|9E001F  |801F00;
                       INX                                  ;809EE8|E8      |      ;
                       INX                                  ;809EE9|E8      |      ;
                       BRA -                                ;809EEA|80F4    |809EE0;
 
                     + LDA.B $02                            ;809EEC|A502    |000002;
                       BEQ +                                ;809EEE|F017    |809F07;
                       db $A6,$00,$A5,$02,$3A,$0A,$A8,$B9   ;809EF0|        |000000;
                       db $0D,$9F,$49,$FF,$FF,$85,$04,$BD   ;809EF8|        |00499F;
                       db $00,$1F,$25,$04,$9D,$00,$1F       ;809F00|        |      ;
 
                     + STZ.W $0284                          ;809F07|9C8402  |800284;
                       PLB                                  ;809F0A|AB      |      ;
                       PLP                                  ;809F0B|28      |      ;
                       RTL                                  ;809F0C|6B      |      ;
                       db $03,$00,$0F,$00,$3F,$00,$FF,$00   ;809F0D|        |000000;
                       db $FF,$03,$FF,$0F,$FF,$3F,$08,$8B   ;809F15|        |0FFF03;
                       db $4B,$AB,$E2,$20,$C2,$10,$9F,$24   ;809F1D|        |      ;
                       db $00,$00,$E8,$88,$D0,$F8,$AB,$28   ;809F25|        |      ;
                       db $6B,$08,$8B,$4B,$AB,$C2,$30,$9F   ;809F2D|        |      ;
                       db $24,$00,$00,$E8,$E8,$88,$88,$D0   ;809F35|        |000000;
                       db $F6,$AB,$28,$6B,$08,$8B,$4B,$AB   ;809F3D|        |0000AB;
                       db $E2,$20,$C2,$10,$9F,$00,$00,$7E   ;809F45|        |      ;
                       db $E8,$88,$D0,$F8,$AB,$28,$6B       ;809F4D|        |      ;
 
       CODE_FL_809F54:
                       PHP                                  ;809F54|08      |      ;
                       PHB                                  ;809F55|8B      |      ;
                       PHK                                  ;809F56|4B      |      ;
                       PLB                                  ;809F57|AB      |      ;
                       REP #$30                             ;809F58|C230    |      ;
 
                     - STA.L $7E0000,X                      ;809F5A|9F00007E|7E0000;
                       INX                                  ;809F5E|E8      |      ;
                       INX                                  ;809F5F|E8      |      ;
                       DEY                                  ;809F60|88      |      ;
                       DEY                                  ;809F61|88      |      ;
                       BNE -                                ;809F62|D0F6    |809F5A;
                       PLB                                  ;809F64|AB      |      ;
                       PLP                                  ;809F65|28      |      ;
                       RTL                                  ;809F66|6B      |      ;
                       db $08,$8B,$4B,$AB,$C2,$30,$9F,$00   ;809F67|        |      ;
                       db $00,$7F,$E8,$E8,$88,$88,$D0,$F6   ;809F6F|        |      ;
                       db $AB,$28,$6B                       ;809F77|        |      ;
 
       CODE_FL_809F7A:
                       PHB                                  ;809F7A|8B      |      ;
                       PHK                                  ;809F7B|4B      |      ;
                       PLB                                  ;809F7C|AB      |      ;
                       PHX                                  ;809F7D|DA      |      ;
                       PHY                                  ;809F7E|5A      |      ;
                       PHA                                  ;809F7F|48      |      ;
                       PHP                                  ;809F80|08      |      ;
                       REP #$20                             ;809F81|C220    |      ;
                       SEP #$10                             ;809F83|E210    |      ;
                       LDX.B $14                            ;809F85|A614    |000014;
                       STX.W WRMPYA                         ;809F87|8E0242  |804202;
                       LDX.B $16                            ;809F8A|A616    |000016;
                       STX.W WRMPYB                         ;809F8C|8E0342  |804203;
                       NOP                                  ;809F8F|EA      |      ;
                       NOP                                  ;809F90|EA      |      ;
                       NOP                                  ;809F91|EA      |      ;
                       LDA.W RDMPYL                         ;809F92|AD1642  |804216;
                       STA.B $18                            ;809F95|8518    |000018;
                       LDX.B $15                            ;809F97|A615    |000015;
                       STX.W WRMPYA                         ;809F99|8E0242  |804202;
                       LDX.B $17                            ;809F9C|A617    |000017;
                       STX.W WRMPYB                         ;809F9E|8E0342  |804203;
                       NOP                                  ;809FA1|EA      |      ;
                       NOP                                  ;809FA2|EA      |      ;
                       NOP                                  ;809FA3|EA      |      ;
                       LDX.W RDMPYL                         ;809FA4|AE1642  |804216;
                       STX.B $1A                            ;809FA7|861A    |00001A;
                       LDY.W RDMPYH                         ;809FA9|AC1742  |804217;
                       LDX.B $15                            ;809FAC|A615    |000015;
                       STX.W WRMPYA                         ;809FAE|8E0242  |804202;
                       LDX.B $16                            ;809FB1|A616    |000016;
                       STX.W WRMPYB                         ;809FB3|8E0342  |804203;
                       NOP                                  ;809FB6|EA      |      ;
                       NOP                                  ;809FB7|EA      |      ;
                       LDA.B $19                            ;809FB8|A519    |000019;
                       CLC                                  ;809FBA|18      |      ;
                       ADC.W RDMPYL                         ;809FBB|6D1642  |804216;
                       STA.B $19                            ;809FBE|8519    |000019;
                       BCC +                                ;809FC0|9001    |809FC3;
                       db $C8                               ;809FC2|        |      ;
 
                     + LDX.B $14                            ;809FC3|A614    |000014;
                       STX.W WRMPYA                         ;809FC5|8E0242  |804202;
                       LDX.B $17                            ;809FC8|A617    |000017;
                       STX.W WRMPYB                         ;809FCA|8E0342  |804203;
                       NOP                                  ;809FCD|EA      |      ;
                       NOP                                  ;809FCE|EA      |      ;
                       LDA.B $19                            ;809FCF|A519    |000019;
                       CLC                                  ;809FD1|18      |      ;
                       ADC.W RDMPYL                         ;809FD2|6D1642  |804216;
                       STA.B $19                            ;809FD5|8519    |000019;
                       BCC +                                ;809FD7|9001    |809FDA;
                       db $C8                               ;809FD9|        |      ;
 
                     + STY.B $1B                            ;809FDA|841B    |00001B;
                       PLP                                  ;809FDC|28      |      ;
                       PLA                                  ;809FDD|68      |      ;
                       PLY                                  ;809FDE|7A      |      ;
                       PLX                                  ;809FDF|FA      |      ;
                       PLB                                  ;809FE0|AB      |      ;
                       RTL                                  ;809FE1|6B      |      ;
                       db $08,$8B,$4B,$AB,$C2,$30,$64,$1C   ;809FE2|        |      ;
                       db $64,$1E,$64,$20,$64,$22,$A2,$20   ;809FEA|        |00001E;
                       db $00,$46,$16,$66,$14,$90,$0D,$A5   ;809FF2|        |      ;
                       db $18,$18,$65,$20,$85,$20,$A5,$1A   ;809FFA|        |      ;
                       db $65,$22,$85,$22,$66,$22,$66,$20   ;80A002|        |000022;
                       db $66,$1E,$66,$1C,$CA,$D0,$E2,$AB   ;80A00A|        |00001E;
                       db $28,$6B                           ;80A012|        |      ;
 
       CODE_FL_80A014:
                       PHP                                  ;80A014|08      |      ;
                       PHB                                  ;80A015|8B      |      ;
                       PHK                                  ;80A016|4B      |      ;
                       PLB                                  ;80A017|AB      |      ;
                       REP #$30                             ;80A018|C230    |      ;
                       STZ.B $14                            ;80A01A|6414    |000014;
                       LDA.B $1C                            ;80A01C|A51C    |00001C;
                       BNE +                                ;80A01E|D004    |80A024;
                       db $64,$1A,$80,$18                   ;80A020|        |00001A;
 
                     + LDX.W #$0011                         ;80A024|A21100  |      ;
                       CLC                                  ;80A027|18      |      ;
 
                     - ROL.B $1A                            ;80A028|261A    |00001A;
                       DEX                                  ;80A02A|CA      |      ;
                       BEQ +                                ;80A02B|F00F    |80A03C;
                       ROL.B $14                            ;80A02D|2614    |000014;
                       LDA.B $14                            ;80A02F|A514    |000014;
                       BEQ -                                ;80A031|F0F5    |80A028;
                       SEC                                  ;80A033|38      |      ;
                       SBC.B $1C                            ;80A034|E51C    |00001C;
                       BCC -                                ;80A036|90F0    |80A028;
                       STA.B $14                            ;80A038|8514    |000014;
                       BRA -                                ;80A03A|80EC    |80A028;
 
                     + PLB                                  ;80A03C|AB      |      ;
                       PLP                                  ;80A03D|28      |      ;
                       RTL                                  ;80A03E|6B      |      ;
                       db $08,$8B,$4B,$AB,$C2,$30,$64,$16   ;80A03F|        |      ;
                       db $64,$14,$A5,$1E,$05,$1C,$D0,$06   ;80A047|        |000014;
                       db $64,$1A,$64,$18,$80,$27,$A2,$21   ;80A04F|        |00001A;
                       db $00,$18,$26,$18,$26,$1A,$CA,$F0   ;80A057|        |      ;
                       db $1C,$26,$14,$26,$16,$A5,$16,$05   ;80A05F|        |001426;
                       db $14,$F0,$EF,$A5,$14,$38,$E5,$1C   ;80A067|        |0000F0;
                       db $A8,$A5,$16,$E5,$1E,$90,$E3,$85   ;80A06F|        |      ;
                       db $16,$84,$14,$80,$DD,$AB,$28,$6B   ;80A077|        |000084;
 
       CODE_FL_80A07F:
                       PHP                                  ;80A07F|08      |      ;
                       REP #$30                             ;80A080|C230    |      ;
                       LDA.L $0001B0                        ;80A082|AFB00100|0001B0;
                       TAX                                  ;80A086|AA      |      ;
                       CLC                                  ;80A087|18      |      ;
                       ADC.W #$0007                         ;80A088|690700  |      ;
                       STA.L $0001B0                        ;80A08B|8FB00100|0001B0;
                       LDA.W $0000,Y                        ;80A08F|B90000  |830000;
                       STA.L $0000F1,X                      ;80A092|9FF10000|0000F1;
                       LDA.W $0002,Y                        ;80A096|B90200  |830002;
                       STA.L $0000F3,X                      ;80A099|9FF30000|0000F3;
                       LDA.W $0004,Y                        ;80A09D|B90400  |830004;
                       STA.L $0000F5,X                      ;80A0A0|9FF50000|0000F5;
                       SEP #$20                             ;80A0A4|E220    |      ;
                       LDA.B #$01                           ;80A0A6|A901    |      ;
                       STA.L $0000F0,X                      ;80A0A8|9FF00000|0000F0;
                       LDA.B #$00                           ;80A0AC|A900    |      ;
                       STA.L $0000F7,X                      ;80A0AE|9FF70000|0000F7;
                       SEP #$30                             ;80A0B2|E230    |      ;
                       LDA.B #$01                           ;80A0B4|A901    |      ;
                       STA.L $0001B2                        ;80A0B6|8FB20100|0001B2;
                       LDA.L $0001B6                        ;80A0BA|AFB60100|0001B6;
                       BPL +                                ;80A0BE|1008    |80A0C8;
                       PHB                                  ;80A0C0|8B      |      ;
                       PHK                                  ;80A0C1|4B      |      ;
                       PLB                                  ;80A0C2|AB      |      ;
                       JSL.L CODE_FL_809D94                 ;80A0C3|22949D80|809D94;
                       PLB                                  ;80A0C7|AB      |      ;
 
                     + PLP                                  ;80A0C8|28      |      ;
                       RTL                                  ;80A0C9|6B      |      ;
 
       CODE_FL_80A0CA:
                       PHP                                  ;80A0CA|08      |      ;
                       REP #$30                             ;80A0CB|C230    |      ;
                       LDA.L $0001B0                        ;80A0CD|AFB00100|0001B0;
                       TAX                                  ;80A0D1|AA      |      ;
                       CLC                                  ;80A0D2|18      |      ;
                       ADC.W #$0009                         ;80A0D3|690900  |      ;
                       STA.L $0001B0                        ;80A0D6|8FB00100|0001B0;
                       LDA.W $0000,Y                        ;80A0DA|B90000  |7E0000;
                       STA.L $0000F1,X                      ;80A0DD|9FF10000|0000F1;
                       LDA.W $0002,Y                        ;80A0E1|B90200  |7E0002;
                       STA.L $0000F3,X                      ;80A0E4|9FF30000|0000F3;
                       LDA.W $0004,Y                        ;80A0E8|B90400  |7E0004;
                       STA.L $0000F5,X                      ;80A0EB|9FF50000|0000F5;
                       LDA.W $0006,Y                        ;80A0EF|B90600  |7E0006;
                       STA.L $0000F7,X                      ;80A0F2|9FF70000|0000F7;
                       SEP #$20                             ;80A0F6|E220    |      ;
                       LDA.B #$02                           ;80A0F8|A902    |      ;
                       STA.L $0000F0,X                      ;80A0FA|9FF00000|0000F0;
                       LDA.B #$00                           ;80A0FE|A900    |      ;
                       STA.L $0000F9,X                      ;80A100|9FF90000|0000F9;
                       SEP #$30                             ;80A104|E230    |      ;
                       LDA.B #$01                           ;80A106|A901    |      ;
                       STA.L $0001B2                        ;80A108|8FB20100|0001B2;
                       LDA.L $0001B6                        ;80A10C|AFB60100|0001B6;
                       BPL +                                ;80A110|1008    |80A11A;
                       PHB                                  ;80A112|8B      |      ;
                       PHK                                  ;80A113|4B      |      ;
                       PLB                                  ;80A114|AB      |      ;
                       JSL.L CODE_FL_809D94                 ;80A115|22949D80|809D94;
                       PLB                                  ;80A119|AB      |      ;
 
                     + PLP                                  ;80A11A|28      |      ;
                       RTL                                  ;80A11B|6B      |      ;
 
       CODE_FL_80A11C:
                       SEP #$20                             ;80A11C|E220    |      ;
                       LDA.B #$00                           ;80A11E|A900    |      ;
                       STA.W HDMA0LINES                     ;80A120|8D0A43  |80430A;
                       STA.W HDMA1LINES                     ;80A123|8D1A43  |80431A;
                       STA.W HDMA2LINES                     ;80A126|8D2A43  |80432A;
                       STA.W HDMA3LINES                     ;80A129|8D3A43  |80433A;
                       STA.W HDMA4LINES                     ;80A12C|8D4A43  |80434A;
                       STA.W HDMA5LINES                     ;80A12F|8D5A43  |80435A;
                       STA.W HDMA6LINES                     ;80A132|8D6A43  |80436A;
                       STA.W HDMA7LINES                     ;80A135|8D7A43  |80437A;
                       LDA.W $01F1                          ;80A138|ADF101  |8001F1;
                       ORA.W $021E                          ;80A13B|0D1E02  |80021E;
                       STA.W HDMAEN                         ;80A13E|8D0C42  |80420C;
                       STZ.W $01F1                          ;80A141|9CF101  |8001F1;
                       RTL                                  ;80A144|6B      |      ;
 
       CODE_FL_80A145:
                       PHP                                  ;80A145|08      |      ;
                       SEP #$20                             ;80A146|E220    |      ;
                       PHB                                  ;80A148|8B      |      ;
                       PHK                                  ;80A149|4B      |      ;
                       PLB                                  ;80A14A|AB      |      ;
                       STZ.W MDMAEN                         ;80A14B|9C0B42  |80420B;
                       STZ.W HDMAEN                         ;80A14E|9C0C42  |80420C;
                       STZ.W $01F1                          ;80A151|9CF101  |8001F1;
                       STZ.W $021E                          ;80A154|9C1E02  |80021E;
                       STZ.W HDMA0LINES                     ;80A157|9C0A43  |80430A;
                       STZ.W HDMA1LINES                     ;80A15A|9C1A43  |80431A;
                       STZ.W HDMA2LINES                     ;80A15D|9C2A43  |80432A;
                       STZ.W HDMA3LINES                     ;80A160|9C3A43  |80433A;
                       STZ.W HDMA4LINES                     ;80A163|9C4A43  |80434A;
                       STZ.W HDMA5LINES                     ;80A166|9C5A43  |80435A;
                       STZ.W HDMA6LINES                     ;80A169|9C6A43  |80436A;
                       STZ.W HDMA7LINES                     ;80A16C|9C7A43  |80437A;
                       LDA.B #$81                           ;80A16F|A981    |      ;
                       STA.W NMITIMEN                       ;80A171|8D0042  |804200;
                       PLB                                  ;80A174|AB      |      ;
                       PLP                                  ;80A175|28      |      ;
                       RTL                                  ;80A176|6B      |      ;
                       db $08,$8B,$4B,$AB,$E2,$20,$8D,$73   ;80A177|        |      ;
                       db $02,$22,$CA,$9C,$80,$CE,$73,$02   ;80A17F|        |      ;
                       db $D0,$F7,$AB,$28,$6B,$C2,$30,$A9   ;80A187|        |80A180;
                       db $00,$00,$A2,$00,$20,$A0,$00,$E0   ;80A18F|        |      ;
                       db $22,$54,$9F,$80,$A9,$00,$00,$AA   ;80A197|        |809F54;
                       db $A0,$FE,$DF,$22,$67,$9F,$80,$E2   ;80A19F|        |      ;
                       db $30,$60                           ;80A1A7|        |80A209;
 
       CODE_FN_80A1A9:
                       REP #$30                             ;80A1A9|C230    |      ;
                       LDA.W #$1C2F                         ;80A1AB|A92F1C  |      ;
                       JSL.L CODE_FL_80A1CF                 ;80A1AE|22CFA180|80A1CF;
                       LDA.W #$1C2F                         ;80A1B2|A92F1C  |      ;
                       JSL.L CODE_FL_80A1E0                 ;80A1B5|22E0A180|80A1E0;
                       LDA.W #$1C2F                         ;80A1B9|A92F1C  |      ;
                       JSL.L CODE_FL_80A1F1                 ;80A1BC|22F1A180|80A1F1;
                       SEP #$30                             ;80A1C0|E230    |      ;
                       JSL.L CODE_FL_80A202                 ;80A1C2|2202A280|80A202;
                       JSL.L CODE_FL_80A220                 ;80A1C6|2220A280|80A220;
                       JSL.L CODE_FL_80A23E                 ;80A1CA|223EA280|80A23E;
                       RTS                                  ;80A1CE|60      |      ;
 
       CODE_FL_80A1CF:
                       PHP                                  ;80A1CF|08      |      ;
                       PHB                                  ;80A1D0|8B      |      ;
                       REP #$30                             ;80A1D1|C230    |      ;
                       LDX.W #$2000                         ;80A1D3|A20020  |      ;
                       LDY.W #$0800                         ;80A1D6|A00008  |      ;
                       JSL.L CODE_FL_809F54                 ;80A1D9|22549F80|809F54;
                       PLB                                  ;80A1DD|AB      |      ;
                       PLP                                  ;80A1DE|28      |      ;
                       RTL                                  ;80A1DF|6B      |      ;
 
       CODE_FL_80A1E0:
                       PHP                                  ;80A1E0|08      |      ;
                       PHB                                  ;80A1E1|8B      |      ;
                       REP #$30                             ;80A1E2|C230    |      ;
                       LDX.W #$2800                         ;80A1E4|A20028  |      ;
                       LDY.W #$0800                         ;80A1E7|A00008  |      ;
                       JSL.L CODE_FL_809F54                 ;80A1EA|22549F80|809F54;
                       PLB                                  ;80A1EE|AB      |      ;
                       PLP                                  ;80A1EF|28      |      ;
                       RTL                                  ;80A1F0|6B      |      ;
 
       CODE_FL_80A1F1:
                       PHP                                  ;80A1F1|08      |      ;
                       PHB                                  ;80A1F2|8B      |      ;
                       REP #$30                             ;80A1F3|C230    |      ;
                       LDX.W #$3000                         ;80A1F5|A20030  |      ;
                       LDY.W #$0800                         ;80A1F8|A00008  |      ;
                       JSL.L CODE_FL_809F54                 ;80A1FB|22549F80|809F54;
                       PLB                                  ;80A1FF|AB      |      ;
                       PLP                                  ;80A200|28      |      ;
                       RTL                                  ;80A201|6B      |      ;
 
       CODE_FL_80A202:
                       PHP                                  ;80A202|08      |      ;
                       PHB                                  ;80A203|8B      |      ;
                       PHK                                  ;80A204|4B      |      ;
                       PLB                                  ;80A205|AB      |      ;
                       REP #$30                             ;80A206|C230    |      ;
                       PHB                                  ;80A208|8B      |      ;
                       PHK                                  ;80A209|4B      |      ;
                       PLB                                  ;80A20A|AB      |      ;
                       LDY.W #$A215                         ;80A20B|A015A2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80A20E|22CAA080|80A0CA;
                       PLB                                  ;80A212|AB      |      ;
                       BRA +                                ;80A213|8008    |80A21D;
                       db $00,$20,$7E,$00,$08,$80,$00,$70   ;80A215|        |      ;
 
                     + PLB                                  ;80A21D|AB      |      ;
                       PLP                                  ;80A21E|28      |      ;
                       RTL                                  ;80A21F|6B      |      ;
 
       CODE_FL_80A220:
                       PHP                                  ;80A220|08      |      ;
                       PHB                                  ;80A221|8B      |      ;
                       PHK                                  ;80A222|4B      |      ;
                       PLB                                  ;80A223|AB      |      ;
                       REP #$30                             ;80A224|C230    |      ;
                       PHB                                  ;80A226|8B      |      ;
                       PHK                                  ;80A227|4B      |      ;
                       PLB                                  ;80A228|AB      |      ;
                       LDY.W #$A233                         ;80A229|A033A2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80A22C|22CAA080|80A0CA;
                       PLB                                  ;80A230|AB      |      ;
                       BRA +                                ;80A231|8008    |80A23B;
                       db $00,$28,$7E,$00,$08,$80,$00,$78   ;80A233|        |      ;
 
                     + PLB                                  ;80A23B|AB      |      ;
                       PLP                                  ;80A23C|28      |      ;
                       RTL                                  ;80A23D|6B      |      ;
 
       CODE_FL_80A23E:
                       PHP                                  ;80A23E|08      |      ;
                       PHB                                  ;80A23F|8B      |      ;
                       PHK                                  ;80A240|4B      |      ;
                       PLB                                  ;80A241|AB      |      ;
                       REP #$30                             ;80A242|C230    |      ;
                       PHB                                  ;80A244|8B      |      ;
                       PHK                                  ;80A245|4B      |      ;
                       PLB                                  ;80A246|AB      |      ;
                       LDY.W #$A251                         ;80A247|A051A2  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80A24A|22CAA080|80A0CA;
                       PLB                                  ;80A24E|AB      |      ;
                       BRA +                                ;80A24F|8008    |80A259;
                       db $00,$30,$7E,$00,$08,$80,$00,$1C   ;80A251|        |      ;
 
                     + PLB                                  ;80A259|AB      |      ;
                       PLP                                  ;80A25A|28      |      ;
                       RTL                                  ;80A25B|6B      |      ;
                       db $08,$8B,$4B,$AB,$C2,$30,$AD,$84   ;80A25C|        |      ;
                       db $02,$4A,$4A,$8D,$04,$42,$E2,$20   ;80A264|        |      ;
                       db $A9,$04,$8D,$06,$42,$C2,$20,$AD   ;80A26C|        |      ;
                       db $90,$02,$85,$25,$AD,$8F,$02,$85   ;80A274|        |80A278;
                       db $24,$AD,$8C,$02,$0A,$18,$6D,$8C   ;80A27C|        |0000AD;
                       db $02,$A8,$B7,$24,$85,$27,$E2,$20   ;80A284|        |      ;
                       db $AD,$14,$42,$8D,$86,$02,$AD,$16   ;80A28C|        |004214;
                       db $42,$0A,$8D,$87,$02,$C8,$C8,$B7   ;80A294|        |      ;
                       db $24,$85,$29,$A0,$00,$00,$B7,$27   ;80A29C|        |000085;
                       db $C8,$85,$11,$B7,$27,$C8,$85,$12   ;80A2A4|        |      ;
                       db $A9,$08,$85,$13,$C2,$20,$AD,$84   ;80A2AC|        |      ;
                       db $02,$C9,$FD,$01,$90,$03,$AB,$28   ;80A2B4|        |      ;
                       db $6B,$E2,$20,$06,$12,$EE,$87,$02   ;80A2BC|        |      ;
                       db $5A,$20,$59,$A3,$7A,$CE,$87,$02   ;80A2C4|        |      ;
                       db $64,$01,$64,$09,$B7,$27,$85,$00   ;80A2CC|        |000001;
                       db $10,$02,$C6,$01,$C8,$B7,$27,$85   ;80A2D4|        |80A2D8;
                       db $08,$10,$02,$C6,$09,$C8,$C2,$20   ;80A2DC|        |      ;
                       db $A5,$00,$18,$6D,$8A,$02,$85,$00   ;80A2E4|        |000000;
                       db $A5,$08,$18,$6D,$88,$02,$85,$08   ;80A2EC|        |000008;
                       db $B7,$27,$C8,$C8,$AE,$84,$02,$9D   ;80A2F4|        |000027;
                       db $02,$1D,$8A,$18,$69,$04,$00,$8D   ;80A2FC|        |      ;
                       db $84,$02,$E2,$20,$A5,$00,$AE,$84   ;80A304|        |000002;
                       db $02,$9D,$FD,$1C,$A5,$09,$18,$F0   ;80A30C|        |      ;
                       db $01,$38,$5A,$20,$59,$A3,$7A,$A5   ;80A314|        |000038;
                       db $08,$AE,$84,$02,$9D,$FC,$1C,$AD   ;80A31C|        |      ;
                       db $8E,$02,$10,$0D,$0A,$85,$00,$BD   ;80A324|        |001002;
                       db $FF,$1C,$29,$F1,$05,$00,$9D,$FF   ;80A32C|        |F1291C;
                       db $1C,$EE,$87,$02,$EE,$87,$02,$AD   ;80A334|        |0087EE;
                       db $87,$02,$C9,$08,$90,$06,$9C,$87   ;80A33C|        |000002;
                       db $02,$EE,$86,$02,$C6,$11,$F0,$0A   ;80A344|        |      ;
                       db $C6,$13,$D0,$03,$4C,$A7,$A2,$4C   ;80A34C|        |000013;
                       db $B0,$A2,$AB,$28,$6B,$E2,$10,$AC   ;80A354|        |80A2F8;
                       db $87,$02,$B0,$0F,$AE,$86,$02,$BD   ;80A35C|        |000002;
                       db $00,$1F,$39,$81,$A3,$9D,$00,$1F   ;80A364|        |      ;
                       db $C2,$10,$60,$AE,$86,$02,$BD,$00   ;80A36C|        |      ;
                       db $1F,$39,$81,$A3,$19,$89,$A3,$9D   ;80A374|        |A38139;
                       db $00,$1F,$C2,$10,$60,$FE,$FD,$FB   ;80A37C|        |      ;
                       db $F7,$EF,$DF,$BF,$7F,$01,$02,$04   ;80A384|        |0000EF;
                       db $08,$10,$20,$40,$80,$C1,$A3,$80   ;80A38C|        |      ;
                       db $C7,$A3,$80,$CD,$A3,$80,$D3,$A3   ;80A394|        |0000A3;
                       db $80,$D9,$A3,$80,$DF,$A3,$80,$E5   ;80A39C|        |80A377;
                       db $A3,$80,$EB,$A3,$80,$F1,$A3,$80   ;80A3A4|        |000080;
                       db $F7,$A3,$80,$FD,$A3,$80,$03,$A4   ;80A3AC|        |0000A3;
                       db $80,$09,$A4,$80,$0F,$A4,$80,$15   ;80A3B4|        |80A3BF;
                       db $A4,$80,$1B,$A4,$80,$01,$00,$00   ;80A3BC|        |000080;
                       db $00,$00,$38,$01,$00,$00,$00,$01   ;80A3C4|        |      ;
                       db $38,$01,$00,$00,$00,$02,$38,$01   ;80A3CC|        |      ;
                       db $00,$00,$00,$03,$38,$01,$00,$00   ;80A3D4|        |      ;
                       db $00,$04,$38,$01,$00,$00,$00,$05   ;80A3DC|        |      ;
                       db $38,$01,$00,$00,$00,$06,$38,$01   ;80A3E4|        |      ;
                       db $00,$00,$00,$07,$38,$01,$00,$00   ;80A3EC|        |      ;
                       db $00,$08,$38,$01,$00,$00,$00,$09   ;80A3F4|        |      ;
                       db $38,$01,$00,$00,$00,$0A,$38,$01   ;80A3FC|        |      ;
                       db $00,$00,$00,$0B,$38,$01,$00,$00   ;80A404|        |      ;
                       db $00,$0C,$38,$01,$00,$00,$00,$0D   ;80A40C|        |      ;
                       db $38,$01,$00,$00,$00,$0E,$38,$01   ;80A414|        |      ;
                       db $00,$00,$00,$0F,$38               ;80A41C|        |      ;
 
       CODE_FL_80A421:
                       PHP                                  ;80A421|08      |      ;
                       PHB                                  ;80A422|8B      |      ;
                       REP #$30                             ;80A423|C230    |      ;
                       LDY.B $7C                            ;80A425|A47C    |00007C;
                       STZ.B $7C                            ;80A427|647C    |00007C;
                       SEP #$20                             ;80A429|E220    |      ;
                       STZ.B $85                            ;80A42B|6485    |000085;
                       LDA.B $81                            ;80A42D|A581    |000081;
                       PHA                                  ;80A42F|48      |      ;
                       PLB                                  ;80A430|AB      |      ;
                       LDX.B $7F                            ;80A431|A67F    |00007F;
                       JMP.W CODE_JP_80A5AC                 ;80A433|4CACA5  |80A5AC;
 
       CODE_FN_80A436:
                       LDA.B [$7C],Y                        ;80A436|B77C    |00007C;
                       INY                                  ;80A438|C8      |      ;
                       BNE +                                ;80A439|D003    |80A43E;
                       db $20,$54,$A4                       ;80A43B|        |80A454;
 
                     + PHA                                  ;80A43E|48      |      ;
                       LDA.B $85                            ;80A43F|A585    |000085;
                       BEQ +                                ;80A441|F003    |80A446;
                       JSR.W CODE_FN_80A448                 ;80A443|2048A4  |80A448;
 
                     + PLA                                  ;80A446|68      |      ;
                       RTS                                  ;80A447|60      |      ;
 
       CODE_FN_80A448:
                       DEC A                                ;80A448|3A      |      ;
                       STA.B $85                            ;80A449|8585    |000085;
                       BNE +                                ;80A44B|D006    |80A453;
                       LDA.B $84                            ;80A44D|A584    |000084;
                       STA.B $7E                            ;80A44F|857E    |00007E;
                       LDY.B $82                            ;80A451|A482    |000082;
 
                     + RTS                                  ;80A453|60      |      ;
 
       CODE_FN_80A454:
                       INC.B $7E                            ;80A454|E67E    |00007E;
                       LDY.W #$8000                         ;80A456|A00080  |      ;
                       RTS                                  ;80A459|60      |      ;
 
                    -- STA.B $7F                            ;80A45A|857F    |00007F;
                       ASL A                                ;80A45C|0A      |      ;
                       BPL +                                ;80A45D|1022    |80A481;
                       AND.B #$20                           ;80A45F|2920    |      ;
                       BEQ ++                               ;80A461|F010    |80A473;
                       LDA.B $7F                            ;80A463|A57F    |00007F;
                       ASL A                                ;80A465|0A      |      ;
                       ASL A                                ;80A466|0A      |      ;
                       ASL A                                ;80A467|0A      |      ;
                       ASL A                                ;80A468|0A      |      ;
                       ORA.B #$0F                           ;80A469|090F    |      ;
                       STA.W $0000,X                        ;80A46B|9D0000  |7F0000;
                       INX                                  ;80A46E|E8      |      ;
                       LDA.B #$1F                           ;80A46F|A91F    |      ;
                       BRA +++                              ;80A471|8038    |80A4AB;
 
                    ++ LDA.B $7F                            ;80A473|A57F    |00007F;
                       AND.B #$0F                           ;80A475|290F    |      ;
                       ORA.B #$F0                           ;80A477|09F0    |      ;
                       STA.W $0000,X                        ;80A479|9D0000  |7F0000;
                       INX                                  ;80A47C|E8      |      ;
                       LDA.B #$0F                           ;80A47D|A90F    |      ;
                       BRA +++                              ;80A47F|802A    |80A4AB;
 
                     + AND.B #$20                           ;80A481|2920    |      ;
                       BEQ +                                ;80A483|F00E    |80A493;
                       LDA.B $7F                            ;80A485|A57F    |00007F;
                       ASL A                                ;80A487|0A      |      ;
                       ASL A                                ;80A488|0A      |      ;
                       ASL A                                ;80A489|0A      |      ;
                       ASL A                                ;80A48A|0A      |      ;
                       STA.W $0000,X                        ;80A48B|9D0000  |7F0000;
                       INX                                  ;80A48E|E8      |      ;
                       LDA.B #$10                           ;80A48F|A910    |      ;
                       BRA +++                              ;80A491|8018    |80A4AB;
 
                     + LDA.B $7F                            ;80A493|A57F    |00007F;
                       AND.B #$0F                           ;80A495|290F    |      ;
                       STA.W $0000,X                        ;80A497|9D0000  |7F0000;
                       INX                                  ;80A49A|E8      |      ;
                       LDA.B #$00                           ;80A49B|A900    |      ;
                       BRA +++                              ;80A49D|800C    |80A4AB;
 
                     - AND.B #$0F                           ;80A49F|290F    |      ;
                       INC A                                ;80A4A1|1A      |      ;
                       STA.B $81                            ;80A4A2|8581    |000081;
                       JSR.W CODE_FN_80A436                 ;80A4A4|2036A4  |80A436;
                       CMP.B #$80                           ;80A4A7|C980    |      ;
                       BCS --                               ;80A4A9|B0AF    |80A45A;
 
                   +++ CMP.B #$10                           ;80A4AB|C910    |      ;
                       BCC +                                ;80A4AD|9028    |80A4D7;
                       AND.B #$0F                           ;80A4AF|290F    |      ;
                       STA.B $7F                            ;80A4B1|857F    |00007F;
 
                    -- JSR.W CODE_FN_80A436                 ;80A4B3|2036A4  |80A436;
                       STA.B $80                            ;80A4B6|8580    |000080;
                       AND.B #$F0                           ;80A4B8|29F0    |      ;
                       ORA.B $7F                            ;80A4BA|057F    |00007F;
                       STA.W $0000,X                        ;80A4BC|9D0000  |7F0000;
                       INX                                  ;80A4BF|E8      |      ;
                       DEC.B $81                            ;80A4C0|C681    |000081;
                       BMI ++                               ;80A4C2|303A    |80A4FE;
                       LDA.B $80                            ;80A4C4|A580    |000080;
                       ASL A                                ;80A4C6|0A      |      ;
                       ASL A                                ;80A4C7|0A      |      ;
                       ASL A                                ;80A4C8|0A      |      ;
                       ASL A                                ;80A4C9|0A      |      ;
                       ORA.B $7F                            ;80A4CA|057F    |00007F;
                       STA.W $0000,X                        ;80A4CC|9D0000  |7F0000;
                       INX                                  ;80A4CF|E8      |      ;
                       DEC.B $81                            ;80A4D0|C681    |000081;
                       BPL --                               ;80A4D2|10DF    |80A4B3;
                       JMP.W CODE_JP_80A5AC                 ;80A4D4|4CACA5  |80A5AC;
 
                     + ASL A                                ;80A4D7|0A      |      ;
                       ASL A                                ;80A4D8|0A      |      ;
                       ASL A                                ;80A4D9|0A      |      ;
                       ASL A                                ;80A4DA|0A      |      ;
                       STA.B $7F                            ;80A4DB|857F    |00007F;
 
                    -- JSR.W CODE_FN_80A436                 ;80A4DD|2036A4  |80A436;
                       STA.B $80                            ;80A4E0|8580    |000080;
                       LSR A                                ;80A4E2|4A      |      ;
                       LSR A                                ;80A4E3|4A      |      ;
                       LSR A                                ;80A4E4|4A      |      ;
                       LSR A                                ;80A4E5|4A      |      ;
                       ORA.B $7F                            ;80A4E6|057F    |00007F;
                       STA.W $0000,X                        ;80A4E8|9D0000  |7F0000;
                       INX                                  ;80A4EB|E8      |      ;
                       DEC.B $81                            ;80A4EC|C681    |000081;
                       BMI ++                               ;80A4EE|300E    |80A4FE;
                       LDA.B $80                            ;80A4F0|A580    |000080;
                       AND.B #$0F                           ;80A4F2|290F    |      ;
                       ORA.B $7F                            ;80A4F4|057F    |00007F;
                       STA.W $0000,X                        ;80A4F6|9D0000  |7F0000;
                       INX                                  ;80A4F9|E8      |      ;
                       DEC.B $81                            ;80A4FA|C681    |000081;
                       BPL --                               ;80A4FC|10DF    |80A4DD;
 
                    ++ JMP.W CODE_JP_80A5AC                 ;80A4FE|4CACA5  |80A5AC;
 
                    -- CMP.B #$50                           ;80A501|C950    |      ;
                       BCC -                                ;80A503|909A    |80A49F;
                       AND.B #$0F                           ;80A505|290F    |      ;
                       STA.B $81                            ;80A507|8581    |000081;
 
                     - LDA.B [$7C],Y                        ;80A509|B77C    |00007C;
                       INY                                  ;80A50B|C8      |      ;
                       BNE +                                ;80A50C|D003    |80A511;
                       JSR.W CODE_FN_80A454                 ;80A50E|2054A4  |80A454;
 
                     + PHA                                  ;80A511|48      |      ;
                       LDA.B $85                            ;80A512|A585    |000085;
                       BEQ +                                ;80A514|F003    |80A519;
                       db $20,$48,$A4                       ;80A516|        |80A448;
 
                     + PLA                                  ;80A519|68      |      ;
                       STA.W $0000,X                        ;80A51A|9D0000  |7F0000;
                       INX                                  ;80A51D|E8      |      ;
                       STA.W $0000,X                        ;80A51E|9D0000  |7F0000;
                       INX                                  ;80A521|E8      |      ;
                       DEC.B $81                            ;80A522|C681    |000081;
                       BPL -                                ;80A524|10E3    |80A509;
                       JMP.W CODE_JP_80A5AC                 ;80A526|4CACA5  |80A5AC;
 
                     - LSR A                                ;80A529|4A      |      ;
                       CMP.B #$60                           ;80A52A|C960    |      ;
                       BCC --                               ;80A52C|90D3    |80A501;
                       XBA                                  ;80A52E|EB      |      ;
                       LDA.B [$7C],Y                        ;80A52F|B77C    |00007C;
                       INY                                  ;80A531|C8      |      ;
                       BNE +                                ;80A532|D003    |80A537;
                       db $20,$54,$A4                       ;80A534|        |80A454;
 
                     + PHA                                  ;80A537|48      |      ;
                       LDA.B $85                            ;80A538|A585    |000085;
                       BEQ +                                ;80A53A|F003    |80A53F;
                       JSR.W CODE_FN_80A448                 ;80A53C|2048A4  |80A448;
 
                     + PLA                                  ;80A53F|68      |      ;
                       STA.B $7F                            ;80A540|857F    |00007F;
                       XBA                                  ;80A542|EB      |      ;
                       CMP.B #$70                           ;80A543|C970    |      ;
                       AND.B #$0F                           ;80A545|290F    |      ;
                       INC A                                ;80A547|1A      |      ;
                       STA.B $81                            ;80A548|8581    |000081;
                       BCS CODE_80A56D                      ;80A54A|B021    |80A56D;
 
                    -- LDA.B $7F                            ;80A54C|A57F    |00007F;
                       STA.W $0000,X                        ;80A54E|9D0000  |7F0000;
                       INX                                  ;80A551|E8      |      ;
                       LDA.B [$7C],Y                        ;80A552|B77C    |00007C;
                       INY                                  ;80A554|C8      |      ;
                       BNE +                                ;80A555|D003    |80A55A;
                       db $20,$54,$A4                       ;80A557|        |80A454;
 
                     + PHA                                  ;80A55A|48      |      ;
                       LDA.B $85                            ;80A55B|A585    |000085;
                       BEQ +                                ;80A55D|F003    |80A562;
                       db $20,$48,$A4                       ;80A55F|        |80A448;
 
                     + PLA                                  ;80A562|68      |      ;
                       STA.W $0000,X                        ;80A563|9D0000  |7F0000;
                       INX                                  ;80A566|E8      |      ;
                       DEC.B $81                            ;80A567|C681    |000081;
                       BPL --                               ;80A569|10E1    |80A54C;
                       BRA CODE_JP_80A5AC                   ;80A56B|803F    |80A5AC;
 
          CODE_80A56D:
                       LDA.B [$7C],Y                        ;80A56D|B77C    |00007C;
                       INY                                  ;80A56F|C8      |      ;
                       BNE +                                ;80A570|D003    |80A575;
                       db $20,$54,$A4                       ;80A572|        |80A454;
 
                     + PHA                                  ;80A575|48      |      ;
                       LDA.B $85                            ;80A576|A585    |000085;
                       BEQ +                                ;80A578|F003    |80A57D;
                       JSR.W CODE_FN_80A448                 ;80A57A|2048A4  |80A448;
 
                     + PLA                                  ;80A57D|68      |      ;
                       STA.W $0000,X                        ;80A57E|9D0000  |7F0000;
                       INX                                  ;80A581|E8      |      ;
                       LDA.B $7F                            ;80A582|A57F    |00007F;
                       STA.W $0000,X                        ;80A584|9D0000  |7F0000;
                       INX                                  ;80A587|E8      |      ;
                       DEC.B $81                            ;80A588|C681    |000081;
                       BPL CODE_80A56D                      ;80A58A|10E1    |80A56D;
                       BRA CODE_JP_80A5AC                   ;80A58C|801E    |80A5AC;
 
                     - BMI -                                ;80A58E|3099    |80A529;
                       LSR A                                ;80A590|4A      |      ;
                       STA.B $81                            ;80A591|8581    |000081;
 
                    -- LDA.B [$7C],Y                        ;80A593|B77C    |00007C;
                       INY                                  ;80A595|C8      |      ;
                       BNE +                                ;80A596|D003    |80A59B;
                       JSR.W CODE_FN_80A454                 ;80A598|2054A4  |80A454;
 
                     + PHA                                  ;80A59B|48      |      ;
                       LDA.B $85                            ;80A59C|A585    |000085;
                       BEQ +                                ;80A59E|F003    |80A5A3;
                       JSR.W CODE_FN_80A448                 ;80A5A0|2048A4  |80A448;
 
                     + PLA                                  ;80A5A3|68      |      ;
                       STA.W $0000,X                        ;80A5A4|9D0000  |7F0000;
                       INX                                  ;80A5A7|E8      |      ;
                       DEC.B $81                            ;80A5A8|C681    |000081;
                       BPL --                               ;80A5AA|10E7    |80A593;
 
       CODE_JP_80A5AC:
                       LDA.B [$7C],Y                        ;80A5AC|B77C    |00007C;
                       INY                                  ;80A5AE|C8      |      ;
                       BNE +                                ;80A5AF|D003    |80A5B4;
                       JSR.W CODE_FN_80A454                 ;80A5B1|2054A4  |80A454;
 
                     + PHA                                  ;80A5B4|48      |      ;
                       LDA.B $85                            ;80A5B5|A585    |000085;
                       BEQ +                                ;80A5B7|F003    |80A5BC;
                       JSR.W CODE_FN_80A448                 ;80A5B9|2048A4  |80A448;
 
                     + PLA                                  ;80A5BC|68      |      ;
                       ASL A                                ;80A5BD|0A      |      ;
                       BCC -                                ;80A5BE|90CE    |80A58E;
                       BMI +                                ;80A5C0|3035    |80A5F7;
                       LSR A                                ;80A5C2|4A      |      ;
                       PHA                                  ;80A5C3|48      |      ;
                       LSR A                                ;80A5C4|4A      |      ;
                       LSR A                                ;80A5C5|4A      |      ;
                       INC A                                ;80A5C6|1A      |      ;
                       STA.B $81                            ;80A5C7|8581    |000081;
                       PLA                                  ;80A5C9|68      |      ;
                       AND.B #$03                           ;80A5CA|2903    |      ;
                       XBA                                  ;80A5CC|EB      |      ;
 
                     - LDA.B [$7C],Y                        ;80A5CD|B77C    |00007C;
                       INY                                  ;80A5CF|C8      |      ;
                       BNE ++                               ;80A5D0|D003    |80A5D5;
                       JSR.W CODE_FN_80A454                 ;80A5D2|2054A4  |80A454;
 
                    ++ PHY                                  ;80A5D5|5A      |      ;
                       REP #$20                             ;80A5D6|C220    |      ;
                       STA.B $7F                            ;80A5D8|857F    |00007F;
                       TXA                                  ;80A5DA|8A      |      ;
                       SEC                                  ;80A5DB|38      |      ;
                       SBC.B $7F                            ;80A5DC|E57F    |00007F;
                       TAY                                  ;80A5DE|A8      |      ;
                       SEP #$20                             ;80A5DF|E220    |      ;
 
                    -- LDA.W $0000,Y                        ;80A5E1|B90000  |7F0000;
                       STA.W $0000,X                        ;80A5E4|9D0000  |7F0000;
                       INY                                  ;80A5E7|C8      |      ;
                       INX                                  ;80A5E8|E8      |      ;
                       DEC.B $81                            ;80A5E9|C681    |000081;
                       BPL --                               ;80A5EB|10F4    |80A5E1;
                       PLY                                  ;80A5ED|7A      |      ;
 
       CODE_JP_80A5EE:
                       LDA.B $85                            ;80A5EE|A585    |000085;
                       BEQ CODE_JP_80A5AC                   ;80A5F0|F0BA    |80A5AC;
                       JSR.W CODE_FN_80A448                 ;80A5F2|2048A4  |80A448;
                       BRA CODE_JP_80A5AC                   ;80A5F5|80B5    |80A5AC;
 
                     + ROR A                                ;80A5F7|6A      |      ;
                       CMP.B #$E0                           ;80A5F8|C9E0    |      ;
                       BCS +                                ;80A5FA|B020    |80A61C;
                       AND.B #$1F                           ;80A5FC|291F    |      ;
                       XBA                                  ;80A5FE|EB      |      ;
                       LDA.B [$7C],Y                        ;80A5FF|B77C    |00007C;
                       INY                                  ;80A601|C8      |      ;
                       BNE ++                               ;80A602|D003    |80A607;
                       db $20,$54,$A4                       ;80A604|        |80A454;
 
                    ++ PHA                                  ;80A607|48      |      ;
                       LDA.B $85                            ;80A608|A585    |000085;
                       BEQ ++                               ;80A60A|F003    |80A60F;
                       JSR.W CODE_FN_80A448                 ;80A60C|2048A4  |80A448;
 
                    ++ PLA                                  ;80A60F|68      |      ;
                       REP #$20                             ;80A610|C220    |      ;
                       ASL A                                ;80A612|0A      |      ;
                       SEP #$20                             ;80A613|E220    |      ;
                       LSR A                                ;80A615|4A      |      ;
                       XBA                                  ;80A616|EB      |      ;
                       INC A                                ;80A617|1A      |      ;
                       STA.B $81                            ;80A618|8581    |000081;
                       BRA -                                ;80A61A|80B1    |80A5CD;
 
                     + CMP.B #$F0                           ;80A61C|C9F0    |      ;
                       BCS +                                ;80A61E|B040    |80A660;
                       AND.B #$0F                           ;80A620|290F    |      ;
                       STA.B $80                            ;80A622|8580    |000080;
                       LDA.B [$7C],Y                        ;80A624|B77C    |00007C;
                       INY                                  ;80A626|C8      |      ;
                       BNE ++                               ;80A627|D003    |80A62C;
                       db $20,$54,$A4                       ;80A629|        |80A454;
 
                    ++ PHA                                  ;80A62C|48      |      ;
                       LDA.B $85                            ;80A62D|A585    |000085;
                       BEQ ++                               ;80A62F|F003    |80A634;
                       JSR.W CODE_FN_80A448                 ;80A631|2048A4  |80A448;
 
                    ++ PLA                                  ;80A634|68      |      ;
                       STA.B $7F                            ;80A635|857F    |00007F;
                       LDA.B [$7C],Y                        ;80A637|B77C    |00007C;
                       INY                                  ;80A639|C8      |      ;
                       BNE ++                               ;80A63A|D003    |80A63F;
                       db $20,$54,$A4                       ;80A63C|        |80A454;
 
                    ++ PHY                                  ;80A63F|5A      |      ;
                       PHA                                  ;80A640|48      |      ;
                       PHA                                  ;80A641|48      |      ;
                       REP #$20                             ;80A642|C220    |      ;
                       LDA.B $7F                            ;80A644|A57F    |00007F;
                       CLC                                  ;80A646|18      |      ;
                       ADC.W #$0003                         ;80A647|690300  |      ;
                       LSR A                                ;80A64A|4A      |      ;
                       TAY                                  ;80A64B|A8      |      ;
                       PLA                                  ;80A64C|68      |      ;
 
                     - STA.W $0000,X                        ;80A64D|9D0000  |7F0000;
                       INX                                  ;80A650|E8      |      ;
                       INX                                  ;80A651|E8      |      ;
                       DEY                                  ;80A652|88      |      ;
                       BNE -                                ;80A653|D0F8    |80A64D;
                       SEP #$20                             ;80A655|E220    |      ;
                       BCC ++                               ;80A657|9004    |80A65D;
                       STA.W $0000,X                        ;80A659|9D0000  |7F0000;
                       INX                                  ;80A65C|E8      |      ;
 
                    ++ PLY                                  ;80A65D|7A      |      ;
                       BRA CODE_JP_80A5EE                   ;80A65E|808E    |80A5EE;
 
                     + CMP.B #$F8                           ;80A660|C9F8    |      ;
                       BCS +                                ;80A662|B019    |80A67D;
                       AND.B #$07                           ;80A664|2907    |      ;
                       ADC.B #$02                           ;80A666|6902    |      ;
                       STA.B $81                            ;80A668|8581    |000081;
                       LDA.B [$7C],Y                        ;80A66A|B77C    |00007C;
                       INY                                  ;80A66C|C8      |      ;
                       BNE CODE_80A672                      ;80A66D|D003    |80A672;
                       db $20,$54,$A4                       ;80A66F|        |80A454;
 
          CODE_80A672:
                       STA.W $0000,X                        ;80A672|9D0000  |7E0000;
                       INX                                  ;80A675|E8      |      ;
                       DEC.B $81                            ;80A676|C681    |000081;
                       BPL CODE_80A672                      ;80A678|10F8    |80A672;
                       JMP.W CODE_JP_80A5EE                 ;80A67A|4CEEA5  |80A5EE;
 
                     + CMP.B #$FC                           ;80A67D|C9FC    |      ;
                       BCS +                                ;80A67F|B049    |80A6CA;
                       AND.B #$03                           ;80A681|2903    |      ;
                       XBA                                  ;80A683|EB      |      ;
                       LDA.B [$7C],Y                        ;80A684|B77C    |00007C;
                       INY                                  ;80A686|C8      |      ;
                       BNE ++                               ;80A687|D003    |80A68C;
                       db $20,$54,$A4                       ;80A689|        |80A454;
 
                    ++ REP #$20                             ;80A68C|C220    |      ;
                       ASL A                                ;80A68E|0A      |      ;
                       ASL A                                ;80A68F|0A      |      ;
                       ASL A                                ;80A690|0A      |      ;
                       SEP #$20                             ;80A691|E220    |      ;
                       LSR A                                ;80A693|4A      |      ;
                       LSR A                                ;80A694|4A      |      ;
                       LSR A                                ;80A695|4A      |      ;
                       XBA                                  ;80A696|EB      |      ;
                       PHA                                  ;80A697|48      |      ;
                       LDA.B [$7C],Y                        ;80A698|B77C    |00007C;
                       INY                                  ;80A69A|C8      |      ;
                       BNE ++                               ;80A69B|D003    |80A6A0;
                       db $20,$54,$A4                       ;80A69D|        |80A454;
 
                    ++ REP #$20                             ;80A6A0|C220    |      ;
                       CLC                                  ;80A6A2|18      |      ;
                       ADC.W #$0003                         ;80A6A3|690300  |      ;
 
                     - STY.B $82                            ;80A6A6|8482    |000082;
                       STA.B $7F                            ;80A6A8|857F    |00007F;
                       SEP #$20                             ;80A6AA|E220    |      ;
                       LDA.B $7E                            ;80A6AC|A57E    |00007E;
                       STA.B $84                            ;80A6AE|8584    |000084;
                       REP #$20                             ;80A6B0|C220    |      ;
                       TYA                                  ;80A6B2|98      |      ;
                       SEC                                  ;80A6B3|38      |      ;
                       SBC.B $7F                            ;80A6B4|E57F    |00007F;
                       BMI ++                               ;80A6B6|3006    |80A6BE;
                       CLC                                  ;80A6B8|18      |      ;
                       ADC.W #$8000                         ;80A6B9|690080  |      ;
                       DEC.B $7E                            ;80A6BC|C67E    |00007E;
 
                    ++ TAY                                  ;80A6BE|A8      |      ;
                       SEP #$20                             ;80A6BF|E220    |      ;
                       PLA                                  ;80A6C1|68      |      ;
                       CLC                                  ;80A6C2|18      |      ;
                       ADC.B #$03                           ;80A6C3|6903    |      ;
                       STA.B $85                            ;80A6C5|8585    |000085;
                       JMP.W CODE_JP_80A5AC                 ;80A6C7|4CACA5  |80A5AC;
 
                     + CMP.B #$FE                           ;80A6CA|C9FE    |      ;
                       BCS +                                ;80A6CC|B01F    |80A6ED;
                       AND.B #$01                           ;80A6CE|2901    |      ;
                       XBA                                  ;80A6D0|EB      |      ;
                       LDA.B [$7C],Y                        ;80A6D1|B77C    |00007C;
                       INY                                  ;80A6D3|C8      |      ;
                       BNE ++                               ;80A6D4|D003    |80A6D9;
                       db $20,$54,$A4                       ;80A6D6|        |80A454;
 
                    ++ REP #$20                             ;80A6D9|C220    |      ;
                       ASL A                                ;80A6DB|0A      |      ;
                       ASL A                                ;80A6DC|0A      |      ;
                       SEP #$20                             ;80A6DD|E220    |      ;
                       XBA                                  ;80A6DF|EB      |      ;
                       PHA                                  ;80A6E0|48      |      ;
                       XBA                                  ;80A6E1|EB      |      ;
                       LSR A                                ;80A6E2|4A      |      ;
                       LSR A                                ;80A6E3|4A      |      ;
                       REP #$20                             ;80A6E4|C220    |      ;
                       AND.W #$003F                         ;80A6E6|293F00  |      ;
                       INC A                                ;80A6E9|1A      |      ;
                       INC A                                ;80A6EA|1A      |      ;
                       BRA -                                ;80A6EB|80B9    |80A6A6;
 
                     + PLB                                  ;80A6ED|AB      |      ;
                       PLP                                  ;80A6EE|28      |      ;
                       RTL                                  ;80A6EF|6B      |      ;
 
       CODE_JP_80A6F0:
                       JSL.L CODE_FL_84C12D                 ;80A6F0|222DC184|84C12D;
                       JSL.L CODE_FL_809086                 ;80A6F4|22869080|809086;
                       JMP.W CODE_JP_80A6F0                 ;80A6F8|4CF0A6  |80A6F0;
 
       CODE_FL_80A6FB:
                       PHP                                  ;80A6FB|08      |      ;
                       PHK                                  ;80A6FC|4B      |      ;
                       PLB                                  ;80A6FD|AB      |      ;
                       REP #$30                             ;80A6FE|C230    |      ;
                       PHP                                  ;80A700|08      |      ;
                       REP #$30                             ;80A701|C230    |      ;
                       LDA.W Game_State                     ;80A703|ADA002  |8002A0;
                       ASL A                                ;80A706|0A      |      ;
                       CLC                                  ;80A707|18      |      ;
                       ADC.W Game_State                     ;80A708|6DA002  |8002A0;
                       TAX                                  ;80A70B|AA      |      ;
                       LDA.W DATA8_80A727,X                 ;80A70C|BD27A7  |80A727;
                       STA.B $00                            ;80A70F|8500    |000000;
                       LDA.W DATA8_80A728,X                 ;80A711|BD28A7  |80A728;
                       STA.B $01                            ;80A714|8501    |000001;
                       SEP #$20                             ;80A716|E220    |      ;
                       LDA.B #$80                           ;80A718|A980    |      ;
                       PHA                                  ;80A71A|48      |      ;
                       REP #$20                             ;80A71B|C220    |      ;
                       LDA.W #$A723                         ;80A71D|A923A7  |      ;
                       PHA                                  ;80A720|48      |      ;
                       JML.W [$0000]                        ;80A721|DC0000  |000000;
                       PLP                                  ;80A724|28      |      ;
                       PLP                                  ;80A725|28      |      ;
                       RTL                                  ;80A726|6B      |      ;
 
         DATA8_80A727:
                       db $03                               ;80A727|        |      ;
 
         DATA8_80A728:
                       db $BE,$8A,$17,$BD,$83,$CF,$D5,$83   ;80A728|        |      ;
                       db $00,$80,$87,$AD,$92,$82,$F6,$BA   ;80A730|        |      ;
                       db $87,$3D,$80,$8B,$DF,$80,$8B,$1E   ;80A738|        |      ;
                       db $DB,$89,$14,$E5,$89,$87,$E6,$89   ;80A740|        |      ;
                       db $E0,$F1,$8B,$11,$F2,$8B,$3A,$ED   ;80A748|        |      ;
                       db $89,$31,$8B,$8A,$66,$8B,$8A       ;80A750|        |      ;
                       db $BC,$8B,$8A                       ;80A757|        |008A8B;
                       db $36,$B6,$80,$D3,$AE,$8A           ;80A75A|        |      ;
                       db $76,$F1,$84,$B7,$F1,$84           ;80A760|        |0000F1;
                       db $82,$F1,$84,$CC,$F1,$84,$34,$DE   ;80A766|        |      ;
                       db $86                               ;80A76E|        |      ;
                       db $72,$A7,$80,$6B                   ;80A76F|        |0000A7;
 
       CODE_FL_80A773:
                       REP #$30                             ;80A773|C230    |      ;
                       JSR.W CODE_FN_80AC06                 ;80A775|2006AC  |80AC06;
                       JSL.L CODE_FL_82A32E                 ;80A778|222EA382|82A32E;
                       JSR.W CODE_FN_80A896                 ;80A77C|2096A8  |80A896;
                       JSL.L CODE_FL_809678                 ;80A77F|22789680|809678;
                       JSR.W CODE_FN_80AC3A                 ;80A783|203AAC  |80AC3A;
                       JSL.L CODE_FL_80A6FB                 ;80A786|22FBA680|80A6FB;
                       JSL.L CODE_FL_80C6D6                 ;80A78A|22D6C680|80C6D6;
                       JSR.W CODE_FN_80A8FD                 ;80A78E|20FDA8  |80A8FD;
                       JSR.W CODE_FN_80A8BB                 ;80A791|20BBA8  |80A8BB;
                       JSL.L CODE_FL_80959E                 ;80A794|229E9580|80959E;
                       REP #$30                             ;80A798|C230    |      ;
                       LDA.W $029F                          ;80A79A|AD9F02  |83029F;
                       AND.W #$00FF                         ;80A79D|29FF00  |      ;
                       BNE +                                ;80A7A0|D017    |80A7B9;
                       LDA.W $0358                          ;80A7A2|AD5803  |830358;
                       BNE +                                ;80A7A5|D012    |80A7B9;
                       JSR.W CODE_FN_80A7E5                 ;80A7A7|20E5A7  |80A7E5;
                       JSR.W IncrementTimers                ;80A7AA|2002A8  |80A802;
                       LDA.L $7E38FE                        ;80A7AD|AFFE387E|7E38FE;
                       CMP.W #$0001                         ;80A7B1|C90100  |      ;
                       BNE +                                ;80A7B4|D003    |80A7B9;
                       JSR.W CODE_FN_80A84C                 ;80A7B6|204CA8  |80A84C;
 
                     + JSL.L CODE_FL_8091B2                 ;80A7B9|22B29180|8091B2;
                       JSR.W CODE_FN_80AE92                 ;80A7BD|2092AE  |80AE92;
                       REP #$30                             ;80A7C0|C230    |      ;
                       RTL                                  ;80A7C2|6B      |      ;
 
       CODE_FL_80A7C3:
                       REP #$30                             ;80A7C3|C230    |      ;
                       LDA.W $029F                          ;80A7C5|AD9F02  |80029F;
                       AND.W #$00FF                         ;80A7C8|29FF00  |      ;
                       BNE +                                ;80A7CB|D017    |80A7E4;
                       LDA.W $0358                          ;80A7CD|AD5803  |800358;
                       BNE +                                ;80A7D0|D012    |80A7E4;
                       JSR.W CODE_FN_80A7E5                 ;80A7D2|20E5A7  |80A7E5;
                       JSR.W IncrementTimers                ;80A7D5|2002A8  |80A802;
                       LDA.L $7E38FE                        ;80A7D8|AFFE387E|7E38FE;
                       CMP.W #$0001                         ;80A7DC|C90100  |      ;
                       BNE +                                ;80A7DF|D003    |80A7E4;
                       JSR.W CODE_FN_80A84C                 ;80A7E1|204CA8  |80A84C;
 
                     + RTL                                  ;80A7E4|6B      |      ;
 
       CODE_FN_80A7E5:
                       LDA.B $A7                            ;80A7E5|A5A7    |0000A7;
                       INC A                                ;80A7E7|1A      |      ;
                       STA.B $A7                            ;80A7E8|85A7    |0000A7;
                       CMP.W #$003C                         ;80A7EA|C93C00  |      ;
                       BCC +                                ;80A7ED|9012    |80A801;
                       STZ.B $A7                            ;80A7EF|64A7    |0000A7;
                       LDA.B $AD                            ;80A7F1|A5AD    |0000AD;
                       CMP.W #$003B                         ;80A7F3|C93B00  |      ;
                       BCC ++                               ;80A7F6|9007    |80A7FF;
                       LDA.W #$FFFF                         ;80A7F8|A9FFFF  |      ;
                       STA.B $AD                            ;80A7FB|85AD    |0000AD;
                       INC.B $AB                            ;80A7FD|E6AB    |0000AB;
 
                    ++ INC.B $AD                            ;80A7FF|E6AD    |0000AD;
 
                     + RTS                                  ;80A801|60      |      ;
 
      IncrementTimers:
                       INC.W $0382                          ;80A802|EE8203  |830382; includes in-match timer
                       INC.W $0384                          ;80A805|EE8403  |830384;
                       INC.W $038A                          ;80A808|EE8A03  |83038A;
                       INC.W $038C                          ;80A80B|EE8C03  |83038C;
                       INC.W $0386                          ;80A80E|EE8603  |830386;
                       INC.W $0388                          ;80A811|EE8803  |830388;
                       LDA.W $0380                          ;80A814|AD8003  |830380;
                       BEQ +                                ;80A817|F032    |80A84B;
                       LDA.W $037C                          ;80A819|AD7C03  |82037C;
                       INC A                                ;80A81C|1A      |      ;
                       STA.W $037C                          ;80A81D|8D7C03  |82037C;
                       CMP.W #$003C                         ;80A820|C93C00  |      ;
                       BCC +                                ;80A823|9026    |80A84B;
                       STZ.W $037C                          ;80A825|9C7C03  |82037C;
                       LDA.W Timer_Seconds                  ;80A828|AD3603  |820336;
                       CMP.W #$003B                         ;80A82B|C93B00  |      ;
                       BCC ++                               ;80A82E|9018    |80A848;
                       LDA.W #$FFFF                         ;80A830|A9FFFF  |      ;
                       STA.W Timer_Seconds                  ;80A833|8D3603  |820336;
                       LDA.W Timer_Minutes                  ;80A836|AD3403  |820334;
                       INC A                                ;80A839|1A      |      ;
                       STA.W Timer_Minutes                  ;80A83A|8D3403  |820334;
                       CMP.W #$003C                         ;80A83D|C93C00  |      ;
                       BCC ++                               ;80A840|9006    |80A848;
                       STZ.W Timer_Minutes                  ;80A842|9C3403  |000334;
                       INC.W Timer_Hours                    ;80A845|EE3203  |000332;
 
                    ++ INC.W Timer_Seconds                  ;80A848|EE3603  |820336;
 
                     + RTS                                  ;80A84B|60      |      ;
 
       CODE_FN_80A84C:
                       LDA.W $0392                          ;80A84C|AD9203  |830392;
                       BNE +                                ;80A84F|D044    |80A895;
                       LDA.W $0380                          ;80A851|AD8003  |830380;
                       BEQ +                                ;80A854|F03F    |80A895;
                       LDA.W $0390                          ;80A856|AD9003  |820390;
                       BNE ++                               ;80A859|D005    |80A860;
                       LDA.W $038E                          ;80A85B|AD8E03  |82038E;
                       BEQ +++                              ;80A85E|F025    |80A885;
 
                    ++ LDA.W $037E                          ;80A860|AD7E03  |82037E;
                       INC A                                ;80A863|1A      |      ;
                       STA.W $037E                          ;80A864|8D7E03  |82037E;
                       CMP.W #$003C                         ;80A867|C93C00  |      ;
                       BCC +                                ;80A86A|9029    |80A895;
                       STZ.W $037E                          ;80A86C|9C7E03  |82037E;
                       LDA.W $0390                          ;80A86F|AD9003  |820390;
                       BNE ++                               ;80A872|D01E    |80A892;
                       LDA.W #$003C                         ;80A874|A93C00  |      ;
                       STA.W $0390                          ;80A877|8D9003  |820390;
                       LDA.W $038E                          ;80A87A|AD8E03  |82038E;
                       BEQ +++                              ;80A87D|F006    |80A885;
                       DEC A                                ;80A87F|3A      |      ;
                       STA.W $038E                          ;80A880|8D8E03  |82038E;
                       BPL ++                               ;80A883|100D    |80A892;
 
                   +++ LDA.W #$0001                         ;80A885|A90100  |      ;
                       STA.W $0392                          ;80A888|8D9203  |820392;
                       STZ.W $0390                          ;80A88B|9C9003  |820390;
                       STZ.W $038E                          ;80A88E|9C8E03  |82038E;
                       RTS                                  ;80A891|60      |      ;
 
                    ++ DEC.W $0390                          ;80A892|CE9003  |820390;
 
                     + RTS                                  ;80A895|60      |      ;
 
       CODE_FN_80A896:
                       LDA.B $B7                            ;80A896|A5B7    |0000B7;
                       ORA.B $B9                            ;80A898|05B9    |0000B9;
                       BIT.W #$B080                         ;80A89A|8980B0  |      ;
                       BEQ +                                ;80A89D|F01B    |80A8BA;
                       LDA.B $B3                            ;80A89F|A5B3    |0000B3;
                       CMP.W #$B080                         ;80A8A1|C980B0  |      ;
                       BEQ ++                               ;80A8A4|F009    |80A8AF;
                       LDA.B $B5                            ;80A8A6|A5B5    |0000B5;
                       CMP.W #$B080                         ;80A8A8|C980B0  |      ;
                       BEQ ++                               ;80A8AB|F002    |80A8AF;
                       BRA +                                ;80A8AD|800B    |80A8BA;
 
                    ++ JSL.L CODE_FL_86D7D8                 ;80A8AF|22D8D786|86D7D8;
                       JSL.L CODE_FL_809CF7                 ;80A8B3|22F79C80|809CF7;
                       JMP.W CODE_JP_808151                 ;80A8B7|4C5181  |808151;
 
                     + RTS                                  ;80A8BA|60      |      ;
 
       CODE_FN_80A8BB:
                       LDA.W $02A8                          ;80A8BB|ADA802  |8302A8;
                       BEQ +                                ;80A8BE|F03C    |80A8FC;
                       BMI +                                ;80A8C0|303A    |80A8FC;
                       LDA.L $7E8F50                        ;80A8C2|AF508F7E|7E8F50;
                       BEQ +                                ;80A8C6|F034    |80A8FC;
                       LDA.L $7E8EE6                        ;80A8C8|AFE68E7E|7E8EE6;
                       CMP.L $7E8EE8                        ;80A8CC|CFE88E7E|7E8EE8;
                       BEQ ++                               ;80A8D0|F00C    |80A8DE;
                       BCC ++                               ;80A8D2|900A    |80A8DE;
                       JSL.L CODE_FL_88A1EF                 ;80A8D4|22EFA188|88A1EF;
                       JSL.L CODE_FL_88A1A1                 ;80A8D8|22A1A188|88A1A1;
                       BRA +++                              ;80A8DC|8008    |80A8E6;
 
                    ++ JSL.L CODE_FL_88A1A1                 ;80A8DE|22A1A188|88A1A1;
                       JSL.L CODE_FL_88A1EF                 ;80A8E2|22EFA188|88A1EF;
 
                   +++ JSL.L CODE_FL_88A241                 ;80A8E6|2241A288|88A241;
                       JSL.L CODE_FL_88A287                 ;80A8EA|2287A288|88A287;
                       JSL.L CODE_FL_858288                 ;80A8EE|22888285|858288;
                       LDA.L $7E6543                        ;80A8F2|AF43657E|7E6543;
                       BNE +                                ;80A8F6|D004    |80A8FC;
                       JSL.L CODE_FL_8581B1                 ;80A8F8|22B18185|8581B1;
 
                     + RTS                                  ;80A8FC|60      |      ;
 
       CODE_FN_80A8FD:
                       PHB                                  ;80A8FD|8B      |      ;
                       PHK                                  ;80A8FE|4B      |      ;
                       PLB                                  ;80A8FF|AB      |      ;
                       LDA.W $02A8                          ;80A900|ADA802  |8002A8;
                       BEQ +                                ;80A903|F003    |80A908;
                       JMP.W CODE_JP_80A971                 ;80A905|4C71A9  |80A971;
 
                     + BMI CODE_JP_80A971                   ;80A908|3067    |80A971;
                       LDA.L $7E8F50                        ;80A90A|AF508F7E|7E8F50;
                       BEQ CODE_JP_80A971                   ;80A90E|F061    |80A971;
                       LDA.L $7E634B                        ;80A910|AF4B637E|7E634B;
                       INC A                                ;80A914|1A      |      ;
                       STA.L $7E634B                        ;80A915|8F4B637E|7E634B;
                       LDA.W #$00FF                         ;80A919|A9FF00  |      ;
                       STA.W $036E                          ;80A91C|8D6E03  |80036E;
                       LDA.W Character_1P                   ;80A91F|ADBA02  |8002BA;
                       ASL A                                ;80A922|0A      |      ;
                       TAX                                  ;80A923|AA      |      ;
                       JSR.W (DATA8_80A978,X)               ;80A924|FC78A9  |80A978;
                       LDA.W Character_1P                   ;80A927|ADBA02  |8002BA;
                       CMP.W #$0006                         ;80A92A|C90600  |      ;
                       BNE +                                ;80A92D|D004    |80A933;
                       JSL.L CODE_FL_8882CA                 ;80A92F|22CA8288|8882CA;
 
                     + JSL.L CODE_FL_899E69                 ;80A933|22699E89|899E69;
                       LDA.L $7E6397                        ;80A937|AF97637E|7E6397;
                       BNE CODE_JP_80A971                   ;80A93B|D034    |80A971;
                       LDA.W Character_1P                   ;80A93D|ADBA02  |8002BA;
                       CMP.W #$0003                         ;80A940|C90300  |      ;
                       BNE +                                ;80A943|D017    |80A95C;
                       PHB                                  ;80A945|8B      |      ;
                       PHK                                  ;80A946|4B      |      ;
                       PLB                                  ;80A947|AB      |      ;
                       LDY.W #$A952                         ;80A948|A052A9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80A94B|22CAA080|80A0CA;
                       PLB                                  ;80A94F|AB      |      ;
                       BRA ++                               ;80A950|8008    |80A95A;
                       db $00,$28,$7E,$C0,$06,$80,$00,$78   ;80A952|        |      ;
 
                    ++ BRA CODE_JP_80A971                   ;80A95A|8015    |80A971;
 
                     + PHB                                  ;80A95C|8B      |      ;
                       PHK                                  ;80A95D|4B      |      ;
                       PLB                                  ;80A95E|AB      |      ;
                       LDY.W #$A969                         ;80A95F|A069A9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80A962|22CAA080|80A0CA;
                       PLB                                  ;80A966|AB      |      ;
                       BRA CODE_JP_80A971                   ;80A967|8008    |80A971;
                       db $00,$28,$7E,$00,$07,$80,$00,$78   ;80A969|        |      ;
 
       CODE_JP_80A971:
                       TDC                                  ;80A971|7B      |      ;
                       STA.L $7E6397                        ;80A972|8F97637E|7E6397;
                       PLB                                  ;80A976|AB      |      ;
                       RTS                                  ;80A977|60      |      ;
 
         DATA8_80A978:
                       db $86,$A9,$8F,$A9,$05,$AA,$12,$AA   ;80A978|        |      ;
                       db $1F,$AA,$27,$AB,$77,$A9           ;80A980|        |      ;
                       JSL.L CODE_FL_8882CA                 ;80A986|22CA8288|8882CA;
                       JSL.L CODE_FL_888553                 ;80A98A|22538588|888553;
                       RTS                                  ;80A98E|60      |      ;
                       LDA.L $7E634D                        ;80A98F|AF4D637E|7E634D;
                       DEC A                                ;80A993|3A      |      ;
                       STA.L $7E634D                        ;80A994|8F4D637E|7E634D;
                       BNE +                                ;80A998|D02A    |80A9C4;
                       LDA.W #$0006                         ;80A99A|A90600  |      ;
                       STA.L $7E634D                        ;80A99D|8F4D637E|7E634D;
                       LDA.L $7E6373                        ;80A9A1|AF73637E|7E6373;
                       CLC                                  ;80A9A5|18      |      ;
                       ADC.W #$0002                         ;80A9A6|690200  |      ;
                       AND.W #$003E                         ;80A9A9|293E00  |      ;
                       STA.L $7E6373                        ;80A9AC|8F73637E|7E6373;
                       LDA.W #$A6B9                         ;80A9B0|A9B9A6  |      ;
                       CLC                                  ;80A9B3|18      |      ;
                       ADC.L $7E6373                        ;80A9B4|6F73637E|7E6373;
                       STA.L $7E6362                        ;80A9B8|8F62637E|7E6362;
                       STA.L $7E6365                        ;80A9BC|8F65637E|7E6365;
                       STA.L $7E6368                        ;80A9C0|8F68637E|7E6368;
 
                     + JSL.L CODE_FL_8882CA                 ;80A9C4|22CA8288|8882CA;
                       PHB                                  ;80A9C8|8B      |      ;
                       PEA.W $7E00                          ;80A9C9|F4007E  |807E00;
                       PLB                                  ;80A9CC|AB      |      ;
                       PLB                                  ;80A9CD|AB      |      ;
                       LDA.W $634B                          ;80A9CE|AD4B63  |7E634B;
                       LSR A                                ;80A9D1|4A      |      ;
                       BCC +                                ;80A9D2|9003    |80A9D7;
                       INC.W $6342                          ;80A9D4|EE4263  |7E6342;
 
                     + DEC.W $634F                          ;80A9D7|CE4F63  |7E634F;
                       BNE +                                ;80A9DA|D027    |80AA03;
                       LDA.W #$0008                         ;80A9DC|A90800  |      ;
                       STA.W $634F                          ;80A9DF|8D4F63  |7E634F;
                       DEC.W $6351                          ;80A9E2|CE5163  |7E6351;
                       BNE ++                               ;80A9E5|D00F    |80A9F6;
                       LDA.W $6353                          ;80A9E7|AD5363  |7E6353;
                       EOR.W #$0001                         ;80A9EA|490100  |      ;
                       STA.W $6353                          ;80A9ED|8D5363  |7E6353;
                       LDA.W #$0004                         ;80A9F0|A90400  |      ;
                       STA.W $6351                          ;80A9F3|8D5163  |7E6351;
 
                    ++ LDA.W $6353                          ;80A9F6|AD5363  |7E6353;
                       BNE ++                               ;80A9F9|D005    |80AA00;
                       INC.W $04E6                          ;80A9FB|EEE604  |7E04E6;
                       BRA +                                ;80A9FE|8003    |80AA03;
 
                    ++ DEC.W $04E6                          ;80AA00|CEE604  |7E04E6;
 
                     + PLB                                  ;80AA03|AB      |      ;
                       RTS                                  ;80AA04|60      |      ;
                       JSL.L CODE_FL_888872                 ;80AA05|22728888|888872;
                       JSL.L CODE_FL_8882CA                 ;80AA09|22CA8288|8882CA;
                       JSL.L CODE_FL_88898B                 ;80AA0D|228B8988|88898B;
                       RTS                                  ;80AA11|60      |      ;
                       JSL.L CODE_FL_8889EE                 ;80AA12|22EE8988|8889EE;
                       JSL.L CODE_FL_8882CA                 ;80AA16|22CA8288|8882CA;
                       JSL.L CODE_FL_8583A1                 ;80AA1A|22A18385|8583A1;
                       RTS                                  ;80AA1E|60      |      ;
                       LDA.L $7E634D                        ;80AA1F|AF4D637E|7E634D;
                       DEC A                                ;80AA23|3A      |      ;
                       STA.L $7E634D                        ;80AA24|8F4D637E|7E634D;
                       BNE +                                ;80AA28|D03A    |80AA64;
                       LDA.W #$0006                         ;80AA2A|A90600  |      ;
                       STA.L $7E634D                        ;80AA2D|8F4D637E|7E634D;
                       LDA.L $7E6373                        ;80AA31|AF73637E|7E6373;
                       CLC                                  ;80AA35|18      |      ;
                       ADC.W #$0002                         ;80AA36|690200  |      ;
                       AND.W #$003E                         ;80AA39|293E00  |      ;
                       STA.L $7E6373                        ;80AA3C|8F73637E|7E6373;
                       LDA.W #$A739                         ;80AA40|A939A7  |      ;
                       CLC                                  ;80AA43|18      |      ;
                       ADC.L $7E6373                        ;80AA44|6F73637E|7E6373;
                       STA.L $7E6359                        ;80AA48|8F59637E|7E6359;
                       STA.L $7E635C                        ;80AA4C|8F5C637E|7E635C;
                       STA.L $7E635F                        ;80AA50|8F5F637E|7E635F;
                       STA.L $7E6362                        ;80AA54|8F62637E|7E6362;
                       STA.L $7E6365                        ;80AA58|8F65637E|7E6365;
                       STA.L $7E6368                        ;80AA5C|8F68637E|7E6368;
                       STA.L $7E636B                        ;80AA60|8F6B637E|7E636B;
 
                     + JSL.L CODE_FL_88957B                 ;80AA64|227B9588|88957B;
                       JSL.L CODE_FL_88981E                 ;80AA68|221E9888|88981E;
                       JSL.L CODE_FL_8882CA                 ;80AA6C|22CA8288|8882CA;
                       LDA.W $04E4                          ;80AA70|ADE404  |8004E4;
                       BNE +                                ;80AA73|D013    |80AA88;
                       PHB                                  ;80AA75|8B      |      ;
                       PHK                                  ;80AA76|4B      |      ;
                       PLB                                  ;80AA77|AB      |      ;
                       LDY.W #$AA82                         ;80AA78|A082AA  |      ;
                       JSL.L CODE_FL_80A07F                 ;80AA7B|227FA080|80A07F;
                       PLB                                  ;80AA7F|AB      |      ;
                       BRA +                                ;80AA80|8006    |80AA88;
                       db $C2,$87,$7E,$08,$00,$66           ;80AA82|        |      ;
 
                     + LDA.L $7E6377                        ;80AA88|AF77637E|7E6377;
                       BEQ +                                ;80AA8C|F00D    |80AA9B;
                       DEC A                                ;80AA8E|3A      |      ;
                       STA.L $7E6377                        ;80AA8F|8F77637E|7E6377;
                       RTS                                  ;80AA93|60      |      ;
 
                     - LDA.W #$FFFF                         ;80AA94|A9FFFF  |      ;
                       STA.L $7E6375                        ;80AA97|8F75637E|7E6375;
 
                     + LDA.L $7E6375                        ;80AA9B|AF75637E|7E6375;
                       INC A                                ;80AA9F|1A      |      ;
                       STA.L $7E6375                        ;80AAA0|8F75637E|7E6375;
                       LDA.L $7E6375                        ;80AAA4|AF75637E|7E6375;
                       ASL A                                ;80AAA8|0A      |      ;
                       ASL A                                ;80AAA9|0A      |      ;
                       ASL A                                ;80AAAA|0A      |      ;
                       CLC                                  ;80AAAB|18      |      ;
                       ADC.L $7E6375                        ;80AAAC|6F75637E|7E6375;
                       CLC                                  ;80AAB0|18      |      ;
                       ADC.L $7E6375                        ;80AAB1|6F75637E|7E6375;
                       TAX                                  ;80AAB5|AA      |      ;
                       LDA.W DATA8_80AADF,X                 ;80AAB6|BDDFAA  |80AADF;
                       CMP.W #$8000                         ;80AAB9|C90080  |      ;
                       BEQ -                                ;80AABC|F0D6    |80AA94;
                       STA.L $7E6377                        ;80AABE|8F77637E|7E6377;
                       LDA.W DATA8_80AAE1,X                 ;80AAC2|BDE1AA  |80AAE1;
                       STA.L $7E87C2                        ;80AAC5|8FC2877E|7E87C2;
                       LDA.W DATA8_80AAE3,X                 ;80AAC9|BDE3AA  |80AAE3;
                       STA.L $7E87C4                        ;80AACC|8FC4877E|7E87C4;
                       LDA.W DATA8_80AAE5,X                 ;80AAD0|BDE5AA  |80AAE5;
                       STA.L $7E87C6                        ;80AAD3|8FC6877E|7E87C6;
                       LDA.W DATA8_80AAE7,X                 ;80AAD7|BDE7AA  |80AAE7;
                       STA.L $7E87C8                        ;80AADA|8FC8877E|7E87C8;
                       RTS                                  ;80AADE|60      |      ;
 
         DATA8_80AADF:
                       db $0D,$00                           ;80AADF|        |      ;
 
         DATA8_80AAE1:
                       db $9C,$03                           ;80AAE1|        |      ;
 
         DATA8_80AAE3:
                       db $19,$02                           ;80AAE3|        |      ;
 
         DATA8_80AAE5:
                       db $58,$01                           ;80AAE5|        |      ;
 
         DATA8_80AAE7:
                       db $F7,$00,$0D,$00,$5C,$03,$F9,$01   ;80AAE7|        |      ;
                       db $38,$01,$D7,$00,$0D,$00,$1B,$03   ;80AAEF|        |      ;
                       db $B8,$01,$37,$01,$B6,$00,$0D,$00   ;80AAF7|        |      ;
                       db $DB,$02,$98,$01,$17,$01,$96,$00   ;80AAFF|        |      ;
                       db $0D,$00,$1B,$03,$B8,$01,$37,$01   ;80AB07|        |      ;
                       db $B6,$00,$0D,$00,$5C,$03,$F9,$01   ;80AB0F|        |      ;
                       db $38,$01,$D7,$00,$0D,$00,$9C,$03   ;80AB17|        |      ;
                       db $19,$02,$58,$01,$F7,$00,$00,$80   ;80AB1F|        |      ;
                       JSL.L CODE_FL_889C4A                 ;80AB27|224A9C88|889C4A;
                       JSL.L CODE_FL_8882CA                 ;80AB2B|22CA8288|8882CA;
                       JSL.L CODE_FL_889BDE                 ;80AB2F|22DE9B88|889BDE;
                       JSL.L CODE_FL_889D0A                 ;80AB33|220A9D88|889D0A;
                       LDA.L $7E6395                        ;80AB37|AF95637E|7E6395;
                       BNE +                                ;80AB3B|D04E    |80AB8B;
                       LDA.L $7E6377                        ;80AB3D|AF77637E|7E6377;
                       BEQ ++                               ;80AB41|F00D    |80AB50;
                       DEC A                                ;80AB43|3A      |      ;
                       STA.L $7E6377                        ;80AB44|8F77637E|7E6377;
                       RTS                                  ;80AB48|60      |      ;
 
                     - LDA.W #$FFFF                         ;80AB49|A9FFFF  |      ;
                       STA.L $7E6375                        ;80AB4C|8F75637E|7E6375;
 
                    ++ LDA.L $7E6375                        ;80AB50|AF75637E|7E6375;
                       INC A                                ;80AB54|1A      |      ;
                       STA.L $7E6375                        ;80AB55|8F75637E|7E6375;
                       LDA.L $7E6375                        ;80AB59|AF75637E|7E6375;
                       ASL A                                ;80AB5D|0A      |      ;
                       ASL A                                ;80AB5E|0A      |      ;
                       TAX                                  ;80AB5F|AA      |      ;
                       LDA.W DATA8_00AB8C,X                 ;80AB60|BD8CAB  |00AB8C;
                       CMP.W #$8000                         ;80AB63|C90080  |      ;
                       BEQ -                                ;80AB66|F0E1    |80AB49;
                       STA.L $7E6377                        ;80AB68|8F77637E|7E6377;
                       LDA.W DATA8_00AB8E,X                 ;80AB6C|BD8EAB  |00AB8E;
                       STA.L $7E87CE                        ;80AB6F|8FCE877E|7E87CE;
                       LDA.W $04E4                          ;80AB73|ADE404  |0004E4;
                       BNE +                                ;80AB76|D013    |80AB8B;
                       PHB                                  ;80AB78|8B      |      ;
                       PHK                                  ;80AB79|4B      |      ;
                       PLB                                  ;80AB7A|AB      |      ;
                       LDY.W #$AB85                         ;80AB7B|A085AB  |      ;
                       JSL.L CODE_FL_80A07F                 ;80AB7E|227FA080|80A07F;
                       PLB                                  ;80AB82|AB      |      ;
                       BRA +                                ;80AB83|8006    |80AB8B;
                       db $CE,$87,$7E,$02,$00,$6C           ;80AB85|        |      ;
 
                     + RTS                                  ;80AB8B|60      |      ;
                       db $20,$00,$7F,$7E,$06,$00,$9E,$72   ;80AB8C|        |      ;
                       db $06,$00,$BE,$66,$06,$00,$BD,$5A   ;80AB94|        |      ;
                       db $06,$00,$DD,$4E,$06,$00,$FC,$42   ;80AB9C|        |      ;
                       db $06,$00,$1B,$37,$06,$00,$1B,$2B   ;80ABA4|        |      ;
                       db $20,$00,$5B,$13,$00,$00,$59,$2B   ;80ABAC|        |      ;
                       db $06,$00,$57,$33,$06,$00,$76,$3F   ;80ABB4|        |      ;
                       db $06,$00,$95,$4B,$06,$00,$93,$53   ;80ABBC|        |      ;
                       db $06,$00,$B2,$5F,$20,$00,$B0,$67   ;80ABC4|        |      ;
                       db $06,$00,$B2,$5F,$06,$00,$93,$53   ;80ABCC|        |      ;
                       db $06,$00,$95,$4B,$06,$00,$76,$3F   ;80ABD4|        |      ;
                       db $06,$00,$57,$33,$06,$00,$59,$2B   ;80ABDC|        |      ;
                       db $20,$00,$5B,$13,$06,$00,$1B,$2B   ;80ABE4|        |      ;
                       db $06,$00,$1B,$37,$06,$00,$FC,$42   ;80ABEC|        |      ;
                       db $06,$00,$DD,$4E,$06,$00,$BD,$5A   ;80ABF4|        |      ;
                       db $06,$00,$BE,$66,$06,$00,$9E,$72   ;80ABFC|        |      ;
                       db $00,$80                           ;80AC04|        |      ;
 
       CODE_FN_80AC06:
                       REP #$20                             ;80AC06|C220    |      ;
                       LDA.W $02A8                          ;80AC08|ADA802  |8002A8;
                       BNE +                                ;80AC0B|D02A    |80AC37;
                       BMI +                                ;80AC0D|3028    |80AC37;
                       LDA.L $7E8F50                        ;80AC0F|AF508F7E|7E8F50;
                       BEQ +                                ;80AC13|F022    |80AC37;
                       LDA.W Character_1P                   ;80AC15|ADBA02  |8002BA;
                       CMP.W #$0006                         ;80AC18|C90600  |      ;
                       BNE +                                ;80AC1B|D01A    |80AC37;
                       SEP #$20                             ;80AC1D|E220    |      ;
                       INC.W $01D1                          ;80AC1F|EED101  |8001D1;
                       INC.W $01D1                          ;80AC22|EED101  |8001D1;
                       INC.W $01D1                          ;80AC25|EED101  |8001D1;
                       INC.W $01D1                          ;80AC28|EED101  |8001D1;
                       LDA.W $01D1                          ;80AC2B|ADD101  |8001D1;
                       STA.W BG2VOFS                        ;80AC2E|8D1021  |802110;
                       LDA.W $01D2                          ;80AC31|ADD201  |8001D2;
                       STA.W BG2VOFS                        ;80AC34|8D1021  |802110;
 
                     + REP #$20                             ;80AC37|C220    |      ;
                       RTS                                  ;80AC39|60      |      ;
 
       CODE_FN_80AC3A:
                       LDA.L $7E9349                        ;80AC3A|AF49937E|7E9349;
                       BNE +                                ;80AC3E|D003    |80AC43;
                       JMP.W CODE_JP_80ACE2                 ;80AC40|4CE2AC  |80ACE2;
 
                     + LDA.W Game_State                     ;80AC43|ADA002  |8002A0;
                       CMP.W #$0003                         ;80AC46|C90300  |      ;
                       BEQ +                                ;80AC49|F063    |80ACAE;
                       CMP.W #$0009                         ;80AC4B|C90900  |      ;
                       BEQ +                                ;80AC4E|F05E    |80ACAE;
                       LDA.L $7E9351                        ;80AC50|AF51937E|7E9351;
                       BNE ++                               ;80AC54|D02D    |80AC83;
                       LDX.W #$0088                         ;80AC56|A28800  |      ;
                       LDY.W #$00C7                         ;80AC59|A0C700  |      ;
                       LDA.W #$0000                         ;80AC5C|A90000  |      ;
                       STA.B $00                            ;80AC5F|8500    |000000;
                       LDA.W #$0013                         ;80AC61|A91300  |      ;
                       STA.B $02                            ;80AC64|8502    |000002;
                       LDA.W #$0000                         ;80AC66|A90000  |      ;
                       STA.B $08                            ;80AC69|8508    |000008;
                       LDA.W #$8600                         ;80AC6B|A90086  |      ;
                       STA.B $D6                            ;80AC6E|85D6    |0000D6;
                       LDA.W #$E18D                         ;80AC70|A98DE1  |      ;
                       STA.B $D5                            ;80AC73|85D5    |0000D5;
                       LDA.L $7E390E                        ;80AC75|AF0E397E|7E390E;
                       JSL.L CODE_FL_85BAFB                 ;80AC79|22FBBA85|85BAFB;
                       STA.L $7E390E                        ;80AC7D|8F0E397E|7E390E;
                       BRA +                                ;80AC81|802B    |80ACAE;
 
                    ++ LDX.W #$0080                         ;80AC83|A28000  |      ;
                       LDY.W #$00C7                         ;80AC86|A0C700  |      ;
                       LDA.W #$0000                         ;80AC89|A90000  |      ;
                       STA.B $00                            ;80AC8C|8500    |000000;
                       LDA.W #$0013                         ;80AC8E|A91300  |      ;
                       STA.B $02                            ;80AC91|8502    |000002;
                       LDA.W #$0000                         ;80AC93|A90000  |      ;
                       STA.B $08                            ;80AC96|8508    |000008;
                       LDA.W #$8600                         ;80AC98|A90086  |      ;
                       STA.B $D6                            ;80AC9B|85D6    |0000D6;
                       LDA.W #$E18D                         ;80AC9D|A98DE1  |      ;
                       STA.B $D5                            ;80ACA0|85D5    |0000D5;
                       LDA.L $7E390E                        ;80ACA2|AF0E397E|7E390E;
                       JSL.L CODE_FL_85BAFB                 ;80ACA6|22FBBA85|85BAFB;
                       STA.L $7E390E                        ;80ACAA|8F0E397E|7E390E;
 
                     + LDA.W $029F                          ;80ACAE|AD9F02  |80029F;
                       AND.W #$00FF                         ;80ACB1|29FF00  |      ;
                       BNE CODE_JP_80ACE2                   ;80ACB4|D02C    |80ACE2;
                       LDA.W $01B6                          ;80ACB6|ADB601  |8001B6;
                       AND.W #$00FF                         ;80ACB9|29FF00  |      ;
                       CMP.W #$000F                         ;80ACBC|C90F00  |      ;
                       BNE CODE_JP_80ACE2                   ;80ACBF|D021    |80ACE2;
                       LDA.L $7E935B                        ;80ACC1|AF5B937E|7E935B;
                       INC A                                ;80ACC5|1A      |      ;
                       STA.L $7E935B                        ;80ACC6|8F5B937E|7E935B;
                       LDA.B $B7                            ;80ACCA|A5B7    |0000B7;
                       ORA.B $B9                            ;80ACCC|05B9    |0000B9;
                       AND.W #$FFF0                         ;80ACCE|29F0FF  |      ;
                       BNE +                                ;80ACD1|D00B    |80ACDE;
                       LDA.L $7E935B                        ;80ACD3|AF5B937E|7E935B;
                       CMP.W #$05DC                         ;80ACD7|C9DC05  |      ;
                       BEQ +                                ;80ACDA|F002    |80ACDE;
                       BRA CODE_JP_80ACE2                   ;80ACDC|8004    |80ACE2;
 
                     + JSL.L CODE_FL_80ACE3                 ;80ACDE|22E3AC80|80ACE3;
 
       CODE_JP_80ACE2:
                       RTS                                  ;80ACE2|60      |      ;
 
       CODE_FL_80ACE3:
                       REP #$30                             ;80ACE3|C230    |      ;
                       LDA.W #$0002                         ;80ACE5|A90200  |      ;
                       JSL.L CODE_FL_80C612                 ;80ACE8|2212C680|80C612;
                       LDA.W #$0003                         ;80ACEC|A90300  |      ;
                       JSL.L CODE_FL_80C612                 ;80ACEF|2212C680|80C612;
                       LDA.L $7E9351                        ;80ACF3|AF51937E|7E9351;
                       BEQ +                                ;80ACF7|F00E    |80AD07;
                       LDA.W #$0004                         ;80ACF9|A90400  |      ;
                       JSL.L CODE_FL_80C612                 ;80ACFC|2212C680|80C612;
                       LDA.W #$0005                         ;80AD00|A90500  |      ;
                       JSL.L CODE_FL_80C612                 ;80AD03|2212C680|80C612;
 
                     + LDA.W #$0009                         ;80AD07|A90900  |      ;
                       STA.W Game_State                     ;80AD0A|8DA002  |8002A0;
                       LDA.W #$0001                         ;80AD0D|A90100  |      ;
                       STA.L $7E9357                        ;80AD10|8F57937E|7E9357;
                       JSL.L CODE_FL_86D7D8                 ;80AD14|22D8D786|86D7D8;
                       RTL                                  ;80AD18|6B      |      ;
                       db $08,$8B,$4B,$AB,$C2,$30,$AF,$5B   ;80AD19|        |      ;
                       db $93,$7E,$1A,$8F,$5B,$93,$7E,$C9   ;80AD21|        |00007E;
                       db $B8,$0B,$D0,$04,$AB,$28,$38,$6B   ;80AD29|        |      ;
                       db $AB,$28,$18,$6B                   ;80AD31|        |      ;
 
       CODE_FL_80AD35:
                       PHP                                  ;80AD35|08      |      ;
                       PHB                                  ;80AD36|8B      |      ;
                       PHK                                  ;80AD37|4B      |      ;
                       PLB                                  ;80AD38|AB      |      ;
                       REP #$30                             ;80AD39|C230    |      ;
                       LDA.L $7E933D                        ;80AD3B|AF3D937E|7E933D;
                       BEQ +                                ;80AD3F|F012    |80AD53;
                       LDA.L $7E934B                        ;80AD41|AF4B937E|7E934B;
                       ASL A                                ;80AD45|0A      |      ;
                       TAX                                  ;80AD46|AA      |      ;
                       JSR.W (DATA8_80AD56,X)               ;80AD47|FC56AD  |80AD56;
                       LDA.L $7E934B                        ;80AD4A|AF4B937E|7E934B;
                       INC A                                ;80AD4E|1A      |      ;
                       STA.L $7E934B                        ;80AD4F|8F4B937E|7E934B;
 
                     + PLB                                  ;80AD53|AB      |      ;
                       PLP                                  ;80AD54|28      |      ;
                       RTL                                  ;80AD55|6B      |      ;
 
         DATA8_80AD56:
                       db $68,$AD                           ;80AD56|        |      ;
                       db $8C,$AD                           ;80AD58|        |0071AD;
                       db $71,$AD                           ;80AD5A|        |      ;
                       db $8C,$AD                           ;80AD5C|        |007AAD;
                       db $7A,$AD                           ;80AD5E|        |      ;
                       db $A0,$AD                           ;80AD60|        |      ;
                       db $83,$AD                           ;80AD62|        |      ;
                       db $A0,$AD                           ;80AD64|        |      ;
                       db $B7,$AD                           ;80AD66|        |      ;
                       JSL.L CODE_FL_8AAEA3                 ;80AD68|22A3AE8A|8AAEA3;
                       JSL.L CODE_FL_86D7D8                 ;80AD6C|22D8D786|86D7D8;
                       RTS                                  ;80AD70|60      |      ;
                       JSL.L CODE_FL_8AAEA9                 ;80AD71|22A9AE8A|8AAEA9;
                       JSL.L CODE_FL_86D7D8                 ;80AD75|22D8D786|86D7D8;
                       RTS                                  ;80AD79|60      |      ;
                       JSL.L CODE_FL_8AAEAF                 ;80AD7A|22AFAE8A|8AAEAF;
                       JSL.L CODE_FL_86D7D8                 ;80AD7E|22D8D786|86D7D8;
                       RTS                                  ;80AD82|60      |      ;
                       JSL.L CODE_FL_8AAEB5                 ;80AD83|22B5AE8A|8AAEB5;
                       JSL.L CODE_FL_86D7D8                 ;80AD87|22D8D786|86D7D8;
                       RTS                                  ;80AD8B|60      |      ;
                       db $A9,$09,$00,$8D,$A0,$02,$7B,$8F   ;80AD8C|        |      ;
                       db $57,$93,$7E,$8F,$51,$93,$7E,$22   ;80AD94|        |000093;
                       db $D8,$D7,$86,$60,$A9,$09,$00,$8D   ;80AD9C|        |      ;
                       db $A0,$02,$7B,$8F,$57,$93,$7E,$A9   ;80ADA4|        |      ;
                       db $01,$00,$8F,$51,$93,$7E,$22,$D8   ;80ADAC|        |000000;
                       db $D7,$86,$60                       ;80ADB4|        |000086;
                       LDA.W #$000A                         ;80ADB7|A90A00  |      ;
                       STA.W Game_State                     ;80ADBA|8DA002  |8002A0;
                       TDC                                  ;80ADBD|7B      |      ;
                       STA.L $7E9357                        ;80ADBE|8F57937E|7E9357;
                       STA.L $7E9347                        ;80ADC2|8F47937E|7E9347;
                       STA.L Options_Character_Selection    ;80ADC6|8F45937E|7E9345;
                       RTS                                  ;80ADCA|60      |      ;
 
       CODE_FL_80ADCB:
                       PHP                                  ;80ADCB|08      |      ;
                       PHB                                  ;80ADCC|8B      |      ;
                       PHK                                  ;80ADCD|4B      |      ;
                       PLB                                  ;80ADCE|AB      |      ;
                       REP #$20                             ;80ADCF|C220    |      ;
                       LDA.W #$0000                         ;80ADD1|A90000  |      ;
                       STA.W Game_State                     ;80ADD4|8DA002  |8002A0;
                       STZ.W Game_State_State               ;80ADD7|9CA202  |8002A2;
                       PLB                                  ;80ADDA|AB      |      ;
                       PLP                                  ;80ADDB|28      |      ;
                       RTL                                  ;80ADDC|6B      |      ;
 
       CODE_FL_80ADDD:
                       PHP                                  ;80ADDD|08      |      ;
                       PHB                                  ;80ADDE|8B      |      ;
                       PHK                                  ;80ADDF|4B      |      ;
                       PLB                                  ;80ADE0|AB      |      ;
                       REP #$30                             ;80ADE1|C230    |      ;
                       LDA.L $7E9341                        ;80ADE3|AF41937E|7E9341;
                       CMP.W #$0002                         ;80ADE7|C90200  |      ;
                       BCS +                                ;80ADEA|B007    |80ADF3;
                       TDC                                  ;80ADEC|7B      |      ;
                       STA.L $7E9351                        ;80ADED|8F51937E|7E9351;
                       BRA ++                               ;80ADF1|8007    |80ADFA;
 
                     + LDA.W #$0001                         ;80ADF3|A90100  |      ;
                       STA.L $7E9351                        ;80ADF6|8F51937E|7E9351;
 
                    ++ LDA.L $7E934B                        ;80ADFA|AF4B937E|7E934B;
                       INC A                                ;80ADFE|1A      |      ;
                       STA.L $7E934B                        ;80ADFF|8F4B937E|7E934B;
                       LDA.W #$0009                         ;80AE03|A90900  |      ;
                       STA.W Game_State                     ;80AE06|8DA002  |8002A0;
                       TDC                                  ;80AE09|7B      |      ;
                       STA.L $7E9357                        ;80AE0A|8F57937E|7E9357;
                       JSL.L CODE_FL_86D7D8                 ;80AE0E|22D8D786|86D7D8;
                       PLB                                  ;80AE12|AB      |      ;
                       PLP                                  ;80AE13|28      |      ;
                       RTL                                  ;80AE14|6B      |      ;
 
       CODE_FL_80AE15:
                       PHP                                  ;80AE15|08      |      ;
                       PHB                                  ;80AE16|8B      |      ;
                       PHK                                  ;80AE17|4B      |      ;
                       PLB                                  ;80AE18|AB      |      ;
                       REP #$30                             ;80AE19|C230    |      ;
                       LDA.L BALL_Counter                   ;80AE1B|AF02397E|7E3902;
                       ASL A                                ;80AE1F|0A      |      ;
                       TAX                                  ;80AE20|AA      |      ;
                       JSR.W (DATA8_80AE27,X)               ;80AE21|FC27AE  |80AE27;
                       PLB                                  ;80AE24|AB      |      ;
                       PLP                                  ;80AE25|28      |      ;
                       RTL                                  ;80AE26|6B      |      ;
 
         DATA8_80AE27:
                       db $2F,$AE,$43,$AE,$57,$AE,$6B,$AE   ;80AE27|        |      ;
                       LDA.B $B7                            ;80AE2F|A5B7    |0000B7;
                       AND.W #!JOY_B                        ;80AE31|290080  |      ; !!o !JOY_B ; check for B input
                       BEQ +                                ;80AE34|F00A    |80AE40;
                       LDA.L BALL_Counter                   ;80AE36|AF02397E|7E3902;
                       INC A                                ;80AE3A|1A      |      ;
                       STA.L BALL_Counter                   ;80AE3B|8F02397E|7E3902;
                       RTS                                  ;80AE3F|60      |      ;
 
                     + JMP.W CODE_JP_80AE88                 ;80AE40|4C88AE  |80AE88;
                       LDA.B $B7                            ;80AE43|A5B7    |0000B7;
                       AND.W #!JOY_A                        ;80AE45|298000  |      ; !!o !JOY_A ; check for A input
                       BEQ +                                ;80AE48|F00A    |80AE54;
                       LDA.L BALL_Counter                   ;80AE4A|AF02397E|7E3902;
                       INC A                                ;80AE4E|1A      |      ;
                       STA.L BALL_Counter                   ;80AE4F|8F02397E|7E3902;
                       RTS                                  ;80AE53|60      |      ;
 
                     + JMP.W CODE_JP_80AE88                 ;80AE54|4C88AE  |80AE88;
                       LDA.B $B7                            ;80AE57|A5B7    |0000B7;
                       AND.W #!JOY_L                        ;80AE59|292000  |      ; !!o !JOY_L ; check for L input
                       BEQ +                                ;80AE5C|F00A    |80AE68;
                       LDA.L BALL_Counter                   ;80AE5E|AF02397E|7E3902;
                       INC A                                ;80AE62|1A      |      ;
                       STA.L BALL_Counter                   ;80AE63|8F02397E|7E3902;
                       RTS                                  ;80AE67|60      |      ;
 
                     + JMP.W CODE_JP_80AE88                 ;80AE68|4C88AE  |80AE88;
                       LDA.B $B7                            ;80AE6B|A5B7    |0000B7;
                       AND.W #!JOY_L                        ;80AE6D|292000  |      ; !!o !JOY_L ; check for L input
                       BEQ +                                ;80AE70|F013    |80AE85;
                       TDC                                  ;80AE72|7B      |      ;
                       STA.L BALL_Counter                   ;80AE73|8F02397E|7E3902;
                       LDA.W #$0001                         ;80AE77|A90100  |      ;
                       STA.L BALL_Active                    ;80AE7A|8F60947E|7E9460; we BALL
                       LDA.W #$0005                         ;80AE7E|A90500  |      ;
                       STA.W $1988                          ;80AE81|8D8819  |801988;
                       RTS                                  ;80AE84|60      |      ;
 
                     + JMP.W CODE_JP_80AE88                 ;80AE85|4C88AE  |80AE88;
 
       CODE_JP_80AE88:
                       LDA.B $B7                            ;80AE88|A5B7    |0000B7;
                       BEQ +                                ;80AE8A|F005    |80AE91;
                       TDC                                  ;80AE8C|7B      |      ;
                       STA.L BALL_Counter                   ;80AE8D|8F02397E|7E3902;
 
                     + RTS                                  ;80AE91|60      |      ;
 
       CODE_FN_80AE92:
                       PHP                                  ;80AE92|08      |      ;
                       PHB                                  ;80AE93|8B      |      ;
                       PHK                                  ;80AE94|4B      |      ;
                       PLB                                  ;80AE95|AB      |      ;
                       JSL.L CODE_FL_86D8F8                 ;80AE96|22F8D886|86D8F8;
                       JSL.L CODE_FL_86D973                 ;80AE9A|2273D986|86D973;
                       JSL.L CODE_FL_86D9CE                 ;80AE9E|22CED986|86D9CE;
                       REP #$20                             ;80AEA2|C220    |      ;
                       STZ.B $00                            ;80AEA4|6400    |000000;
                       SEP #$20                             ;80AEA6|E220    |      ;
                       REP #$10                             ;80AEA8|C210    |      ;
                       LDX.W #$008B                         ;80AEAA|A28B00  |      ;
 
                     - LDA.L $7EF148,X                      ;80AEAD|BF48F17E|7EF148;
                       CLC                                  ;80AEB1|18      |      ;
                       ADC.B $00                            ;80AEB2|6500    |000000;
                       STA.B $00                            ;80AEB4|8500    |000000;
                       DEX                                  ;80AEB6|CA      |      ;
                       BNE -                                ;80AEB7|D0F4    |80AEAD;
                       REP #$20                             ;80AEB9|C220    |      ;
                       LDA.L $7EF148                        ;80AEBB|AF48F17E|7EF148;
                       CLC                                  ;80AEBF|18      |      ;
                       ADC.B $00                            ;80AEC0|6500    |000000;
                       STA.B $00                            ;80AEC2|8500    |000000;
                       STA.L $7EFFFE                        ;80AEC4|8FFEFF7E|7EFFFE;
                       PLB                                  ;80AEC8|AB      |      ;
                       PLP                                  ;80AEC9|28      |      ;
                       RTS                                  ;80AECA|60      |      ;
 
       CODE_FL_80AECB:
                       SEP #$20                             ;80AECB|E220    |      ;
                       TYA                                  ;80AECD|98      |      ;
                       STA.W $0277                          ;80AECE|8D7702  |830277;
                       LDA.B #$01                           ;80AED1|A901    |      ;
                       STA.W $029F                          ;80AED3|8D9F02  |83029F;
                       LDA.W $029E                          ;80AED6|AD9E02  |83029E;
                       BPL +                                ;80AED9|100E    |80AEE9;
                       LDA.B #$00                           ;80AEDB|A900    |      ;
                       STA.W $01B6                          ;80AEDD|8DB601  |8301B6;
                       LDA.W $0277                          ;80AEE0|AD7702  |830277;
                       STA.W $0278                          ;80AEE3|8D7802  |830278;
                       STZ.W $029E                          ;80AEE6|9C9E02  |83029E;
 
                     + LDA.W $01B6                          ;80AEE9|ADB601  |8301B6;
                       AND.B #$0F                           ;80AEEC|290F    |      ;
                       CMP.B #$0F                           ;80AEEE|C90F    |      ;
                       BEQ +                                ;80AEF0|F018    |80AF0A;
                       DEC.W $0278                          ;80AEF2|CE7802  |830278;
                       BNE ++                               ;80AEF5|D00F    |80AF06;
                       LDA.W $0277                          ;80AEF7|AD7702  |830277;
                       STA.W $0278                          ;80AEFA|8D7802  |830278;
                       LDA.W $01B6                          ;80AEFD|ADB601  |8301B6;
                       INC A                                ;80AF00|1A      |      ;
                       AND.B #$0F                           ;80AF01|290F    |      ;
                       STA.W $01B6                          ;80AF03|8DB601  |8301B6;
 
                    ++ REP #$20                             ;80AF06|C220    |      ;
                       CLC                                  ;80AF08|18      |      ;
                       RTL                                  ;80AF09|6B      |      ;
 
                     + SEP #$20                             ;80AF0A|E220    |      ;
                       LDA.B #$FF                           ;80AF0C|A9FF    |      ;
                       STA.W $029E                          ;80AF0E|8D9E02  |83029E;
                       STZ.W $029F                          ;80AF11|9C9F02  |83029F;
                       REP #$20                             ;80AF14|C220    |      ;
                       SEC                                  ;80AF16|38      |      ;
                       RTL                                  ;80AF17|6B      |      ;
 
       CODE_FL_80AF18:
                       SEP #$20                             ;80AF18|E220    |      ;
                       TYA                                  ;80AF1A|98      |      ;
                       STA.W $0277                          ;80AF1B|8D7702  |820277;
                       LDA.B #$01                           ;80AF1E|A901    |      ;
                       STA.W $029F                          ;80AF20|8D9F02  |82029F;
                       LDA.W $029E                          ;80AF23|AD9E02  |82029E;
                       BPL +                                ;80AF26|100E    |80AF36;
                       LDA.B #$0F                           ;80AF28|A90F    |      ;
                       STA.W $01B6                          ;80AF2A|8DB601  |8201B6;
                       LDA.W $0277                          ;80AF2D|AD7702  |820277;
                       STA.W $0278                          ;80AF30|8D7802  |820278;
                       STZ.W $029E                          ;80AF33|9C9E02  |82029E;
 
                     + LDA.W $01B6                          ;80AF36|ADB601  |8201B6;
                       AND.B #$0F                           ;80AF39|290F    |      ;
                       BEQ +                                ;80AF3B|F018    |80AF55;
                       DEC.W $0278                          ;80AF3D|CE7802  |820278;
                       BNE ++                               ;80AF40|D00F    |80AF51;
                       LDA.W $0277                          ;80AF42|AD7702  |820277;
                       STA.W $0278                          ;80AF45|8D7802  |820278;
                       LDA.W $01B6                          ;80AF48|ADB601  |8201B6;
                       DEC A                                ;80AF4B|3A      |      ;
                       AND.B #$0F                           ;80AF4C|290F    |      ;
                       STA.W $01B6                          ;80AF4E|8DB601  |8201B6;
 
                    ++ REP #$20                             ;80AF51|C220    |      ;
                       CLC                                  ;80AF53|18      |      ;
                       RTL                                  ;80AF54|6B      |      ;
 
                     + SEP #$20                             ;80AF55|E220    |      ;
                       LDA.B #$FF                           ;80AF57|A9FF    |      ;
                       STA.W $029E                          ;80AF59|8D9E02  |82029E;
                       STZ.W $029F                          ;80AF5C|9C9F02  |82029F;
                       LDA.B #$80                           ;80AF5F|A980    |      ;
                       STA.W $01B6                          ;80AF61|8DB601  |8201B6;
                       REP #$20                             ;80AF64|C220    |      ;
                       SEC                                  ;80AF66|38      |      ;
                       RTL                                  ;80AF67|6B      |      ;
 
       CODE_FL_80AF68:
                       PHP                                  ;80AF68|08      |      ;
                       REP #$30                             ;80AF69|C230    |      ;
                       LDX.W #$0000                         ;80AF6B|A20000  |      ;
                       SEC                                  ;80AF6E|38      |      ;
                       SBC.W #$2710                         ;80AF6F|E91027  |      ;
                       BCC +                                ;80AF72|9003    |80AF77;
                       db $E8,$80,$F7                       ;80AF74|        |      ;
 
                     + STX.W $0370                          ;80AF77|8E7003  |870370;
                       CLC                                  ;80AF7A|18      |      ;
                       ADC.W #$2710                         ;80AF7B|691027  |      ;
                       LDX.W #$0000                         ;80AF7E|A20000  |      ;
                       SEC                                  ;80AF81|38      |      ;
                       SBC.W #$03E8                         ;80AF82|E9E803  |      ;
                       BCC +                                ;80AF85|9003    |80AF8A;
                       db $E8,$80,$F7                       ;80AF87|        |      ;
 
                     + STX.W $0372                          ;80AF8A|8E7203  |870372;
                       CLC                                  ;80AF8D|18      |      ;
                       ADC.W #$03E8                         ;80AF8E|69E803  |      ;
                       LDX.W #$0000                         ;80AF91|A20000  |      ;
                       SEC                                  ;80AF94|38      |      ;
                       SBC.W #$0064                         ;80AF95|E96400  |      ;
                       BCC +                                ;80AF98|9003    |80AF9D;
                       db $E8,$80,$F7                       ;80AF9A|        |      ;
 
                     + STX.W $0374                          ;80AF9D|8E7403  |870374;
                       CLC                                  ;80AFA0|18      |      ;
                       ADC.W #$0064                         ;80AFA1|696400  |      ;
                       LDX.W #$0000                         ;80AFA4|A20000  |      ;
 
                     - SEC                                  ;80AFA7|38      |      ;
                       SBC.W #$000A                         ;80AFA8|E90A00  |      ;
                       BCC +                                ;80AFAB|9003    |80AFB0;
                       INX                                  ;80AFAD|E8      |      ;
                       BRA -                                ;80AFAE|80F7    |80AFA7;
 
                     + STX.W $0376                          ;80AFB0|8E7603  |870376;
                       CLC                                  ;80AFB3|18      |      ;
                       ADC.W #$000A                         ;80AFB4|690A00  |      ;
                       LDX.W #$0000                         ;80AFB7|A20000  |      ;
 
                     - SEC                                  ;80AFBA|38      |      ;
                       SBC.W #$0001                         ;80AFBB|E90100  |      ;
                       BCC +                                ;80AFBE|9003    |80AFC3;
                       INX                                  ;80AFC0|E8      |      ;
                       BRA -                                ;80AFC1|80F7    |80AFBA;
 
                     + STX.W $0378                          ;80AFC3|8E7803  |870378;
                       CLC                                  ;80AFC6|18      |      ;
                       ADC.W #$0001                         ;80AFC7|690100  |      ;
                       PLP                                  ;80AFCA|28      |      ;
                       RTL                                  ;80AFCB|6B      |      ;
 
       CODE_FL_80AFCC:
                       PHP                                  ;80AFCC|08      |      ;
                       REP #$30                             ;80AFCD|C230    |      ;
                       LDX.W #$0000                         ;80AFCF|A20000  |      ;
                       SEC                                  ;80AFD2|38      |      ;
                       LDA.B $0C                            ;80AFD3|A50C    |00000C;
                       SBC.W #$86A0                         ;80AFD5|E9A086  |      ;
                       STA.B $0C                            ;80AFD8|850C    |00000C;
                       LDA.B $0E                            ;80AFDA|A50E    |00000E;
                       SBC.W #$0001                         ;80AFDC|E90100  |      ;
                       STA.B $0E                            ;80AFDF|850E    |00000E;
                       BMI +                                ;80AFE1|3003    |80AFE6;
                       db $E8,$80,$EC                       ;80AFE3|        |      ;
 
                     + STX.B $00                            ;80AFE6|8600    |000000;
                       CLC                                  ;80AFE8|18      |      ;
                       LDA.B $0C                            ;80AFE9|A50C    |00000C;
                       ADC.W #$86A0                         ;80AFEB|69A086  |      ;
                       STA.B $0C                            ;80AFEE|850C    |00000C;
                       LDA.B $0E                            ;80AFF0|A50E    |00000E;
                       ADC.W #$0001                         ;80AFF2|690100  |      ;
                       STA.B $0E                            ;80AFF5|850E    |00000E;
                       LDX.W #$0000                         ;80AFF7|A20000  |      ;
 
                     - SEC                                  ;80AFFA|38      |      ;
                       LDA.B $0C                            ;80AFFB|A50C    |00000C;
                       SBC.W #$2710                         ;80AFFD|E91027  |      ;
                       STA.B $0C                            ;80B000|850C    |00000C;
                       LDA.B $0E                            ;80B002|A50E    |00000E;
                       SBC.W #$0000                         ;80B004|E90000  |      ;
                       STA.B $0E                            ;80B007|850E    |00000E;
                       BMI +                                ;80B009|3003    |80B00E;
                       INX                                  ;80B00B|E8      |      ;
                       BRA -                                ;80B00C|80EC    |80AFFA;
 
                     + STX.B $02                            ;80B00E|8602    |000002;
                       CLC                                  ;80B010|18      |      ;
                       LDA.B $0C                            ;80B011|A50C    |00000C;
                       ADC.W #$2710                         ;80B013|691027  |      ;
                       STA.B $0C                            ;80B016|850C    |00000C;
                       LDA.B $0E                            ;80B018|A50E    |00000E;
                       ADC.W #$0000                         ;80B01A|690000  |      ;
                       STA.B $0E                            ;80B01D|850E    |00000E;
                       LDX.W #$0000                         ;80B01F|A20000  |      ;
 
                     - SEC                                  ;80B022|38      |      ;
                       LDA.B $0C                            ;80B023|A50C    |00000C;
                       SBC.W #$03E8                         ;80B025|E9E803  |      ;
                       STA.B $0C                            ;80B028|850C    |00000C;
                       LDA.B $0E                            ;80B02A|A50E    |00000E;
                       SBC.W #$0000                         ;80B02C|E90000  |      ;
                       STA.B $0E                            ;80B02F|850E    |00000E;
                       BMI +                                ;80B031|3003    |80B036;
                       INX                                  ;80B033|E8      |      ;
                       BRA -                                ;80B034|80EC    |80B022;
 
                     + STX.B $04                            ;80B036|8604    |000004;
                       CLC                                  ;80B038|18      |      ;
                       LDA.B $0C                            ;80B039|A50C    |00000C;
                       ADC.W #$03E8                         ;80B03B|69E803  |      ;
                       STA.B $0C                            ;80B03E|850C    |00000C;
                       LDA.B $0E                            ;80B040|A50E    |00000E;
                       ADC.W #$0000                         ;80B042|690000  |      ;
                       STA.B $0E                            ;80B045|850E    |00000E;
                       LDX.W #$0000                         ;80B047|A20000  |      ;
 
                     - SEC                                  ;80B04A|38      |      ;
                       LDA.B $0C                            ;80B04B|A50C    |00000C;
                       SBC.W #$0064                         ;80B04D|E96400  |      ;
                       STA.B $0C                            ;80B050|850C    |00000C;
                       LDA.B $0E                            ;80B052|A50E    |00000E;
                       SBC.W #$0000                         ;80B054|E90000  |      ;
                       STA.B $0E                            ;80B057|850E    |00000E;
                       BMI +                                ;80B059|3003    |80B05E;
                       INX                                  ;80B05B|E8      |      ;
                       BRA -                                ;80B05C|80EC    |80B04A;
 
                     + STX.B $06                            ;80B05E|8606    |000006;
                       CLC                                  ;80B060|18      |      ;
                       LDA.B $0C                            ;80B061|A50C    |00000C;
                       ADC.W #$0064                         ;80B063|696400  |      ;
                       STA.B $0C                            ;80B066|850C    |00000C;
                       LDA.B $0E                            ;80B068|A50E    |00000E;
                       ADC.W #$0000                         ;80B06A|690000  |      ;
                       STA.B $0E                            ;80B06D|850E    |00000E;
                       LDX.W #$0000                         ;80B06F|A20000  |      ;
 
                     - SEC                                  ;80B072|38      |      ;
                       LDA.B $0C                            ;80B073|A50C    |00000C;
                       SBC.W #$000A                         ;80B075|E90A00  |      ;
                       STA.B $0C                            ;80B078|850C    |00000C;
                       LDA.B $0E                            ;80B07A|A50E    |00000E;
                       SBC.W #$0000                         ;80B07C|E90000  |      ;
                       STA.B $0E                            ;80B07F|850E    |00000E;
                       BMI +                                ;80B081|3003    |80B086;
                       INX                                  ;80B083|E8      |      ;
                       BRA -                                ;80B084|80EC    |80B072;
 
                     + STX.B $08                            ;80B086|8608    |000008;
                       CLC                                  ;80B088|18      |      ;
                       LDA.B $0C                            ;80B089|A50C    |00000C;
                       ADC.W #$000A                         ;80B08B|690A00  |      ;
                       STA.B $0C                            ;80B08E|850C    |00000C;
                       LDA.B $0E                            ;80B090|A50E    |00000E;
                       ADC.W #$0000                         ;80B092|690000  |      ;
                       STA.B $0E                            ;80B095|850E    |00000E;
                       LDX.W #$0000                         ;80B097|A20000  |      ;
 
                     - SEC                                  ;80B09A|38      |      ;
                       LDA.B $0C                            ;80B09B|A50C    |00000C;
                       SBC.W #$0001                         ;80B09D|E90100  |      ;
                       STA.B $0C                            ;80B0A0|850C    |00000C;
                       LDA.B $0E                            ;80B0A2|A50E    |00000E;
                       SBC.W #$0000                         ;80B0A4|E90000  |      ;
                       STA.B $0E                            ;80B0A7|850E    |00000E;
                       BMI +                                ;80B0A9|3003    |80B0AE;
                       INX                                  ;80B0AB|E8      |      ;
                       BRA -                                ;80B0AC|80EC    |80B09A;
 
                     + STX.B $0A                            ;80B0AE|860A    |00000A;
                       CLC                                  ;80B0B0|18      |      ;
                       LDA.B $0C                            ;80B0B1|A50C    |00000C;
                       ADC.W #$0001                         ;80B0B3|690100  |      ;
                       STA.B $0C                            ;80B0B6|850C    |00000C;
                       LDA.B $0E                            ;80B0B8|A50E    |00000E;
                       ADC.W #$0000                         ;80B0BA|690000  |      ;
                       STA.B $0E                            ;80B0BD|850E    |00000E;
                       PLP                                  ;80B0BF|28      |      ;
                       RTL                                  ;80B0C0|6B      |      ;
 
       CODE_FL_80B0C1:
                       LDY.W #$0000                         ;80B0C1|A00000  |      ;
                       STY.W $0366                          ;80B0C4|8C6603  |870366;
                       LDA.W #$0000                         ;80B0C7|A90000  |      ;
                       STA.B $02                            ;80B0CA|8502    |000002;
                       LDX.W #$001A                         ;80B0CC|A21A00  |      ;
 
                     - LDA.L $7E871A,X                      ;80B0CF|BF1A877E|7E871A;
                       CMP.B $02                            ;80B0D3|C502    |000002;
                       BEQ +                                ;80B0D5|F009    |80B0E0;
                       INY                                  ;80B0D7|C8      |      ;
                       JSL.L CODE_FL_80B32C                 ;80B0D8|222CB380|80B32C;
                       STA.L $7E871A,X                      ;80B0DC|9F1A877E|7E871A;
 
                     + DEX                                  ;80B0E0|CA      |      ;
                       DEX                                  ;80B0E1|CA      |      ;
                       BPL -                                ;80B0E2|10EB    |80B0CF;
                       LDX.W #$001A                         ;80B0E4|A21A00  |      ;
 
                     - LDA.L $7E873A,X                      ;80B0E7|BF3A877E|7E873A;
                       CMP.B $02                            ;80B0EB|C502    |000002;
                       BEQ +                                ;80B0ED|F009    |80B0F8;
                       INY                                  ;80B0EF|C8      |      ;
                       JSL.L CODE_FL_80B32C                 ;80B0F0|222CB380|80B32C;
                       STA.L $7E873A,X                      ;80B0F4|9F3A877E|7E873A;
 
                     + DEX                                  ;80B0F8|CA      |      ;
                       DEX                                  ;80B0F9|CA      |      ;
                       BPL -                                ;80B0FA|10EB    |80B0E7;
                       STY.W $0366                          ;80B0FC|8C6603  |870366;
                       RTL                                  ;80B0FF|6B      |      ;
 
       CODE_FL_80B100:
                       LDY.W #$0000                         ;80B100|A00000  |      ;
                       STY.W $0366                          ;80B103|8C6603  |870366;
                       LDA.W #$7FFF                         ;80B106|A9FF7F  |      ;
                       STA.B $02                            ;80B109|8502    |000002;
                       LDX.W #$01FE                         ;80B10B|A2FE01  |      ;
 
                     - LDA.L $7E86F6,X                      ;80B10E|BFF6867E|7E86F6;
                       CMP.B $02                            ;80B112|C502    |000002;
                       BEQ +                                ;80B114|F009    |80B11F;
                       INY                                  ;80B116|C8      |      ;
                       JSL.L CODE_FL_80B32C                 ;80B117|222CB380|80B32C;
                       STA.L $7E86F6,X                      ;80B11B|9FF6867E|7E86F6;
 
                     + DEX                                  ;80B11F|CA      |      ;
                       DEX                                  ;80B120|CA      |      ;
                       BPL -                                ;80B121|10EB    |80B10E;
                       LDX.W #$037C                         ;80B123|A27C03  |      ;
 
                     - LDA.L $7E4C1E,X                      ;80B126|BF1E4C7E|7E4C1E;
                       CMP.B $02                            ;80B12A|C502    |000002;
                       BEQ +                                ;80B12C|F009    |80B137;
                       INY                                  ;80B12E|C8      |      ;
                       JSL.L CODE_FL_80B32C                 ;80B12F|222CB380|80B32C;
                       STA.L $7E4C1E,X                      ;80B133|9F1E4C7E|7E4C1E;
 
                     + DEX                                  ;80B137|CA      |      ;
                       DEX                                  ;80B138|CA      |      ;
                       DEX                                  ;80B139|CA      |      ;
                       DEX                                  ;80B13A|CA      |      ;
                       BPL -                                ;80B13B|10E9    |80B126;
                       STY.W $0366                          ;80B13D|8C6603  |870366;
                       RTL                                  ;80B140|6B      |      ;
 
       CODE_FL_80B141:
                       LDX.W #$001C                         ;80B141|A21C00  |      ;
 
                     - LDA.L $7E501E,X                      ;80B144|BF1E507E|7E501E;
                       CMP.L $7E87B8,X                      ;80B148|DFB8877E|7E87B8;
                       BEQ +                                ;80B14C|F014    |80B162;
                       STA.B $02                            ;80B14E|8502    |000002;
                       LDA.W #$0001                         ;80B150|A90100  |      ;
                       STA.W $0366                          ;80B153|8D6603  |820366;
                       LDA.L $7E87B8,X                      ;80B156|BFB8877E|7E87B8;
                       JSL.L CODE_FL_80B32C                 ;80B15A|222CB380|80B32C;
                       STA.L $7E87B8,X                      ;80B15E|9FB8877E|7E87B8;
 
                     + DEX                                  ;80B162|CA      |      ;
                       DEX                                  ;80B163|CA      |      ;
                       BPL -                                ;80B164|10DE    |80B144;
                       RTL                                  ;80B166|6B      |      ;
 
       CODE_FL_80B167:
                       LDX.W #$001C                         ;80B167|A21C00  |      ;
 
                     - LDA.L $7E503E,X                      ;80B16A|BF3E507E|7E503E;
                       CMP.L $7E87B8,X                      ;80B16E|DFB8877E|7E87B8;
                       BEQ +                                ;80B172|F014    |80B188;
                       STA.B $02                            ;80B174|8502    |000002;
                       LDA.W #$0001                         ;80B176|A90100  |      ;
                       STA.W $0366                          ;80B179|8D6603  |870366;
                       LDA.L $7E87B8,X                      ;80B17C|BFB8877E|7E87B8;
                       JSL.L CODE_FL_80B32C                 ;80B180|222CB380|80B32C;
                       STA.L $7E87B8,X                      ;80B184|9FB8877E|7E87B8;
 
                     + DEX                                  ;80B188|CA      |      ;
                       DEX                                  ;80B189|CA      |      ;
                       BPL -                                ;80B18A|10DE    |80B16A;
                       RTL                                  ;80B18C|6B      |      ;
 
       CODE_FL_80B18D:
                       LDX.W #$001C                         ;80B18D|A21C00  |      ;
 
                     - LDA.L $7E505E,X                      ;80B190|BF5E507E|7E505E;
                       CMP.L $7E87D8,X                      ;80B194|DFD8877E|7E87D8;
                       BEQ +                                ;80B198|F014    |80B1AE;
                       STA.B $02                            ;80B19A|8502    |000002;
                       LDA.W #$0001                         ;80B19C|A90100  |      ;
                       STA.W $0366                          ;80B19F|8D6603  |820366;
                       LDA.L $7E87D8,X                      ;80B1A2|BFD8877E|7E87D8;
                       JSL.L CODE_FL_80B32C                 ;80B1A6|222CB380|80B32C;
                       STA.L $7E87D8,X                      ;80B1AA|9FD8877E|7E87D8;
 
                     + DEX                                  ;80B1AE|CA      |      ;
                       DEX                                  ;80B1AF|CA      |      ;
                       BPL -                                ;80B1B0|10DE    |80B190;
                       RTL                                  ;80B1B2|6B      |      ;
 
       CODE_FL_80B1B3:
                       LDX.W #$001C                         ;80B1B3|A21C00  |      ;
 
                     - LDA.L $7E507E,X                      ;80B1B6|BF7E507E|7E507E;
                       CMP.L $7E87D8,X                      ;80B1BA|DFD8877E|7E87D8;
                       BEQ +                                ;80B1BE|F014    |80B1D4;
                       STA.B $02                            ;80B1C0|8502    |000002;
                       LDA.W #$0001                         ;80B1C2|A90100  |      ;
                       STA.W $0366                          ;80B1C5|8D6603  |870366;
                       LDA.L $7E87D8,X                      ;80B1C8|BFD8877E|7E87D8;
                       JSL.L CODE_FL_80B32C                 ;80B1CC|222CB380|80B32C;
                       STA.L $7E87D8,X                      ;80B1D0|9FD8877E|7E87D8;
 
                     + DEX                                  ;80B1D4|CA      |      ;
                       DEX                                  ;80B1D5|CA      |      ;
                       BPL -                                ;80B1D6|10DE    |80B1B6;
                       RTL                                  ;80B1D8|6B      |      ;
 
       CODE_FL_80B1D9:
                       LDX.W #$003A                         ;80B1D9|A23A00  |      ;
 
                     - LDA.L $7E509E,X                      ;80B1DC|BF9E507E|7E509E;
                       CMP.L $7E8718,X                      ;80B1E0|DF18877E|7E8718;
                       BEQ +                                ;80B1E4|F014    |80B1FA;
                       STA.B $02                            ;80B1E6|8502    |000002;
                       LDA.W #$0001                         ;80B1E8|A90100  |      ;
                       STA.W $0366                          ;80B1EB|8D6603  |870366;
                       LDA.L $7E8718,X                      ;80B1EE|BF18877E|7E8718;
                       JSL.L CODE_FL_80B32C                 ;80B1F2|222CB380|80B32C;
                       STA.L $7E8718,X                      ;80B1F6|9F18877E|7E8718;
 
                     + DEX                                  ;80B1FA|CA      |      ;
                       DEX                                  ;80B1FB|CA      |      ;
                       BPL -                                ;80B1FC|10DE    |80B1DC;
                       RTL                                  ;80B1FE|6B      |      ;
 
       CODE_FL_80B1FF:
                       LDA.W #$0000                         ;80B1FF|A90000  |      ;
                       STA.B $02                            ;80B202|8502    |000002;
                       LDX.W #$003A                         ;80B204|A23A00  |      ;
 
                     - LDA.L $7E8718,X                      ;80B207|BF18877E|7E8718;
                       CMP.B $02                            ;80B20B|C502    |000002;
                       BEQ +                                ;80B20D|F012    |80B221;
                       LDA.W #$0001                         ;80B20F|A90100  |      ;
                       STA.W $0366                          ;80B212|8D6603  |820366;
                       LDA.L $7E8718,X                      ;80B215|BF18877E|7E8718;
                       JSL.L CODE_FL_80B32C                 ;80B219|222CB380|80B32C;
                       STA.L $7E8718,X                      ;80B21D|9F18877E|7E8718;
 
                     + DEX                                  ;80B221|CA      |      ;
                       DEX                                  ;80B222|CA      |      ;
                       BPL -                                ;80B223|10E2    |80B207;
                       RTL                                  ;80B225|6B      |      ;
 
       CODE_FL_80B226:
                       LDX.W #$0004                         ;80B226|A20400  |      ;
 
                     - LDA.L $7E50DC,X                      ;80B229|BFDC507E|7E50DC;
                       CMP.L $7E875A,X                      ;80B22D|DF5A877E|7E875A;
                       BEQ +                                ;80B231|F014    |80B247;
                       STA.B $02                            ;80B233|8502    |000002;
                       LDA.W #$0001                         ;80B235|A90100  |      ;
                       STA.W $0366                          ;80B238|8D6603  |820366;
                       LDA.L $7E875A,X                      ;80B23B|BF5A877E|7E875A;
                       JSL.L CODE_FL_80B32C                 ;80B23F|222CB380|80B32C;
                       STA.L $7E875A,X                      ;80B243|9F5A877E|7E875A;
 
                     + DEX                                  ;80B247|CA      |      ;
                       DEX                                  ;80B248|CA      |      ;
                       BPL -                                ;80B249|10DE    |80B229;
                       RTL                                  ;80B24B|6B      |      ;
 
       CODE_FL_80B24C:
                       LDA.W #$0000                         ;80B24C|A90000  |      ;
                       STA.B $02                            ;80B24F|8502    |000002;
                       LDX.W #$0004                         ;80B251|A20400  |      ;
 
                     - LDA.L $7E875A,X                      ;80B254|BF5A877E|7E875A;
                       CMP.B $02                            ;80B258|C502    |000002;
                       BEQ +                                ;80B25A|F012    |80B26E;
                       LDA.W #$0001                         ;80B25C|A90100  |      ;
                       STA.W $0366                          ;80B25F|8D6603  |820366;
                       LDA.L $7E875A,X                      ;80B262|BF5A877E|7E875A;
                       JSL.L CODE_FL_80B32C                 ;80B266|222CB380|80B32C;
                       STA.L $7E875A,X                      ;80B26A|9F5A877E|7E875A;
 
                     + DEX                                  ;80B26E|CA      |      ;
                       DEX                                  ;80B26F|CA      |      ;
                       BPL -                                ;80B270|10E2    |80B254;
                       RTL                                  ;80B272|6B      |      ;
 
       CODE_FL_80B273:
                       LDX.W #$0004                         ;80B273|A20400  |      ;
 
                     - LDA.L $7E50E2,X                      ;80B276|BFE2507E|7E50E2;
                       CMP.L $7E877A,X                      ;80B27A|DF7A877E|7E877A;
                       BEQ +                                ;80B27E|F014    |80B294;
                       STA.B $02                            ;80B280|8502    |000002;
                       LDA.W #$0001                         ;80B282|A90100  |      ;
                       STA.W $0366                          ;80B285|8D6603  |820366;
                       LDA.L $7E877A,X                      ;80B288|BF7A877E|7E877A;
                       JSL.L CODE_FL_80B32C                 ;80B28C|222CB380|80B32C;
                       STA.L $7E877A,X                      ;80B290|9F7A877E|7E877A;
 
                     + DEX                                  ;80B294|CA      |      ;
                       DEX                                  ;80B295|CA      |      ;
                       BPL -                                ;80B296|10DE    |80B276;
                       RTL                                  ;80B298|6B      |      ;
 
       CODE_FL_80B299:
                       LDA.W #$0000                         ;80B299|A90000  |      ;
                       STA.B $02                            ;80B29C|8502    |000002;
                       LDX.W #$0004                         ;80B29E|A20400  |      ;
 
                     - LDA.L $7E877A,X                      ;80B2A1|BF7A877E|7E877A;
                       CMP.B $02                            ;80B2A5|C502    |000002;
                       BEQ +                                ;80B2A7|F012    |80B2BB;
                       LDA.W #$0001                         ;80B2A9|A90100  |      ;
                       STA.W $0366                          ;80B2AC|8D6603  |820366;
                       LDA.L $7E877A,X                      ;80B2AF|BF7A877E|7E877A;
                       JSL.L CODE_FL_80B32C                 ;80B2B3|222CB380|80B32C;
                       STA.L $7E877A,X                      ;80B2B7|9F7A877E|7E877A;
 
                     + DEX                                  ;80B2BB|CA      |      ;
                       DEX                                  ;80B2BC|CA      |      ;
                       BPL -                                ;80B2BD|10E2    |80B2A1;
                       RTL                                  ;80B2BF|6B      |      ;
 
       CODE_FL_80B2C0:
                       LDX.W #$0320                         ;80B2C0|A22003  |      ;
 
                     - LDA.L $7E441C,X                      ;80B2C3|BF1C447E|7E441C;
                       CMP.L $7E4C1C,X                      ;80B2C7|DF1C4C7E|7E4C1C;
                       BEQ +                                ;80B2CB|F014    |80B2E1;
                       STA.B $02                            ;80B2CD|8502    |000002;
                       LDA.W #$0001                         ;80B2CF|A90100  |      ;
                       STA.W $0366                          ;80B2D2|8D6603  |870366;
                       LDA.L $7E4C1C,X                      ;80B2D5|BF1C4C7E|7E4C1C;
                       JSL.L CODE_FL_80B32C                 ;80B2D9|222CB380|80B32C;
                       STA.L $7E4C1C,X                      ;80B2DD|9F1C4C7E|7E4C1C;
 
                     + DEX                                  ;80B2E1|CA      |      ;
                       DEX                                  ;80B2E2|CA      |      ;
                       BPL -                                ;80B2E3|10DE    |80B2C3;
                       RTL                                  ;80B2E5|6B      |      ;
 
       CODE_FL_80B2E6:
                       LDX.W #$0320                         ;80B2E6|A22003  |      ;
 
                     - LDA.L $7E481C,X                      ;80B2E9|BF1C487E|7E481C;
                       CMP.L $7E4C1C,X                      ;80B2ED|DF1C4C7E|7E4C1C;
                       BEQ +                                ;80B2F1|F014    |80B307;
                       STA.B $02                            ;80B2F3|8502    |000002;
                       LDA.W #$0001                         ;80B2F5|A90100  |      ;
                       STA.W $0366                          ;80B2F8|8D6603  |820366;
                       LDA.L $7E4C1C,X                      ;80B2FB|BF1C4C7E|7E4C1C;
                       JSL.L CODE_FL_80B32C                 ;80B2FF|222CB380|80B32C;
                       STA.L $7E4C1C,X                      ;80B303|9F1C4C7E|7E4C1C;
 
                     + DEX                                  ;80B307|CA      |      ;
                       DEX                                  ;80B308|CA      |      ;
                       BPL -                                ;80B309|10DE    |80B2E9;
                       RTL                                  ;80B30B|6B      |      ;
 
       CODE_FL_80B30C:
                       LDX.W #$001C                         ;80B30C|A21C00  |      ;
 
                     - LDA.L $7E391C,X                      ;80B30F|BF1C397E|7E391C;
                       CMP.L $7E88B8,X                      ;80B313|DFB8887E|7E88B8;
                       BEQ +                                ;80B317|F00E    |80B327;
                       db $85,$02,$BF,$B8,$88,$7E,$22,$2C   ;80B319|        |000002;
                       db $B3,$80,$9F,$B8,$88,$7E           ;80B321|        |000080;
 
                     + DEX                                  ;80B327|CA      |      ;
                       DEX                                  ;80B328|CA      |      ;
                       BPL -                                ;80B329|10E4    |80B30F;
                       RTL                                  ;80B32B|6B      |      ;
 
       CODE_FL_80B32C:
                       STA.B $00                            ;80B32C|8500    |000000;
                       STZ.B $06                            ;80B32E|6406    |000006;
                       STZ.B $08                            ;80B330|6408    |000008;
                       STZ.B $0A                            ;80B332|640A    |00000A;
                       LDA.B $02                            ;80B334|A502    |000002;
                       AND.W #$001F                         ;80B336|291F00  |      ;
                       STA.B $06                            ;80B339|8506    |000006;
                       LDA.B $00                            ;80B33B|A500    |000000;
                       AND.W #$001F                         ;80B33D|291F00  |      ;
                       CMP.B $06                            ;80B340|C506    |000006;
                       BEQ +                                ;80B342|F008    |80B34C;
                       BCC ++                               ;80B344|9003    |80B349;
                       DEC A                                ;80B346|3A      |      ;
                       BRA +++                              ;80B347|8001    |80B34A;
 
                    ++ INC A                                ;80B349|1A      |      ;
 
                   +++ STA.B $06                            ;80B34A|8506    |000006;
 
                     + LDA.B $02                            ;80B34C|A502    |000002;
                       AND.W #$03E0                         ;80B34E|29E003  |      ;
                       STA.B $08                            ;80B351|8508    |000008;
                       LDA.B $00                            ;80B353|A500    |000000;
                       AND.W #$03E0                         ;80B355|29E003  |      ;
                       CMP.B $08                            ;80B358|C508    |000008;
                       BEQ +                                ;80B35A|F00E    |80B36A;
                       BCC ++                               ;80B35C|9006    |80B364;
                       SEC                                  ;80B35E|38      |      ;
                       SBC.W #$0020                         ;80B35F|E92000  |      ;
                       BRA +++                              ;80B362|8004    |80B368;
 
                    ++ CLC                                  ;80B364|18      |      ;
                       ADC.W #$0020                         ;80B365|692000  |      ;
 
                   +++ STA.B $08                            ;80B368|8508    |000008;
 
                     + LDA.B $02                            ;80B36A|A502    |000002;
                       AND.W #$7C00                         ;80B36C|29007C  |      ;
                       STA.B $0A                            ;80B36F|850A    |00000A;
                       LDA.B $00                            ;80B371|A500    |000000;
                       AND.W #$7C00                         ;80B373|29007C  |      ;
                       CMP.B $0A                            ;80B376|C50A    |00000A;
                       BEQ +                                ;80B378|F00E    |80B388;
                       BCC ++                               ;80B37A|9006    |80B382;
                       SEC                                  ;80B37C|38      |      ;
                       SBC.W #$0400                         ;80B37D|E90004  |      ;
                       BRA +++                              ;80B380|8004    |80B386;
 
                    ++ CLC                                  ;80B382|18      |      ;
                       ADC.W #$0400                         ;80B383|690004  |      ;
 
                   +++ STA.B $0A                            ;80B386|850A    |00000A;
 
                     + LDA.B $06                            ;80B388|A506    |000006;
                       ORA.B $08                            ;80B38A|0508    |000008;
                       ORA.B $0A                            ;80B38C|050A    |00000A;
                       RTL                                  ;80B38E|6B      |      ;
 
       CODE_FL_80B38F:
                       PHP                                  ;80B38F|08      |      ;
                       PHB                                  ;80B390|8B      |      ;
                       PHK                                  ;80B391|4B      |      ;
                       PLB                                  ;80B392|AB      |      ;
                       REP #$30                             ;80B393|C230    |      ;
                       LDA.W #$0209                         ;80B395|A90902  |      ;
                       STA.W $01F7                          ;80B398|8DF701  |8001F7;
                       STZ.W $0203                          ;80B39B|9C0302  |800203;
                       STZ.W $0205                          ;80B39E|9C0502  |800205;
                       LDA.W #$4C1C                         ;80B3A1|A91C4C  |      ;
                       STA.W $0201                          ;80B3A4|8D0102  |800201;
                       LDA.W #$00C8                         ;80B3A7|A9C800  |      ;
                       STA.W $01FF                          ;80B3AA|8DFF01  |8001FF;
                       LDA.W #$0080                         ;80B3AD|A98000  |      ;
                       STA.W $0203                          ;80B3B0|8D0302  |800203;
                       LDA.W #$01E0                         ;80B3B3|A9E001  |      ;
                       STA.W $0205                          ;80B3B6|8D0502  |800205;
                       JSR.W CODE_FN_80B3C5                 ;80B3B9|20C5B3  |80B3C5;
                       STZ.W $01FF                          ;80B3BC|9CFF01  |8001FF;
                       JSR.W CODE_FN_80B3C5                 ;80B3BF|20C5B3  |80B3C5;
                       PLB                                  ;80B3C2|AB      |      ;
                       PLP                                  ;80B3C3|28      |      ;
                       RTL                                  ;80B3C4|6B      |      ;
 
       CODE_FN_80B3C5:
                       LDA.W $0201                          ;80B3C5|AD0102  |800201;
                       STA.W $0207                          ;80B3C8|8D0702  |800207;
                       LDA.W $01FF                          ;80B3CB|ADFF01  |8001FF;
                       BEQ +                                ;80B3CE|F00C    |80B3DC;
                       CMP.W #$007F                         ;80B3D0|C97F00  |      ;
                       BCS ++                               ;80B3D3|B014    |80B3E9;
                       db $AD,$FF,$01,$20,$04,$B4,$60       ;80B3D5|        |0001FF;
 
                     + LDX.W $01F7                          ;80B3DC|AEF701  |8001F7;
                       SEP #$20                             ;80B3DF|E220    |      ;
                       LDA.B #$00                           ;80B3E1|A900    |      ;
                       STA.W $0000,X                        ;80B3E3|9D0000  |800000;
                       REP #$20                             ;80B3E6|C220    |      ;
                       RTS                                  ;80B3E8|60      |      ;
 
                    ++ LDA.W #$0078                         ;80B3E9|A97800  |      ;
                       JSR.W CODE_FN_80B404                 ;80B3EC|2004B4  |80B404;
                       LDA.W $0207                          ;80B3EF|AD0702  |800207;
                       CLC                                  ;80B3F2|18      |      ;
                       ADC.W $0205                          ;80B3F3|6D0502  |800205;
                       STA.W $0207                          ;80B3F6|8D0702  |800207;
                       LDA.W $01FF                          ;80B3F9|ADFF01  |8001FF;
                       SEC                                  ;80B3FC|38      |      ;
                       SBC.W #$0078                         ;80B3FD|E97800  |      ;
                       JSR.W CODE_FN_80B404                 ;80B400|2004B4  |80B404;
                       RTS                                  ;80B403|60      |      ;
 
       CODE_FN_80B404:
                       LDX.W $01F7                          ;80B404|AEF701  |8001F7;
                       ORA.W $0203                          ;80B407|0D0302  |800203;
                       STA.W $0000,X                        ;80B40A|9D0000  |800000;
                       INX                                  ;80B40D|E8      |      ;
                       LDA.W $0207                          ;80B40E|AD0702  |800207;
                       STA.W $0000,X                        ;80B411|9D0000  |800000;
                       LDA.W $01F7                          ;80B414|ADF701  |8001F7;
                       CLC                                  ;80B417|18      |      ;
                       ADC.W #$0003                         ;80B418|690300  |      ;
                       STA.W $01F7                          ;80B41B|8DF701  |8001F7;
                       RTS                                  ;80B41E|60      |      ;
                       db $A2,$08,$00,$A9,$FF,$7F,$DF,$FA   ;80B41F|        |      ;
                       db $86,$7E,$F0,$14,$85,$02,$A9,$01   ;80B427|        |00007E;
                       db $00,$8D,$66,$03,$BF,$FA,$86,$7E   ;80B42F|        |      ;
                       db $22,$2C,$B3,$80,$9F,$FA,$86,$7E   ;80B437|        |80B32C;
                       db $CA,$CA,$10,$DF,$6B,$A2,$08,$00   ;80B43F|        |      ;
                       db $BF,$00,$5D,$7F,$DF,$FA,$86,$7E   ;80B447|        |7F5D00;
                       db $F0,$14,$85,$02,$A9,$01,$00,$8D   ;80B44F|        |80B465;
                       db $66,$03,$BF,$FA,$86,$7E,$22,$2C   ;80B457|        |000003;
                       db $B3,$80,$9F,$FA,$86,$7E,$CA,$CA   ;80B45F|        |000080;
                       db $10,$DE,$6B,$8B,$4B,$AB,$9C,$66   ;80B467|        |80B447;
                       db $03,$A2,$00,$00,$A9,$FF,$7F,$DF   ;80B46F|        |0000A2;
                       db $F8,$86,$7E,$F0,$14,$85,$02,$A9   ;80B477|        |      ;
                       db $01,$00,$8D,$66,$03,$BF,$F8,$86   ;80B47F|        |000000;
                       db $7E,$22,$2C,$B3,$80,$9F,$F8,$86   ;80B487|        |002C22;
                       db $7E,$CA,$CA,$10,$DF,$AD,$66,$03   ;80B48F|        |00CACA;
                       db $D0,$03,$18,$AB,$6B,$38,$AB,$6B   ;80B497|        |80B49C;
                       db $8B,$4B,$AB,$9C,$66,$03,$A2,$00   ;80B49F|        |      ;
                       db $00,$A9,$FF,$7F,$DF,$18,$87,$7E   ;80B4A7|        |      ;
                       db $F0,$14,$85,$02,$A9,$01,$00,$8D   ;80B4AF|        |80B4C5;
                       db $66,$03,$BF,$18,$87,$7E,$22,$2C   ;80B4B7|        |000003;
                       db $B3,$80,$9F,$18,$87,$7E,$CA,$CA   ;80B4BF|        |000080;
                       db $10,$DF,$AD,$66,$03,$D0,$03,$18   ;80B4C7|        |80B4A8;
                       db $AB,$6B,$38,$AB,$6B,$8B,$4B,$AB   ;80B4CF|        |      ;
                       db $9C,$66,$03,$A2,$00,$00,$A9,$FF   ;80B4D7|        |000366;
                       db $7F,$DF,$38,$87,$7E,$F0,$14,$85   ;80B4DF|        |8738DF;
                       db $02,$A9,$01,$00,$8D,$66,$03,$BF   ;80B4E7|        |      ;
                       db $38,$87,$7E,$22,$2C,$B3,$80,$9F   ;80B4EF|        |      ;
                       db $38,$87,$7E,$CA,$CA,$10,$DF,$AD   ;80B4F7|        |      ;
                       db $66,$03,$D0,$03,$18,$AB,$6B,$38   ;80B4FF|        |000003;
                       db $AB,$6B,$A2,$0A,$00,$BF,$37,$64   ;80B507|        |      ;
                       db $7E,$DF,$F8,$86,$7E,$F0,$14,$85   ;80B50F|        |00F8DF;
                       db $02,$A9,$01,$00,$8D,$66,$03,$BF   ;80B517|        |      ;
                       db $F8,$86,$7E,$22,$2C,$B3,$80,$9F   ;80B51F|        |      ;
                       db $F8,$86,$7E,$CA,$CA,$10,$DE,$6B   ;80B527|        |      ;
                       db $A2,$0A,$00,$BF,$55,$64,$7E,$DF   ;80B52F|        |      ;
                       db $18,$87,$7E,$F0,$14,$85,$02,$A9   ;80B537|        |      ;
                       db $01,$00,$8D,$66,$03,$BF,$18,$87   ;80B53F|        |000000;
                       db $7E,$22,$2C,$B3,$80,$9F,$18,$87   ;80B547|        |002C22;
                       db $7E,$CA,$CA,$10,$DE,$6B,$A2,$0A   ;80B54F|        |00CACA;
                       db $00,$BF,$73,$64,$7E,$DF,$38,$87   ;80B557|        |      ;
                       db $7E,$F0,$14,$85,$02,$A9,$01,$00   ;80B55F|        |0014F0;
                       db $8D,$66,$03,$BF,$38,$87,$7E,$22   ;80B567|        |000366;
                       db $2C,$B3,$80,$9F,$38,$87,$7E,$CA   ;80B56F|        |0080B3;
                       db $CA,$10,$DE,$6B                   ;80B577|        |      ;
 
       CODE_FL_80B57B:
                       LDX.W #$001C                         ;80B57B|A21C00  |      ;
 
                     - LDA.L $7E391E,X                      ;80B57E|BF1E397E|7E391E;
                       CMP.L $7E86F8,X                      ;80B582|DFF8867E|7E86F8;
                       BEQ +                                ;80B586|F014    |80B59C;
                       STA.B $02                            ;80B588|8502    |000002;
                       LDA.W #$0001                         ;80B58A|A90100  |      ;
                       STA.W $0366                          ;80B58D|8D6603  |800366;
                       LDA.L $7E86F8,X                      ;80B590|BFF8867E|7E86F8;
                       JSL.L CODE_FL_80B32C                 ;80B594|222CB380|80B32C;
                       STA.L $7E86F8,X                      ;80B598|9FF8867E|7E86F8;
 
                     + DEX                                  ;80B59C|CA      |      ;
                       DEX                                  ;80B59D|CA      |      ;
                       BPL -                                ;80B59E|10DE    |80B57E;
                       RTL                                  ;80B5A0|6B      |      ;
 
       CODE_FL_80B5A1:
                       LDX.W #$001C                         ;80B5A1|A21C00  |      ;
 
                     - LDA.W #$5C28                         ;80B5A4|A9285C  |      ;
                       CMP.L $7E86F8,X                      ;80B5A7|DFF8867E|7E86F8;
                       BEQ +                                ;80B5AB|F014    |80B5C1;
                       STA.B $02                            ;80B5AD|8502    |000002;
                       LDA.W #$0001                         ;80B5AF|A90100  |      ;
                       STA.W $0366                          ;80B5B2|8D6603  |800366;
                       LDA.L $7E86F8,X                      ;80B5B5|BFF8867E|7E86F8;
                       JSL.L CODE_FL_80B32C                 ;80B5B9|222CB380|80B32C;
                       STA.L $7E86F8,X                      ;80B5BD|9FF8867E|7E86F8;
 
                     + DEX                                  ;80B5C1|CA      |      ;
                       DEX                                  ;80B5C2|CA      |      ;
                       BPL -                                ;80B5C3|10DF    |80B5A4;
                       RTL                                  ;80B5C5|6B      |      ;
 
       CODE_FL_80B5C6:
                       LDX.W #$0014                         ;80B5C6|A21400  |      ;
 
                     - LDA.L $7E393E,X                      ;80B5C9|BF3E397E|7E393E;
                       CMP.L $7E8718,X                      ;80B5CD|DF18877E|7E8718;
                       BEQ +                                ;80B5D1|F014    |80B5E7;
                       STA.B $02                            ;80B5D3|8502    |000002;
                       LDA.W #$0001                         ;80B5D5|A90100  |      ;
                       STA.W $0366                          ;80B5D8|8D6603  |800366;
                       LDA.L $7E8718,X                      ;80B5DB|BF18877E|7E8718;
                       JSL.L CODE_FL_80B32C                 ;80B5DF|222CB380|80B32C;
                       STA.L $7E8718,X                      ;80B5E3|9F18877E|7E8718;
 
                     + DEX                                  ;80B5E7|CA      |      ;
                       DEX                                  ;80B5E8|CA      |      ;
                       BPL -                                ;80B5E9|10DE    |80B5C9;
                       RTL                                  ;80B5EB|6B      |      ;
 
       CODE_FL_80B5EC:
                       LDX.W #$0014                         ;80B5EC|A21400  |      ;
 
                     - LDA.W #$0000                         ;80B5EF|A90000  |      ;
                       CMP.L $7E8718,X                      ;80B5F2|DF18877E|7E8718;
                       BEQ +                                ;80B5F6|F014    |80B60C;
                       STA.B $02                            ;80B5F8|8502    |000002;
                       LDA.W #$0001                         ;80B5FA|A90100  |      ;
                       STA.W $0366                          ;80B5FD|8D6603  |800366;
                       LDA.L $7E8718,X                      ;80B600|BF18877E|7E8718;
                       JSL.L CODE_FL_80B32C                 ;80B604|222CB380|80B32C;
                       STA.L $7E8718,X                      ;80B608|9F18877E|7E8718;
 
                     + DEX                                  ;80B60C|CA      |      ;
                       DEX                                  ;80B60D|CA      |      ;
                       BPL -                                ;80B60E|10DF    |80B5EF;
                       RTL                                  ;80B610|6B      |      ;
 
       CODE_FL_80B611:
                       LDX.W #$0000                         ;80B611|A20000  |      ;
 
                     - LDA.W #$0000                         ;80B614|A90000  |      ;
                       CMP.L $7E86F6,X                      ;80B617|DFF6867E|7E86F6;
                       BEQ +                                ;80B61B|F014    |80B631;
                       STA.B $02                            ;80B61D|8502    |000002;
                       LDA.W #$0001                         ;80B61F|A90100  |      ;
                       STA.W $0366                          ;80B622|8D6603  |800366;
                       LDA.L $7E86F6,X                      ;80B625|BFF6867E|7E86F6;
                       JSL.L CODE_FL_80B32C                 ;80B629|222CB380|80B32C;
                       STA.L $7E86F6,X                      ;80B62D|9FF6867E|7E86F6;
 
                     + DEX                                  ;80B631|CA      |      ;
                       DEX                                  ;80B632|CA      |      ;
                       BPL -                                ;80B633|10DF    |80B614;
                       RTL                                  ;80B635|6B      |      ;
                       PHP                                  ;80B636|08      |      ;
                       PHK                                  ;80B637|4B      |      ;
                       PLB                                  ;80B638|AB      |      ;
                       REP #$30                             ;80B639|C230    |      ;
                       LDA.W Game_State_State               ;80B63B|ADA202  |8002A2;
                       ASL A                                ;80B63E|0A      |      ;
                       TAX                                  ;80B63F|AA      |      ;
                       JSR.W (DATA8_80B662,X)               ;80B640|FC62B6  |80B662;
                       LDA.L $7E3900                        ;80B643|AF00397E|7E3900;
                       BNE +                                ;80B647|D004    |80B64D;
                       JSL.L CODE_FL_80AE15                 ;80B649|2215AE80|80AE15;
 
                     + PHB                                  ;80B64D|8B      |      ;
                       PHK                                  ;80B64E|4B      |      ;
                       PLB                                  ;80B64F|AB      |      ;
                       LDY.W #$B65A                         ;80B650|A05AB6  |      ;
                       JSL.L CODE_FL_80A07F                 ;80B653|227FA080|80A07F;
                       PLB                                  ;80B657|AB      |      ;
                       BRA +                                ;80B658|8006    |80B660;
                       db $F6,$86,$7E,$00,$02,$00           ;80B65A|        |      ;
 
                     + PLB                                  ;80B660|AB      |      ;
                       RTL                                  ;80B661|6B      |      ;
 
         DATA8_80B662:
                       db $79,$B6,$A2,$B8,$C8,$B8,$D8,$B8   ;80B662|        |      ;
                       db $44,$B9,$6B,$B9,$8C,$B9,$97,$B9   ;80B66A|        |      ;
                       db $BC,$B9,$43,$BA,$78,$B6           ;80B672|        |0043B9;
                       RTS                                  ;80B678|60      |      ;
                       JSL.L CODE_FL_809CF7                 ;80B679|22F79C80|809CF7;
                       JSL.L CODE_FL_809C8A                 ;80B67D|228A9C80|809C8A;
                       JSR.W CODE_FN_80B7B7                 ;80B681|20B7B7  |80B7B7;
                       JSL.L CODE_FL_80BB2D                 ;80B684|222DBB80|80BB2D;
                       db $3B,$AF,$94,$00,$5D,$7F           ;80B688|        |      ;
                       PHB                                  ;80B68E|8B      |      ;
                       PHK                                  ;80B68F|4B      |      ;
                       PLB                                  ;80B690|AB      |      ;
                       LDY.W #$B69B                         ;80B691|A09BB6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80B694|22CAA080|80A0CA;
                       PLB                                  ;80B698|AB      |      ;
                       BRA +                                ;80B699|8008    |80B6A3;
                       db $00,$5D,$7F,$00,$0E,$80,$00,$20   ;80B69B|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;80B6A3|222DBB80|80BB2D;
                       db $A4,$B4,$94,$00,$5D,$7F           ;80B6A7|        |      ;
                       PHB                                  ;80B6AD|8B      |      ;
                       PHK                                  ;80B6AE|4B      |      ;
                       PLB                                  ;80B6AF|AB      |      ;
                       LDY.W #$B6BA                         ;80B6B0|A0BAB6  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80B6B3|22CAA080|80A0CA;
                       PLB                                  ;80B6B7|AB      |      ;
                       BRA +                                ;80B6B8|8008    |80B6C2;
                       db $00,$5D,$7F,$00,$0C,$80,$00,$60   ;80B6BA|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;80B6C2|222DBB80|80BB2D;
                       db $8D,$B9,$94,$1C,$39,$7E           ;80B6C6|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;80B6CC|222DBB80|80BB2D;
                       db $C1,$B8,$94,$00,$30,$7E           ;80B6D0|        |      ;
                       JSL.L CODE_FL_80BB2D                 ;80B6D6|222DBB80|80BB2D;
                       db $EC,$B7,$94,$00,$5D,$7F           ;80B6DA|        |      ;
                       LDA.W #$0008                         ;80B6E0|A90800  |      ;
                       STA.B $00                            ;80B6E3|8500    |000000;
                       LDX.W #$0000                         ;80B6E5|A20000  |      ;
                       STX.B $02                            ;80B6E8|8602    |000002;
                       STX.B $04                            ;80B6EA|8604    |000004;
 
                     - LDY.W #$001A                         ;80B6EC|A01A00  |      ;
 
                    -- LDX.B $02                            ;80B6EF|A602    |000002;
                       LDA.L $7F5D1C,X                      ;80B6F1|BF1C5D7F|7F5D1C;
                       LDX.B $04                            ;80B6F5|A604    |000004;
                       STA.L $7E2214,X                      ;80B6F7|9F14227E|7E2214;
                       LDX.B $02                            ;80B6FB|A602    |000002;
                       INX                                  ;80B6FD|E8      |      ;
                       INX                                  ;80B6FE|E8      |      ;
                       STX.B $02                            ;80B6FF|8602    |000002;
                       LDX.B $04                            ;80B701|A604    |000004;
                       INX                                  ;80B703|E8      |      ;
                       INX                                  ;80B704|E8      |      ;
                       STX.B $04                            ;80B705|8604    |000004;
                       DEY                                  ;80B707|88      |      ;
                       DEY                                  ;80B708|88      |      ;
                       BNE --                               ;80B709|D0E4    |80B6EF;
                       LDA.B $02                            ;80B70B|A502    |000002;
                       CLC                                  ;80B70D|18      |      ;
                       ADC.W #$0026                         ;80B70E|692600  |      ;
                       STA.B $02                            ;80B711|8502    |000002;
                       LDA.B $04                            ;80B713|A504    |000004;
                       CLC                                  ;80B715|18      |      ;
                       ADC.W #$0026                         ;80B716|692600  |      ;
                       STA.B $04                            ;80B719|8504    |000004;
                       DEC.B $00                            ;80B71B|C600    |000000;
                       BNE -                                ;80B71D|D0CD    |80B6EC;
                       LDA.W #$5C28                         ;80B71F|A9285C  |      ;
                       STA.L $7E86F6                        ;80B722|8FF6867E|7E86F6;
                       STA.L $7E86F8                        ;80B726|8FF8867E|7E86F8;
                       STA.L $7E86FA                        ;80B72A|8FFA867E|7E86FA;
                       STA.L $7E86FC                        ;80B72E|8FFC867E|7E86FC;
                       STA.L $7E86FE                        ;80B732|8FFE867E|7E86FE;
                       STA.L $7E8700                        ;80B736|8F00877E|7E8700;
                       STA.L $7E8702                        ;80B73A|8F02877E|7E8702;
                       STA.L $7E8704                        ;80B73E|8F04877E|7E8704;
                       STA.L $7E8706                        ;80B742|8F06877E|7E8706;
                       STA.L $7E8708                        ;80B746|8F08877E|7E8708;
                       STA.L $7E870A                        ;80B74A|8F0A877E|7E870A;
                       STA.L $7E870C                        ;80B74E|8F0C877E|7E870C;
                       STA.L $7E870E                        ;80B752|8F0E877E|7E870E;
                       STA.L $7E8710                        ;80B756|8F10877E|7E8710;
                       STA.L $7E8712                        ;80B75A|8F12877E|7E8712;
                       STA.L $7E8714                        ;80B75E|8F14877E|7E8714;
                       STA.L $7E8716                        ;80B762|8F16877E|7E8716;
                       STA.L $7E8718                        ;80B766|8F18877E|7E8718;
                       STA.L $7E871A                        ;80B76A|8F1A877E|7E871A;
                       STA.L $7E871C                        ;80B76E|8F1C877E|7E871C;
                       STA.L $7E871E                        ;80B772|8F1E877E|7E871E;
                       STA.L $7E8720                        ;80B776|8F20877E|7E8720;
                       STA.L $7E8722                        ;80B77A|8F22877E|7E8722;
                       STA.L $7E8724                        ;80B77E|8F24877E|7E8724;
                       STA.L $7E8726                        ;80B782|8F26877E|7E8726;
                       STA.L $7E8728                        ;80B786|8F28877E|7E8728;
                       STA.L $7E872A                        ;80B78A|8F2A877E|7E872A;
                       STA.L $7E872C                        ;80B78E|8F2C877E|7E872C;
                       STA.L $7E872E                        ;80B792|8F2E877E|7E872E;
                       STA.L $7E8730                        ;80B796|8F30877E|7E8730;
                       STA.L $7E8732                        ;80B79A|8F32877E|7E8732;
                       STA.L $7E8734                        ;80B79E|8F34877E|7E8734;
                       LDA.W #$0000                         ;80B7A2|A90000  |      ;
                       STA.L BALL_Active                    ;80B7A5|8F60947E|7E9460;
                       INC.W Game_State_State               ;80B7A9|EEA202  |8002A2;
                       LDA.W #$0003                         ;80B7AC|A90300  |      ;
                       STA.W $199C                          ;80B7AF|8D9C19  |80199C;
                       JSL.L CODE_FL_809D0B                 ;80B7B2|220B9D80|809D0B;
                       RTS                                  ;80B7B6|60      |      ;
 
       CODE_FN_80B7B7:
                       JSL.L CODE_FL_809E38                 ;80B7B7|22389E80|809E38;
                       LDA.W #$0000                         ;80B7BB|A90000  |      ;
                       JSL.L CODE_FL_80A1CF                 ;80B7BE|22CFA180|80A1CF;
                       LDA.W #$0000                         ;80B7C2|A90000  |      ;
                       JSL.L CODE_FL_80A1E0                 ;80B7C5|22E0A180|80A1E0;
                       LDA.W #$0000                         ;80B7C9|A90000  |      ;
                       JSL.L CODE_FL_80A1F1                 ;80B7CC|22F1A180|80A1F1;
                       SEP #$30                             ;80B7D0|E230    |      ;
                       LDA.B #$80                           ;80B7D2|A980    |      ;
                       STA.W $01B6                          ;80B7D4|8DB601  |8001B6;
                       LDA.B #$09                           ;80B7D7|A909    |      ;
                       STA.W $01BA                          ;80B7D9|8DBA01  |8001BA;
                       LDA.B #$70                           ;80B7DC|A970    |      ;
                       STA.W $01BC                          ;80B7DE|8DBC01  |8001BC;
                       LDA.B #$7A                           ;80B7E1|A97A    |      ;
                       STA.W $01BD                          ;80B7E3|8DBD01  |8001BD;
                       LDA.B #$68                           ;80B7E6|A968    |      ;
                       STA.W $01BE                          ;80B7E8|8DBE01  |8001BE;
                       STZ.W $01BF                          ;80B7EB|9CBF01  |8001BF;
                       LDA.B #$02                           ;80B7EE|A902    |      ;
                       STA.W $01C0                          ;80B7F0|8DC001  |8001C0;
                       LDA.B #$06                           ;80B7F3|A906    |      ;
                       STA.W $01C1                          ;80B7F5|8DC101  |8001C1;
                       STZ.W $01B7                          ;80B7F8|9CB701  |8001B7;
                       STZ.W BG1HOFS                        ;80B7FB|9C0D21  |80210D;
                       STZ.W BG1HOFS                        ;80B7FE|9C0D21  |80210D;
                       STZ.W _BG1VOFS                       ;80B801|9C0E21  |80210E;
                       STZ.W _BG1VOFS                       ;80B804|9C0E21  |80210E;
                       STZ.W BG2HOFS                        ;80B807|9C0F21  |80210F;
                       STZ.W BG2HOFS                        ;80B80A|9C0F21  |80210F;
                       STZ.W BG2VOFS                        ;80B80D|9C1021  |802110;
                       STZ.W BG2VOFS                        ;80B810|9C1021  |802110;
                       STZ.W BG3HOFS                        ;80B813|9C1121  |802111;
                       STZ.W BG3HOFS                        ;80B816|9C1121  |802111;
                       STZ.W BG3VOFS                        ;80B819|9C1221  |802112;
                       STZ.W BG3VOFS                        ;80B81C|9C1221  |802112;
                       STZ.W BG4HOFS                        ;80B81F|9C1321  |802113;
                       STZ.W BG4HOFS                        ;80B822|9C1321  |802113;
                       STZ.W BG4VOFS                        ;80B825|9C1421  |802114;
                       STZ.W BG4VOFS                        ;80B828|9C1421  |802114;
                       STZ.W VMAINC                         ;80B82B|9C1521  |802115;
                       STZ.W $01C2                          ;80B82E|9CC201  |8001C2;
                       STZ.W $01C3                          ;80B831|9CC301  |8001C3;
                       STZ.W $01C4                          ;80B834|9CC401  |8001C4;
                       STZ.W $01C5                          ;80B837|9CC501  |8001C5;
                       STZ.W $01C6                          ;80B83A|9CC601  |8001C6;
                       STZ.W $01C7                          ;80B83D|9CC701  |8001C7;
                       STZ.W $01C8                          ;80B840|9CC801  |8001C8;
                       STZ.W $01C9                          ;80B843|9CC901  |8001C9;
                       STZ.W $01CA                          ;80B846|9CCA01  |8001CA;
                       STZ.W $01DB                          ;80B849|9CDB01  |8001DB;
                       STZ.W $01E0                          ;80B84C|9CE001  |8001E0;
                       STZ.W $01E1                          ;80B84F|9CE101  |8001E1;
                       STZ.W $01E4                          ;80B852|9CE401  |8001E4;
                       STZ.W $01E5                          ;80B855|9CE501  |8001E5;
                       LDA.B #$05                           ;80B858|A905    |      ;
                       STA.W $01E2                          ;80B85A|8DE201  |8001E2;
                       STZ.W $01E3                          ;80B85D|9CE301  |8001E3;
                       STZ.W $01DC                          ;80B860|9CDC01  |8001DC;
                       STZ.W $01DE                          ;80B863|9CDE01  |8001DE;
                       STZ.W $01DD                          ;80B866|9CDD01  |8001DD;
                       STZ.W $01DF                          ;80B869|9CDF01  |8001DF;
                       LDA.B #$12                           ;80B86C|A912    |      ;
                       STA.W $01E6                          ;80B86E|8DE601  |8001E6;
                       LDA.B #$B6                           ;80B871|A9B6    |      ;
                       STA.W $01E7                          ;80B873|8DE701  |8001E7;
                       LDA.B #$E0                           ;80B876|A9E0    |      ;
                       STA.W $01E8                          ;80B878|8DE801  |8001E8;
                       STA.W $01E9                          ;80B87B|8DE901  |8001E9;
                       STA.W $01EA                          ;80B87E|8DEA01  |8001EA;
                       STZ.W CGADD                          ;80B881|9C2121  |802121;
                       STZ.W $01EB                          ;80B884|9CEB01  |8001EB;
                       LDA.B #$81                           ;80B887|A981    |      ;
                       STA.W $01EC                          ;80B889|8DEC01  |8001EC;
                       STZ.W MDMAEN                         ;80B88C|9C0B42  |80420B;
                       STZ.W $01F1                          ;80B88F|9CF101  |8001F1;
                       STZ.W $021E                          ;80B892|9C1E02  |80021E;
                       STZ.W $01F1                          ;80B895|9CF101  |8001F1;
                       STZ.W HDMAEN                         ;80B898|9C0C42  |80420C;
                       JSL.L CODE_FL_80A145                 ;80B89B|2245A180|80A145;
                       REP #$30                             ;80B89F|C230    |      ;
                       RTS                                  ;80B8A1|60      |      ;
                       LDY.W #$0001                         ;80B8A2|A00100  |      ;
                       JSL.L CODE_FL_80AECB                 ;80B8A5|22CBAE80|80AECB;
                       BCC +                                ;80B8A9|901A    |80B8C5;
                       REP #$20                             ;80B8AB|C220    |      ;
                       PHB                                  ;80B8AD|8B      |      ;
                       PHK                                  ;80B8AE|4B      |      ;
                       PLB                                  ;80B8AF|AB      |      ;
                       LDY.W #$B8BA                         ;80B8B0|A0BAB8  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80B8B3|22CAA080|80A0CA;
                       PLB                                  ;80B8B7|AB      |      ;
                       BRA ++                               ;80B8B8|8008    |80B8C2;
                       db $00,$20,$7E,$00,$08,$80,$00,$70   ;80B8BA|        |      ;
 
                    ++ INC.W Game_State_State               ;80B8C2|EEA202  |8002A2;
 
                     + REP #$20                             ;80B8C5|C220    |      ;
                       RTS                                  ;80B8C7|60      |      ;
                       STZ.W $0366                          ;80B8C8|9C6603  |800366;
                       JSL.L CODE_FL_80B57B                 ;80B8CB|227BB580|80B57B;
                       LDA.W $0366                          ;80B8CF|AD6603  |800366;
                       BNE +                                ;80B8D2|D003    |80B8D7;
                       INC.W Game_State_State               ;80B8D4|EEA202  |8002A2;
 
                     + RTS                                  ;80B8D7|60      |      ;
                       LDA.W #$00D1                         ;80B8D8|A9D100  |      ;
                       STA.W $1986                          ;80B8DB|8D8619  |801986;
                       JSL.L CODE_FL_80BB2D                 ;80B8DE|222DBB80|80BB2D;
                       db $EC,$B7,$94,$00,$5D,$7F           ;80B8E2|        |      ;
                       LDA.W #$0008                         ;80B8E8|A90800  |      ;
                       STA.B $00                            ;80B8EB|8500    |000000;
                       LDX.W #$0000                         ;80B8ED|A20000  |      ;
                       STX.B $02                            ;80B8F0|8602    |000002;
                       STX.B $04                            ;80B8F2|8604    |000004;
 
                     - LDY.W #$001C                         ;80B8F4|A01C00  |      ;
 
                    -- LDX.B $02                            ;80B8F7|A602    |000002;
                       LDA.L $7F5D00,X                      ;80B8F9|BF005D7F|7F5D00;
                       LDX.B $04                            ;80B8FD|A604    |000004;
                       STA.L $7E2214,X                      ;80B8FF|9F14227E|7E2214;
                       LDX.B $02                            ;80B903|A602    |000002;
                       INX                                  ;80B905|E8      |      ;
                       INX                                  ;80B906|E8      |      ;
                       STX.B $02                            ;80B907|8602    |000002;
                       LDX.B $04                            ;80B909|A604    |000004;
                       INX                                  ;80B90B|E8      |      ;
                       INX                                  ;80B90C|E8      |      ;
                       STX.B $04                            ;80B90D|8604    |000004;
                       DEY                                  ;80B90F|88      |      ;
                       DEY                                  ;80B910|88      |      ;
                       BNE --                               ;80B911|D0E4    |80B8F7;
                       LDA.B $02                            ;80B913|A502    |000002;
                       CLC                                  ;80B915|18      |      ;
                       ADC.W #$0024                         ;80B916|692400  |      ;
                       STA.B $02                            ;80B919|8502    |000002;
                       LDA.B $04                            ;80B91B|A504    |000004;
                       CLC                                  ;80B91D|18      |      ;
                       ADC.W #$0024                         ;80B91E|692400  |      ;
                       STA.B $04                            ;80B921|8504    |000004;
                       DEC.B $00                            ;80B923|C600    |000000;
                       BNE -                                ;80B925|D0CD    |80B8F4;
                       PHB                                  ;80B927|8B      |      ;
                       PHK                                  ;80B928|4B      |      ;
                       PLB                                  ;80B929|AB      |      ;
                       LDY.W #$B934                         ;80B92A|A034B9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80B92D|22CAA080|80A0CA;
                       PLB                                  ;80B931|AB      |      ;
                       BRA +                                ;80B932|8008    |80B93C;
                       db $00,$20,$7E,$00,$08,$80,$00,$70   ;80B934|        |      ;
 
                     + STZ.B $A7                            ;80B93C|64A7    |0000A7;
                       STZ.B $AD                            ;80B93E|64AD    |0000AD;
                       INC.W Game_State_State               ;80B940|EEA202  |8002A2;
                       RTS                                  ;80B943|60      |      ;
                       LDA.B $AD                            ;80B944|A5AD    |0000AD;
                       CMP.W #$0001                         ;80B946|C90100  |      ;
                       BNE +                                ;80B949|D01F    |80B96A;
                       LDA.B $A7                            ;80B94B|A5A7    |0000A7;
                       CMP.W #$001E                         ;80B94D|C91E00  |      ;
                       BNE +                                ;80B950|D018    |80B96A;
                       PHB                                  ;80B952|8B      |      ;
                       PHK                                  ;80B953|4B      |      ;
                       PLB                                  ;80B954|AB      |      ;
                       LDY.W #$B95F                         ;80B955|A05FB9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80B958|22CAA080|80A0CA;
                       PLB                                  ;80B95C|AB      |      ;
                       BRA ++                               ;80B95D|8008    |80B967;
                       db $00,$30,$7E,$00,$08,$80,$00,$68   ;80B95F|        |      ;
 
                    ++ INC.W Game_State_State               ;80B967|EEA202  |8002A2;
 
                     + RTS                                  ;80B96A|60      |      ;
                       STZ.W $0366                          ;80B96B|9C6603  |800366;
                       JSL.L CODE_FL_80B5A1                 ;80B96E|22A1B580|80B5A1;
                       JSL.L CODE_FL_80B5C6                 ;80B972|22C6B580|80B5C6;
                       LDA.W $0366                          ;80B976|AD6603  |800366;
                       BNE +                                ;80B979|D010    |80B98B;
                       SEP #$20                             ;80B97B|E220    |      ;
                       LDA.B #$04                           ;80B97D|A904    |      ;
                       STA.W $01E2                          ;80B97F|8DE201  |8001E2;
                       REP #$20                             ;80B982|C220    |      ;
                       STZ.B $A7                            ;80B984|64A7    |0000A7;
                       STZ.B $AD                            ;80B986|64AD    |0000AD;
                       INC.W Game_State_State               ;80B988|EEA202  |8002A2;
 
                     + RTS                                  ;80B98B|60      |      ;
                       LDA.B $AD                            ;80B98C|A5AD    |0000AD;
                       CMP.W #$0001                         ;80B98E|C90100  |      ;
                       BNE +                                ;80B991|D003    |80B996;
                       INC.W Game_State_State               ;80B993|EEA202  |8002A2;
 
                     + RTS                                  ;80B996|60      |      ;
                       STZ.W $0366                          ;80B997|9C6603  |800366;
                       JSL.L CODE_FL_80B5EC                 ;80B99A|22ECB580|80B5EC;
                       JSL.L CODE_FL_80B611                 ;80B99E|2211B680|80B611;
                       LDA.W $0366                          ;80B9A2|AD6603  |800366;
                       BNE +                                ;80B9A5|D014    |80B9BB;
                       STZ.B $A7                            ;80B9A7|64A7    |0000A7;
                       STZ.B $AD                            ;80B9A9|64AD    |0000AD;
                       LDA.W #$0000                         ;80B9AB|A90000  |      ;
                       STA.W Game_State                     ;80B9AE|8DA002  |8002A0;
                       STZ.W Game_State_State               ;80B9B1|9CA202  |8002A2;
                       LDA.W #$0000                         ;80B9B4|A90000  |      ;
                       STA.L $7E935B                        ;80B9B7|8F5B937E|7E935B;
 
                     + RTS                                  ;80B9BB|60      |      ;
                       JSL.L CODE_FL_809CF7                 ;80B9BC|22F79C80|809CF7;
                       JSL.L CODE_FL_809C8A                 ;80B9C0|228A9C80|809C8A;
                       JSR.W CODE_FN_80BA48                 ;80B9C4|2048BA  |80BA48;
                       LDA.W #$FFFF                         ;80B9C7|A9FFFF  |      ;
                       STA.W $029E                          ;80B9CA|8D9E02  |80029E;
                       JSL.L CODE_FL_80BB2D                 ;80B9CD|222DBB80|80BB2D;
                       db $CB,$B9,$94,$00,$5D,$7F           ;80B9D1|        |      ;
                       PHB                                  ;80B9D7|8B      |      ;
                       PHK                                  ;80B9D8|4B      |      ;
                       PLB                                  ;80B9D9|AB      |      ;
                       LDY.W #$B9E4                         ;80B9DA|A0E4B9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80B9DD|22CAA080|80A0CA;
                       PLB                                  ;80B9E1|AB      |      ;
                       BRA +                                ;80B9E2|8008    |80B9EC;
                       db $00,$5D,$7F,$80,$08,$80,$00,$20   ;80B9E4|        |      ;
 
                     + JSL.L CODE_FL_80BB2D                 ;80B9EC|222DBB80|80BB2D;
                       db $6E,$BE,$94,$F6,$86,$7E           ;80B9F0|        |0094BE;
                       PHB                                  ;80B9F6|8B      |      ;
                       PHK                                  ;80B9F7|4B      |      ;
                       PLB                                  ;80B9F8|AB      |      ;
                       LDY.W #$BA03                         ;80B9F9|A003BA  |      ;
                       JSL.L CODE_FL_80A07F                 ;80B9FC|227FA080|80A07F;
                       PLB                                  ;80BA00|AB      |      ;
                       BRA +                                ;80BA01|8006    |80BA09;
                       db $F6,$86,$7E,$00,$02,$00           ;80BA03|        |000086;
 
                     + LDA.L $7E3900                        ;80BA09|AF00397E|7E3900;
                       DEC A                                ;80BA0D|3A      |      ;
                       BNE +                                ;80BA0E|D00C    |80BA1C;
                       db $22,$2D,$BB,$80,$7B,$BE,$94,$00   ;80BA10|        |80BB2D;
                       db $20,$7E,$80,$0A                   ;80BA18|        |80807E;
 
                     + JSL.L CODE_FL_80BB2D                 ;80BA1C|222DBB80|80BB2D;
                       db $AD,$BF,$94,$00,$20,$7E           ;80BA20|        |0094BF;
                       PHB                                  ;80BA26|8B      |      ;
                       PHK                                  ;80BA27|4B      |      ;
                       PLB                                  ;80BA28|AB      |      ;
                       LDY.W #$BA33                         ;80BA29|A033BA  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80BA2C|22CAA080|80A0CA;
                       PLB                                  ;80BA30|AB      |      ;
                       BRA +                                ;80BA31|8008    |80BA3B;
                       db $00,$20,$7E,$00,$08,$80,$00,$70   ;80BA33|        |      ;
 
                     + INC.W Game_State_State               ;80BA3B|EEA202  |8002A2;
                       JSL.L CODE_FL_809D0B                 ;80BA3E|220B9D80|809D0B;
                       RTS                                  ;80BA42|60      |      ;
                       JSL.L CODE_FL_86D67D                 ;80BA43|227DD686|86D67D;
                       RTS                                  ;80BA47|60      |      ;
 
       CODE_FN_80BA48:
                       JSL.L CODE_FL_809E38                 ;80BA48|22389E80|809E38;
                       LDA.W #$0000                         ;80BA4C|A90000  |      ;
                       JSL.L CODE_FL_80A1CF                 ;80BA4F|22CFA180|80A1CF;
                       LDA.W #$0000                         ;80BA53|A90000  |      ;
                       JSL.L CODE_FL_80A1E0                 ;80BA56|22E0A180|80A1E0;
                       LDA.W #$0000                         ;80BA5A|A90000  |      ;
                       JSL.L CODE_FL_80A1F1                 ;80BA5D|22F1A180|80A1F1;
                       SEP #$30                             ;80BA61|E230    |      ;
                       LDA.B #$80                           ;80BA63|A980    |      ;
                       STA.W $01B6                          ;80BA65|8DB601  |8001B6;
                       LDA.B #$00                           ;80BA68|A900    |      ;
                       STA.W $01BA                          ;80BA6A|8DBA01  |8001BA;
                       LDA.B #$70                           ;80BA6D|A970    |      ;
                       STA.W $01BC                          ;80BA6F|8DBC01  |8001BC;
                       STZ.W $01BD                          ;80BA72|9CBD01  |8001BD;
                       STZ.W $01BE                          ;80BA75|9CBE01  |8001BE;
                       STZ.W $01BF                          ;80BA78|9CBF01  |8001BF;
                       LDA.B #$02                           ;80BA7B|A902    |      ;
                       STA.W $01C0                          ;80BA7D|8DC001  |8001C0;
                       STZ.W $01C1                          ;80BA80|9CC101  |8001C1;
                       STZ.W $01B7                          ;80BA83|9CB701  |8001B7;
                       STZ.W BG1HOFS                        ;80BA86|9C0D21  |80210D;
                       STZ.W BG1HOFS                        ;80BA89|9C0D21  |80210D;
                       STZ.W _BG1VOFS                       ;80BA8C|9C0E21  |80210E;
                       STZ.W _BG1VOFS                       ;80BA8F|9C0E21  |80210E;
                       STZ.W BG2HOFS                        ;80BA92|9C0F21  |80210F;
                       STZ.W BG2HOFS                        ;80BA95|9C0F21  |80210F;
                       STZ.W BG2VOFS                        ;80BA98|9C1021  |802110;
                       STZ.W BG2VOFS                        ;80BA9B|9C1021  |802110;
                       STZ.W BG3HOFS                        ;80BA9E|9C1121  |802111;
                       STZ.W BG3HOFS                        ;80BAA1|9C1121  |802111;
                       STZ.W BG3VOFS                        ;80BAA4|9C1221  |802112;
                       STZ.W BG3VOFS                        ;80BAA7|9C1221  |802112;
                       STZ.W BG4HOFS                        ;80BAAA|9C1321  |802113;
                       STZ.W BG4HOFS                        ;80BAAD|9C1321  |802113;
                       STZ.W BG4VOFS                        ;80BAB0|9C1421  |802114;
                       STZ.W BG4VOFS                        ;80BAB3|9C1421  |802114;
                       STZ.W VMAINC                         ;80BAB6|9C1521  |802115;
                       STZ.W $01C2                          ;80BAB9|9CC201  |8001C2;
                       STZ.W $01C3                          ;80BABC|9CC301  |8001C3;
                       STZ.W $01C4                          ;80BABF|9CC401  |8001C4;
                       STZ.W $01C5                          ;80BAC2|9CC501  |8001C5;
                       STZ.W $01C6                          ;80BAC5|9CC601  |8001C6;
                       STZ.W $01C7                          ;80BAC8|9CC701  |8001C7;
                       STZ.W $01C8                          ;80BACB|9CC801  |8001C8;
                       STZ.W $01C9                          ;80BACE|9CC901  |8001C9;
                       STZ.W $01CA                          ;80BAD1|9CCA01  |8001CA;
                       STZ.W $01DB                          ;80BAD4|9CDB01  |8001DB;
                       STZ.W $01E0                          ;80BAD7|9CE001  |8001E0;
                       STZ.W $01E1                          ;80BADA|9CE101  |8001E1;
                       STZ.W $01E4                          ;80BADD|9CE401  |8001E4;
                       STZ.W $01E5                          ;80BAE0|9CE501  |8001E5;
                       LDA.B #$01                           ;80BAE3|A901    |      ;
                       STA.W $01E2                          ;80BAE5|8DE201  |8001E2;
                       STZ.W $01E3                          ;80BAE8|9CE301  |8001E3;
                       STZ.W $01DC                          ;80BAEB|9CDC01  |8001DC;
                       STZ.W $01DE                          ;80BAEE|9CDE01  |8001DE;
                       STZ.W $01DD                          ;80BAF1|9CDD01  |8001DD;
                       STZ.W $01DF                          ;80BAF4|9CDF01  |8001DF;
                       LDA.B #$12                           ;80BAF7|A912    |      ;
                       STA.W $01E6                          ;80BAF9|8DE601  |8001E6;
                       LDA.B #$B6                           ;80BAFC|A9B6    |      ;
                       STA.W $01E7                          ;80BAFE|8DE701  |8001E7;
                       LDA.B #$E0                           ;80BB01|A9E0    |      ;
                       STA.W $01E8                          ;80BB03|8DE801  |8001E8;
                       STA.W $01E9                          ;80BB06|8DE901  |8001E9;
                       STA.W $01EA                          ;80BB09|8DEA01  |8001EA;
                       STZ.W CGADD                          ;80BB0C|9C2121  |802121;
                       STZ.W $01EB                          ;80BB0F|9CEB01  |8001EB;
                       LDA.B #$81                           ;80BB12|A981    |      ;
                       STA.W $01EC                          ;80BB14|8DEC01  |8001EC;
                       STZ.W MDMAEN                         ;80BB17|9C0B42  |80420B;
                       STZ.W $01F1                          ;80BB1A|9CF101  |8001F1;
                       STZ.W $021E                          ;80BB1D|9C1E02  |80021E;
                       STZ.W $01F1                          ;80BB20|9CF101  |8001F1;
                       STZ.W HDMAEN                         ;80BB23|9C0C42  |80420C;
                       JSL.L CODE_FL_80A145                 ;80BB26|2245A180|80A145;
                       REP #$30                             ;80BB2A|C230    |      ;
                       RTS                                  ;80BB2C|60      |      ;
 
       CODE_FL_80BB2D:
                       PHP                                  ;80BB2D|08      |      ;
                       REP #$30                             ;80BB2E|C230    |      ;
                       PHB                                  ;80BB30|8B      |      ;
                       PHX                                  ;80BB31|DA      |      ;
                       PHY                                  ;80BB32|5A      |      ;
                       SEP #$20                             ;80BB33|E220    |      ;
                       LDA.B $09,S                          ;80BB35|A309    |000009;
                       PHA                                  ;80BB37|48      |      ;
                       PLB                                  ;80BB38|AB      |      ;
                       REP #$20                             ;80BB39|C220    |      ;
                       LDA.B $07,S                          ;80BB3B|A307    |000007;
                       TAX                                  ;80BB3D|AA      |      ;
                       CLC                                  ;80BB3E|18      |      ;
                       ADC.W #$0006                         ;80BB3F|690600  |      ;
                       STA.B $07,S                          ;80BB42|8307    |000007;
                       LDA.W $0001,X                        ;80BB44|BD0100  |830001;
                       STA.B $7C                            ;80BB47|857C    |00007C;
                       LDA.W $0002,X                        ;80BB49|BD0200  |830002;
                       STA.B $7D                            ;80BB4C|857D    |00007D;
                       LDA.W $0004,X                        ;80BB4E|BD0400  |830004;
                       STA.B $7F                            ;80BB51|857F    |00007F;
                       LDA.W $0005,X                        ;80BB53|BD0500  |830005;
                       STA.B $80                            ;80BB56|8580    |000080;
                       JSL.L CODE_FL_80A421                 ;80BB58|2221A480|80A421;
                       PLY                                  ;80BB5C|7A      |      ;
                       PLX                                  ;80BB5D|FA      |      ;
                       PLB                                  ;80BB5E|AB      |      ;
                       PLP                                  ;80BB5F|28      |      ;
                       RTL                                  ;80BB60|6B      |      ;
 
       CODE_FL_80BB61:
                       PHP                                  ;80BB61|08      |      ;
                       REP #$30                             ;80BB62|C230    |      ;
                       PHB                                  ;80BB64|8B      |      ;
                       PHX                                  ;80BB65|DA      |      ;
                       PHY                                  ;80BB66|5A      |      ;
                       SEP #$20                             ;80BB67|E220    |      ;
                       LDA.B $09,S                          ;80BB69|A309    |000009;
                       PHA                                  ;80BB6B|48      |      ;
                       PLB                                  ;80BB6C|AB      |      ;
                       REP #$20                             ;80BB6D|C220    |      ;
                       LDA.B $07,S                          ;80BB6F|A307    |000007;
                       TAX                                  ;80BB71|AA      |      ;
                       CLC                                  ;80BB72|18      |      ;
                       ADC.W #$0009                         ;80BB73|690900  |      ;
                       STA.B $07,S                          ;80BB76|8307    |000007;
                       LDA.W $0001,X                        ;80BB78|BD0100  |850001;
                       STA.B $7F                            ;80BB7B|857F    |00007F;
                       LDA.W $0002,X                        ;80BB7D|BD0200  |850002;
                       STA.B $80                            ;80BB80|8580    |000080;
                       LDA.B [$7F]                          ;80BB82|A77F    |00007F;
                       ASL A                                ;80BB84|0A      |      ;
                       CLC                                  ;80BB85|18      |      ;
                       ADC.B [$7F]                          ;80BB86|677F    |00007F;
                       TAY                                  ;80BB88|A8      |      ;
                       LDA.W $0004,X                        ;80BB89|BD0400  |850004;
                       STA.B $7F                            ;80BB8C|857F    |00007F;
                       LDA.W $0005,X                        ;80BB8E|BD0500  |850005;
                       STA.B $80                            ;80BB91|8580    |000080;
                       LDA.B [$7F],Y                        ;80BB93|B77F    |00007F;
                       STA.B $7C                            ;80BB95|857C    |00007C;
                       INY                                  ;80BB97|C8      |      ;
                       LDA.B [$7F],Y                        ;80BB98|B77F    |00007F;
                       STA.B $7D                            ;80BB9A|857D    |00007D;
                       LDA.W $0007,X                        ;80BB9C|BD0700  |850007;
                       STA.B $7F                            ;80BB9F|857F    |00007F;
                       LDA.W $0008,X                        ;80BBA1|BD0800  |850008;
                       STA.B $80                            ;80BBA4|8580    |000080;
                       JSL.L CODE_FL_80A421                 ;80BBA6|2221A480|80A421;
                       PLY                                  ;80BBAA|7A      |      ;
                       PLX                                  ;80BBAB|FA      |      ;
                       PLB                                  ;80BBAC|AB      |      ;
                       PLP                                  ;80BBAD|28      |      ;
                       RTL                                  ;80BBAE|6B      |      ;
 
       CODE_FL_80BBAF:
                       PHP                                  ;80BBAF|08      |      ;
                       REP #$30                             ;80BBB0|C230    |      ;
                       PHB                                  ;80BBB2|8B      |      ;
                       LDA.B $D3                            ;80BBB3|A5D3    |0000D3;
                       ASL A                                ;80BBB5|0A      |      ;
                       CLC                                  ;80BBB6|18      |      ;
                       ADC.B $D3                            ;80BBB7|65D3    |0000D3;
                       TAY                                  ;80BBB9|A8      |      ;
                       CLC                                  ;80BBBA|18      |      ;
                       LDA.B [$D5],Y                        ;80BBBB|B7D5    |0000D5;
                       ADC.B $D5                            ;80BBBD|65D5    |0000D5;
                       TAX                                  ;80BBBF|AA      |      ;
                       INY                                  ;80BBC0|C8      |      ;
                       INY                                  ;80BBC1|C8      |      ;
                       SEP #$20                             ;80BBC2|E220    |      ;
                       LDA.B [$D5],Y                        ;80BBC4|B7D5    |0000D5;
                       ADC.B $D7                            ;80BBC6|65D7    |0000D7;
                       PHA                                  ;80BBC8|48      |      ;
                       PLB                                  ;80BBC9|AB      |      ;
                       REP #$20                             ;80BBCA|C220    |      ;
                       LDA.W $0000,X                        ;80BBCC|BD0000  |860000;
                       AND.W #$00FF                         ;80BBCF|29FF00  |      ;
                       STA.B $E4                            ;80BBD2|85E4    |0000E4;
                       ASL A                                ;80BBD4|0A      |      ;
                       ASL A                                ;80BBD5|0A      |      ;
                       CLC                                  ;80BBD6|18      |      ;
                       ADC.W $1F20                          ;80BBD7|6D201F  |861F20;
                       CMP.W #$0200                         ;80BBDA|C90002  |      ;
                       BCS UNREACH_80BBE7                   ;80BBDD|B008    |80BBE7;
                       TXY                                  ;80BBDF|9B      |      ;
                       INY                                  ;80BBE0|C8      |      ;
                       INY                                  ;80BBE1|C8      |      ;
                       LDX.W $1F20                          ;80BBE2|AE201F  |861F20;
                       BRA CODE_80BBEA                      ;80BBE5|8003    |80BBEA;
 
       UNREACH_80BBE7:
                       db $AB,$28,$6B                       ;80BBE7|        |      ;
 
          CODE_80BBEA:
                       LDA.W $0000,Y                        ;80BBEA|B90000  |860000;
                       BMI +                                ;80BBED|301B    |80BC0A;
                       CLC                                  ;80BBEF|18      |      ;
                       ADC.B $CF                            ;80BBF0|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BBF2|9D001D  |861D00;
                       BIT.W #$0100                         ;80BBF5|890001  |      ;
                       BEQ ++                               ;80BBF8|F039    |80BC33;
                       LDA.L DATA8_80C1FE,X                 ;80BBFA|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BBFE|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BC00|B2E0    |0000E0;
                       ORA.L DATA8_80C200,X                 ;80BC02|1F00C280|80C200;
                       STA.B ($E0)                          ;80BC06|92E0    |0000E0;
                       BRA ++                               ;80BC08|8029    |80BC33;
 
                     + CLC                                  ;80BC0A|18      |      ;
                       ADC.B $CF                            ;80BC0B|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BC0D|9D001D  |861D00;
                       BIT.W #$0100                         ;80BC10|890001  |      ;
                       BEQ +                                ;80BC13|F010    |80BC25;
                       LDA.L DATA8_80C1FE,X                 ;80BC15|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BC19|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BC1B|B2E0    |0000E0;
                       ORA.L DATA8_80C400,X                 ;80BC1D|1F00C480|80C400;
                       STA.B ($E0)                          ;80BC21|92E0    |0000E0;
                       BRA ++                               ;80BC23|800E    |80BC33;
 
                     + LDA.L DATA8_80C1FE,X                 ;80BC25|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BC29|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BC2B|B2E0    |0000E0;
                       ORA.L DATA8_80C3FE,X                 ;80BC2D|1FFEC380|80C3FE;
                       STA.B ($E0)                          ;80BC31|92E0    |0000E0;
 
                    ++ LDA.W $0002,Y                        ;80BC33|B90200  |860002;
                       CLC                                  ;80BC36|18      |      ;
                       ADC.B $D1                            ;80BC37|65D1    |0000D1;
                       STA.W $1D01,X                        ;80BC39|9D011D  |861D01;
                       LDA.W $0003,Y                        ;80BC3C|B90300  |860003;
                       STA.W $1D02,X                        ;80BC3F|9D021D  |861D02;
                       INY                                  ;80BC42|C8      |      ;
                       INY                                  ;80BC43|C8      |      ;
                       INY                                  ;80BC44|C8      |      ;
                       INY                                  ;80BC45|C8      |      ;
                       INY                                  ;80BC46|C8      |      ;
                       INX                                  ;80BC47|E8      |      ;
                       INX                                  ;80BC48|E8      |      ;
                       INX                                  ;80BC49|E8      |      ;
                       INX                                  ;80BC4A|E8      |      ;
                       DEC.B $E4                            ;80BC4B|C6E4    |0000E4;
                       BNE CODE_80BBEA                      ;80BC4D|D09B    |80BBEA;
                       STX.W $1F20                          ;80BC4F|8E201F  |861F20;
                       PLB                                  ;80BC52|AB      |      ;
                       PLP                                  ;80BC53|28      |      ;
                       RTL                                  ;80BC54|6B      |      ;
 
       CODE_FL_80BC55:
                       PHP                                  ;80BC55|08      |      ;
                       REP #$30                             ;80BC56|C230    |      ;
                       PHB                                  ;80BC58|8B      |      ;
                       LDA.B $D3                            ;80BC59|A5D3    |0000D3;
                       ASL A                                ;80BC5B|0A      |      ;
                       CLC                                  ;80BC5C|18      |      ;
                       ADC.B $D3                            ;80BC5D|65D3    |0000D3;
                       TAY                                  ;80BC5F|A8      |      ;
                       CLC                                  ;80BC60|18      |      ;
                       LDA.B [$D5],Y                        ;80BC61|B7D5    |0000D5;
                       ADC.B $D5                            ;80BC63|65D5    |0000D5;
                       TAX                                  ;80BC65|AA      |      ;
                       INY                                  ;80BC66|C8      |      ;
                       INY                                  ;80BC67|C8      |      ;
                       SEP #$20                             ;80BC68|E220    |      ;
                       LDA.B [$D5],Y                        ;80BC6A|B7D5    |0000D5;
                       ADC.B $D7                            ;80BC6C|65D7    |0000D7;
                       PHA                                  ;80BC6E|48      |      ;
                       PLB                                  ;80BC6F|AB      |      ;
                       REP #$20                             ;80BC70|C220    |      ;
                       LDA.W $0000,X                        ;80BC72|BD0000  |810000;
                       AND.W #$00FF                         ;80BC75|29FF00  |      ;
                       STA.B $E4                            ;80BC78|85E4    |0000E4;
                       ASL A                                ;80BC7A|0A      |      ;
                       ASL A                                ;80BC7B|0A      |      ;
                       CLC                                  ;80BC7C|18      |      ;
                       ADC.W $1F20                          ;80BC7D|6D201F  |811F20;
                       CMP.W #$0200                         ;80BC80|C90002  |      ;
                       BCS UNREACH_80BC8D                   ;80BC83|B008    |80BC8D;
                       TXY                                  ;80BC85|9B      |      ;
                       INY                                  ;80BC86|C8      |      ;
                       INY                                  ;80BC87|C8      |      ;
                       LDX.W $1F20                          ;80BC88|AE201F  |811F20;
                       BRA CODE_80BC90                      ;80BC8B|8003    |80BC90;
 
       UNREACH_80BC8D:
                       db $AB,$28,$6B                       ;80BC8D|        |      ;
 
          CODE_80BC90:
                       LDA.W $0000,Y                        ;80BC90|B90000  |810000;
                       BMI +                                ;80BC93|301B    |80BCB0;
                       CLC                                  ;80BC95|18      |      ;
                       ADC.B $CF                            ;80BC96|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BC98|9D001D  |811D00;
                       BIT.W #$0100                         ;80BC9B|890001  |      ;
                       BEQ ++                               ;80BC9E|F039    |80BCD9;
                       LDA.L DATA8_80C1FE,X                 ;80BCA0|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BCA4|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BCA6|B2E0    |0000E0;
                       ORA.L DATA8_80C200,X                 ;80BCA8|1F00C280|80C200;
                       STA.B ($E0)                          ;80BCAC|92E0    |0000E0;
                       BRA ++                               ;80BCAE|8029    |80BCD9;
 
                     + CLC                                  ;80BCB0|18      |      ;
                       ADC.B $CF                            ;80BCB1|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BCB3|9D001D  |811D00;
                       BIT.W #$0100                         ;80BCB6|890001  |      ;
                       BEQ +                                ;80BCB9|F010    |80BCCB;
                       LDA.L DATA8_80C1FE,X                 ;80BCBB|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BCBF|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BCC1|B2E0    |0000E0;
                       ORA.L DATA8_80C400,X                 ;80BCC3|1F00C480|80C400;
                       STA.B ($E0)                          ;80BCC7|92E0    |0000E0;
                       BRA ++                               ;80BCC9|800E    |80BCD9;
 
                     + LDA.L DATA8_80C1FE,X                 ;80BCCB|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BCCF|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BCD1|B2E0    |0000E0;
                       ORA.L DATA8_80C3FE,X                 ;80BCD3|1FFEC380|80C3FE;
                       STA.B ($E0)                          ;80BCD7|92E0    |0000E0;
 
                    ++ LDA.W $0002,Y                        ;80BCD9|B90200  |810002;
                       CLC                                  ;80BCDC|18      |      ;
                       ADC.B $D1                            ;80BCDD|65D1    |0000D1;
                       STA.W $1D01,X                        ;80BCDF|9D011D  |811D01;
                       LDA.W $0003,Y                        ;80BCE2|B90300  |810003;
                       AND.B $D8                            ;80BCE5|25D8    |0000D8;
                       ORA.B $DA                            ;80BCE7|05DA    |0000DA;
                       STA.W $1D02,X                        ;80BCE9|9D021D  |811D02;
                       INY                                  ;80BCEC|C8      |      ;
                       INY                                  ;80BCED|C8      |      ;
                       INY                                  ;80BCEE|C8      |      ;
                       INY                                  ;80BCEF|C8      |      ;
                       INY                                  ;80BCF0|C8      |      ;
                       INX                                  ;80BCF1|E8      |      ;
                       INX                                  ;80BCF2|E8      |      ;
                       INX                                  ;80BCF3|E8      |      ;
                       INX                                  ;80BCF4|E8      |      ;
                       DEC.B $E4                            ;80BCF5|C6E4    |0000E4;
                       BNE CODE_80BC90                      ;80BCF7|D097    |80BC90;
                       STX.W $1F20                          ;80BCF9|8E201F  |811F20;
                       PLB                                  ;80BCFC|AB      |      ;
                       PLP                                  ;80BCFD|28      |      ;
                       RTL                                  ;80BCFE|6B      |      ;
 
       CODE_FL_80BCFF:
                       PHP                                  ;80BCFF|08      |      ;
                       REP #$30                             ;80BD00|C230    |      ;
                       PHB                                  ;80BD02|8B      |      ;
                       LDA.B $D3                            ;80BD03|A5D3    |0000D3;
                       ASL A                                ;80BD05|0A      |      ;
                       CLC                                  ;80BD06|18      |      ;
                       ADC.B $D3                            ;80BD07|65D3    |0000D3;
                       TAY                                  ;80BD09|A8      |      ;
                       CLC                                  ;80BD0A|18      |      ;
                       LDA.B [$D5],Y                        ;80BD0B|B7D5    |0000D5;
                       ADC.B $D5                            ;80BD0D|65D5    |0000D5;
                       TAX                                  ;80BD0F|AA      |      ;
                       INY                                  ;80BD10|C8      |      ;
                       INY                                  ;80BD11|C8      |      ;
                       SEP #$20                             ;80BD12|E220    |      ;
                       LDA.B [$D5],Y                        ;80BD14|B7D5    |0000D5;
                       ADC.B $D7                            ;80BD16|65D7    |0000D7;
                       PHA                                  ;80BD18|48      |      ;
                       PLB                                  ;80BD19|AB      |      ;
                       REP #$20                             ;80BD1A|C220    |      ;
                       LDA.W $0000,X                        ;80BD1C|BD0000  |810000;
                       AND.W #$00FF                         ;80BD1F|29FF00  |      ;
                       STA.B $E4                            ;80BD22|85E4    |0000E4;
                       ASL A                                ;80BD24|0A      |      ;
                       ASL A                                ;80BD25|0A      |      ;
                       CLC                                  ;80BD26|18      |      ;
                       ADC.W $1F20                          ;80BD27|6D201F  |811F20;
                       CMP.W #$0200                         ;80BD2A|C90002  |      ;
                       BCS UNREACH_80BD37                   ;80BD2D|B008    |80BD37;
                       TXY                                  ;80BD2F|9B      |      ;
                       INY                                  ;80BD30|C8      |      ;
                       INY                                  ;80BD31|C8      |      ;
                       LDX.W $1F20                          ;80BD32|AE201F  |811F20;
                       BRA +                                ;80BD35|8003    |80BD3A;
 
       UNREACH_80BD37:
                       db $AB,$28,$6B                       ;80BD37|        |      ;
 
                     + LDA.B $DE                            ;80BD3A|A5DE    |0000DE;
                       BIT.W #$8000                         ;80BD3C|890080  |      ;
                       BNE UNREACH_80BD50                   ;80BD3F|D00F    |80BD50;
                       BIT.W #$4000                         ;80BD41|890040  |      ;
                       BNE +                                ;80BD44|D005    |80BD4B;
                       JSR.W CODE_FN_80BD65                 ;80BD46|2065BD  |80BD65;
                       BRA ++                               ;80BD49|8014    |80BD5F;
 
                     + JSR.W CODE_FN_80BE85                 ;80BD4B|2085BE  |80BE85;
                       BRA ++                               ;80BD4E|800F    |80BD5F;
 
       UNREACH_80BD50:
                       db $89,$00,$40,$D0,$05,$20,$EB,$BD   ;80BD50|        |      ;
                       db $80,$05,$20,$1C,$BF,$80,$00       ;80BD58|        |80BD5F;
 
                    ++ STX.W $1F20                          ;80BD5F|8E201F  |811F20;
                       PLB                                  ;80BD62|AB      |      ;
                       PLP                                  ;80BD63|28      |      ;
                       RTL                                  ;80BD64|6B      |      ;
 
       CODE_FN_80BD65:
                       LDA.B $D8                            ;80BD65|A5D8    |0000D8;
                       PHA                                  ;80BD67|48      |      ;
                       AND.W #$FE00                         ;80BD68|2900FE  |      ;
                       STA.B $D8                            ;80BD6B|85D8    |0000D8;
 
       CODE_JP_80BD6D:
                       LDA.W $0000,Y                        ;80BD6D|B90000  |860000;
                       BMI +                                ;80BD70|301B    |80BD8D;
                       CLC                                  ;80BD72|18      |      ;
                       ADC.B $CF                            ;80BD73|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BD75|9D001D  |861D00;
                       BIT.W #$0100                         ;80BD78|890001  |      ;
                       BEQ ++                               ;80BD7B|F039    |80BDB6;
                       LDA.L DATA8_80C1FE,X                 ;80BD7D|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BD81|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BD83|B2E0    |0000E0;
                       ORA.L DATA8_80C200,X                 ;80BD85|1F00C280|80C200;
                       STA.B ($E0)                          ;80BD89|92E0    |0000E0;
                       BRA ++                               ;80BD8B|8029    |80BDB6;
 
                     + CLC                                  ;80BD8D|18      |      ;
                       ADC.B $CF                            ;80BD8E|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BD90|9D001D  |861D00;
                       BIT.W #$0100                         ;80BD93|890001  |      ;
                       BEQ +                                ;80BD96|F010    |80BDA8;
                       LDA.L DATA8_80C1FE,X                 ;80BD98|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BD9C|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BD9E|B2E0    |0000E0;
                       ORA.L DATA8_80C400,X                 ;80BDA0|1F00C480|80C400;
                       STA.B ($E0)                          ;80BDA4|92E0    |0000E0;
                       BRA ++                               ;80BDA6|800E    |80BDB6;
 
                     + LDA.L DATA8_80C1FE,X                 ;80BDA8|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BDAC|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BDAE|B2E0    |0000E0;
                       ORA.L DATA8_80C3FE,X                 ;80BDB0|1FFEC380|80C3FE;
                       STA.B ($E0)                          ;80BDB4|92E0    |0000E0;
 
                    ++ LDA.W $0002,Y                        ;80BDB6|B90200  |860002;
                       CLC                                  ;80BDB9|18      |      ;
                       ADC.B $D1                            ;80BDBA|65D1    |0000D1;
                       STA.W $1D01,X                        ;80BDBC|9D011D  |861D01;
                       LDA.W $0003,Y                        ;80BDBF|B90300  |860003;
                       CLC                                  ;80BDC2|18      |      ;
                       ADC.B $DC                            ;80BDC3|65DC    |0000DC;
                       AND.W #$01FF                         ;80BDC5|29FF01  |      ;
                       STA.B $E0                            ;80BDC8|85E0    |0000E0;
                       LDA.W $0003,Y                        ;80BDCA|B90300  |860003;
                       AND.B $D8                            ;80BDCD|25D8    |0000D8;
                       ORA.B $DA                            ;80BDCF|05DA    |0000DA;
                       ORA.B $E0                            ;80BDD1|05E0    |0000E0;
                       STA.W $1D02,X                        ;80BDD3|9D021D  |861D02;
                       TYA                                  ;80BDD6|98      |      ;
                       CLC                                  ;80BDD7|18      |      ;
                       ADC.W #$0005                         ;80BDD8|690500  |      ;
                       TAY                                  ;80BDDB|A8      |      ;
                       INX                                  ;80BDDC|E8      |      ;
                       INX                                  ;80BDDD|E8      |      ;
                       INX                                  ;80BDDE|E8      |      ;
                       INX                                  ;80BDDF|E8      |      ;
                       DEC.B $E4                            ;80BDE0|C6E4    |0000E4;
                       BEQ +                                ;80BDE2|F003    |80BDE7;
                       JMP.W CODE_JP_80BD6D                 ;80BDE4|4C6DBD  |80BD6D;
 
                     + PLA                                  ;80BDE7|68      |      ;
                       STA.B $D8                            ;80BDE8|85D8    |0000D8;
                       RTS                                  ;80BDEA|60      |      ;
                       db $A5,$D8,$48,$29,$00,$FE,$85,$D8   ;80BDEB|        |0000D8;
                       db $B9,$00,$00,$30,$28,$18,$65,$CF   ;80BDF3|        |000000;
                       db $9D,$00,$1D,$89,$00,$01,$F0,$0E   ;80BDFB|        |001D00;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80BE03|        |80C1FE;
                       db $1F,$00,$C2,$80,$92,$E0,$A9,$F8   ;80BE0B|        |80C200;
                       db $FF,$38,$F9,$02,$00,$18,$65,$D1   ;80BE13|        |02F938;
                       db $9D,$01,$1D,$80,$36,$18,$65,$CF   ;80BE1B|        |001D01;
                       db $9D,$00,$1D,$89,$00,$01,$F0,$10   ;80BE23|        |001D00;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80BE2B|        |80C1FE;
                       db $1F,$00,$C4,$80,$92,$E0,$80,$0E   ;80BE33|        |80C400;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80BE3B|        |80C1FE;
                       db $1F,$FE,$C3,$80,$92,$E0,$A9,$F0   ;80BE43|        |80C3FE;
                       db $FF,$38,$F9,$02,$00,$18,$65,$D1   ;80BE4B|        |02F938;
                       db $9D,$01,$1D,$B9,$03,$00,$18,$65   ;80BE53|        |001D01;
                       db $DC,$29,$FF,$01,$85,$E0,$B9,$03   ;80BE5B|        |00FF29;
                       db $00,$25,$D8,$05,$DA,$05,$E0,$49   ;80BE63|        |      ;
                       db $00,$80,$9D,$02,$1D,$98,$18,$69   ;80BE6B|        |      ;
                       db $05,$00,$A8,$E8,$E8,$E8,$E8,$C6   ;80BE73|        |000000;
                       db $E4,$F0,$03,$4C,$F3,$BD,$68,$85   ;80BE7B|        |0000F0;
                       db $D8,$60                           ;80BE83|        |      ;
 
       CODE_FN_80BE85:
                       LDA.B $D8                            ;80BE85|A5D8    |0000D8;
                       PHA                                  ;80BE87|48      |      ;
                       AND.W #$FE00                         ;80BE88|2900FE  |      ;
                       STA.B $D8                            ;80BE8B|85D8    |0000D8;
 
       CODE_JP_80BE8D:
                       LDA.W $0000,Y                        ;80BE8D|B90000  |810000;
                       BMI +                                ;80BE90|3022    |80BEB4;
                       LDA.W #$FFF8                         ;80BE92|A9F8FF  |      ;
                       SEC                                  ;80BE95|38      |      ;
                       SBC.W $0000,Y                        ;80BE96|F90000  |810000;
                       CLC                                  ;80BE99|18      |      ;
                       ADC.B $CF                            ;80BE9A|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BE9C|9D001D  |811D00;
                       BIT.W #$0100                         ;80BE9F|890001  |      ;
                       BEQ ++                               ;80BEA2|F040    |80BEE4;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80BEA4|        |80C1FE;
                       db $1F,$00,$C2,$80,$92,$E0,$80,$30   ;80BEAC|        |80C200;
 
                     + LDA.W #$FFF0                         ;80BEB4|A9F0FF  |      ;
                       SEC                                  ;80BEB7|38      |      ;
                       SBC.W $0000,Y                        ;80BEB8|F90000  |810000;
                       CLC                                  ;80BEBB|18      |      ;
                       ADC.B $CF                            ;80BEBC|65CF    |0000CF;
                       STA.W $1D00,X                        ;80BEBE|9D001D  |811D00;
                       BIT.W #$0100                         ;80BEC1|890001  |      ;
                       BEQ +                                ;80BEC4|F010    |80BED6;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80BEC6|        |80C1FE;
                       db $1F,$00,$C4,$80,$92,$E0,$80,$0E   ;80BECE|        |80C400;
 
                     + LDA.L DATA8_80C1FE,X                 ;80BED6|BFFEC180|80C1FE;
                       STA.B $E0                            ;80BEDA|85E0    |0000E0;
                       LDA.B ($E0)                          ;80BEDC|B2E0    |0000E0;
                       ORA.L DATA8_80C3FE,X                 ;80BEDE|1FFEC380|80C3FE;
                       STA.B ($E0)                          ;80BEE2|92E0    |0000E0;
 
                    ++ LDA.W $0002,Y                        ;80BEE4|B90200  |810002;
                       CLC                                  ;80BEE7|18      |      ;
                       ADC.B $D1                            ;80BEE8|65D1    |0000D1;
                       STA.W $1D01,X                        ;80BEEA|9D011D  |811D01;
                       LDA.W $0003,Y                        ;80BEED|B90300  |810003;
                       CLC                                  ;80BEF0|18      |      ;
                       ADC.B $DC                            ;80BEF1|65DC    |0000DC;
                       AND.W #$01FF                         ;80BEF3|29FF01  |      ;
                       STA.B $E0                            ;80BEF6|85E0    |0000E0;
                       LDA.W $0003,Y                        ;80BEF8|B90300  |810003;
                       AND.B $D8                            ;80BEFB|25D8    |0000D8;
                       ORA.B $DA                            ;80BEFD|05DA    |0000DA;
                       ORA.B $E0                            ;80BEFF|05E0    |0000E0;
                       EOR.W #$4000                         ;80BF01|490040  |      ;
                       STA.W $1D02,X                        ;80BF04|9D021D  |811D02;
                       TYA                                  ;80BF07|98      |      ;
                       CLC                                  ;80BF08|18      |      ;
                       ADC.W #$0005                         ;80BF09|690500  |      ;
                       TAY                                  ;80BF0C|A8      |      ;
                       INX                                  ;80BF0D|E8      |      ;
                       INX                                  ;80BF0E|E8      |      ;
                       INX                                  ;80BF0F|E8      |      ;
                       INX                                  ;80BF10|E8      |      ;
                       DEC.B $E4                            ;80BF11|C6E4    |0000E4;
                       BEQ +                                ;80BF13|F003    |80BF18;
                       JMP.W CODE_JP_80BE8D                 ;80BF15|4C8DBE  |80BE8D;
 
                     + PLA                                  ;80BF18|68      |      ;
                       STA.B $D8                            ;80BF19|85D8    |0000D8;
                       RTS                                  ;80BF1B|60      |      ;
                       db $A5,$D8,$48,$29,$00,$FE,$85,$D8   ;80BF1C|        |0000D8;
                       db $B9,$00,$00,$30,$2F,$A9,$F8,$FF   ;80BF24|        |000000;
                       db $38,$F9,$00,$00,$18,$65,$CF,$9D   ;80BF2C|        |      ;
                       db $00,$1D,$89,$00,$01,$F0,$0E,$BF   ;80BF34|        |      ;
                       db $FE,$C1,$80,$85,$E0,$B2,$E0,$1F   ;80BF3C|        |0080C1;
                       db $00,$C2,$80,$92,$E0,$A9,$F8,$FF   ;80BF44|        |      ;
                       db $38,$F9,$02,$00,$18,$65,$D1,$9D   ;80BF4C|        |      ;
                       db $01,$1D,$80,$3D,$A9,$F0,$FF,$38   ;80BF54|        |00001D;
                       db $F9,$00,$00,$18,$65,$CF,$9D,$00   ;80BF5C|        |000000;
                       db $1D,$89,$00,$01,$F0,$10,$BF,$FE   ;80BF64|        |000089;
                       db $C1,$80,$85,$E0,$B2,$E0,$1F,$00   ;80BF6C|        |000080;
                       db $C4,$80,$92,$E0,$80,$0E,$BF,$FE   ;80BF74|        |000080;
                       db $C1,$80,$85,$E0,$B2,$E0,$1F,$FE   ;80BF7C|        |000080;
                       db $C3,$80,$92,$E0,$A9,$F0,$FF,$38   ;80BF84|        |000080;
                       db $F9,$02,$00,$18,$65,$D1,$9D,$01   ;80BF8C|        |000002;
                       db $1D,$B9,$03,$00,$18,$65,$DC,$29   ;80BF94|        |0003B9;
                       db $FF,$01,$85,$E0,$B9,$03,$00,$25   ;80BF9C|        |E08501;
                       db $D8,$05,$DA,$05,$E0,$49,$00,$C0   ;80BFA4|        |      ;
                       db $9D,$02,$1D,$98,$18,$69,$05,$00   ;80BFAC|        |001D02;
                       db $A8,$E8,$E8,$E8,$E8,$C6,$E4,$F0   ;80BFB4|        |      ;
                       db $03,$4C,$24,$BF,$68,$85,$D8,$60   ;80BFBC|        |00004C;
 
       CODE_FL_80BFC4:
                       PHP                                  ;80BFC4|08      |      ;
                       REP #$30                             ;80BFC5|C230    |      ;
                       PHB                                  ;80BFC7|8B      |      ;
                       LDA.B $D3                            ;80BFC8|A5D3    |0000D3;
                       ASL A                                ;80BFCA|0A      |      ;
                       CLC                                  ;80BFCB|18      |      ;
                       ADC.B $D3                            ;80BFCC|65D3    |0000D3;
                       TAY                                  ;80BFCE|A8      |      ;
                       CLC                                  ;80BFCF|18      |      ;
                       LDA.B [$D5],Y                        ;80BFD0|B7D5    |0000D5;
                       ADC.B $D5                            ;80BFD2|65D5    |0000D5;
                       TAX                                  ;80BFD4|AA      |      ;
                       INY                                  ;80BFD5|C8      |      ;
                       INY                                  ;80BFD6|C8      |      ;
                       SEP #$20                             ;80BFD7|E220    |      ;
                       LDA.B [$D5],Y                        ;80BFD9|B7D5    |0000D5;
                       ADC.B $D7                            ;80BFDB|65D7    |0000D7;
                       PHA                                  ;80BFDD|48      |      ;
                       PLB                                  ;80BFDE|AB      |      ;
                       REP #$20                             ;80BFDF|C220    |      ;
                       LDA.W $0000,X                        ;80BFE1|BD0000  |810000;
                       AND.W #$00FF                         ;80BFE4|29FF00  |      ;
                       STA.B $E4                            ;80BFE7|85E4    |0000E4;
                       ASL A                                ;80BFE9|0A      |      ;
                       ASL A                                ;80BFEA|0A      |      ;
                       CLC                                  ;80BFEB|18      |      ;
                       ADC.W $1F20                          ;80BFEC|6D201F  |811F20;
                       CMP.W #$0200                         ;80BFEF|C90002  |      ;
                       BCS UNREACH_80BFFC                   ;80BFF2|B008    |80BFFC;
                       TXY                                  ;80BFF4|9B      |      ;
                       INY                                  ;80BFF5|C8      |      ;
                       INY                                  ;80BFF6|C8      |      ;
                       LDX.W $1F20                          ;80BFF7|AE201F  |811F20;
                       BRA CODE_JP_80BFFF                   ;80BFFA|8003    |80BFFF;
 
       UNREACH_80BFFC:
                       db $AB,$28,$6B                       ;80BFFC|        |      ;
 
       CODE_JP_80BFFF:
                       LDA.W $0000,Y                        ;80BFFF|B90000  |810000;
                       BMI +                                ;80C002|301B    |80C01F;
                       CLC                                  ;80C004|18      |      ;
                       ADC.B $CF                            ;80C005|65CF    |0000CF;
                       STA.W $1D00,X                        ;80C007|9D001D  |811D00;
                       BIT.W #$0100                         ;80C00A|890001  |      ;
                       BEQ ++                               ;80C00D|F039    |80C048;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80C00F|        |80C1FE;
                       db $1F,$00,$C2,$80,$92,$E0,$80,$29   ;80C017|        |80C200;
 
                     + CLC                                  ;80C01F|18      |      ;
                       ADC.B $CF                            ;80C020|65CF    |0000CF;
                       STA.W $1D00,X                        ;80C022|9D001D  |811D00;
                       BIT.W #$0100                         ;80C025|890001  |      ;
                       BEQ +                                ;80C028|F010    |80C03A;
                       LDA.L DATA8_80C1FE,X                 ;80C02A|BFFEC180|80C1FE;
                       STA.B $E0                            ;80C02E|85E0    |0000E0;
                       LDA.B ($E0)                          ;80C030|B2E0    |0000E0;
                       ORA.L DATA8_80C400,X                 ;80C032|1F00C480|80C400;
                       STA.B ($E0)                          ;80C036|92E0    |0000E0;
                       BRA ++                               ;80C038|800E    |80C048;
 
                     + LDA.L DATA8_80C1FE,X                 ;80C03A|BFFEC180|80C1FE;
                       STA.B $E0                            ;80C03E|85E0    |0000E0;
                       LDA.B ($E0)                          ;80C040|B2E0    |0000E0;
                       ORA.L DATA8_80C3FE,X                 ;80C042|1FFEC380|80C3FE;
                       STA.B ($E0)                          ;80C046|92E0    |0000E0;
 
                    ++ LDA.W $0002,Y                        ;80C048|B90200  |810002;
                       BIT.W #$0080                         ;80C04B|898000  |      ;
                       BNE +                                ;80C04E|D005    |80C055;
                       db $29,$7F,$00,$80,$03               ;80C050|        |      ;
 
                     + ORA.W #$FF80                         ;80C055|0980FF  |      ;
                       CLC                                  ;80C058|18      |      ;
                       ADC.B $D1                            ;80C059|65D1    |0000D1;
                       STA.W $1D01,X                        ;80C05B|9D011D  |811D01;
                       CLC                                  ;80C05E|18      |      ;
                       ADC.W #$0010                         ;80C05F|691000  |      ;
                       CMP.W #$0100                         ;80C062|C90001  |      ;
                       BCC +                                ;80C065|9006    |80C06D;
                       LDA.W #$00F0                         ;80C067|A9F000  |      ;
                       STA.W $1D01,X                        ;80C06A|9D011D  |811D01;
 
                     + LDA.W $0003,Y                        ;80C06D|B90300  |810003;
                       AND.B $D8                            ;80C070|25D8    |0000D8;
                       ORA.B $DA                            ;80C072|05DA    |0000DA;
                       STA.W $1D02,X                        ;80C074|9D021D  |811D02;
                       INY                                  ;80C077|C8      |      ;
                       INY                                  ;80C078|C8      |      ;
                       INY                                  ;80C079|C8      |      ;
                       INY                                  ;80C07A|C8      |      ;
                       INY                                  ;80C07B|C8      |      ;
                       INX                                  ;80C07C|E8      |      ;
                       INX                                  ;80C07D|E8      |      ;
                       INX                                  ;80C07E|E8      |      ;
                       INX                                  ;80C07F|E8      |      ;
                       DEC.B $E4                            ;80C080|C6E4    |0000E4;
                       BEQ +                                ;80C082|F003    |80C087;
                       JMP.W CODE_JP_80BFFF                 ;80C084|4CFFBF  |80BFFF;
 
                     + STX.W $1F20                          ;80C087|8E201F  |811F20;
                       PLB                                  ;80C08A|AB      |      ;
                       PLP                                  ;80C08B|28      |      ;
                       RTL                                  ;80C08C|6B      |      ;
 
       CODE_FL_80C08D:
                       PHP                                  ;80C08D|08      |      ;
                       REP #$30                             ;80C08E|C230    |      ;
                       PHB                                  ;80C090|8B      |      ;
                       LDA.B $D3                            ;80C091|A5D3    |0000D3;
                       ASL A                                ;80C093|0A      |      ;
                       CLC                                  ;80C094|18      |      ;
                       ADC.B $D3                            ;80C095|65D3    |0000D3;
                       TAY                                  ;80C097|A8      |      ;
                       CLC                                  ;80C098|18      |      ;
                       LDA.B [$D5],Y                        ;80C099|B7D5    |0000D5;
                       ADC.B $D5                            ;80C09B|65D5    |0000D5;
                       TAX                                  ;80C09D|AA      |      ;
                       INY                                  ;80C09E|C8      |      ;
                       INY                                  ;80C09F|C8      |      ;
                       SEP #$20                             ;80C0A0|E220    |      ;
                       LDA.B [$D5],Y                        ;80C0A2|B7D5    |0000D5;
                       ADC.B $D7                            ;80C0A4|65D7    |0000D7;
                       PHA                                  ;80C0A6|48      |      ;
                       PLB                                  ;80C0A7|AB      |      ;
                       REP #$20                             ;80C0A8|C220    |      ;
                       LDA.W $0000,X                        ;80C0AA|BD0000  |860000;
                       AND.W #$00FF                         ;80C0AD|29FF00  |      ;
                       STA.B $E4                            ;80C0B0|85E4    |0000E4;
                       ASL A                                ;80C0B2|0A      |      ;
                       ASL A                                ;80C0B3|0A      |      ;
                       CLC                                  ;80C0B4|18      |      ;
                       ADC.W $1F20                          ;80C0B5|6D201F  |861F20;
                       CMP.W #$0200                         ;80C0B8|C90002  |      ;
                       BCS +                                ;80C0BB|B008    |80C0C5;
                       TXY                                  ;80C0BD|9B      |      ;
                       INY                                  ;80C0BE|C8      |      ;
                       INY                                  ;80C0BF|C8      |      ;
                       LDX.W $1F20                          ;80C0C0|AE201F  |861F20;
                       BRA CODE_JP_80C0C8                   ;80C0C3|8003    |80C0C8;
 
                     + PLB                                  ;80C0C5|AB      |      ;
                       PLP                                  ;80C0C6|28      |      ;
                       RTL                                  ;80C0C7|6B      |      ;
 
       CODE_JP_80C0C8:
                       LDA.W $0000,Y                        ;80C0C8|B90000  |860000;
                       BMI +                                ;80C0CB|302E    |80C0FB;
                       LDA.B $DE                            ;80C0CD|A5DE    |0000DE;
                       BIT.W #$4000                         ;80C0CF|890040  |      ;
                       BEQ ++                               ;80C0D2|F009    |80C0DD;
                       LDA.W #$FFF8                         ;80C0D4|A9F8FF  |      ;
                       SEC                                  ;80C0D7|38      |      ;
                       SBC.W $0000,Y                        ;80C0D8|F90000  |860000;
                       BRA +++                              ;80C0DB|8003    |80C0E0;
 
                    ++ LDA.W $0000,Y                        ;80C0DD|B90000  |860000;
 
                   +++ CLC                                  ;80C0E0|18      |      ;
                       ADC.B $CF                            ;80C0E1|65CF    |0000CF;
                       STA.W $1D00,X                        ;80C0E3|9D001D  |861D00;
                       BIT.W #$0100                         ;80C0E6|890001  |      ;
                       BEQ ++                               ;80C0E9|F04E    |80C139;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80C0EB|        |80C1FE;
                       db $1F,$00,$C2,$80,$92,$E0,$80,$3E   ;80C0F3|        |80C200;
 
                     + LDA.B $DE                            ;80C0FB|A5DE    |0000DE;
                       BIT.W #$4000                         ;80C0FD|890040  |      ;
                       BEQ +                                ;80C100|F009    |80C10B;
                       LDA.W #$FFF0                         ;80C102|A9F0FF  |      ;
                       SEC                                  ;80C105|38      |      ;
                       SBC.W $0000,Y                        ;80C106|F90000  |860000;
                       BRA +++                              ;80C109|8003    |80C10E;
 
                     + LDA.W $0000,Y                        ;80C10B|B90000  |860000;
 
                   +++ CLC                                  ;80C10E|18      |      ;
                       ADC.B $CF                            ;80C10F|65CF    |0000CF;
                       STA.W $1D00,X                        ;80C111|9D001D  |861D00;
                       BIT.W #$0100                         ;80C114|890001  |      ;
                       BEQ +                                ;80C117|F010    |80C129;
                       db $BF,$FE,$C1,$80,$85,$E0,$B2,$E0   ;80C119|        |80C1FE;
                       db $1F,$00,$C4,$80,$92,$E0,$80,$58   ;80C121|        |80C400;
 
                     + LDA.L DATA8_80C1FE,X                 ;80C129|BFFEC180|80C1FE;
                       STA.B $E0                            ;80C12D|85E0    |0000E0;
                       LDA.B ($E0)                          ;80C12F|B2E0    |0000E0;
                       ORA.L DATA8_80C3FE,X                 ;80C131|1FFEC380|80C3FE;
                       STA.B ($E0)                          ;80C135|92E0    |0000E0;
                       BRA +                                ;80C137|8048    |80C181;
 
                    ++ LDA.B $DE                            ;80C139|A5DE    |0000DE;
                       BIT.W #$8000                         ;80C13B|890080  |      ;
                       BEQ ++                               ;80C13E|F01A    |80C15A;
                       db $B9,$02,$00,$89,$80,$00,$D0,$05   ;80C140|        |000002;
                       db $29,$7F,$00,$80,$03,$09,$80,$FF   ;80C148|        |      ;
                       db $18,$69,$08,$00,$49,$FF,$FF,$1A   ;80C150|        |      ;
                       db $80,$10                           ;80C158|        |80C16A;
 
                    ++ LDA.W $0002,Y                        ;80C15A|B90200  |860002;
                       BIT.W #$0080                         ;80C15D|898000  |      ;
                       BNE ++                               ;80C160|D005    |80C167;
                       AND.W #$007F                         ;80C162|297F00  |      ;
                       BRA +++                              ;80C165|8003    |80C16A;
 
                    ++ ORA.W #$FF80                         ;80C167|0980FF  |      ;
 
                   +++ CLC                                  ;80C16A|18      |      ;
                       ADC.B $D1                            ;80C16B|65D1    |0000D1;
                       STA.W $1D01,X                        ;80C16D|9D011D  |861D01;
                       CLC                                  ;80C170|18      |      ;
                       ADC.W #$0010                         ;80C171|691000  |      ;
                       CMP.W #$0100                         ;80C174|C90001  |      ;
                       BCC ++                               ;80C177|9006    |80C17F;
                       db $A9,$F0,$00,$9D,$01,$1D           ;80C179|        |      ;
 
                    ++ BRA ++                               ;80C17F|8048    |80C1C9;
 
                     + LDA.B $DE                            ;80C181|A5DE    |0000DE;
                       BIT.W #$8000                         ;80C183|890080  |      ;
                       BEQ +                                ;80C186|F01A    |80C1A2;
                       db $B9,$02,$00,$89,$80,$00,$D0,$05   ;80C188|        |000002;
                       db $29,$7F,$00,$80,$03,$09,$80,$FF   ;80C190|        |      ;
                       db $18,$69,$10,$00,$49,$FF,$FF,$1A   ;80C198|        |      ;
                       db $80,$10                           ;80C1A0|        |80C1B2;
 
                     + LDA.W $0002,Y                        ;80C1A2|B90200  |860002;
                       BIT.W #$0080                         ;80C1A5|898000  |      ;
                       BNE +                                ;80C1A8|D005    |80C1AF;
                       AND.W #$007F                         ;80C1AA|297F00  |      ;
                       BRA +++                              ;80C1AD|8003    |80C1B2;
 
                     + ORA.W #$FF80                         ;80C1AF|0980FF  |      ;
 
                   +++ CLC                                  ;80C1B2|18      |      ;
                       ADC.B $D1                            ;80C1B3|65D1    |0000D1;
                       STA.W $1D01,X                        ;80C1B5|9D011D  |861D01;
                       CLC                                  ;80C1B8|18      |      ;
                       ADC.W #$0010                         ;80C1B9|691000  |      ;
                       CMP.W #$0100                         ;80C1BC|C90001  |      ;
                       BCC +                                ;80C1BF|9006    |80C1C7;
                       db $A9,$F0,$00,$9D,$01,$1D           ;80C1C1|        |      ;
 
                     + BRA ++                               ;80C1C7|8000    |80C1C9;
 
                    ++ LDA.W $0003,Y                        ;80C1C9|B90300  |860003;
                       AND.W #$01FF                         ;80C1CC|29FF01  |      ;
                       CLC                                  ;80C1CF|18      |      ;
                       ADC.B $DC                            ;80C1D0|65DC    |0000DC;
                       AND.W #$01FF                         ;80C1D2|29FF01  |      ;
                       STA.B $E0                            ;80C1D5|85E0    |0000E0;
                       LDA.W $0003,Y                        ;80C1D7|B90300  |860003;
                       AND.W #$FE00                         ;80C1DA|2900FE  |      ;
                       AND.B $D8                            ;80C1DD|25D8    |0000D8;
                       ORA.B $DA                            ;80C1DF|05DA    |0000DA;
                       ORA.B $E0                            ;80C1E1|05E0    |0000E0;
                       EOR.B $DE                            ;80C1E3|45DE    |0000DE;
                       STA.W $1D02,X                        ;80C1E5|9D021D  |861D02;
                       INY                                  ;80C1E8|C8      |      ;
                       INY                                  ;80C1E9|C8      |      ;
                       INY                                  ;80C1EA|C8      |      ;
                       INY                                  ;80C1EB|C8      |      ;
                       INY                                  ;80C1EC|C8      |      ;
                       INX                                  ;80C1ED|E8      |      ;
                       INX                                  ;80C1EE|E8      |      ;
                       INX                                  ;80C1EF|E8      |      ;
                       INX                                  ;80C1F0|E8      |      ;
                       DEC.B $E4                            ;80C1F1|C6E4    |0000E4;
                       BEQ +                                ;80C1F3|F003    |80C1F8;
                       JMP.W CODE_JP_80C0C8                 ;80C1F5|4CC8C0  |80C0C8;
 
                     + STX.W $1F20                          ;80C1F8|8E201F  |861F20;
                       PLB                                  ;80C1FB|AB      |      ;
                       PLP                                  ;80C1FC|28      |      ;
                       RTL                                  ;80C1FD|6B      |      ;
 
         DATA8_80C1FE:
                       db $00,$1F                           ;80C1FE|        |      ;
 
         DATA8_80C200:
                       db $01,$00,$00,$1F,$04,$00,$00,$1F   ;80C200|        |      ;
                       db $10,$00,$00,$1F,$40,$00,$00,$1F   ;80C208|        |      ;
                       db $00,$01,$00,$1F,$00,$04,$00,$1F   ;80C210|        |      ;
                       db $00,$10,$00,$1F,$00,$40,$02,$1F   ;80C218|        |      ;
                       db $01,$00,$02,$1F,$04,$00,$02,$1F   ;80C220|        |      ;
                       db $10,$00,$02,$1F,$40,$00,$02,$1F   ;80C228|        |      ;
                       db $00,$01,$02,$1F,$00,$04,$02,$1F   ;80C230|        |      ;
                       db $00,$10,$02,$1F,$00,$40,$04,$1F   ;80C238|        |      ;
                       db $01,$00,$04,$1F,$04,$00,$04,$1F   ;80C240|        |      ;
                       db $10,$00,$04,$1F,$40,$00,$04,$1F   ;80C248|        |      ;
                       db $00,$01,$04,$1F,$00,$04,$04,$1F   ;80C250|        |      ;
                       db $00,$10,$04,$1F,$00,$40,$06,$1F   ;80C258|        |      ;
                       db $01,$00,$06,$1F,$04,$00,$06,$1F   ;80C260|        |      ;
                       db $10,$00,$06,$1F,$40,$00,$06,$1F   ;80C268|        |      ;
                       db $00,$01,$06,$1F,$00,$04,$06,$1F   ;80C270|        |      ;
                       db $00,$10,$06,$1F,$00,$40,$08,$1F   ;80C278|        |      ;
                       db $01,$00,$08,$1F,$04,$00,$08,$1F   ;80C280|        |      ;
                       db $10,$00,$08,$1F,$40,$00,$08,$1F   ;80C288|        |      ;
                       db $00,$01,$08,$1F,$00,$04,$08,$1F   ;80C290|        |      ;
                       db $00,$10,$08,$1F,$00,$40,$0A,$1F   ;80C298|        |      ;
                       db $01,$00,$0A,$1F,$04,$00,$0A,$1F   ;80C2A0|        |      ;
                       db $10,$00,$0A,$1F,$40,$00,$0A,$1F   ;80C2A8|        |      ;
                       db $00,$01,$0A,$1F,$00,$04,$0A,$1F   ;80C2B0|        |      ;
                       db $00,$10,$0A,$1F,$00,$40,$0C,$1F   ;80C2B8|        |      ;
                       db $01,$00,$0C,$1F,$04,$00,$0C,$1F   ;80C2C0|        |      ;
                       db $10,$00,$0C,$1F,$40,$00,$0C,$1F   ;80C2C8|        |      ;
                       db $00,$01,$0C,$1F,$00,$04,$0C,$1F   ;80C2D0|        |      ;
                       db $00,$10,$0C,$1F,$00,$40,$0E,$1F   ;80C2D8|        |      ;
                       db $01,$00,$0E,$1F,$04,$00,$0E,$1F   ;80C2E0|        |      ;
                       db $10,$00,$0E,$1F,$40,$00,$0E,$1F   ;80C2E8|        |      ;
                       db $00,$01,$0E,$1F,$00,$04,$0E,$1F   ;80C2F0|        |      ;
                       db $00,$10,$0E,$1F,$00,$40,$10,$1F   ;80C2F8|        |      ;
                       db $01,$00,$10,$1F,$04,$00,$10,$1F   ;80C300|        |      ;
                       db $10,$00,$10,$1F,$40,$00,$10,$1F   ;80C308|        |      ;
                       db $00,$01,$10,$1F,$00,$04,$10,$1F   ;80C310|        |      ;
                       db $00,$10,$10,$1F,$00,$40,$12,$1F   ;80C318|        |      ;
                       db $01,$00,$12,$1F,$04,$00,$12,$1F   ;80C320|        |      ;
                       db $10,$00,$12,$1F,$40,$00,$12,$1F   ;80C328|        |      ;
                       db $00,$01,$12,$1F,$00,$04,$12,$1F   ;80C330|        |      ;
                       db $00,$10,$12,$1F,$00,$40,$14,$1F   ;80C338|        |      ;
                       db $01,$00,$14,$1F,$04,$00,$14,$1F   ;80C340|        |      ;
                       db $10,$00,$14,$1F,$40,$00,$14,$1F   ;80C348|        |      ;
                       db $00,$01,$14,$1F,$00,$04,$14,$1F   ;80C350|        |      ;
                       db $00,$10,$14,$1F,$00,$40,$16,$1F   ;80C358|        |      ;
                       db $01,$00,$16,$1F,$04,$00,$16,$1F   ;80C360|        |      ;
                       db $10,$00,$16,$1F,$40,$00,$16,$1F   ;80C368|        |      ;
                       db $00,$01,$16,$1F,$00,$04,$16,$1F   ;80C370|        |      ;
                       db $00,$10,$16,$1F,$00,$40,$18,$1F   ;80C378|        |      ;
                       db $01,$00,$18,$1F,$04,$00,$18,$1F   ;80C380|        |      ;
                       db $10,$00,$18,$1F,$40,$00,$18,$1F   ;80C388|        |      ;
                       db $00,$01,$18,$1F,$00,$04,$18,$1F   ;80C390|        |      ;
                       db $00,$10,$18,$1F,$00,$40,$1A,$1F   ;80C398|        |      ;
                       db $01,$00,$1A,$1F,$04,$00,$1A,$1F   ;80C3A0|        |      ;
                       db $10,$00,$1A,$1F,$40,$00,$1A,$1F   ;80C3A8|        |      ;
                       db $00,$01,$1A,$1F,$00,$04,$1A,$1F   ;80C3B0|        |      ;
                       db $00,$10,$1A,$1F,$00,$40,$1C,$1F   ;80C3B8|        |      ;
                       db $01,$00,$1C,$1F,$04,$00,$1C,$1F   ;80C3C0|        |      ;
                       db $10,$00,$1C,$1F,$40,$00,$1C,$1F   ;80C3C8|        |      ;
                       db $00,$01,$1C,$1F,$00,$04,$1C,$1F   ;80C3D0|        |      ;
                       db $00,$10,$1C,$1F,$00,$40,$1E,$1F   ;80C3D8|        |      ;
                       db $01,$00,$1E,$1F,$04,$00,$1E,$1F   ;80C3E0|        |      ;
                       db $10,$00                           ;80C3E8|        |80C3EA;
                       db $1E,$1F                           ;80C3EA|        |      ;
                       db $40,$00                           ;80C3EC|        |      ;
                       db $1E,$1F                           ;80C3EE|        |      ;
                       db $00,$01                           ;80C3F0|        |      ;
                       db $1E,$1F                           ;80C3F2|        |      ;
                       db $00,$04                           ;80C3F4|        |      ;
                       db $1E,$1F                           ;80C3F6|        |      ;
                       db $00,$10,$1E,$1F,$00,$40           ;80C3F8|        |      ;
 
         DATA8_80C3FE:
                       db $02,$00                           ;80C3FE|        |      ;
 
         DATA8_80C400:
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C400|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C408|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C410|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C418|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C420|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C428|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C430|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C438|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C440|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C448|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C450|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C458|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C460|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C468|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C470|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C478|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C480|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C488|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C490|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C498|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C4A0|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C4A8|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C4B0|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C4B8|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C4C0|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C4C8|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C4D0|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C4D8|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C4E0|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C4E8|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C4F0|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C4F8|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C500|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C508|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C510|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C518|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C520|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C528|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C530|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C538|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C540|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C548|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C550|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C558|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C560|        |      ;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C568|        |      ;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C570|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C578|        |      ;
                       db $03,$00,$08,$00                   ;80C580|        |      ;
                       db $0C,$00                           ;80C584|        |002000;
                       db $20,$00,$30,$00,$80,$00,$C0,$00   ;80C586|        |      ;
                       db $00,$02                           ;80C58E|        |      ;
                       db $00,$03                           ;80C590|        |      ;
                       db $00,$08,$00,$0C,$00,$20,$00,$30   ;80C592|        |      ;
                       db $00,$80,$00,$C0,$02,$00,$03,$00   ;80C59A|        |      ;
                       db $08,$00,$0C,$00,$20,$00,$30,$00   ;80C5A2|        |      ;
                       db $80,$00                           ;80C5AA|        |      ;
                       db $C0,$00                           ;80C5AC|        |      ;
                       db $00,$02,$00,$03,$00,$08,$00,$0C   ;80C5AE|        |      ;
                       db $00,$20                           ;80C5B6|        |      ;
                       db $00,$30                           ;80C5B8|        |      ;
                       db $00,$80                           ;80C5BA|        |      ;
                       db $00,$C0                           ;80C5BC|        |      ;
                       db $02,$00                           ;80C5BE|        |      ;
                       db $03,$00,$08,$00,$0C,$00,$20,$00   ;80C5C0|        |000000;
                       db $30,$00,$80,$00,$C0,$00,$00,$02   ;80C5C8|        |80C5CA;
                       db $00,$03,$00,$08,$00,$0C,$00,$20   ;80C5D0|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$02,$00   ;80C5D8|        |      ;
                       db $03,$00                           ;80C5E0|        |000000;
                       db $08,$00                           ;80C5E2|        |      ;
                       db $0C,$00                           ;80C5E4|        |002000;
                       db $20,$00,$30,$00,$80,$00,$C0,$00   ;80C5E6|        |      ;
                       db $00,$02,$00,$03,$00,$08           ;80C5EE|        |      ;
                       db $00,$0C                           ;80C5F4|        |      ;
                       db $00,$20                           ;80C5F6|        |      ;
                       db $00,$30,$00,$80,$00,$C0,$00,$00   ;80C5F8|        |      ;
                       db $60,$6B                           ;80C600|        |      ;
 
       CODE_FL_80C602:
                       REP #$20                             ;80C602|C220    |      ;
                       LDX.W #$0076                         ;80C604|A27600  |      ;
 
                     - STZ.W $0764,X                        ;80C607|9E6407  |830764;
                       STZ.W $0C14,X                        ;80C60A|9E140C  |830C14;
                       DEX                                  ;80C60D|CA      |      ;
                       DEX                                  ;80C60E|CA      |      ;
                       BPL -                                ;80C60F|10F6    |80C607;
                       RTL                                  ;80C611|6B      |      ;
 
       CODE_FL_80C612:
                       REP #$20                             ;80C612|C220    |      ;
                       ASL A                                ;80C614|0A      |      ;
                       DEC A                                ;80C615|3A      |      ;
                       DEC A                                ;80C616|3A      |      ;
                       TAX                                  ;80C617|AA      |      ;
                       STZ.W $0764,X                        ;80C618|9E6407  |820764;
                       STZ.W $0C14,X                        ;80C61B|9E140C  |820C14;
                       RTL                                  ;80C61E|6B      |      ;
 
       CODE_FL_80C61F:
                       PHP                                  ;80C61F|08      |      ;
                       REP #$20                             ;80C620|C220    |      ;
                       LDA.W #$8000                         ;80C622|A90080  |      ;
                       TSB.W $075C                          ;80C625|0C5C07  |82075C;
                       PLP                                  ;80C628|28      |      ;
                       RTL                                  ;80C629|6B      |      ;
                       db $08,$C2,$20,$A9,$00,$80,$1C,$5C   ;80C62A|        |      ;
                       db $07,$28,$6B                       ;80C632|        |000028;
 
       CODE_FL_80C635:
                       REP #$20                             ;80C635|C220    |      ;
                       LDX.W #$0076                         ;80C637|A27600  |      ;
 
                     - LDA.W $0C14,X                        ;80C63A|BD140C  |820C14;
                       BIT.W #$0010                         ;80C63D|891000  |      ;
                       BNE +                                ;80C640|D006    |80C648;
                       LDA.W #$0007                         ;80C642|A90700  |      ;
                       STA.W $0C14,X                        ;80C645|9D140C  |820C14;
 
                     + DEX                                  ;80C648|CA      |      ;
                       DEX                                  ;80C649|CA      |      ;
                       BPL -                                ;80C64A|10EE    |80C63A;
                       RTL                                  ;80C64C|6B      |      ;
 
       CODE_FL_80C64D:
                       REP #$20                             ;80C64D|C220    |      ;
                       LDX.W #$0076                         ;80C64F|A27600  |      ;
 
                     - LDA.W $0C14,X                        ;80C652|BD140C  |820C14;
                       BIT.W #$0010                         ;80C655|891000  |      ;
                       BNE +                                ;80C658|D006    |80C660;
                       STZ.W $0C14,X                        ;80C65A|9E140C  |820C14;
                       JMP.W CODE_JP_80C666                 ;80C65D|4C66C6  |80C666;
 
                     + LDA.W #$0010                         ;80C660|A91000  |      ;
                       STA.W $0C14,X                        ;80C663|9D140C  |820C14;
 
       CODE_JP_80C666:
                       DEX                                  ;80C666|CA      |      ;
                       DEX                                  ;80C667|CA      |      ;
                       BPL -                                ;80C668|10E8    |80C652;
                       RTL                                  ;80C66A|6B      |      ;
 
       CODE_FL_80C66B:
                       PHB                                  ;80C66B|8B      |      ;
                       PHK                                  ;80C66C|4B      |      ;
                       PLB                                  ;80C66D|AB      |      ;
                       PHY                                  ;80C66E|5A      |      ;
                       PHX                                  ;80C66F|DA      |      ;
                       TAY                                  ;80C670|A8      |      ;
                       LDX.W #$0076                         ;80C671|A27600  |      ;
 
                     - LDA.W $0764,X                        ;80C674|BD6407  |800764;
                       BEQ CODE_JP_80C69A                   ;80C677|F021    |80C69A;
                       DEX                                  ;80C679|CA      |      ;
                       DEX                                  ;80C67A|CA      |      ;
                       BPL -                                ;80C67B|10F7    |80C674;
                       db $FA,$7A,$AB,$38,$6B               ;80C67D|        |      ;
 
       CODE_FL_80C682:
                       PHB                                  ;80C682|8B      |      ;
                       PHK                                  ;80C683|4B      |      ;
                       PLB                                  ;80C684|AB      |      ;
                       PHY                                  ;80C685|5A      |      ;
                       PHX                                  ;80C686|DA      |      ;
                       TAY                                  ;80C687|A8      |      ;
                       LDA.W $0762                          ;80C688|AD6207  |800762;
                       ASL A                                ;80C68B|0A      |      ;
                       DEC A                                ;80C68C|3A      |      ;
                       DEC A                                ;80C68D|3A      |      ;
                       TAX                                  ;80C68E|AA      |      ;
                       LDA.W $0764,X                        ;80C68F|BD6407  |800764;
                       JMP.W CODE_JP_80C69A                 ;80C692|4C9AC6  |80C69A;
                       db $FA,$7A,$AB,$38,$6B               ;80C695|        |      ;
 
       CODE_JP_80C69A:
                       TYA                                  ;80C69A|98      |      ;
                       STA.W $0764,X                        ;80C69B|9D6407  |800764;
                       STZ.W $0A34,X                        ;80C69E|9E340A  |800A34;
                       PLA                                  ;80C6A1|68      |      ;
                       STA.W $0AAC,X                        ;80C6A2|9DAC0A  |800AAC;
                       STZ.W $0B24,X                        ;80C6A5|9E240B  |800B24;
                       PLA                                  ;80C6A8|68      |      ;
                       STA.W $0B9C,X                        ;80C6A9|9D9C0B  |800B9C;
                       LDA.W $0002,Y                        ;80C6AC|B90200  |800002;
                       STA.W $0854,X                        ;80C6AF|9D5408  |800854;
                       STZ.W $07DC,X                        ;80C6B2|9EDC07  |8007DC;
                       LDA.W #$0001                         ;80C6B5|A90100  |      ;
                       STA.W $08CC,X                        ;80C6B8|9DCC08  |8008CC;
                       LDA.W $0004,Y                        ;80C6BB|B90400  |800004;
                       STA.W $0944,X                        ;80C6BE|9D4409  |800944;
                       LDA.W #$C5FE                         ;80C6C1|A9FEC5  |      ;
                       STA.W $09BC,X                        ;80C6C4|9DBC09  |8009BC;
                       LDA.W $0000,Y                        ;80C6C7|B90000  |800000;
                       STA.B $86                            ;80C6CA|8586    |000086;
                       PEA.W LOOSE_OP_80C6D1                ;80C6CC|F4D1C6  |80C6D1;
                       JMP.W ($0086)                        ;80C6CF|6C8600  |000086;
                       PLB                                  ;80C6D2|AB      |      ;
                       CLC                                  ;80C6D3|18      |      ;
                       RTL                                  ;80C6D4|6B      |      ;
                       db $60                               ;80C6D5|        |      ;
 
       CODE_FL_80C6D6:
                       PHP                                  ;80C6D6|08      |      ;
                       PHB                                  ;80C6D7|8B      |      ;
                       PHK                                  ;80C6D8|4B      |      ;
                       PLB                                  ;80C6D9|AB      |      ;
                       REP #$30                             ;80C6DA|C230    |      ;
                       LDA.W $075C                          ;80C6DC|AD5C07  |80075C;
                       BMI +                                ;80C6DF|3003    |80C6E4;
                       JMP.W CODE_JP_80CA2F                 ;80C6E1|4C2FCA  |80CA2F;
 
                     + LDA.W $07DA                          ;80C6E4|ADDA07  |8007DA;
                       BEQ +                                ;80C6E7|F009    |80C6F2;
                       LDX.W #$0076                         ;80C6E9|A27600  |      ;
                       STX.W $075E                          ;80C6EC|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C6EF|2032CA  |80CA32;
 
                     + LDA.W $07D8                          ;80C6F2|ADD807  |8007D8;
                       BEQ +                                ;80C6F5|F009    |80C700;
                       LDX.W #$0074                         ;80C6F7|A27400  |      ;
                       STX.W $075E                          ;80C6FA|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C6FD|2032CA  |80CA32;
 
                     + LDA.W $07D6                          ;80C700|ADD607  |8007D6;
                       BEQ +                                ;80C703|F009    |80C70E;
                       LDX.W #$0072                         ;80C705|A27200  |      ;
                       STX.W $075E                          ;80C708|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C70B|2032CA  |80CA32;
 
                     + LDA.W $07D4                          ;80C70E|ADD407  |8007D4;
                       BEQ +                                ;80C711|F009    |80C71C;
                       LDX.W #$0070                         ;80C713|A27000  |      ;
                       STX.W $075E                          ;80C716|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C719|2032CA  |80CA32;
 
                     + LDA.W $07D2                          ;80C71C|ADD207  |8007D2;
                       BEQ +                                ;80C71F|F009    |80C72A;
                       LDX.W #$006E                         ;80C721|A26E00  |      ;
                       STX.W $075E                          ;80C724|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C727|2032CA  |80CA32;
 
                     + LDA.W $07D0                          ;80C72A|ADD007  |8007D0;
                       BEQ +                                ;80C72D|F009    |80C738;
                       LDX.W #$006C                         ;80C72F|A26C00  |      ;
                       STX.W $075E                          ;80C732|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C735|2032CA  |80CA32;
 
                     + LDA.W $07CE                          ;80C738|ADCE07  |8007CE;
                       BEQ +                                ;80C73B|F009    |80C746;
                       LDX.W #$006A                         ;80C73D|A26A00  |      ;
                       STX.W $075E                          ;80C740|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C743|2032CA  |80CA32;
 
                     + LDA.W $07CC                          ;80C746|ADCC07  |8007CC;
                       BEQ +                                ;80C749|F009    |80C754;
                       LDX.W #$0068                         ;80C74B|A26800  |      ;
                       STX.W $075E                          ;80C74E|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C751|2032CA  |80CA32;
 
                     + LDA.W $07CA                          ;80C754|ADCA07  |8007CA;
                       BEQ +                                ;80C757|F009    |80C762;
                       LDX.W #$0066                         ;80C759|A26600  |      ;
                       STX.W $075E                          ;80C75C|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C75F|2032CA  |80CA32;
 
                     + LDA.W $07C8                          ;80C762|ADC807  |8007C8;
                       BEQ +                                ;80C765|F009    |80C770;
                       LDX.W #$0064                         ;80C767|A26400  |      ;
                       STX.W $075E                          ;80C76A|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C76D|2032CA  |80CA32;
 
                     + LDA.W $07C6                          ;80C770|ADC607  |8007C6;
                       BEQ +                                ;80C773|F009    |80C77E;
                       LDX.W #$0062                         ;80C775|A26200  |      ;
                       STX.W $075E                          ;80C778|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C77B|2032CA  |80CA32;
 
                     + LDA.W $07C4                          ;80C77E|ADC407  |8007C4;
                       BEQ +                                ;80C781|F009    |80C78C;
                       LDX.W #$0060                         ;80C783|A26000  |      ;
                       STX.W $075E                          ;80C786|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C789|2032CA  |80CA32;
 
                     + LDA.W $07C2                          ;80C78C|ADC207  |8007C2;
                       BEQ +                                ;80C78F|F009    |80C79A;
                       LDX.W #$005E                         ;80C791|A25E00  |      ;
                       STX.W $075E                          ;80C794|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C797|2032CA  |80CA32;
 
                     + LDA.W $07C0                          ;80C79A|ADC007  |8007C0;
                       BEQ +                                ;80C79D|F009    |80C7A8;
                       LDX.W #$005C                         ;80C79F|A25C00  |      ;
                       STX.W $075E                          ;80C7A2|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7A5|2032CA  |80CA32;
 
                     + LDA.W $07BE                          ;80C7A8|ADBE07  |8007BE;
                       BEQ +                                ;80C7AB|F009    |80C7B6;
                       LDX.W #$005A                         ;80C7AD|A25A00  |      ;
                       STX.W $075E                          ;80C7B0|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7B3|2032CA  |80CA32;
 
                     + LDA.W $07BC                          ;80C7B6|ADBC07  |8007BC;
                       BEQ +                                ;80C7B9|F009    |80C7C4;
                       LDX.W #$0058                         ;80C7BB|A25800  |      ;
                       STX.W $075E                          ;80C7BE|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7C1|2032CA  |80CA32;
 
                     + LDA.W $07BA                          ;80C7C4|ADBA07  |8007BA;
                       BEQ +                                ;80C7C7|F009    |80C7D2;
                       LDX.W #$0056                         ;80C7C9|A25600  |      ;
                       STX.W $075E                          ;80C7CC|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7CF|2032CA  |80CA32;
 
                     + LDA.W $07B8                          ;80C7D2|ADB807  |8007B8;
                       BEQ +                                ;80C7D5|F009    |80C7E0;
                       LDX.W #$0054                         ;80C7D7|A25400  |      ;
                       STX.W $075E                          ;80C7DA|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7DD|2032CA  |80CA32;
 
                     + LDA.W $07B6                          ;80C7E0|ADB607  |8007B6;
                       BEQ +                                ;80C7E3|F009    |80C7EE;
                       LDX.W #$0052                         ;80C7E5|A25200  |      ;
                       STX.W $075E                          ;80C7E8|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7EB|2032CA  |80CA32;
 
                     + LDA.W $07B4                          ;80C7EE|ADB407  |8007B4;
                       BEQ +                                ;80C7F1|F009    |80C7FC;
                       LDX.W #$0050                         ;80C7F3|A25000  |      ;
                       STX.W $075E                          ;80C7F6|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C7F9|2032CA  |80CA32;
 
                     + LDA.W $07B2                          ;80C7FC|ADB207  |8007B2;
                       BEQ +                                ;80C7FF|F009    |80C80A;
                       LDX.W #$004E                         ;80C801|A24E00  |      ;
                       STX.W $075E                          ;80C804|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C807|2032CA  |80CA32;
 
                     + LDA.W $07B0                          ;80C80A|ADB007  |8007B0;
                       BEQ +                                ;80C80D|F009    |80C818;
                       LDX.W #$004C                         ;80C80F|A24C00  |      ;
                       STX.W $075E                          ;80C812|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C815|2032CA  |80CA32;
 
                     + LDA.W $07AE                          ;80C818|ADAE07  |8007AE;
                       BEQ +                                ;80C81B|F009    |80C826;
                       LDX.W #$004A                         ;80C81D|A24A00  |      ;
                       STX.W $075E                          ;80C820|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C823|2032CA  |80CA32;
 
                     + LDA.W $07AC                          ;80C826|ADAC07  |8007AC;
                       BEQ +                                ;80C829|F009    |80C834;
                       LDX.W #$0048                         ;80C82B|A24800  |      ;
                       STX.W $075E                          ;80C82E|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C831|2032CA  |80CA32;
 
                     + LDA.W $07AA                          ;80C834|ADAA07  |8007AA;
                       BEQ +                                ;80C837|F009    |80C842;
                       LDX.W #$0046                         ;80C839|A24600  |      ;
                       STX.W $075E                          ;80C83C|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C83F|2032CA  |80CA32;
 
                     + LDA.W $07A8                          ;80C842|ADA807  |8007A8;
                       BEQ +                                ;80C845|F009    |80C850;
                       LDX.W #$0044                         ;80C847|A24400  |      ;
                       STX.W $075E                          ;80C84A|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C84D|2032CA  |80CA32;
 
                     + LDA.W $07A6                          ;80C850|ADA607  |8007A6;
                       BEQ +                                ;80C853|F009    |80C85E;
                       LDX.W #$0042                         ;80C855|A24200  |      ;
                       STX.W $075E                          ;80C858|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C85B|2032CA  |80CA32;
 
                     + LDA.W $07A4                          ;80C85E|ADA407  |8007A4;
                       BEQ +                                ;80C861|F009    |80C86C;
                       LDX.W #$0040                         ;80C863|A24000  |      ;
                       STX.W $075E                          ;80C866|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C869|2032CA  |80CA32;
 
                     + LDA.W $07A2                          ;80C86C|ADA207  |8007A2;
                       BEQ +                                ;80C86F|F009    |80C87A;
                       LDX.W #$003E                         ;80C871|A23E00  |      ;
                       STX.W $075E                          ;80C874|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C877|2032CA  |80CA32;
 
                     + LDA.W $07A0                          ;80C87A|ADA007  |8007A0;
                       BEQ +                                ;80C87D|F009    |80C888;
                       LDX.W #$003C                         ;80C87F|A23C00  |      ;
                       STX.W $075E                          ;80C882|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C885|2032CA  |80CA32;
 
                     + LDA.W $079E                          ;80C888|AD9E07  |80079E;
                       BEQ +                                ;80C88B|F009    |80C896;
                       LDX.W #$003A                         ;80C88D|A23A00  |      ;
                       STX.W $075E                          ;80C890|8E5E07  |00075E;
                       JSR.W CODE_FN_80CA32                 ;80C893|2032CA  |80CA32;
 
                     + LDA.W $079C                          ;80C896|AD9C07  |80079C;
                       BEQ +                                ;80C899|F009    |80C8A4;
                       db $A2,$38,$00,$8E,$5E,$07,$20,$32   ;80C89B|        |      ;
                       db $CA                               ;80C8A3|        |      ;
 
                     + LDA.W $079A                          ;80C8A4|AD9A07  |80079A;
                       BEQ +                                ;80C8A7|F009    |80C8B2;
                       db $A2,$36,$00,$8E,$5E,$07,$20,$32   ;80C8A9|        |      ;
                       db $CA                               ;80C8B1|        |      ;
 
                     + LDA.W $0798                          ;80C8B2|AD9807  |800798;
                       BEQ +                                ;80C8B5|F009    |80C8C0;
                       db $A2,$34,$00,$8E,$5E,$07,$20,$32   ;80C8B7|        |      ;
                       db $CA                               ;80C8BF|        |      ;
 
                     + LDA.W $0796                          ;80C8C0|AD9607  |800796;
                       BEQ +                                ;80C8C3|F009    |80C8CE;
                       db $A2,$32,$00,$8E,$5E,$07,$20,$32   ;80C8C5|        |      ;
                       db $CA                               ;80C8CD|        |      ;
 
                     + LDA.W $0794                          ;80C8CE|AD9407  |800794;
                       BEQ +                                ;80C8D1|F009    |80C8DC;
                       db $A2,$30,$00,$8E,$5E,$07,$20,$32   ;80C8D3|        |      ;
                       db $CA                               ;80C8DB|        |      ;
 
                     + LDA.W $0792                          ;80C8DC|AD9207  |800792;
                       BEQ +                                ;80C8DF|F009    |80C8EA;
                       db $A2,$2E,$00,$8E,$5E,$07,$20,$32   ;80C8E1|        |      ;
                       db $CA                               ;80C8E9|        |      ;
 
                     + LDA.W $0790                          ;80C8EA|AD9007  |800790;
                       BEQ +                                ;80C8ED|F009    |80C8F8;
                       LDX.W #$002C                         ;80C8EF|A22C00  |      ;
                       STX.W $075E                          ;80C8F2|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C8F5|2032CA  |80CA32;
 
                     + LDA.W $078E                          ;80C8F8|AD8E07  |80078E;
                       BEQ +                                ;80C8FB|F009    |80C906;
                       LDX.W #$002A                         ;80C8FD|A22A00  |      ;
                       STX.W $075E                          ;80C900|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C903|2032CA  |80CA32;
 
                     + LDA.W $078C                          ;80C906|AD8C07  |80078C;
                       BEQ +                                ;80C909|F009    |80C914;
                       LDX.W #$0028                         ;80C90B|A22800  |      ;
                       STX.W $075E                          ;80C90E|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C911|2032CA  |80CA32;
 
                     + LDA.W $078A                          ;80C914|AD8A07  |80078A;
                       BEQ +                                ;80C917|F009    |80C922;
                       LDX.W #$0026                         ;80C919|A22600  |      ;
                       STX.W $075E                          ;80C91C|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C91F|2032CA  |80CA32;
 
                     + LDA.W $0788                          ;80C922|AD8807  |800788;
                       BEQ +                                ;80C925|F009    |80C930;
                       db $A2,$24,$00,$8E,$5E,$07,$20,$32   ;80C927|        |      ;
                       db $CA                               ;80C92F|        |      ;
 
                     + LDA.W $0786                          ;80C930|AD8607  |800786;
                       BEQ +                                ;80C933|F009    |80C93E;
                       db $A2,$22,$00,$8E,$5E,$07,$20,$32   ;80C935|        |      ;
                       db $CA                               ;80C93D|        |      ;
 
                     + LDA.W $0784                          ;80C93E|AD8407  |800784;
                       BEQ +                                ;80C941|F009    |80C94C;
                       db $A2,$20,$00,$8E,$5E,$07,$20,$32   ;80C943|        |      ;
                       db $CA                               ;80C94B|        |      ;
 
                     + LDA.W $0782                          ;80C94C|AD8207  |800782;
                       BEQ +                                ;80C94F|F009    |80C95A;
                       db $A2,$1E,$00,$8E,$5E,$07,$20,$32   ;80C951|        |      ;
                       db $CA                               ;80C959|        |      ;
 
                     + LDA.W $0780                          ;80C95A|AD8007  |800780;
                       BEQ +                                ;80C95D|F009    |80C968;
                       db $A2,$1C,$00,$8E,$5E,$07,$20,$32   ;80C95F|        |      ;
                       db $CA                               ;80C967|        |      ;
 
                     + LDA.W $077E                          ;80C968|AD7E07  |80077E;
                       BEQ +                                ;80C96B|F009    |80C976;
                       db $A2,$1A,$00,$8E,$5E,$07,$20,$32   ;80C96D|        |      ;
                       db $CA                               ;80C975|        |      ;
 
                     + LDA.W $077C                          ;80C976|AD7C07  |80077C;
                       BEQ +                                ;80C979|F009    |80C984;
                       db $A2,$18,$00,$8E,$5E,$07,$20,$32   ;80C97B|        |      ;
                       db $CA                               ;80C983|        |      ;
 
                     + LDA.W $077A                          ;80C984|AD7A07  |80077A;
                       BEQ +                                ;80C987|F009    |80C992;
                       db $A2,$16,$00,$8E,$5E,$07,$20,$32   ;80C989|        |      ;
                       db $CA                               ;80C991|        |      ;
 
                     + LDA.W $0778                          ;80C992|AD7807  |800778;
                       BEQ +                                ;80C995|F009    |80C9A0;
                       db $A2,$14,$00,$8E,$5E,$07,$20,$32   ;80C997|        |      ;
                       db $CA                               ;80C99F|        |      ;
 
                     + LDA.W $0776                          ;80C9A0|AD7607  |800776;
                       BEQ +                                ;80C9A3|F009    |80C9AE;
                       db $A2,$12,$00,$8E,$5E,$07,$20,$32   ;80C9A5|        |      ;
                       db $CA                               ;80C9AD|        |      ;
 
                     + LDA.W $0774                          ;80C9AE|AD7407  |800774;
                       BEQ +                                ;80C9B1|F009    |80C9BC;
                       LDX.W #$0010                         ;80C9B3|A21000  |      ;
                       STX.W $075E                          ;80C9B6|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C9B9|2032CA  |80CA32;
 
                     + LDA.W $0772                          ;80C9BC|AD7207  |800772;
                       BEQ +                                ;80C9BF|F009    |80C9CA;
                       LDX.W #$000E                         ;80C9C1|A20E00  |      ;
                       STX.W $075E                          ;80C9C4|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C9C7|2032CA  |80CA32;
 
                     + LDA.W $0770                          ;80C9CA|AD7007  |800770;
                       BEQ +                                ;80C9CD|F009    |80C9D8;
                       LDX.W #$000C                         ;80C9CF|A20C00  |      ;
                       STX.W $075E                          ;80C9D2|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C9D5|2032CA  |80CA32;
 
                     + LDA.W $076E                          ;80C9D8|AD6E07  |80076E;
                       BEQ +                                ;80C9DB|F009    |80C9E6;
                       LDX.W #$000A                         ;80C9DD|A20A00  |      ;
                       STX.W $075E                          ;80C9E0|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C9E3|2032CA  |80CA32;
 
                     + LDA.W $076C                          ;80C9E6|AD6C07  |80076C;
                       BEQ +                                ;80C9E9|F009    |80C9F4;
                       LDX.W #$0008                         ;80C9EB|A20800  |      ;
                       STX.W $075E                          ;80C9EE|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C9F1|2032CA  |80CA32;
 
                     + LDA.W $076A                          ;80C9F4|AD6A07  |80076A;
                       BEQ +                                ;80C9F7|F009    |80CA02;
                       LDX.W #$0006                         ;80C9F9|A20600  |      ;
                       STX.W $075E                          ;80C9FC|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80C9FF|2032CA  |80CA32;
 
                     + LDA.W $0768                          ;80CA02|AD6807  |800768;
                       BEQ +                                ;80CA05|F009    |80CA10;
                       LDX.W #$0004                         ;80CA07|A20400  |      ;
                       STX.W $075E                          ;80CA0A|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80CA0D|2032CA  |80CA32;
 
                     + LDA.W $0766                          ;80CA10|AD6607  |800766;
                       BEQ +                                ;80CA13|F009    |80CA1E;
                       LDX.W #$0002                         ;80CA15|A20200  |      ;
                       STX.W $075E                          ;80CA18|8E5E07  |80075E;
                       JSR.W CODE_FN_80CA32                 ;80CA1B|2032CA  |80CA32;
 
                     + LDA.W $0764                          ;80CA1E|AD6407  |800764;
                       BEQ +                                ;80CA21|F009    |80CA2C;
                       db $A2,$00,$00,$8E,$5E,$07,$20,$32   ;80CA23|        |      ;
                       db $CA                               ;80CA2B|        |      ;
 
                     + JSR.W CODE_FN_80CA71                 ;80CA2C|2071CA  |80CA71;
 
       CODE_JP_80CA2F:
                       PLB                                  ;80CA2F|AB      |      ;
                       PLP                                  ;80CA30|28      |      ;
                       RTL                                  ;80CA31|6B      |      ;
 
       CODE_FN_80CA32:
                       LDA.W $0C14,X                        ;80CA32|BD140C  |800C14;
                       BIT.W #$0004                         ;80CA35|890400  |      ;
                       BNE +                                ;80CA38|D003    |80CA3D;
                       JSR.W ($0854,X)                      ;80CA3A|FC5408  |800854;
 
                     + LDX.W $075E                          ;80CA3D|AE5E07  |80075E;
                       LDA.W $0C14,X                        ;80CA40|BD140C  |800C14;
                       BIT.W #$0002                         ;80CA43|890200  |      ;
                       BNE +                                ;80CA46|D028    |80CA70;
                       DEC.W $08CC,X                        ;80CA48|DECC08  |8008CC;
                       BNE +                                ;80CA4B|D023    |80CA70;
                       LDY.W $0944,X                        ;80CA4D|BC4409  |800944;
                       LDA.W $0000,Y                        ;80CA50|B90000  |800000;
                       BPL ++                               ;80CA53|100A    |80CA5F;
                       STA.B $86                            ;80CA55|8586    |000086;
                       INY                                  ;80CA57|C8      |      ;
                       INY                                  ;80CA58|C8      |      ;
                       PEA.W LOOSE_OP_80CA4F                ;80CA59|F44FCA  |80CA4F;
                       JMP.W ($0086)                        ;80CA5C|6C8600  |000086;
 
                    ++ STA.W $08CC,X                        ;80CA5F|9DCC08  |8008CC;
                       LDA.W $0002,Y                        ;80CA62|B90200  |800002;
                       STA.W $09BC,X                        ;80CA65|9DBC09  |8009BC;
                       TYA                                  ;80CA68|98      |      ;
                       CLC                                  ;80CA69|18      |      ;
                       ADC.W #$0004                         ;80CA6A|690400  |      ;
                       STA.W $0944,X                        ;80CA6D|9D4409  |800944;
 
                     + RTS                                  ;80CA70|60      |      ;
 
       CODE_FN_80CA71:
                       PHP                                  ;80CA71|08      |      ;
                       PHB                                  ;80CA72|8B      |      ;
                       LDA.W $07DA                          ;80CA73|ADDA07  |8007DA;
                       BEQ +                                ;80CA76|F00E    |80CA86;
                       LDA.W $0C8A                          ;80CA78|AD8A0C  |800C8A;
                       BIT.W #$0001                         ;80CA7B|890100  |      ;
                       BNE +                                ;80CA7E|D006    |80CA86;
                       LDX.W #$0076                         ;80CA80|A27600  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CA83|20EACE  |80CEEA;
 
                     + LDA.W $07D8                          ;80CA86|ADD807  |8007D8;
                       BEQ +                                ;80CA89|F00E    |80CA99;
                       LDA.W $0C88                          ;80CA8B|AD880C  |800C88;
                       BIT.W #$0001                         ;80CA8E|890100  |      ;
                       BNE +                                ;80CA91|D006    |80CA99;
                       LDX.W #$0074                         ;80CA93|A27400  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CA96|20EACE  |80CEEA;
 
                     + LDA.W $07D6                          ;80CA99|ADD607  |8007D6;
                       BEQ +                                ;80CA9C|F00E    |80CAAC;
                       LDA.W $0C86                          ;80CA9E|AD860C  |800C86;
                       BIT.W #$0001                         ;80CAA1|890100  |      ;
                       BNE +                                ;80CAA4|D006    |80CAAC;
                       LDX.W #$0072                         ;80CAA6|A27200  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CAA9|20EACE  |80CEEA;
 
                     + LDA.W $07D4                          ;80CAAC|ADD407  |8007D4;
                       BEQ +                                ;80CAAF|F00E    |80CABF;
                       LDA.W $0C84                          ;80CAB1|AD840C  |800C84;
                       BIT.W #$0001                         ;80CAB4|890100  |      ;
                       BNE +                                ;80CAB7|D006    |80CABF;
                       LDX.W #$0070                         ;80CAB9|A27000  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CABC|20EACE  |80CEEA;
 
                     + LDA.W $07D2                          ;80CABF|ADD207  |8007D2;
                       BEQ +                                ;80CAC2|F00E    |80CAD2;
                       LDA.W $0C82                          ;80CAC4|AD820C  |800C82;
                       BIT.W #$0001                         ;80CAC7|890100  |      ;
                       BNE +                                ;80CACA|D006    |80CAD2;
                       LDX.W #$006E                         ;80CACC|A26E00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CACF|20EACE  |80CEEA;
 
                     + LDA.W $07D0                          ;80CAD2|ADD007  |8007D0;
                       BEQ +                                ;80CAD5|F00E    |80CAE5;
                       LDA.W $0C80                          ;80CAD7|AD800C  |800C80;
                       BIT.W #$0001                         ;80CADA|890100  |      ;
                       BNE +                                ;80CADD|D006    |80CAE5;
                       LDX.W #$006C                         ;80CADF|A26C00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CAE2|20EACE  |80CEEA;
 
                     + LDA.W $07CE                          ;80CAE5|ADCE07  |8007CE;
                       BEQ +                                ;80CAE8|F00E    |80CAF8;
                       LDA.W $0C7E                          ;80CAEA|AD7E0C  |800C7E;
                       BIT.W #$0001                         ;80CAED|890100  |      ;
                       BNE +                                ;80CAF0|D006    |80CAF8;
                       LDX.W #$006A                         ;80CAF2|A26A00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CAF5|20EACE  |80CEEA;
 
                     + LDA.W $07CC                          ;80CAF8|ADCC07  |8007CC;
                       BEQ +                                ;80CAFB|F00E    |80CB0B;
                       LDA.W $0C7C                          ;80CAFD|AD7C0C  |800C7C;
                       BIT.W #$0001                         ;80CB00|890100  |      ;
                       BNE +                                ;80CB03|D006    |80CB0B;
                       LDX.W #$0068                         ;80CB05|A26800  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB08|20EACE  |80CEEA;
 
                     + LDA.W $07CA                          ;80CB0B|ADCA07  |8007CA;
                       BEQ +                                ;80CB0E|F00E    |80CB1E;
                       LDA.W $0C7A                          ;80CB10|AD7A0C  |800C7A;
                       BIT.W #$0001                         ;80CB13|890100  |      ;
                       BNE +                                ;80CB16|D006    |80CB1E;
                       LDX.W #$0066                         ;80CB18|A26600  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB1B|20EACE  |80CEEA;
 
                     + LDA.W $07C8                          ;80CB1E|ADC807  |8007C8;
                       BEQ +                                ;80CB21|F00E    |80CB31;
                       LDA.W $0C78                          ;80CB23|AD780C  |800C78;
                       BIT.W #$0001                         ;80CB26|890100  |      ;
                       BNE +                                ;80CB29|D006    |80CB31;
                       LDX.W #$0064                         ;80CB2B|A26400  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB2E|20EACE  |80CEEA;
 
                     + LDA.W $07C6                          ;80CB31|ADC607  |8007C6;
                       BEQ +                                ;80CB34|F00E    |80CB44;
                       LDA.W $0C76                          ;80CB36|AD760C  |800C76;
                       BIT.W #$0001                         ;80CB39|890100  |      ;
                       BNE +                                ;80CB3C|D006    |80CB44;
                       LDX.W #$0062                         ;80CB3E|A26200  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB41|20EACE  |80CEEA;
 
                     + LDA.W $07C4                          ;80CB44|ADC407  |8007C4;
                       BEQ +                                ;80CB47|F00E    |80CB57;
                       LDA.W $0C74                          ;80CB49|AD740C  |800C74;
                       BIT.W #$0001                         ;80CB4C|890100  |      ;
                       BNE +                                ;80CB4F|D006    |80CB57;
                       LDX.W #$0060                         ;80CB51|A26000  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB54|20EACE  |80CEEA;
 
                     + LDA.W $07C2                          ;80CB57|ADC207  |8007C2;
                       BEQ +                                ;80CB5A|F00E    |80CB6A;
                       LDA.W $0C72                          ;80CB5C|AD720C  |800C72;
                       BIT.W #$0001                         ;80CB5F|890100  |      ;
                       BNE +                                ;80CB62|D006    |80CB6A;
                       LDX.W #$005E                         ;80CB64|A25E00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB67|20EACE  |80CEEA;
 
                     + LDA.W $07C0                          ;80CB6A|ADC007  |8007C0;
                       BEQ +                                ;80CB6D|F00E    |80CB7D;
                       LDA.W $0C70                          ;80CB6F|AD700C  |800C70;
                       BIT.W #$0001                         ;80CB72|890100  |      ;
                       BNE +                                ;80CB75|D006    |80CB7D;
                       LDX.W #$005C                         ;80CB77|A25C00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB7A|20EACE  |80CEEA;
 
                     + LDA.W $07BE                          ;80CB7D|ADBE07  |8007BE;
                       BEQ +                                ;80CB80|F00E    |80CB90;
                       LDA.W $0C6E                          ;80CB82|AD6E0C  |800C6E;
                       BIT.W #$0001                         ;80CB85|890100  |      ;
                       BNE +                                ;80CB88|D006    |80CB90;
                       LDX.W #$005A                         ;80CB8A|A25A00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CB8D|20EACE  |80CEEA;
 
                     + LDA.W $07BC                          ;80CB90|ADBC07  |8007BC;
                       BEQ +                                ;80CB93|F00E    |80CBA3;
                       LDA.W $0C6C                          ;80CB95|AD6C0C  |800C6C;
                       BIT.W #$0001                         ;80CB98|890100  |      ;
                       BNE +                                ;80CB9B|D006    |80CBA3;
                       LDX.W #$0058                         ;80CB9D|A25800  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CBA0|20EACE  |80CEEA;
 
                     + LDA.W $07BA                          ;80CBA3|ADBA07  |8007BA;
                       BEQ +                                ;80CBA6|F00E    |80CBB6;
                       LDA.W $0C6A                          ;80CBA8|AD6A0C  |800C6A;
                       BIT.W #$0001                         ;80CBAB|890100  |      ;
                       BNE +                                ;80CBAE|D006    |80CBB6;
                       LDX.W #$0056                         ;80CBB0|A25600  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CBB3|20EACE  |80CEEA;
 
                     + LDA.W $07B8                          ;80CBB6|ADB807  |8007B8;
                       BEQ +                                ;80CBB9|F00E    |80CBC9;
                       LDA.W $0C68                          ;80CBBB|AD680C  |800C68;
                       BIT.W #$0001                         ;80CBBE|890100  |      ;
                       BNE +                                ;80CBC1|D006    |80CBC9;
                       LDX.W #$0054                         ;80CBC3|A25400  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CBC6|20EACE  |80CEEA;
 
                     + LDA.W $07B6                          ;80CBC9|ADB607  |8007B6;
                       BEQ +                                ;80CBCC|F00E    |80CBDC;
                       LDA.W $0C66                          ;80CBCE|AD660C  |800C66;
                       BIT.W #$0001                         ;80CBD1|890100  |      ;
                       BNE +                                ;80CBD4|D006    |80CBDC;
                       LDX.W #$0052                         ;80CBD6|A25200  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CBD9|20EACE  |80CEEA;
 
                     + LDA.W $07B4                          ;80CBDC|ADB407  |8007B4;
                       BEQ +                                ;80CBDF|F00E    |80CBEF;
                       LDA.W $0C64                          ;80CBE1|AD640C  |800C64;
                       BIT.W #$0001                         ;80CBE4|890100  |      ;
                       BNE +                                ;80CBE7|D006    |80CBEF;
                       LDX.W #$0050                         ;80CBE9|A25000  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CBEC|20EACE  |80CEEA;
 
                     + LDA.W $07B2                          ;80CBEF|ADB207  |8007B2;
                       BEQ +                                ;80CBF2|F00E    |80CC02;
                       LDA.W $0C62                          ;80CBF4|AD620C  |800C62;
                       BIT.W #$0001                         ;80CBF7|890100  |      ;
                       BNE +                                ;80CBFA|D006    |80CC02;
                       LDX.W #$004E                         ;80CBFC|A24E00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CBFF|20EACE  |80CEEA;
 
                     + LDA.W $07B0                          ;80CC02|ADB007  |8007B0;
                       BEQ +                                ;80CC05|F00E    |80CC15;
                       LDA.W $0C60                          ;80CC07|AD600C  |800C60;
                       BIT.W #$0001                         ;80CC0A|890100  |      ;
                       BNE +                                ;80CC0D|D006    |80CC15;
                       LDX.W #$004C                         ;80CC0F|A24C00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC12|20EACE  |80CEEA;
 
                     + LDA.W $07AE                          ;80CC15|ADAE07  |8007AE;
                       BEQ +                                ;80CC18|F00E    |80CC28;
                       LDA.W $0C5E                          ;80CC1A|AD5E0C  |800C5E;
                       BIT.W #$0001                         ;80CC1D|890100  |      ;
                       BNE +                                ;80CC20|D006    |80CC28;
                       LDX.W #$004A                         ;80CC22|A24A00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC25|20EACE  |80CEEA;
 
                     + LDA.W $07AC                          ;80CC28|ADAC07  |8007AC;
                       BEQ +                                ;80CC2B|F00E    |80CC3B;
                       LDA.W $0C5C                          ;80CC2D|AD5C0C  |800C5C;
                       BIT.W #$0001                         ;80CC30|890100  |      ;
                       BNE +                                ;80CC33|D006    |80CC3B;
                       LDX.W #$0048                         ;80CC35|A24800  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC38|20EACE  |80CEEA;
 
                     + LDA.W $07AA                          ;80CC3B|ADAA07  |8007AA;
                       BEQ +                                ;80CC3E|F00E    |80CC4E;
                       LDA.W $0C5A                          ;80CC40|AD5A0C  |800C5A;
                       BIT.W #$0001                         ;80CC43|890100  |      ;
                       BNE +                                ;80CC46|D006    |80CC4E;
                       LDX.W #$0046                         ;80CC48|A24600  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC4B|20EACE  |80CEEA;
 
                     + LDA.W $07A8                          ;80CC4E|ADA807  |8007A8;
                       BEQ +                                ;80CC51|F00E    |80CC61;
                       LDA.W $0C58                          ;80CC53|AD580C  |800C58;
                       BIT.W #$0001                         ;80CC56|890100  |      ;
                       BNE +                                ;80CC59|D006    |80CC61;
                       LDX.W #$0044                         ;80CC5B|A24400  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC5E|20EACE  |80CEEA;
 
                     + LDA.W $07A6                          ;80CC61|ADA607  |8007A6;
                       BEQ +                                ;80CC64|F00E    |80CC74;
                       LDA.W $0C56                          ;80CC66|AD560C  |800C56;
                       BIT.W #$0001                         ;80CC69|890100  |      ;
                       BNE +                                ;80CC6C|D006    |80CC74;
                       LDX.W #$0042                         ;80CC6E|A24200  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC71|20EACE  |80CEEA;
 
                     + LDA.W $07A4                          ;80CC74|ADA407  |8007A4;
                       BEQ +                                ;80CC77|F00E    |80CC87;
                       LDA.W $0C54                          ;80CC79|AD540C  |800C54;
                       BIT.W #$0001                         ;80CC7C|890100  |      ;
                       BNE +                                ;80CC7F|D006    |80CC87;
                       LDX.W #$0040                         ;80CC81|A24000  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC84|20EACE  |80CEEA;
 
                     + LDA.W $07A2                          ;80CC87|ADA207  |8007A2;
                       BEQ +                                ;80CC8A|F00E    |80CC9A;
                       LDA.W $0C52                          ;80CC8C|AD520C  |800C52;
                       BIT.W #$0001                         ;80CC8F|890100  |      ;
                       BNE +                                ;80CC92|D006    |80CC9A;
                       LDX.W #$003E                         ;80CC94|A23E00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CC97|20EACE  |80CEEA;
 
                     + LDA.W $07A0                          ;80CC9A|ADA007  |8007A0;
                       BEQ +                                ;80CC9D|F00E    |80CCAD;
                       LDA.W $0C50                          ;80CC9F|AD500C  |800C50;
                       BIT.W #$0001                         ;80CCA2|890100  |      ;
                       BNE +                                ;80CCA5|D006    |80CCAD;
                       LDX.W #$003C                         ;80CCA7|A23C00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CCAA|20EACE  |80CEEA;
 
                     + LDA.W $079E                          ;80CCAD|AD9E07  |80079E;
                       BEQ +                                ;80CCB0|F00E    |80CCC0;
                       LDA.W $0C4E                          ;80CCB2|AD4E0C  |000C4E;
                       BIT.W #$0001                         ;80CCB5|890100  |      ;
                       BNE +                                ;80CCB8|D006    |80CCC0;
                       LDX.W #$003A                         ;80CCBA|A23A00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CCBD|20EACE  |80CEEA;
 
                     + LDA.W $079C                          ;80CCC0|AD9C07  |80079C;
                       BEQ +                                ;80CCC3|F00E    |80CCD3;
                       db $AD,$4C,$0C,$89,$01,$00,$D0,$06   ;80CCC5|        |000C4C;
                       db $A2,$38,$00,$20,$EA,$CE           ;80CCCD|        |      ;
 
                     + LDA.W $079A                          ;80CCD3|AD9A07  |80079A;
                       BEQ +                                ;80CCD6|F00E    |80CCE6;
                       db $AD,$4A,$0C,$89,$01,$00,$D0,$06   ;80CCD8|        |000C4A;
                       db $A2,$36,$00,$20,$EA,$CE           ;80CCE0|        |      ;
 
                     + LDA.W $0798                          ;80CCE6|AD9807  |800798;
                       BEQ +                                ;80CCE9|F00E    |80CCF9;
                       db $AD,$48,$0C,$89,$01,$00,$D0,$06   ;80CCEB|        |000C48;
                       db $A2,$34,$00,$20,$EA,$CE           ;80CCF3|        |      ;
 
                     + LDA.W $0796                          ;80CCF9|AD9607  |800796;
                       BEQ +                                ;80CCFC|F00E    |80CD0C;
                       db $AD,$46,$0C,$89,$01,$00,$D0,$06   ;80CCFE|        |000C46;
                       db $A2,$32,$00,$20,$EA,$CE           ;80CD06|        |      ;
 
                     + LDA.W $0794                          ;80CD0C|AD9407  |800794;
                       BEQ +                                ;80CD0F|F00E    |80CD1F;
                       db $AD,$44,$0C,$89,$01,$00,$D0,$06   ;80CD11|        |000C44;
                       db $A2,$30,$00,$20,$EA,$CE           ;80CD19|        |      ;
 
                     + LDA.W $0792                          ;80CD1F|AD9207  |800792;
                       BEQ +                                ;80CD22|F00E    |80CD32;
                       db $AD,$42,$0C,$89,$01,$00,$D0,$06   ;80CD24|        |000C42;
                       db $A2,$2E,$00,$20,$EA,$CE           ;80CD2C|        |      ;
 
                     + LDA.W $0790                          ;80CD32|AD9007  |800790;
                       BEQ +                                ;80CD35|F00E    |80CD45;
                       LDA.W $0C40                          ;80CD37|AD400C  |800C40;
                       BIT.W #$0001                         ;80CD3A|890100  |      ;
                       BNE +                                ;80CD3D|D006    |80CD45;
                       LDX.W #$002C                         ;80CD3F|A22C00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CD42|20EACE  |80CEEA;
 
                     + LDA.W $078E                          ;80CD45|AD8E07  |80078E;
                       BEQ +                                ;80CD48|F00E    |80CD58;
                       LDA.W $0C3E                          ;80CD4A|AD3E0C  |800C3E;
                       BIT.W #$0001                         ;80CD4D|890100  |      ;
                       BNE +                                ;80CD50|D006    |80CD58;
                       LDX.W #$002A                         ;80CD52|A22A00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CD55|20EACE  |80CEEA;
 
                     + LDA.W $078C                          ;80CD58|AD8C07  |80078C;
                       BEQ +                                ;80CD5B|F00E    |80CD6B;
                       LDA.W $0C3C                          ;80CD5D|AD3C0C  |800C3C;
                       BIT.W #$0001                         ;80CD60|890100  |      ;
                       BNE +                                ;80CD63|D006    |80CD6B;
                       LDX.W #$0028                         ;80CD65|A22800  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CD68|20EACE  |80CEEA;
 
                     + LDA.W $078A                          ;80CD6B|AD8A07  |80078A;
                       BEQ +                                ;80CD6E|F00E    |80CD7E;
                       LDA.W $0C3A                          ;80CD70|AD3A0C  |800C3A;
                       BIT.W #$0001                         ;80CD73|890100  |      ;
                       BNE +                                ;80CD76|D006    |80CD7E;
                       LDX.W #$0026                         ;80CD78|A22600  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CD7B|20EACE  |80CEEA;
 
                     + LDA.W $0788                          ;80CD7E|AD8807  |800788;
                       BEQ +                                ;80CD81|F00E    |80CD91;
                       db $AD,$38,$0C,$89,$01,$00,$D0,$06   ;80CD83|        |000C38;
                       db $A2,$24,$00,$20,$EA,$CE           ;80CD8B|        |      ;
 
                     + LDA.W $0786                          ;80CD91|AD8607  |800786;
                       BEQ +                                ;80CD94|F00E    |80CDA4;
                       db $AD,$36,$0C,$89,$01,$00,$D0,$06   ;80CD96|        |000C36;
                       db $A2,$22,$00,$20,$EA,$CE           ;80CD9E|        |      ;
 
                     + LDA.W $0784                          ;80CDA4|AD8407  |800784;
                       BEQ +                                ;80CDA7|F00E    |80CDB7;
                       db $AD,$34,$0C,$89,$01,$00,$D0,$06   ;80CDA9|        |000C34;
                       db $A2,$20,$00,$20,$EA,$CE           ;80CDB1|        |      ;
 
                     + LDA.W $0782                          ;80CDB7|AD8207  |800782;
                       BEQ +                                ;80CDBA|F00E    |80CDCA;
                       db $AD,$32,$0C,$89,$01,$00,$D0,$06   ;80CDBC|        |000C32;
                       db $A2,$1E,$00,$20,$EA,$CE           ;80CDC4|        |      ;
 
                     + LDA.W $0780                          ;80CDCA|AD8007  |800780;
                       BEQ +                                ;80CDCD|F00E    |80CDDD;
                       db $AD,$30,$0C,$89,$01,$00,$D0,$06   ;80CDCF|        |000C30;
                       db $A2,$1C,$00,$20,$EA,$CE           ;80CDD7|        |      ;
 
                     + LDA.W $077E                          ;80CDDD|AD7E07  |80077E;
                       BEQ +                                ;80CDE0|F00E    |80CDF0;
                       db $AD,$2E,$0C,$89,$01,$00,$D0,$06   ;80CDE2|        |000C2E;
                       db $A2,$1A,$00,$20,$EA,$CE           ;80CDEA|        |      ;
 
                     + LDA.W $077C                          ;80CDF0|AD7C07  |80077C;
                       BEQ +                                ;80CDF3|F00E    |80CE03;
                       db $AD,$2C,$0C,$89,$01,$00,$D0,$06   ;80CDF5|        |000C2C;
                       db $A2,$18,$00,$20,$EA,$CE           ;80CDFD|        |      ;
 
                     + LDA.W $077A                          ;80CE03|AD7A07  |80077A;
                       BEQ +                                ;80CE06|F00E    |80CE16;
                       db $AD,$2A,$0C,$89,$01,$00,$D0,$06   ;80CE08|        |000C2A;
                       db $A2,$16,$00,$20,$EA,$CE           ;80CE10|        |      ;
 
                     + LDA.W $0778                          ;80CE16|AD7807  |800778;
                       BEQ +                                ;80CE19|F00E    |80CE29;
                       db $AD,$28,$0C,$89,$01,$00,$D0,$06   ;80CE1B|        |000C28;
                       db $A2,$14,$00,$20,$EA,$CE           ;80CE23|        |      ;
 
                     + LDA.W $0776                          ;80CE29|AD7607  |800776;
                       BEQ +                                ;80CE2C|F00E    |80CE3C;
                       db $AD,$26,$0C,$89,$01,$00,$D0,$06   ;80CE2E|        |000C26;
                       db $A2,$12,$00,$20,$EA,$CE           ;80CE36|        |      ;
 
                     + LDA.W $0774                          ;80CE3C|AD7407  |800774;
                       BEQ +                                ;80CE3F|F00E    |80CE4F;
                       LDA.W $0C24                          ;80CE41|AD240C  |800C24;
                       BIT.W #$0001                         ;80CE44|890100  |      ;
                       BNE +                                ;80CE47|D006    |80CE4F;
                       LDX.W #$0010                         ;80CE49|A21000  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CE4C|20EACE  |80CEEA;
 
                     + LDA.W $0772                          ;80CE4F|AD7207  |800772;
                       BEQ +                                ;80CE52|F00E    |80CE62;
                       LDA.W $0C22                          ;80CE54|AD220C  |800C22;
                       BIT.W #$0001                         ;80CE57|890100  |      ;
                       BNE +                                ;80CE5A|D006    |80CE62;
                       LDX.W #$000E                         ;80CE5C|A20E00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CE5F|20EACE  |80CEEA;
 
                     + LDA.W $0770                          ;80CE62|AD7007  |800770;
                       BEQ +                                ;80CE65|F00E    |80CE75;
                       LDA.W $0C20                          ;80CE67|AD200C  |800C20;
                       BIT.W #$0001                         ;80CE6A|890100  |      ;
                       BNE +                                ;80CE6D|D006    |80CE75;
                       LDX.W #$000C                         ;80CE6F|A20C00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CE72|20EACE  |80CEEA;
 
                     + LDA.W $076E                          ;80CE75|AD6E07  |80076E;
                       BEQ +                                ;80CE78|F00E    |80CE88;
                       LDA.W $0C1E                          ;80CE7A|AD1E0C  |800C1E;
                       BIT.W #$0001                         ;80CE7D|890100  |      ;
                       BNE +                                ;80CE80|D006    |80CE88;
                       LDX.W #$000A                         ;80CE82|A20A00  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CE85|20EACE  |80CEEA;
 
                     + LDA.W $076C                          ;80CE88|AD6C07  |80076C;
                       BEQ +                                ;80CE8B|F00E    |80CE9B;
                       LDA.W $0C1C                          ;80CE8D|AD1C0C  |800C1C;
                       BIT.W #$0001                         ;80CE90|890100  |      ;
                       BNE +                                ;80CE93|D006    |80CE9B;
                       LDX.W #$0008                         ;80CE95|A20800  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CE98|20EACE  |80CEEA;
 
                     + LDA.W $076A                          ;80CE9B|AD6A07  |80076A;
                       BEQ +                                ;80CE9E|F00E    |80CEAE;
                       LDA.W $0C1A                          ;80CEA0|AD1A0C  |800C1A;
                       BIT.W #$0001                         ;80CEA3|890100  |      ;
                       BNE +                                ;80CEA6|D006    |80CEAE;
                       LDX.W #$0006                         ;80CEA8|A20600  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CEAB|20EACE  |80CEEA;
 
                     + LDA.W $0768                          ;80CEAE|AD6807  |800768;
                       BEQ +                                ;80CEB1|F00E    |80CEC1;
                       LDA.W $0C18                          ;80CEB3|AD180C  |800C18;
                       BIT.W #$0001                         ;80CEB6|890100  |      ;
                       BNE +                                ;80CEB9|D006    |80CEC1;
                       LDX.W #$0004                         ;80CEBB|A20400  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CEBE|20EACE  |80CEEA;
 
                     + LDA.W $0766                          ;80CEC1|AD6607  |800766;
                       BEQ +                                ;80CEC4|F00E    |80CED4;
                       LDA.W $0C16                          ;80CEC6|AD160C  |800C16;
                       BIT.W #$0001                         ;80CEC9|890100  |      ;
                       BNE +                                ;80CECC|D006    |80CED4;
                       LDX.W #$0002                         ;80CECE|A20200  |      ;
                       JSR.W CODE_FN_80CEEA                 ;80CED1|20EACE  |80CEEA;
 
                     + LDA.W $0764                          ;80CED4|AD6407  |800764;
                       BEQ +                                ;80CED7|F00E    |80CEE7;
                       db $AD,$14,$0C,$89,$01,$00,$D0,$06   ;80CED9|        |000C14;
                       db $A2,$00,$00,$20,$EA,$CE           ;80CEE1|        |      ;
 
                     + PLB                                  ;80CEE7|AB      |      ;
                       PLP                                  ;80CEE8|28      |      ;
                       RTS                                  ;80CEE9|60      |      ;
 
       CODE_FN_80CEEA:
                       LDA.W $0AAC,X                        ;80CEEA|BDAC0A  |800AAC;
                       STA.B $86                            ;80CEED|8586    |000086;
                       CLC                                  ;80CEEF|18      |      ;
                       ADC.W #$0030                         ;80CEF0|693000  |      ;
                       CMP.W #$0160                         ;80CEF3|C96001  |      ;
                       BCS +                                ;80CEF6|B024    |80CF1C;
                       LDA.W $0C14,X                        ;80CEF8|BD140C  |800C14;
                       BIT.W #$0008                         ;80CEFB|890800  |      ;
                       BNE ++                               ;80CEFE|D010    |80CF10;
                       LDA.W $0B9C,X                        ;80CF00|BD9C0B  |800B9C;
                       STA.B $88                            ;80CF03|8588    |000088;
                       CLC                                  ;80CF05|18      |      ;
                       ADC.W #$0010                         ;80CF06|691000  |      ;
                       CMP.W #$0100                         ;80CF09|C90001  |      ;
                       BCS +                                ;80CF0C|B00E    |80CF1C;
                       BRA +++                              ;80CF0E|8005    |80CF15;
 
                    ++ LDA.W $0B9C,X                        ;80CF10|BD9C0B  |800B9C;
                       STA.B $88                            ;80CF13|8588    |000088;
 
                   +++ LDY.W $09BC,X                        ;80CF15|BCBC09  |8009BC;
                       JSL.L CODE_FL_809AAB                 ;80CF18|22AB9A80|809AAB;
 
                     + RTS                                  ;80CF1C|60      |      ;
                       STZ.W $0764,X                        ;80CF1D|9E6407  |800764;
                       PLA                                  ;80CF20|68      |      ;
                       RTS                                  ;80CF21|60      |      ;
                       db $B9,$00,$00,$9D,$CC,$08,$C8,$C8   ;80CF22|        |000000;
                       db $68,$60,$88,$88,$98,$9D,$44,$09   ;80CF2A|        |      ;
                       db $68,$60,$60                       ;80CF32|        |      ;
                       LDA.W $0000,Y                        ;80CF35|B90000  |800000;
                       STA.W $0854,X                        ;80CF38|9D5408  |800854;
                       INY                                  ;80CF3B|C8      |      ;
                       INY                                  ;80CF3C|C8      |      ;
                       RTS                                  ;80CF3D|60      |      ;
                       db $A9,$00,$C6,$9D,$54,$08,$60       ;80CF3E|        |      ;
                       LDA.W $0000,Y                        ;80CF45|B90000  |800000;
                       TAY                                  ;80CF48|A8      |      ;
                       RTS                                  ;80CF49|60      |      ;
                       db $98,$E2,$20,$18,$79,$00,$00,$C2   ;80CF4A|        |      ;
                       db $20,$A8,$60,$B9,$00,$00,$9D,$DC   ;80CF52|        |8060A8;
                       db $07,$C8,$C8,$60,$DE,$DC,$07,$D0   ;80CF5A|        |0000C8;
                       db $E2,$C8,$C8,$60,$DE,$DC,$07,$D0   ;80CF62|        |      ;
                       db $DF,$C8,$60,$73,$CF,$74,$CF,$7B   ;80CF6A|        |7360C8;
                       db $CF,$60,$AE,$5E,$07,$8E,$A6,$02   ;80CF72|        |5EAE60;
                       db $60,$01,$00,$83,$CF,$45,$CF,$7B   ;80CF7A|        |      ;
                       db $CF,$01,$00,$00,$00,$00,$C4,$30   ;80CF82|        |000001;
                       db $DA,$D0,$2F,$D1,$72,$DA,$DA,$D0   ;80CF8A|        |      ;
                       db $84,$D1,$7E,$DA,$DA,$D0,$71,$D2   ;80CF92|        |      ;
                       db $72,$DA,$DA,$D0,$AD,$D2,$7E,$DA   ;80CF9A|        |      ;
                       db $DA,$D0,$A2,$D3,$7E,$DA,$DA,$D0   ;80CFA2|        |      ;
                       db $DD,$D3,$7E,$DA,$DA,$D0,$05,$D4   ;80CFAA|        |      ;
                       db $72,$DA,$DA,$D0,$37,$D4,$7E,$DA   ;80CFB2|        |      ;
                       db $FC,$D0,$5F,$D4,$8A,$DA,$FC,$D0   ;80CFBA|        |      ;
                       db $5F,$D4,$92,$DA,$FC,$D0,$5F,$D4   ;80CFC2|        |      ;
                       db $9A,$DA,$FC,$D0,$5F,$D4,$A2,$DA   ;80CFCA|        |      ;
                       db $FC,$D0,$5F,$D4,$AA,$DA,$FC,$D0   ;80CFD2|        |      ;
                       db $5F,$D4,$B2,$DA,$FC,$D0,$5F,$D4   ;80CFDA|        |      ;
                       db $BA,$DA,$FC,$D0,$7A,$D4,$8A,$DA   ;80CFE2|        |      ;
                       db $FC,$D0,$7A,$D4,$92,$DA,$FC,$D0   ;80CFEA|        |      ;
                       db $7A,$D4,$9A,$DA,$FC,$D0,$7A,$D4   ;80CFF2|        |      ;
                       db $A2,$DA,$FC,$D0,$7A,$D4,$AA,$DA   ;80CFFA|        |      ;
                       db $FC,$D0,$7A,$D4,$B2,$DA,$FC,$D0   ;80D002|        |      ;
                       db $7A,$D4,$BA,$DA,$FC,$D0,$A6,$D4   ;80D00A|        |      ;
                       db $8A,$DA,$FC,$D0,$A6,$D4,$92,$DA   ;80D012|        |      ;
                       db $FC,$D0,$A6,$D4,$9A,$DA,$FC,$D0   ;80D01A|        |      ;
                       db $A6,$D4,$A2,$DA,$FC,$D0,$A6,$D4   ;80D022|        |      ;
                       db $AA,$DA                           ;80D02A|        |      ;
                       db $FC,$D0,$A6,$D4,$B2,$DA           ;80D02C|        |80A6D0;
                       db $FC,$D0,$A6,$D4,$BA,$DA,$FC,$D0   ;80D032|        |      ;
                       db $C1,$D4,$8A,$DA,$FC,$D0,$C1,$D4   ;80D03A|        |      ;
                       db $92,$DA,$FC,$D0,$C1,$D4,$9A,$DA   ;80D042|        |      ;
                       db $FC,$D0,$C1,$D4,$A2,$DA,$FC,$D0   ;80D04A|        |      ;
                       db $C1,$D4,$AA,$DA                   ;80D052|        |      ;
                       db $FC,$D0,$C1,$D4,$B2,$DA           ;80D056|        |80C1D0;
                       db $FC,$D0,$C1,$D4,$BA,$DA,$DD,$D0   ;80D05C|        |      ;
                       db $ED,$D4,$C2,$DA,$DD,$D0,$47,$D5   ;80D064|        |      ;
                       db $C2,$DA,$DD,$D0,$99,$D5,$CA,$DA   ;80D06C|        |      ;
                       db $DD,$D0,$C0,$D6,$CA,$DA,$DD,$D0   ;80D074|        |      ;
                       db $5B,$D7,$D6,$DA,$DD,$D0,$5B,$D7   ;80D07C|        |      ;
                       db $DE,$DA,$DD,$D0,$96,$D7,$D6,$DA   ;80D084|        |      ;
                       db $DA,$D0,$D9,$D7,$E6,$DA,$DA,$D0   ;80D08C|        |      ;
                       db $0A,$D8,$E6,$DA,$DA,$D0,$3B,$D8   ;80D094|        |      ;
                       db $EE,$DA,$DA,$D0,$3E,$D8,$30,$DB   ;80D09C|        |      ;
                       db $DA,$D0,$7A,$D8,$30,$DB           ;80D0A4|        |      ;
                       db $DA,$D0,$A4,$D8,$38,$DB           ;80D0AA|        |      ;
                       db $DA,$D0,$35,$D9,$38,$DB,$DA,$D0   ;80D0B0|        |      ;
                       db $C3,$D9,$38,$DB,$DA,$D0,$A4,$D8   ;80D0B8|        |0000D9;
                       db $40,$DB,$DA,$D0,$35,$D9,$40,$DB   ;80D0C0|        |      ;
                       db $DA,$D0,$C3,$D9,$40,$DB           ;80D0C8|        |      ;
                       db $05,$D1,$21,$DA,$48,$DB,$13,$D1   ;80D0CE|        |      ;
                       db $57,$DA,$50,$DB                   ;80D0D6|        |      ;
                       REP #$30                             ;80D0DA|C230    |      ;
                       RTS                                  ;80D0DC|60      |      ;
                       REP #$30                             ;80D0DD|C230    |      ;
                       LDA.W #$0000                         ;80D0DF|A90000  |      ;
                       STA.L $7E8EB6                        ;80D0E2|8FB68E7E|7E8EB6;
                       LDA.W #$0010                         ;80D0E6|A91000  |      ;
                       STA.W $0C14,X                        ;80D0E9|9D140C  |800C14;
                       LDA.W #$0000                         ;80D0EC|A90000  |      ;
                       STA.L $7E8EB8                        ;80D0EF|8FB88E7E|7E8EB8;
                       STA.L $7E8EBA                        ;80D0F3|8FBA8E7E|7E8EBA;
                       STA.L $7E8EBC                        ;80D0F7|8FBC8E7E|7E8EBC;
                       RTS                                  ;80D0FB|60      |      ;
                       REP #$30                             ;80D0FC|C230    |      ;
                       LDA.W #$0000                         ;80D0FE|A90000  |      ;
                       STA.W $0C14,X                        ;80D101|9D140C  |800C14;
                       RTS                                  ;80D104|60      |      ;
                       REP #$30                             ;80D105|C230    |      ;
                       TXA                                  ;80D107|8A      |      ;
                       STA.L $7E8ECC                        ;80D108|8FCC8E7E|7E8ECC;
                       LDA.W #$0017                         ;80D10C|A91700  |      ;
                       STA.W $0C14,X                        ;80D10F|9D140C  |800C14;
                       RTS                                  ;80D112|60      |      ;
                       REP #$30                             ;80D113|C230    |      ;
                       TXA                                  ;80D115|8A      |      ;
                       STA.L $7E8ECE                        ;80D116|8FCE8E7E|7E8ECE;
                       LDA.W #$0017                         ;80D11A|A91700  |      ;
                       STA.W $0C14,X                        ;80D11D|9D140C  |800C14;
                       LDA.W #$0008                         ;80D120|A90800  |      ;
                       STA.L $7E8ED0                        ;80D123|8FD08E7E|7E8ED0;
                       LDA.W #$0000                         ;80D127|A90000  |      ;
                       STA.L $7E8ED2                        ;80D12A|8FD28E7E|7E8ED2;
                       RTS                                  ;80D12E|60      |      ;
                       REP #$30                             ;80D12F|C230    |      ;
                       LDX.W $075E                          ;80D131|AE5E07  |80075E;
                       STX.W $03B4                          ;80D134|8EB403  |8003B4;
                       LDA.W Game_State                     ;80D137|ADA002  |8002A0;
                       CMP.W #$0003                         ;80D13A|C90300  |      ;
                       BEQ +                                ;80D13D|F004    |80D143;
                       STZ.W $0C14,X                        ;80D13F|9E140C  |800C14;
                       RTS                                  ;80D142|60      |      ;
 
                     + JSR.W CODE_FN_80D20D                 ;80D143|200DD2  |80D20D;
                       JSR.W CODE_FN_80D1B5                 ;80D146|20B5D1  |80D1B5;
                       LDA.L $7E8ED8                        ;80D149|AFD88E7E|7E8ED8;
                       BEQ +                                ;80D14D|F00B    |80D15A;
                       LDA.W $0C14,X                        ;80D14F|BD140C  |800C14;
                       ORA.W #$0001                         ;80D152|090100  |      ;
                       STA.W $0C14,X                        ;80D155|9D140C  |800C14;
                       BRA ++                               ;80D158|8009    |80D163;
 
                     + LDA.W $0C14,X                        ;80D15A|BD140C  |800C14;
                       AND.W #$FFFE                         ;80D15D|29FEFF  |      ;
                       STA.W $0C14,X                        ;80D160|9D140C  |800C14;
 
                    ++ LDA.L $7E8ED6                        ;80D163|AFD68E7E|7E8ED6;
                       INC A                                ;80D167|1A      |      ;
                       STA.L $7E8ED6                        ;80D168|8FD68E7E|7E8ED6;
                       CMP.W #$0001                         ;80D16C|C90100  |      ;
                       BNE +                                ;80D16F|D012    |80D183;
                       LDA.W #$0000                         ;80D171|A90000  |      ;
                       STA.L $7E8ED6                        ;80D174|8FD68E7E|7E8ED6;
                       LDA.L $7E8ED8                        ;80D178|AFD88E7E|7E8ED8;
                       EOR.W #$0001                         ;80D17C|490100  |      ;
                       STA.L $7E8ED8                        ;80D17F|8FD88E7E|7E8ED8;
 
                     + RTS                                  ;80D183|60      |      ;
                       REP #$30                             ;80D184|C230    |      ;
                       LDX.W $075E                          ;80D186|AE5E07  |80075E;
                       STX.W $03B8                          ;80D189|8EB803  |8003B8;
                       LDA.W Game_State                     ;80D18C|ADA002  |8002A0;
                       CMP.W #$0003                         ;80D18F|C90300  |      ;
                       BEQ +                                ;80D192|F004    |80D198;
                       STZ.W $0C14,X                        ;80D194|9E140C  |800C14;
                       RTS                                  ;80D197|60      |      ;
 
                     + JSR.W CODE_FN_80D20D                 ;80D198|200DD2  |80D20D;
                       LDA.L $7E8ED8                        ;80D19B|AFD88E7E|7E8ED8;
                       BEQ +                                ;80D19F|F00A    |80D1AB;
                       LDA.W $0C14,X                        ;80D1A1|BD140C  |800C14;
                       ORA.W #$0001                         ;80D1A4|090100  |      ;
                       STA.W $0C14,X                        ;80D1A7|9D140C  |800C14;
                       RTS                                  ;80D1AA|60      |      ;
 
                     + LDA.W $0C14,X                        ;80D1AB|BD140C  |800C14;
                       AND.W #$FFFE                         ;80D1AE|29FEFF  |      ;
                       STA.W $0C14,X                        ;80D1B1|9D140C  |800C14;
                       RTS                                  ;80D1B4|60      |      ;
 
       CODE_FN_80D1B5:
                       LDA.W $00BB                          ;80D1B5|ADBB00  |8000BB;
                       BIT.W #$0800                         ;80D1B8|890008  |      ;
                       BNE +                                ;80D1BB|D010    |80D1CD;
                       BIT.W #$0400                         ;80D1BD|890004  |      ;
                       BNE ++                               ;80D1C0|D01B    |80D1DD;
                       BIT.W #$0200                         ;80D1C2|890002  |      ;
                       BNE +++                              ;80D1C5|D026    |80D1ED;
                       BIT.W #$0100                         ;80D1C7|890001  |      ;
                       BNE ++++                             ;80D1CA|D031    |80D1FD;
                       RTS                                  ;80D1CC|60      |      ;
 
                     + LDA.W $03A8                          ;80D1CD|ADA803  |8003A8;
                       CMP.W #$0003                         ;80D1D0|C90300  |      ;
                       BEQ +                                ;80D1D3|F007    |80D1DC;
                       DEC A                                ;80D1D5|3A      |      ;
                       STA.W $03A8                          ;80D1D6|8DA803  |8003A8;
                       STA.W $03B0                          ;80D1D9|8DB003  |8003B0;
 
                     + RTS                                  ;80D1DC|60      |      ;
 
                    ++ LDA.W $03A8                          ;80D1DD|ADA803  |8003A8;
                       CMP.W #$000E                         ;80D1E0|C90E00  |      ;
                       BCS +                                ;80D1E3|B007    |80D1EC;
                       INC A                                ;80D1E5|1A      |      ;
                       STA.W $03A8                          ;80D1E6|8DA803  |8003A8;
                       STA.W $03B0                          ;80D1E9|8DB003  |8003B0;
 
                     + RTS                                  ;80D1EC|60      |      ;
 
                   +++ LDA.W $03A4                          ;80D1ED|ADA403  |8003A4;
                       CMP.W #$0001                         ;80D1F0|C90100  |      ;
                       BEQ +                                ;80D1F3|F007    |80D1FC;
                       DEC A                                ;80D1F5|3A      |      ;
                       STA.W $03A4                          ;80D1F6|8DA403  |8003A4;
                       DEC.W $03AC                          ;80D1F9|CEAC03  |8003AC;
 
                     + RTS                                  ;80D1FC|60      |      ;
 
                  ++++ LDA.W $03AC                          ;80D1FD|ADAC03  |8003AC;
                       CMP.W #$0006                         ;80D200|C90600  |      ;
                       BCS +                                ;80D203|B007    |80D20C;
                       INC A                                ;80D205|1A      |      ;
                       STA.W $03AC                          ;80D206|8DAC03  |8003AC;
                       INC.W $03A4                          ;80D209|EEA403  |8003A4;
 
                     + RTS                                  ;80D20C|60      |      ;
 
       CODE_FN_80D20D:
                       LDA.W $00BB                          ;80D20D|ADBB00  |8000BB;
                       BIT.W #$0800                         ;80D210|890008  |      ;
                       BNE +                                ;80D213|D010    |80D225;
                       BIT.W #$0400                         ;80D215|890004  |      ;
                       BNE ++                               ;80D218|D01E    |80D238;
                       BIT.W #$0200                         ;80D21A|890002  |      ;
                       BNE +++                              ;80D21D|D02C    |80D24B;
                       BIT.W #$0100                         ;80D21F|890001  |      ;
                       BNE ++++                             ;80D222|D03A    |80D25E;
                       RTS                                  ;80D224|60      |      ;
 
                     + LDA.W $03A8                          ;80D225|ADA803  |8003A8;
                       CMP.W #$0003                         ;80D228|C90300  |      ;
                       BEQ +                                ;80D22B|F00A    |80D237;
                       LDA.W $0B9C,X                        ;80D22D|BD9C0B  |800B9C;
                       SEC                                  ;80D230|38      |      ;
                       SBC.W #$0010                         ;80D231|E91000  |      ;
                       STA.W $0B9C,X                        ;80D234|9D9C0B  |800B9C;
 
                     + RTS                                  ;80D237|60      |      ;
 
                    ++ LDA.W $03A8                          ;80D238|ADA803  |8003A8;
                       CMP.W #$000E                         ;80D23B|C90E00  |      ;
                       BCS +                                ;80D23E|B00A    |80D24A;
                       LDA.W $0B9C,X                        ;80D240|BD9C0B  |800B9C;
                       CLC                                  ;80D243|18      |      ;
                       ADC.W #$0010                         ;80D244|691000  |      ;
                       STA.W $0B9C,X                        ;80D247|9D9C0B  |800B9C;
 
                     + RTS                                  ;80D24A|60      |      ;
 
                   +++ LDA.W $03A4                          ;80D24B|ADA403  |8003A4;
                       CMP.W #$0001                         ;80D24E|C90100  |      ;
                       BEQ +                                ;80D251|F00A    |80D25D;
                       LDA.W $0AAC,X                        ;80D253|BDAC0A  |800AAC;
                       SEC                                  ;80D256|38      |      ;
                       SBC.W #$0010                         ;80D257|E91000  |      ;
                       STA.W $0AAC,X                        ;80D25A|9DAC0A  |800AAC;
 
                     + RTS                                  ;80D25D|60      |      ;
 
                  ++++ LDA.W $03AC                          ;80D25E|ADAC03  |8003AC;
                       CMP.W #$0006                         ;80D261|C90600  |      ;
                       BCS +                                ;80D264|B00A    |80D270;
                       LDA.W $0AAC,X                        ;80D266|BDAC0A  |800AAC;
                       CLC                                  ;80D269|18      |      ;
                       ADC.W #$0010                         ;80D26A|691000  |      ;
                       STA.W $0AAC,X                        ;80D26D|9DAC0A  |800AAC;
 
                     + RTS                                  ;80D270|60      |      ;
                       REP #$30                             ;80D271|C230    |      ;
                       LDX.W $075E                          ;80D273|AE5E07  |80075E;
                       STX.W $03B6                          ;80D276|8EB603  |8003B6;
                       LDA.W Game_State                     ;80D279|ADA002  |8002A0;
                       CMP.W #$0003                         ;80D27C|C90300  |      ;
                       BEQ +                                ;80D27F|F004    |80D285;
                       STZ.W $0C14,X                        ;80D281|9E140C  |800C14;
                       RTS                                  ;80D284|60      |      ;
 
                     + LDA.W $02A8                          ;80D285|ADA802  |8002A8;
                       CMP.W #$0001                         ;80D288|C90100  |      ;
                       BEQ +                                ;80D28B|F006    |80D293;
                       JSR.W CODE_FN_80D33E                 ;80D28D|203ED3  |80D33E;
                       JSR.W CODE_FN_80D2E6                 ;80D290|20E6D2  |80D2E6;
 
                     + LDA.L $7E8ED8                        ;80D293|AFD88E7E|7E8ED8;
                       BEQ +                                ;80D297|F00A    |80D2A3;
                       LDA.W $0C14,X                        ;80D299|BD140C  |800C14;
                       ORA.W #$0001                         ;80D29C|090100  |      ;
                       STA.W $0C14,X                        ;80D29F|9D140C  |800C14;
                       RTS                                  ;80D2A2|60      |      ;
 
                     + LDA.W $0C14,X                        ;80D2A3|BD140C  |800C14;
                       AND.W #$FFFE                         ;80D2A6|29FEFF  |      ;
                       STA.W $0C14,X                        ;80D2A9|9D140C  |800C14;
                       RTS                                  ;80D2AC|60      |      ;
                       REP #$30                             ;80D2AD|C230    |      ;
                       LDX.W $075E                          ;80D2AF|AE5E07  |80075E;
                       STX.W $03BA                          ;80D2B2|8EBA03  |8003BA;
                       LDA.W Game_State                     ;80D2B5|ADA002  |8002A0;
                       CMP.W #$0003                         ;80D2B8|C90300  |      ;
                       BEQ +                                ;80D2BB|F004    |80D2C1;
                       STZ.W $0C14,X                        ;80D2BD|9E140C  |800C14;
                       RTS                                  ;80D2C0|60      |      ;
 
                     + LDA.W $02A8                          ;80D2C1|ADA802  |8002A8;
                       CMP.W #$0001                         ;80D2C4|C90100  |      ;
                       BEQ +                                ;80D2C7|F003    |80D2CC;
                       JSR.W CODE_FN_80D33E                 ;80D2C9|203ED3  |80D33E;
 
                     + LDA.L $7E8ED8                        ;80D2CC|AFD88E7E|7E8ED8;
                       BEQ +                                ;80D2D0|F00A    |80D2DC;
                       LDA.W $0C14,X                        ;80D2D2|BD140C  |800C14;
                       ORA.W #$0001                         ;80D2D5|090100  |      ;
                       STA.W $0C14,X                        ;80D2D8|9D140C  |800C14;
                       RTS                                  ;80D2DB|60      |      ;
 
                     + LDA.W $0C14,X                        ;80D2DC|BD140C  |800C14;
                       AND.W #$FFFE                         ;80D2DF|29FEFF  |      ;
                       STA.W $0C14,X                        ;80D2E2|9D140C  |800C14;
                       RTS                                  ;80D2E5|60      |      ;
 
       CODE_FN_80D2E6:
                       LDA.W $00BD                          ;80D2E6|ADBD00  |8000BD;
                       BIT.W #$0800                         ;80D2E9|890008  |      ;
                       BNE +                                ;80D2EC|D010    |80D2FE;
                       BIT.W #$0400                         ;80D2EE|890004  |      ;
                       BNE ++                               ;80D2F1|D01B    |80D30E;
                       BIT.W #$0200                         ;80D2F3|890002  |      ;
                       BNE +++                              ;80D2F6|D026    |80D31E;
                       BIT.W #$0100                         ;80D2F8|890001  |      ;
                       BNE ++++                             ;80D2FB|D031    |80D32E;
                       RTS                                  ;80D2FD|60      |      ;
 
                     + LDA.W $03AA                          ;80D2FE|ADAA03  |8003AA;
                       CMP.W #$0003                         ;80D301|C90300  |      ;
                       BEQ +                                ;80D304|F007    |80D30D;
                       DEC A                                ;80D306|3A      |      ;
                       STA.W $03AA                          ;80D307|8DAA03  |8003AA;
                       STA.W $03B2                          ;80D30A|8DB203  |8003B2;
 
                     + RTS                                  ;80D30D|60      |      ;
 
                    ++ LDA.W $03AA                          ;80D30E|ADAA03  |8003AA;
                       CMP.W #$000E                         ;80D311|C90E00  |      ;
                       BCS +                                ;80D314|B007    |80D31D;
                       INC A                                ;80D316|1A      |      ;
                       STA.W $03AA                          ;80D317|8DAA03  |8003AA;
                       STA.W $03B2                          ;80D31A|8DB203  |8003B2;
 
                     + RTS                                  ;80D31D|60      |      ;
 
                   +++ LDA.W $03A6                          ;80D31E|ADA603  |8003A6;
                       CMP.W #$0001                         ;80D321|C90100  |      ;
                       BEQ +                                ;80D324|F007    |80D32D;
                       DEC A                                ;80D326|3A      |      ;
                       STA.W $03A6                          ;80D327|8DA603  |8003A6;
                       DEC.W $03AE                          ;80D32A|CEAE03  |8003AE;
 
                     + RTS                                  ;80D32D|60      |      ;
 
                  ++++ LDA.W $03AE                          ;80D32E|ADAE03  |8003AE;
                       CMP.W #$0006                         ;80D331|C90600  |      ;
                       BCS +                                ;80D334|B007    |80D33D;
                       INC A                                ;80D336|1A      |      ;
                       STA.W $03AE                          ;80D337|8DAE03  |8003AE;
                       INC.W $03A6                          ;80D33A|EEA603  |8003A6;
 
                     + RTS                                  ;80D33D|60      |      ;
 
       CODE_FN_80D33E:
                       LDA.W $00BD                          ;80D33E|ADBD00  |8000BD;
                       BIT.W #$0800                         ;80D341|890008  |      ;
                       BNE +                                ;80D344|D010    |80D356;
                       BIT.W #$0400                         ;80D346|890004  |      ;
                       BNE ++                               ;80D349|D01E    |80D369;
                       BIT.W #$0200                         ;80D34B|890002  |      ;
                       BNE +++                              ;80D34E|D02C    |80D37C;
                       BIT.W #$0100                         ;80D350|890001  |      ;
                       BNE ++++                             ;80D353|D03A    |80D38F;
                       RTS                                  ;80D355|60      |      ;
 
                     + LDA.W $03AA                          ;80D356|ADAA03  |8003AA;
                       CMP.W #$0003                         ;80D359|C90300  |      ;
                       BEQ +                                ;80D35C|F00A    |80D368;
                       LDA.W $0B9C,X                        ;80D35E|BD9C0B  |800B9C;
                       SEC                                  ;80D361|38      |      ;
                       SBC.W #$0010                         ;80D362|E91000  |      ;
                       STA.W $0B9C,X                        ;80D365|9D9C0B  |800B9C;
 
                     + RTS                                  ;80D368|60      |      ;
 
                    ++ LDA.W $03AA                          ;80D369|ADAA03  |8003AA;
                       CMP.W #$000E                         ;80D36C|C90E00  |      ;
                       BCS +                                ;80D36F|B00A    |80D37B;
                       LDA.W $0B9C,X                        ;80D371|BD9C0B  |800B9C;
                       CLC                                  ;80D374|18      |      ;
                       ADC.W #$0010                         ;80D375|691000  |      ;
                       STA.W $0B9C,X                        ;80D378|9D9C0B  |800B9C;
 
                     + RTS                                  ;80D37B|60      |      ;
 
                   +++ LDA.W $03A6                          ;80D37C|ADA603  |8003A6;
                       CMP.W #$0001                         ;80D37F|C90100  |      ;
                       BEQ +                                ;80D382|F00A    |80D38E;
                       LDA.W $0AAC,X                        ;80D384|BDAC0A  |800AAC;
                       SEC                                  ;80D387|38      |      ;
                       SBC.W #$0010                         ;80D388|E91000  |      ;
                       STA.W $0AAC,X                        ;80D38B|9DAC0A  |800AAC;
 
                     + RTS                                  ;80D38E|60      |      ;
 
                  ++++ LDA.W $03AE                          ;80D38F|ADAE03  |8003AE;
                       CMP.W #$0006                         ;80D392|C90600  |      ;
                       BCS +                                ;80D395|B00A    |80D3A1;
                       LDA.W $0AAC,X                        ;80D397|BDAC0A  |800AAC;
                       CLC                                  ;80D39A|18      |      ;
                       ADC.W #$0010                         ;80D39B|691000  |      ;
                       STA.W $0AAC,X                        ;80D39E|9DAC0A  |800AAC;
 
                     + RTS                                  ;80D3A1|60      |      ;
                       REP #$30                             ;80D3A2|C230    |      ;
                       PHB                                  ;80D3A4|8B      |      ;
                       PHK                                  ;80D3A5|4B      |      ;
                       PLB                                  ;80D3A6|AB      |      ;
                       LDX.W $075E                          ;80D3A7|AE5E07  |80075E;
                       LDA.L $7E8EC2                        ;80D3AA|AFC28E7E|7E8EC2;
                       TAY                                  ;80D3AE|A8      |      ;
                       LDA.W DATA8_80F553,Y                 ;80D3AF|B953F5  |80F553;
                       CMP.W #$8000                         ;80D3B2|C90080  |      ;
                       BEQ +                                ;80D3B5|F01D    |80D3D4;
                       CLC                                  ;80D3B7|18      |      ;
                       ADC.W $0AAC,X                        ;80D3B8|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D3BB|9DAC0A  |800AAC;
                       LDA.W DATA8_80F597,Y                 ;80D3BE|B997F5  |80F597;
                       CLC                                  ;80D3C1|18      |      ;
                       ADC.W $0B9C,X                        ;80D3C2|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D3C5|9D9C0B  |800B9C;
                       LDA.L $7E8EC2                        ;80D3C8|AFC28E7E|7E8EC2;
                       INC A                                ;80D3CC|1A      |      ;
                       INC A                                ;80D3CD|1A      |      ;
                       STA.L $7E8EC2                        ;80D3CE|8FC28E7E|7E8EC2;
                       PLB                                  ;80D3D2|AB      |      ;
                       RTS                                  ;80D3D3|60      |      ;
 
                     + LDA.W #$0001                         ;80D3D4|A90100  |      ;
                       STA.L $7E8ED4                        ;80D3D7|8FD48E7E|7E8ED4;
                       PLB                                  ;80D3DB|AB      |      ;
                       RTS                                  ;80D3DC|60      |      ;
                       REP #$30                             ;80D3DD|C230    |      ;
                       PHB                                  ;80D3DF|8B      |      ;
                       PHK                                  ;80D3E0|4B      |      ;
                       PLB                                  ;80D3E1|AB      |      ;
                       LDX.W $075E                          ;80D3E2|AE5E07  |80075E;
                       LDA.L $7E8EC2                        ;80D3E5|AFC28E7E|7E8EC2;
                       TAY                                  ;80D3E9|A8      |      ;
                       LDA.W DATA8_80F553,Y                 ;80D3EA|B953F5  |80F553;
                       CMP.W #$8000                         ;80D3ED|C90080  |      ;
                       BEQ +                                ;80D3F0|F011    |80D403;
                       CLC                                  ;80D3F2|18      |      ;
                       ADC.W $0AAC,X                        ;80D3F3|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D3F6|9DAC0A  |800AAC;
                       LDA.W DATA8_80F597,Y                 ;80D3F9|B997F5  |80F597;
                       CLC                                  ;80D3FC|18      |      ;
                       ADC.W $0B9C,X                        ;80D3FD|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D400|9D9C0B  |800B9C;
 
                     + PLB                                  ;80D403|AB      |      ;
                       RTS                                  ;80D404|60      |      ;
                       REP #$30                             ;80D405|C230    |      ;
                       PHB                                  ;80D407|8B      |      ;
                       PHK                                  ;80D408|4B      |      ;
                       PLB                                  ;80D409|AB      |      ;
                       LDX.W $075E                          ;80D40A|AE5E07  |80075E;
                       LDA.L $7E8EC4                        ;80D40D|AFC48E7E|7E8EC4;
                       TAY                                  ;80D411|A8      |      ;
                       LDA.W DATA8_80F553,Y                 ;80D412|B953F5  |80F553;
                       CMP.W #$8000                         ;80D415|C90080  |      ;
                       BEQ +                                ;80D418|F01B    |80D435;
                       CLC                                  ;80D41A|18      |      ;
                       ADC.W $0AAC,X                        ;80D41B|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D41E|9DAC0A  |800AAC;
                       LDA.W DATA8_80F597,Y                 ;80D421|B997F5  |80F597;
                       CLC                                  ;80D424|18      |      ;
                       ADC.W $0B9C,X                        ;80D425|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D428|9D9C0B  |800B9C;
                       LDA.L $7E8EC4                        ;80D42B|AFC48E7E|7E8EC4;
                       INC A                                ;80D42F|1A      |      ;
                       INC A                                ;80D430|1A      |      ;
                       STA.L $7E8EC4                        ;80D431|8FC48E7E|7E8EC4;
 
                     + PLB                                  ;80D435|AB      |      ;
                       RTS                                  ;80D436|60      |      ;
                       REP #$30                             ;80D437|C230    |      ;
                       PHB                                  ;80D439|8B      |      ;
                       PHK                                  ;80D43A|4B      |      ;
                       PLB                                  ;80D43B|AB      |      ;
                       LDX.W $075E                          ;80D43C|AE5E07  |80075E;
                       LDA.L $7E8EC4                        ;80D43F|AFC48E7E|7E8EC4;
                       TAY                                  ;80D443|A8      |      ;
                       LDA.W DATA8_80F553,Y                 ;80D444|B953F5  |80F553;
                       CMP.W #$8000                         ;80D447|C90080  |      ;
                       BEQ +                                ;80D44A|F011    |80D45D;
                       CLC                                  ;80D44C|18      |      ;
                       ADC.W $0AAC,X                        ;80D44D|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D450|9DAC0A  |800AAC;
                       LDA.W DATA8_80F597,Y                 ;80D453|B997F5  |80F597;
                       CLC                                  ;80D456|18      |      ;
                       ADC.W $0B9C,X                        ;80D457|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D45A|9D9C0B  |800B9C;
 
                     + PLB                                  ;80D45D|AB      |      ;
                       RTS                                  ;80D45E|60      |      ;
                       REP #$30                             ;80D45F|C230    |      ;
                       LDA.W $0358                          ;80D461|AD5803  |800358;
                       BNE +                                ;80D464|D013    |80D479;
                       LDX.W $075E                          ;80D466|AE5E07  |80075E;
                       STX.W $03BC                          ;80D469|8EBC03  |8003BC;
                       LDA.W #$0004                         ;80D46C|A90400  |      ;
                       CLC                                  ;80D46F|18      |      ;
                       ADC.W $0AAC,X                        ;80D470|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D473|9DAC0A  |800AAC;
                       JSR.W CODE_FN_80D495                 ;80D476|2095D4  |80D495;
 
                     + RTS                                  ;80D479|60      |      ;
                       REP #$30                             ;80D47A|C230    |      ;
                       LDA.W $0358                          ;80D47C|AD5803  |800358;
                       BNE +                                ;80D47F|D013    |80D494;
                       LDX.W $075E                          ;80D481|AE5E07  |80075E;
                       STX.W $03C0                          ;80D484|8EC003  |8003C0;
                       LDA.W #$FFFC                         ;80D487|A9FCFF  |      ;
                       CLC                                  ;80D48A|18      |      ;
                       ADC.W $0AAC,X                        ;80D48B|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D48E|9DAC0A  |800AAC;
                       JSR.W CODE_FN_80D495                 ;80D491|2095D4  |80D495;
 
                     + RTS                                  ;80D494|60      |      ;
 
       CODE_FN_80D495:
                       LDA.W $03D6                          ;80D495|ADD603  |8003D6;
                       CMP.W #$0003                         ;80D498|C90300  |      ;
                       BCC +                                ;80D49B|9008    |80D4A5;
                       LDA.W $03E2                          ;80D49D|ADE203  |8003E2;
                       BNE +                                ;80D4A0|D003    |80D4A5;
                       DEC.W $0B9C,X                        ;80D4A2|DE9C0B  |800B9C;
 
                     + RTS                                  ;80D4A5|60      |      ;
                       REP #$30                             ;80D4A6|C230    |      ;
                       LDA.W $0358                          ;80D4A8|AD5803  |800358;
                       BNE +                                ;80D4AB|D013    |80D4C0;
                       LDX.W $075E                          ;80D4AD|AE5E07  |80075E;
                       STX.W $03BE                          ;80D4B0|8EBE03  |8003BE;
                       LDA.W #$0004                         ;80D4B3|A90400  |      ;
                       CLC                                  ;80D4B6|18      |      ;
                       ADC.W $0AAC,X                        ;80D4B7|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D4BA|9DAC0A  |800AAC;
                       JSR.W CODE_FN_80D4DC                 ;80D4BD|20DCD4  |80D4DC;
 
                     + RTS                                  ;80D4C0|60      |      ;
                       REP #$30                             ;80D4C1|C230    |      ;
                       LDA.W $0358                          ;80D4C3|AD5803  |800358;
                       BNE +                                ;80D4C6|D013    |80D4DB;
                       LDX.W $075E                          ;80D4C8|AE5E07  |80075E;
                       STX.W $03C2                          ;80D4CB|8EC203  |8003C2;
                       LDA.W #$FFFC                         ;80D4CE|A9FCFF  |      ;
                       CLC                                  ;80D4D1|18      |      ;
                       ADC.W $0AAC,X                        ;80D4D2|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D4D5|9DAC0A  |800AAC;
                       JSR.W CODE_FN_80D4DC                 ;80D4D8|20DCD4  |80D4DC;
 
                     + RTS                                  ;80D4DB|60      |      ;
 
       CODE_FN_80D4DC:
                       LDA.W $03D8                          ;80D4DC|ADD803  |8003D8;
                       CMP.W #$0003                         ;80D4DF|C90300  |      ;
                       BCC +                                ;80D4E2|9008    |80D4EC;
                       LDA.W $03E4                          ;80D4E4|ADE403  |8003E4;
                       BNE +                                ;80D4E7|D003    |80D4EC;
                       DEC.W $0B9C,X                        ;80D4E9|DE9C0B  |800B9C;
 
                     + RTS                                  ;80D4EC|60      |      ;
                       REP #$30                             ;80D4ED|C230    |      ;
                       LDX.W $075E                          ;80D4EF|AE5E07  |80075E;
                       LDA.W $035A                          ;80D4F2|AD5A03  |80035A;
                       EOR.W #$0001                         ;80D4F5|490100  |      ;
                       ORA.W #$0010                         ;80D4F8|091000  |      ;
                       STA.W $0C14,X                        ;80D4FB|9D140C  |800C14;
                       LDA.W $035E                          ;80D4FE|AD5E03  |80035E;
                       BEQ +                                ;80D501|F011    |80D514;
                       LDA.W $00B3                          ;80D503|ADB300  |8000B3;
                       AND.W #$0040                         ;80D506|294000  |      ;
                       CMP.W #$0040                         ;80D509|C94000  |      ;
                       BNE +                                ;80D50C|D006    |80D514;
                       LDA.W #$0001                         ;80D50E|A90100  |      ;
                       STA.W $0C14,X                        ;80D511|9D140C  |000C14;
 
                     + LDA.L $7E8EB6                        ;80D514|AFB68E7E|7E8EB6;
                       ASL A                                ;80D518|0A      |      ;
                       TAY                                  ;80D519|A8      |      ;
                       LDA.W DATA8_80F4D1,Y                 ;80D51A|B9D1F4  |80F4D1;
                       CMP.W #$8000                         ;80D51D|C90080  |      ;
                       BEQ +                                ;80D520|F017    |80D539;
                       STA.W $0000                          ;80D522|8D0000  |800000;
                       LDA.W $0B9C,X                        ;80D525|BD9C0B  |800B9C;
                       CLC                                  ;80D528|18      |      ;
                       ADC.W $0000                          ;80D529|6D0000  |800000;
                       STA.W $0B9C,X                        ;80D52C|9D9C0B  |800B9C;
                       LDA.L $7E8EB6                        ;80D52F|AFB68E7E|7E8EB6;
                       INC A                                ;80D533|1A      |      ;
                       STA.L $7E8EB6                        ;80D534|8FB68E7E|7E8EB6;
                       RTS                                  ;80D538|60      |      ;
 
                     + LDA.W #$0000                         ;80D539|A90000  |      ;
                       STA.L $7E8EB6                        ;80D53C|8FB68E7E|7E8EB6;
                       LDA.W #$0060                         ;80D540|A96000  |      ;
                       STA.W $0B9C,X                        ;80D543|9D9C0B  |800B9C;
                       RTS                                  ;80D546|60      |      ;
                       REP #$30                             ;80D547|C230    |      ;
                       LDX.W $075E                          ;80D549|AE5E07  |80075E;
                       LDA.W $035A                          ;80D54C|AD5A03  |80035A;
                       EOR.W #$0001                         ;80D54F|490100  |      ;
                       ORA.W #$0010                         ;80D552|091000  |      ;
                       STA.W $0C14,X                        ;80D555|9D140C  |800C14;
                       LDA.W $035E                          ;80D558|AD5E03  |80035E;
                       BEQ +                                ;80D55B|F019    |80D576;
                       LDA.W $02A8                          ;80D55D|ADA802  |8002A8;
                       CMP.W #$0001                         ;80D560|C90100  |      ;
                       BEQ +                                ;80D563|F011    |80D576;
                       LDA.W $00B5                          ;80D565|ADB500  |8000B5;
                       AND.W #$0040                         ;80D568|294000  |      ;
                       CMP.W #$0040                         ;80D56B|C94000  |      ;
                       BNE +                                ;80D56E|D006    |80D576;
                       db $A9,$01,$00,$9D,$14,$0C           ;80D570|        |      ;
 
                     + LDA.L $7E8EB6                        ;80D576|AFB68E7E|7E8EB6;
                       ASL A                                ;80D57A|0A      |      ;
                       TAY                                  ;80D57B|A8      |      ;
                       LDA.W DATA8_80F4D1,Y                 ;80D57C|B9D1F4  |80F4D1;
                       CMP.W #$8000                         ;80D57F|C90080  |      ;
                       BEQ +                                ;80D582|F00E    |80D592;
                       STA.W $0000                          ;80D584|8D0000  |800000;
                       LDA.W $0B9C,X                        ;80D587|BD9C0B  |800B9C;
                       CLC                                  ;80D58A|18      |      ;
                       ADC.W $0000                          ;80D58B|6D0000  |800000;
                       STA.W $0B9C,X                        ;80D58E|9D9C0B  |800B9C;
                       RTS                                  ;80D591|60      |      ;
 
                     + LDA.W #$0060                         ;80D592|A96000  |      ;
                       STA.W $0B9C,X                        ;80D595|9D9C0B  |800B9C;
                       RTS                                  ;80D598|60      |      ;
                       REP #$30                             ;80D599|C230    |      ;
                       LDX.W $075E                          ;80D59B|AE5E07  |80075E;
                       LDA.L $7E8EBC                        ;80D59E|AFBC8E7E|7E8EBC;
                       BEQ +                                ;80D5A2|F001    |80D5A5;
                       db $60                               ;80D5A4|        |      ;
 
                     + LDA.W $035A                          ;80D5A5|AD5A03  |80035A;
                       EOR.W #$0001                         ;80D5A8|490100  |      ;
                       ORA.W #$0010                         ;80D5AB|091000  |      ;
                       STA.W $0C14,X                        ;80D5AE|9D140C  |800C14;
                       LDA.W $035A                          ;80D5B1|AD5A03  |80035A;
                       BNE +                                ;80D5B4|D001    |80D5B7;
                       RTS                                  ;80D5B6|60      |      ;
 
                     + LDA.L $7E8EBA                        ;80D5B7|AFBA8E7E|7E8EBA;
                       BNE +                                ;80D5BB|D006    |80D5C3;
                       LDA.W #$0011                         ;80D5BD|A91100  |      ;
                       STA.W $0C14,X                        ;80D5C0|9D140C  |800C14;
 
                     + LDA.W $035C                          ;80D5C3|AD5C03  |80035C;
                       BEQ +                                ;80D5C6|F001    |80D5C9;
                       RTS                                  ;80D5C8|60      |      ;
 
                     + LDA.W $035E                          ;80D5C9|AD5E03  |80035E;
                       BNE +                                ;80D5CC|D001    |80D5CF;
                       db $60                               ;80D5CE|        |      ;
 
                     + LDA.L $7E38FE                        ;80D5CF|AFFE387E|7E38FE;
                       CMP.W #$0003                         ;80D5D3|C90300  |      ;
                       BNE +                                ;80D5D6|D004    |80D5DC;
                       JSR.W CODE_FN_80D64B                 ;80D5D8|204BD6  |80D64B;
                       RTS                                  ;80D5DB|60      |      ;
 
                     + JSR.W CODE_FN_80D5E0                 ;80D5DC|20E0D5  |80D5E0;
                       RTS                                  ;80D5DF|60      |      ;
 
       CODE_FN_80D5E0:
                       LDA.W $00B3                          ;80D5E0|ADB300  |8000B3;
                       AND.W #$0040                         ;80D5E3|294000  |      ;
                       CMP.W #$0040                         ;80D5E6|C94000  |      ;
                       BNE +                                ;80D5E9|D009    |80D5F4;
                       db $A9,$01,$00,$9D,$14,$0C,$4C,$35   ;80D5EB|        |      ;
                       db $D6                               ;80D5F3|        |0000AD;
 
                     + LDA.W $00BB                          ;80D5F4|ADBB00  |8000BB;
                       AND.W #$0800                         ;80D5F7|290008  |      ;
                       CMP.W #$0800                         ;80D5FA|C90008  |      ;
                       BNE +                                ;80D5FD|D010    |80D60F;
                       LDA.W #$0000                         ;80D5FF|A90000  |      ;
                       STA.L $7E8EB8                        ;80D602|8FB88E7E|7E8EB8;
                       LDA.W #$0003                         ;80D606|A90300  |      ;
                       STA.W $1988                          ;80D609|8D8819  |001988;
                       JMP.W CODE_JP_80D635                 ;80D60C|4C35D6  |80D635;
 
                     + LDA.W $00BB                          ;80D60F|ADBB00  |8000BB;
                       AND.W #$0400                         ;80D612|290004  |      ;
                       CMP.W #$0400                         ;80D615|C90004  |      ;
                       BNE CODE_JP_80D635                   ;80D618|D01B    |80D635;
                       LDA.W #$0001                         ;80D61A|A90100  |      ;
                       STA.L $7E8EB8                        ;80D61D|8FB88E7E|7E8EB8;
                       LDA.W $0356                          ;80D621|AD5603  |800356;
                       BEQ +                                ;80D624|F009    |80D62F;
                       LDA.W #$0003                         ;80D626|A90300  |      ;
                       STA.W $1988                          ;80D629|8D8819  |801988;
                       JMP.W CODE_JP_80D635                 ;80D62C|4C35D6  |80D635;
 
                     + LDA.W #$0001                         ;80D62F|A90100  |      ;
                       STA.W $1988                          ;80D632|8D8819  |801988;
 
       CODE_JP_80D635:
                       LDA.L $7E8EB8                        ;80D635|AFB88E7E|7E8EB8;
                       BNE +                                ;80D639|D009    |80D644;
                       LDA.W #$0077                         ;80D63B|A97700  |      ;
                       STA.W $0B9C,X                        ;80D63E|9D9C0B  |800B9C;
                       JMP.W CODE_JP_80D64A                 ;80D641|4C4AD6  |80D64A;
 
                     + LDA.W #$0083                         ;80D644|A98300  |      ;
                       STA.W $0B9C,X                        ;80D647|9D9C0B  |800B9C;
 
       CODE_JP_80D64A:
                       RTS                                  ;80D64A|60      |      ;
 
       CODE_FN_80D64B:
                       LDA.W $00B3                          ;80D64B|ADB300  |0000B3;
                       AND.W #$0040                         ;80D64E|294000  |      ;
                       CMP.W #$0040                         ;80D651|C94000  |      ;
                       BNE +                                ;80D654|D009    |80D65F;
                       db $A9,$01,$00,$9D,$14,$0C,$4C,$A0   ;80D656|        |      ;
                       db $D6                               ;80D65E|        |0000AD;
 
                     + LDA.W $00BB                          ;80D65F|ADBB00  |0000BB;
                       AND.W #$0800                         ;80D662|290008  |      ;
                       CMP.W #$0800                         ;80D665|C90008  |      ;
                       BNE +                                ;80D668|D014    |80D67E;
                       db $AF,$B8,$8E,$7E,$F0,$05,$3A,$8F   ;80D66A|        |7E8EB8;
                       db $B8,$8E,$7E,$A9,$03,$00,$8D,$88   ;80D672|        |      ;
                       db $19,$4C,$A0,$D6                   ;80D67A|        |00A04C;
 
                     + LDA.W $00BB                          ;80D67E|ADBB00  |0000BB;
                       AND.W #$0400                         ;80D681|290004  |      ;
                       CMP.W #$0400                         ;80D684|C90004  |      ;
                       BNE +                                ;80D687|D017    |80D6A0;
                       db $AF,$B8,$8E,$7E,$C9,$02,$00,$F0   ;80D689|        |7E8EB8;
                       db $05,$1A,$8F,$B8,$8E,$7E,$A9,$01   ;80D691|        |00001A;
                       db $00,$8D,$88,$19,$4C,$A0,$D6       ;80D699|        |      ;
 
                     + LDA.L $7E8EB8                        ;80D6A0|AFB88E7E|7E8EB8;
                       BNE UNREACH_80D6AD                   ;80D6A4|D007    |80D6AD;
                       LDA.W #$0077                         ;80D6A6|A97700  |      ;
                       STA.W $0B9C,X                        ;80D6A9|9D9C0B  |000B9C;
                       RTS                                  ;80D6AC|60      |      ;
 
       UNREACH_80D6AD:
                       db $C9,$01,$00,$D0,$07,$A9,$85,$00   ;80D6AD|        |      ;
                       db $9D,$9C,$0B,$60,$A9,$93,$00,$9D   ;80D6B5|        |000B9C;
                       db $9C,$0B,$60                       ;80D6BD|        |00600B;
                       REP #$30                             ;80D6C0|C230    |      ;
                       LDX.W $075E                          ;80D6C2|AE5E07  |80075E;
                       LDA.L $7E8EBA                        ;80D6C5|AFBA8E7E|7E8EBA;
                       BEQ +                                ;80D6C9|F001    |80D6CC;
                       RTS                                  ;80D6CB|60      |      ;
 
                     + LDA.W $035A                          ;80D6CC|AD5A03  |80035A;
                       EOR.W #$0001                         ;80D6CF|490100  |      ;
                       ORA.W #$0010                         ;80D6D2|091000  |      ;
                       STA.W $0C14,X                        ;80D6D5|9D140C  |800C14;
                       LDA.W $035A                          ;80D6D8|AD5A03  |80035A;
                       BNE +                                ;80D6DB|D001    |80D6DE;
                       RTS                                  ;80D6DD|60      |      ;
 
                     + LDA.L $7E8EBC                        ;80D6DE|AFBC8E7E|7E8EBC;
                       BNE +                                ;80D6E2|D006    |80D6EA;
                       LDA.W #$0011                         ;80D6E4|A91100  |      ;
                       STA.W $0C14,X                        ;80D6E7|9D140C  |800C14;
 
                     + LDA.W $035C                          ;80D6EA|AD5C03  |80035C;
                       BEQ UNREACH_80D6F0                   ;80D6ED|F001    |80D6F0;
                       RTS                                  ;80D6EF|60      |      ;
 
       UNREACH_80D6F0:
                       db $AD,$5E,$03,$D0,$01,$60,$AD,$A8   ;80D6F0|        |00035E;
                       db $02,$C9,$01,$00,$F0,$5C,$AD,$B5   ;80D6F8|        |      ;
                       db $00,$29,$40,$00,$C9,$40,$00,$D0   ;80D700|        |      ;
                       db $09,$A9,$01,$00,$9D,$14,$0C,$4C   ;80D708|        |      ;
                       db $45,$D7,$AD,$BD,$00,$29,$00,$08   ;80D710|        |0000D7;
                       db $C9,$00,$08,$D0,$10,$A9,$00,$00   ;80D718|        |      ;
                       db $8F,$B8,$8E,$7E,$A9,$02,$00,$8D   ;80D720|        |7E8EB8;
                       db $88,$19,$4C,$45,$D7,$AD,$BD,$00   ;80D728|        |      ;
                       db $29,$00,$04,$C9,$00,$04,$D0,$0D   ;80D730|        |      ;
                       db $A9,$01,$00,$8F,$B8,$8E,$7E,$A9   ;80D738|        |      ;
                       db $02,$00,$8D,$88,$19,$AF,$B8,$8E   ;80D740|        |      ;
                       db $7E,$D0,$09,$A9,$77,$00,$9D,$9C   ;80D748|        |0009D0;
                       db $0B,$4C,$5A,$D7,$A9,$83,$00,$9D   ;80D750|        |      ;
                       db $9C,$0B,$60                       ;80D758|        |00600B;
                       REP #$30                             ;80D75B|C230    |      ;
                       LDX.W $075E                          ;80D75D|AE5E07  |80075E;
                       LDA.W $035A                          ;80D760|AD5A03  |80035A;
                       EOR.W #$0001                         ;80D763|490100  |      ;
                       ORA.W #$0010                         ;80D766|091000  |      ;
                       STA.W $0C14,X                        ;80D769|9D140C  |800C14;
                       LDA.W $035A                          ;80D76C|AD5A03  |80035A;
                       BNE +                                ;80D76F|D001    |80D772;
                       RTS                                  ;80D771|60      |      ;
 
                     + LDA.L $7E8EBA                        ;80D772|AFBA8E7E|7E8EBA;
                       BNE +                                ;80D776|D006    |80D77E;
                       LDA.W #$0011                         ;80D778|A91100  |      ;
                       STA.W $0C14,X                        ;80D77B|9D140C  |800C14;
 
                     + LDA.W $035E                          ;80D77E|AD5E03  |80035E;
                       BNE +                                ;80D781|D001    |80D784;
                       RTS                                  ;80D783|60      |      ;
 
                     + LDA.W $00B3                          ;80D784|ADB300  |8000B3;
                       AND.W #$0040                         ;80D787|294000  |      ;
                       CMP.W #$0040                         ;80D78A|C94000  |      ;
                       BNE +                                ;80D78D|D006    |80D795;
                       db $A9,$01,$00,$9D,$14,$0C           ;80D78F|        |      ;
 
                     + RTS                                  ;80D795|60      |      ;
                       REP #$30                             ;80D796|C230    |      ;
                       LDX.W $075E                          ;80D798|AE5E07  |80075E;
                       LDA.W $035A                          ;80D79B|AD5A03  |80035A;
                       EOR.W #$0001                         ;80D79E|490100  |      ;
                       ORA.W #$0010                         ;80D7A1|091000  |      ;
                       STA.W $0C14,X                        ;80D7A4|9D140C  |800C14;
                       LDA.W $035A                          ;80D7A7|AD5A03  |80035A;
                       BNE +                                ;80D7AA|D001    |80D7AD;
                       RTS                                  ;80D7AC|60      |      ;
 
                     + LDA.L $7E8EBC                        ;80D7AD|AFBC8E7E|7E8EBC;
                       BNE +                                ;80D7B1|D006    |80D7B9;
                       LDA.W #$0011                         ;80D7B3|A91100  |      ;
                       STA.W $0C14,X                        ;80D7B6|9D140C  |800C14;
 
                     + LDA.W $035E                          ;80D7B9|AD5E03  |80035E;
                       BNE +                                ;80D7BC|D001    |80D7BF;
                       RTS                                  ;80D7BE|60      |      ;
 
                     + LDA.W $02A8                          ;80D7BF|ADA802  |8002A8;
                       CMP.W #$0001                         ;80D7C2|C90100  |      ;
                       BEQ +                                ;80D7C5|F011    |80D7D8;
                       LDA.W $00B5                          ;80D7C7|ADB500  |8000B5;
                       AND.W #$0040                         ;80D7CA|294000  |      ;
                       CMP.W #$0040                         ;80D7CD|C94000  |      ;
                       BNE +                                ;80D7D0|D006    |80D7D8;
                       db $A9,$01,$00,$9D,$14,$0C           ;80D7D2|        |      ;
 
                     + RTS                                  ;80D7D8|60      |      ;
                       REP #$30                             ;80D7D9|C230    |      ;
                       PHB                                  ;80D7DB|8B      |      ;
                       PHK                                  ;80D7DC|4B      |      ;
                       PLB                                  ;80D7DD|AB      |      ;
                       LDX.W $075E                          ;80D7DE|AE5E07  |80075E;
                       LDA.L $7E8EBE                        ;80D7E1|AFBE8E7E|7E8EBE;
                       TAY                                  ;80D7E5|A8      |      ;
                       LDA.W DATA8_80F535,Y                 ;80D7E6|B935F5  |80F535;
                       CMP.W #$8000                         ;80D7E9|C90080  |      ;
                       BEQ +                                ;80D7EC|F013    |80D801;
                       CLC                                  ;80D7EE|18      |      ;
                       ADC.W $0B9C,X                        ;80D7EF|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D7F2|9D9C0B  |800B9C;
                       LDA.L $7E8EBE                        ;80D7F5|AFBE8E7E|7E8EBE;
                       INC A                                ;80D7F9|1A      |      ;
                       INC A                                ;80D7FA|1A      |      ;
                       STA.L $7E8EBE                        ;80D7FB|8FBE8E7E|7E8EBE;
                       PLB                                  ;80D7FF|AB      |      ;
                       RTS                                  ;80D800|60      |      ;
 
                     + LDA.W #$0001                         ;80D801|A90100  |      ;
                       STA.L $7E655F                        ;80D804|8F5F657E|7E655F;
                       PLB                                  ;80D808|AB      |      ;
                       RTS                                  ;80D809|60      |      ;
                       REP #$30                             ;80D80A|C230    |      ;
                       PHB                                  ;80D80C|8B      |      ;
                       PHK                                  ;80D80D|4B      |      ;
                       PLB                                  ;80D80E|AB      |      ;
                       LDX.W $075E                          ;80D80F|AE5E07  |80075E;
                       LDA.L $7E8EC0                        ;80D812|AFC08E7E|7E8EC0;
                       TAY                                  ;80D816|A8      |      ;
                       LDA.W DATA8_80F535,Y                 ;80D817|B935F5  |80F535;
                       CMP.W #$8000                         ;80D81A|C90080  |      ;
                       BEQ +                                ;80D81D|F013    |80D832;
                       CLC                                  ;80D81F|18      |      ;
                       ADC.W $0B9C,X                        ;80D820|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D823|9D9C0B  |800B9C;
                       LDA.L $7E8EC0                        ;80D826|AFC08E7E|7E8EC0;
                       INC A                                ;80D82A|1A      |      ;
                       INC A                                ;80D82B|1A      |      ;
                       STA.L $7E8EC0                        ;80D82C|8FC08E7E|7E8EC0;
                       PLB                                  ;80D830|AB      |      ;
                       RTS                                  ;80D831|60      |      ;
 
                     + LDA.W #$0001                         ;80D832|A90100  |      ;
                       STA.L $7E655F                        ;80D835|8F5F657E|7E655F;
                       PLB                                  ;80D839|AB      |      ;
                       RTS                                  ;80D83A|60      |      ;
                       REP #$30                             ;80D83B|C230    |      ;
                       RTS                                  ;80D83D|60      |      ;
                       REP #$30                             ;80D83E|C230    |      ;
                       LDX.W $075E                          ;80D840|AE5E07  |80075E;
                       LDA.L $7E8EC6                        ;80D843|AFC68E7E|7E8EC6;
                       BEQ +                                ;80D847|F02D    |80D876;
                       LDA.W $00A7                          ;80D849|ADA700  |8000A7;
                       LSR A                                ;80D84C|4A      |      ;
                       BCC ++                               ;80D84D|9026    |80D875;
                       LDA.L $7E8EC6                        ;80D84F|AFC68E7E|7E8EC6;
                       LSR A                                ;80D853|4A      |      ;
                       BCC +++                              ;80D854|9010    |80D866;
                       LDA.W #$0001                         ;80D856|A90100  |      ;
                       STA.W $0C14,X                        ;80D859|9D140C  |800C14;
                       LDA.L $7E8EC6                        ;80D85C|AFC68E7E|7E8EC6;
                       DEC A                                ;80D860|3A      |      ;
                       STA.L $7E8EC6                        ;80D861|8FC68E7E|7E8EC6;
                       RTS                                  ;80D865|60      |      ;
 
                   +++ LDA.W #$0000                         ;80D866|A90000  |      ;
                       STA.W $0C14,X                        ;80D869|9D140C  |800C14;
                       LDA.L $7E8EC6                        ;80D86C|AFC68E7E|7E8EC6;
                       DEC A                                ;80D870|3A      |      ;
                       STA.L $7E8EC6                        ;80D871|8FC68E7E|7E8EC6;
 
                    ++ RTS                                  ;80D875|60      |      ;
 
                     + STZ.W $0764,X                        ;80D876|9E6407  |800764;
                       RTS                                  ;80D879|60      |      ;
                       REP #$30                             ;80D87A|C230    |      ;
                       LDX.W $075E                          ;80D87C|AE5E07  |80075E;
                       LDA.L $7E8EC6                        ;80D87F|AFC68E7E|7E8EC6;
                       BEQ +                                ;80D883|F01B    |80D8A0;
                       LDA.W $00A7                          ;80D885|ADA700  |8000A7;
                       LSR A                                ;80D888|4A      |      ;
                       BCC ++                               ;80D889|9014    |80D89F;
                       LDA.L $7E8EC6                        ;80D88B|AFC68E7E|7E8EC6;
                       LSR A                                ;80D88F|4A      |      ;
                       BCC +++                              ;80D890|9007    |80D899;
                       LDA.W #$0001                         ;80D892|A90100  |      ;
                       STA.W $0C14,X                        ;80D895|9D140C  |800C14;
                       RTS                                  ;80D898|60      |      ;
 
                   +++ LDA.W #$0000                         ;80D899|A90000  |      ;
                       STA.W $0C14,X                        ;80D89C|9D140C  |800C14;
 
                    ++ RTS                                  ;80D89F|60      |      ;
 
                     + STZ.W $0764,X                        ;80D8A0|9E6407  |800764;
                       RTS                                  ;80D8A3|60      |      ;
                       REP #$30                             ;80D8A4|C230    |      ;
                       LDX.W $075E                          ;80D8A6|AE5E07  |80075E;
                       LDA.L $7E8EC6                        ;80D8A9|AFC68E7E|7E8EC6;
                       BEQ +                                ;80D8AD|F01B    |80D8CA;
                       LDA.W $00A7                          ;80D8AF|ADA700  |8000A7;
                       LSR A                                ;80D8B2|4A      |      ;
                       BCC ++                               ;80D8B3|9014    |80D8C9;
                       LDA.L $7E8EC6                        ;80D8B5|AFC68E7E|7E8EC6;
                       LSR A                                ;80D8B9|4A      |      ;
                       BCC +++                              ;80D8BA|9007    |80D8C3;
                       LDA.W #$0001                         ;80D8BC|A90100  |      ;
                       STA.W $0C14,X                        ;80D8BF|9D140C  |800C14;
                       RTS                                  ;80D8C2|60      |      ;
 
                   +++ LDA.W #$0000                         ;80D8C3|A90000  |      ;
                       STA.W $0C14,X                        ;80D8C6|9D140C  |800C14;
 
                    ++ RTS                                  ;80D8C9|60      |      ;
 
                     + LDA.W #$0000                         ;80D8CA|A90000  |      ;
                       STA.W $0C14,X                        ;80D8CD|9D140C  |800C14;
                       LDA.L $7E8EC8                        ;80D8D0|AFC88E7E|7E8EC8;
                       ASL A                                ;80D8D4|0A      |      ;
                       TAY                                  ;80D8D5|A8      |      ;
                       LDA.W DATA8_80F5DB,Y                 ;80D8D6|B9DBF5  |80F5DB;
                       CMP.W #$8000                         ;80D8D9|C90080  |      ;
                       BEQ +                                ;80D8DC|F020    |80D8FE;
                       CLC                                  ;80D8DE|18      |      ;
                       ADC.W $0AAC,X                        ;80D8DF|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D8E2|9DAC0A  |800AAC;
                       LDA.W DATA8_80F5FD,Y                 ;80D8E5|B9FDF5  |80F5FD;
                       CMP.W #$8000                         ;80D8E8|C90080  |      ;
                       BEQ +                                ;80D8EB|F011    |80D8FE;
                       CLC                                  ;80D8ED|18      |      ;
                       ADC.W $0B9C,X                        ;80D8EE|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D8F1|9D9C0B  |800B9C;
                       LDA.L $7E8EC8                        ;80D8F4|AFC88E7E|7E8EC8;
                       INC A                                ;80D8F8|1A      |      ;
                       STA.L $7E8EC8                        ;80D8F9|8FC88E7E|7E8EC8;
                       RTS                                  ;80D8FD|60      |      ;
 
                     + STZ.W $0764,X                        ;80D8FE|9E6407  |800764;
                       LDA.L TimeSet_Selection              ;80D901|AF62947E|7E9462;
                       BNE UNREACH_80D90C                   ;80D905|D005    |80D90C;
                       LDA.W #$0002                         ;80D907|A90200  |      ;
                       BRA +                                ;80D90A|8003    |80D90F;
 
       UNREACH_80D90C:
                       db $A9,$01,$00                       ;80D90C|        |      ;
 
                     + STA.W $038E                          ;80D90F|8D8E03  |80038E;
                       LDA.W #$0000                         ;80D912|A90000  |      ;
                       STA.W $0390                          ;80D915|8D9003  |800390;
                       STZ.W $0356                          ;80D918|9C5603  |800356;
                       JSL.L CODE_FL_85AC74                 ;80D91B|2274AC85|85AC74;
                       PHB                                  ;80D91F|8B      |      ;
                       PHK                                  ;80D920|4B      |      ;
                       PLB                                  ;80D921|AB      |      ;
                       LDY.W #$D92C                         ;80D922|A02CD9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80D925|22CAA080|80A0CA;
                       PLB                                  ;80D929|AB      |      ;
                       BRA +                                ;80D92A|8008    |80D934;
                       db $00,$20,$7E,$00,$08,$80,$00,$70   ;80D92C|        |      ;
 
                     + RTS                                  ;80D934|60      |      ;
                       REP #$30                             ;80D935|C230    |      ;
                       LDX.W $075E                          ;80D937|AE5E07  |80075E;
                       LDA.L $7E8EC6                        ;80D93A|AFC68E7E|7E8EC6;
                       BEQ +                                ;80D93E|F01B    |80D95B;
                       LDA.W $00A7                          ;80D940|ADA700  |8000A7;
                       LSR A                                ;80D943|4A      |      ;
                       BCC ++                               ;80D944|9014    |80D95A;
                       LDA.L $7E8EC6                        ;80D946|AFC68E7E|7E8EC6;
                       LSR A                                ;80D94A|4A      |      ;
                       BCC +++                              ;80D94B|9007    |80D954;
                       LDA.W #$0001                         ;80D94D|A90100  |      ;
                       STA.W $0C14,X                        ;80D950|9D140C  |800C14;
                       RTS                                  ;80D953|60      |      ;
 
                   +++ LDA.W #$0000                         ;80D954|A90000  |      ;
                       STA.W $0C14,X                        ;80D957|9D140C  |800C14;
 
                    ++ RTS                                  ;80D95A|60      |      ;
 
                     + LDA.W #$0000                         ;80D95B|A90000  |      ;
                       STA.W $0C14,X                        ;80D95E|9D140C  |800C14;
                       LDA.L $7E8EC8                        ;80D961|AFC88E7E|7E8EC8;
                       ASL A                                ;80D965|0A      |      ;
                       TAY                                  ;80D966|A8      |      ;
                       LDA.W UNREACH_80F61F,Y               ;80D967|B91FF6  |80F61F;
                       CMP.W #$8000                         ;80D96A|C90080  |      ;
                       BEQ +                                ;80D96D|F020    |80D98F;
                       CLC                                  ;80D96F|18      |      ;
                       ADC.W $0AAC,X                        ;80D970|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80D973|9DAC0A  |800AAC;
                       LDA.W UNREACH_80F641,Y               ;80D976|B941F6  |80F641;
                       CMP.W #$8000                         ;80D979|C90080  |      ;
                       BEQ +                                ;80D97C|F011    |80D98F;
                       CLC                                  ;80D97E|18      |      ;
                       ADC.W $0B9C,X                        ;80D97F|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80D982|9D9C0B  |800B9C;
                       LDA.L $7E8EC8                        ;80D985|AFC88E7E|7E8EC8;
                       INC A                                ;80D989|1A      |      ;
                       STA.L $7E8EC8                        ;80D98A|8FC88E7E|7E8EC8;
                       RTS                                  ;80D98E|60      |      ;
 
                     + STZ.W $0764,X                        ;80D98F|9E6407  |800764;
                       LDA.L TimeSet_Selection              ;80D992|AF62947E|7E9462;
                       BNE UNREACH_80D99D                   ;80D996|D005    |80D99D;
                       LDA.W #$0002                         ;80D998|A90200  |      ;
                       BRA +                                ;80D99B|8003    |80D9A0;
 
       UNREACH_80D99D:
                       db $A9,$01,$00                       ;80D99D|        |      ;
 
                     + STA.W $038E                          ;80D9A0|8D8E03  |80038E;
                       LDA.W #$0000                         ;80D9A3|A90000  |      ;
                       STA.W $0390                          ;80D9A6|8D9003  |800390;
                       JSL.L CODE_FL_85B366                 ;80D9A9|2266B385|85B366;
                       PHB                                  ;80D9AD|8B      |      ;
                       PHK                                  ;80D9AE|4B      |      ;
                       PLB                                  ;80D9AF|AB      |      ;
                       LDY.W #$D9BA                         ;80D9B0|A0BAD9  |      ;
                       JSL.L CODE_FL_80A0CA                 ;80D9B3|22CAA080|80A0CA;
                       PLB                                  ;80D9B7|AB      |      ;
                       BRA +                                ;80D9B8|8008    |80D9C2;
                       db $00,$20,$7E,$00,$08,$80,$00,$70   ;80D9BA|        |      ;
 
                     + RTS                                  ;80D9C2|60      |      ;
                       REP #$30                             ;80D9C3|C230    |      ;
                       LDX.W $075E                          ;80D9C5|AE5E07  |80075E;
                       LDA.L $7E8EC6                        ;80D9C8|AFC68E7E|7E8EC6;
                       BEQ +                                ;80D9CC|F01B    |80D9E9;
                       LDA.W $00A7                          ;80D9CE|ADA700  |8000A7;
                       LSR A                                ;80D9D1|4A      |      ;
                       BCC ++                               ;80D9D2|9014    |80D9E8;
                       LDA.L $7E8EC6                        ;80D9D4|AFC68E7E|7E8EC6;
                       LSR A                                ;80D9D8|4A      |      ;
                       BCC +++                              ;80D9D9|9007    |80D9E2;
                       LDA.W #$0001                         ;80D9DB|A90100  |      ;
                       STA.W $0C14,X                        ;80D9DE|9D140C  |800C14;
                       RTS                                  ;80D9E1|60      |      ;
 
                   +++ LDA.W #$0000                         ;80D9E2|A90000  |      ;
                       STA.W $0C14,X                        ;80D9E5|9D140C  |800C14;
 
                    ++ RTS                                  ;80D9E8|60      |      ;
 
                     + LDA.W #$0000                         ;80D9E9|A90000  |      ;
                       STA.W $0C14,X                        ;80D9EC|9D140C  |800C14;
                       LDA.L $7E8ECA                        ;80D9EF|AFCA8E7E|7E8ECA;
                       ASL A                                ;80D9F3|0A      |      ;
                       TAY                                  ;80D9F4|A8      |      ;
                       LDA.W UNREACH_80F663,Y               ;80D9F5|B963F6  |80F663;
                       CMP.W #$8000                         ;80D9F8|C90080  |      ;
                       BEQ +                                ;80D9FB|F020    |80DA1D;
                       CLC                                  ;80D9FD|18      |      ;
                       ADC.W $0AAC,X                        ;80D9FE|7DAC0A  |800AAC;
                       STA.W $0AAC,X                        ;80DA01|9DAC0A  |800AAC;
                       LDA.W UNREACH_80F685,Y               ;80DA04|B985F6  |80F685;
                       CMP.W #$8000                         ;80DA07|C90080  |      ;
                       BEQ +                                ;80DA0A|F011    |80DA1D;
                       CLC                                  ;80DA0C|18      |      ;
                       ADC.W $0B9C,X                        ;80DA0D|7D9C0B  |800B9C;
                       STA.W $0B9C,X                        ;80DA10|9D9C0B  |800B9C;
                       LDA.L $7E8ECA                        ;80DA13|AFCA8E7E|7E8ECA;
                       INC A                                ;80DA17|1A      |      ;
                       STA.L $7E8ECA                        ;80DA18|8FCA8E7E|7E8ECA;
                       RTS                                  ;80DA1C|60      |      ;
 
                     + STZ.W $0764,X                        ;80DA1D|9E6407  |800764;
                       RTS                                  ;80DA20|60      |      ;
                       REP #$30                             ;80DA21|C230    |      ;
                       LDX.W $075E                          ;80DA23|AE5E07  |80075E;
                       LDA.L $7E52F7                        ;80DA26|AFF7527E|7E52F7;
                       BNE +                                ;80DA2A|D009    |80DA35;
                       LDA.W #$0007                         ;80DA2C|A90700  |      ;
                       STA.W $0C14,X                        ;80DA2F|9D140C  |800C14;
                       JMP.W CODE_JP_80DA3B                 ;80DA32|4C3BDA  |80DA3B;
 
                     + LDA.W #$0000                         ;80DA35|A90000  |      ;
                       STA.W $0C14,X                        ;80DA38|9D140C  |800C14;
 
       CODE_JP_80DA3B:
                       LDA.W $00A7                          ;80DA3B|ADA700  |8000A7;
                       LSR A                                ;80DA3E|4A      |      ;
                       BCC +                                ;80DA3F|9015    |80DA56;
                       LDA.W $0AAC,X                        ;80DA41|BDAC0A  |800AAC;
                       CLC                                  ;80DA44|18      |      ;
                       ADC.W #$0010                         ;80DA45|691000  |      ;
                       STA.W $0AAC,X                        ;80DA48|9DAC0A  |800AAC;
                       CMP.W #$00B8                         ;80DA4B|C9B800  |      ;
                       BNE +                                ;80DA4E|D006    |80DA56;
                       LDA.W #$0058                         ;80DA50|A95800  |      ;
                       STA.W $0AAC,X                        ;80DA53|9DAC0A  |800AAC;
 
                     + RTS                                  ;80DA56|60      |      ;
                       REP #$30                             ;80DA57|C230    |      ;
                       LDX.W $075E                          ;80DA59|AE5E07  |80075E;
                       LDA.L $7E52F7                        ;80DA5C|AFF7527E|7E52F7;
                       BNE +                                ;80DA60|D009    |80DA6B;
                       LDA.W #$0007                         ;80DA62|A90700  |      ;
                       STA.W $0C14,X                        ;80DA65|9D140C  |800C14;
                       JMP.W CODE_JP_80DA71                 ;80DA68|4C71DA  |80DA71;
 
                     + LDA.W #$0000                         ;80DA6B|A90000  |      ;
                       STA.W $0C14,X                        ;80DA6E|9D140C  |800C14;
 
       CODE_JP_80DA71:
                       RTS                                  ;80DA71|60      |      ;
                       db $10,$00,$64,$DB,$10,$00,$7A,$DB   ;80DA72|        |      ;
                       db $45,$CF,$72,$DA,$10,$00,$90,$DB   ;80DA7A|        |      ;
                       db $10,$00,$A6,$DB,$45,$CF,$7E,$DA   ;80DA82|        |      ;
                       db $01,$00,$BC,$DB,$45,$CF,$8A,$DA   ;80DA8A|        |      ;
                       db $01,$00,$C3,$DB,$45,$CF,$92,$DA   ;80DA92|        |      ;
                       db $01,$00,$CA,$DB,$45,$CF,$9A,$DA   ;80DA9A|        |      ;
                       db $01,$00,$D1,$DB,$45,$CF,$A2,$DA   ;80DAA2|        |      ;
                       db $01,$00,$D8,$DB,$45,$CF,$AA,$DA   ;80DAAA|        |      ;
                       db $01,$00,$DF,$DB,$45,$CF,$B2,$DA   ;80DAB2|        |      ;
                       db $01,$00,$E6,$DB,$45,$CF,$BA,$DA   ;80DABA|        |      ;
                       db $01,$00,$F4,$DB,$45,$CF,$C2,$DA   ;80DAC2|        |      ;
                       db $10,$00,$B9,$DC,$08,$00,$C0,$DC   ;80DACA|        |      ;
                       db $45,$CF,$CA,$DA,$01,$00,$C7,$DC   ;80DAD2|        |      ;
                       db $45,$CF,$D6,$DA,$01,$00,$0F,$DD   ;80DADA|        |      ;
                       db $45,$CF,$DE,$DA,$01,$00,$05,$DC   ;80DAE2|        |      ;
                       db $45,$CF,$E6,$DA,$3C,$00,$1B,$DC   ;80DAEA|        |      ;
                       db $14,$00,$22,$DC,$35,$CF,$14,$DB   ;80DAF2|        |      ;
                       db $28,$00,$22,$DC,$3B,$00,$29,$DC   ;80DAFA|        |      ;
                       db $35,$CF,$0C,$DB,$01,$00,$29,$DC   ;80DB02|        |      ;
                       db $1D,$CF                           ;80DB0A|        |      ;
                       LDA.W #$0001                         ;80DB0C|A90100  |      ;
                       STA.L $7E6561                        ;80DB0F|8F61657E|7E6561;
                       RTS                                  ;80DB13|60      |      ;
                       LDA.W $02A8                          ;80DB14|ADA802  |8002A8;
                       BNE +                                ;80DB17|D008    |80DB21;
                       LDA.W #$0014                         ;80DB19|A91400  |      ;
                       JSL.L CODE_FL_80C612                 ;80DB1C|2212C680|80C612;
                       RTS                                  ;80DB20|60      |      ;
 
                     + LDA.W #$0014                         ;80DB21|A91400  |      ;
                       JSL.L CODE_FL_80C612                 ;80DB24|2212C680|80C612;
                       LDA.W #$0015                         ;80DB28|A91500  |      ;
                       JSL.L CODE_FL_80C612                 ;80DB2B|2212C680|80C612;
                       RTS                                  ;80DB2F|60      |      ;
                       db $01,$00,$30,$DC,$45,$CF,$30,$DB   ;80DB30|        |      ;
                       db $01,$00,$46,$DC,$45,$CF,$38,$DB   ;80DB38|        |      ;
                       db $01,$00,$6B,$DC,$45,$CF,$40,$DB   ;80DB40|        |000000;
                       db $01,$00,$90,$DC,$45,$CF,$48,$DB   ;80DB48|        |      ;
                       db $30,$00,$97,$DC,$08,$00,$A8,$DC   ;80DB50|        |      ;
                       db $08,$00,$97,$DC,$08,$00,$A8,$DC   ;80DB58|        |      ;
                       db $45,$CF,$50,$DB,$04,$00,$FD,$01   ;80DB60|        |      ;
                       db $0B,$00,$B0,$09,$00,$0B,$10,$B0   ;80DB68|        |      ;
                       db $09,$00,$FD,$10,$30,$FD,$01,$FD   ;80DB70|        |      ;
                       db $00,$30,$04,$00,$FE,$01,$0A,$00   ;80DB78|        |      ;
                       db $B0,$09,$00,$0A,$10,$B0,$09,$00   ;80DB80|        |      ;
                       db $FE,$10,$30,$FE,$01,$FE,$00,$30   ;80DB88|        |      ;
                       db $04,$00,$0B,$00,$0B,$00,$F0,$FF   ;80DB90|        |      ;
                       db $01,$0B,$10,$F0,$FF,$01,$FD,$10   ;80DB98|        |      ;
                       db $70,$0B,$00,$FD,$00,$70,$04,$00   ;80DBA0|        |      ;
                       db $0A,$00,$0A,$00,$F0,$FF,$01,$0A   ;80DBA8|        |      ;
                       db $10,$F0,$FF,$01,$FE,$10,$70,$0A   ;80DBB0|        |      ;
                       db $00,$FE,$00,$70,$01,$00,$F8,$81   ;80DBB8|        |      ;
                       db $F8,$40,$34,$01,$00,$F8,$81,$F8   ;80DBC0|        |      ;
                       db $42,$34,$01,$00,$F8,$81,$F8,$44   ;80DBC8|        |      ;
                       db $34,$01,$00,$F8,$81,$F8,$46,$34   ;80DBD0|        |      ;
                       db $01,$00,$F8,$81,$F8,$48,$36,$01   ;80DBD8|        |      ;
                       db $00,$F8,$81,$F8,$4A,$36,$01,$00   ;80DBE0|        |      ;
                       db $F8,$81,$F8,$4C,$36               ;80DBE8|        |      ;
                       db $01,$00,$00,$00,$00,$01,$30       ;80DBED|        |000000;
                       db $03,$00,$09,$80,$F8,$6E,$30,$F9   ;80DBF4|        |      ;
                       db $81,$F8,$6C,$30,$E9,$81,$F8,$6A   ;80DBFC|        |      ;
                       db $30,$04,$00,$10,$80,$F8,$26,$30   ;80DC04|        |      ;
                       db $00,$80,$F8,$24,$30,$F0,$81,$F8   ;80DC0C|        |      ;
                       db $22,$30,$E0,$81,$F8,$20,$30,$01   ;80DC14|        |      ;
                       db $00,$F8,$81,$08,$28,$30,$01,$00   ;80DC1C|        |      ;
                       db $F8,$81,$08,$2A,$30,$01,$00,$F8   ;80DC24|        |      ;
                       db $81,$08,$2C,$30,$04,$00,$18,$00   ;80DC2C|        |      ;
                       db $F7,$45,$32,$10,$00,$F7,$44,$32   ;80DC34|        |      ;
                       db $08,$00,$F7,$43,$32,$00,$00,$F7   ;80DC3C|        |      ;
                       db $42,$32,$07,$00,$08,$00,$00,$52   ;80DC44|        |      ;
                       db $32,$18,$00,$08,$51,$32,$18,$00   ;80DC4C|        |      ;
                       db $00,$41,$32,$10,$00,$08,$51,$32   ;80DC54|        |      ;
                       db $10,$00,$00,$41,$32,$00,$00,$08   ;80DC5C|        |      ;
                       db $50,$32,$00,$00,$00,$40,$32       ;80DC64|        |      ;
                       db $07,$00,$00,$00,$08,$54,$32,$00   ;80DC6B|        |000000;
                       db $00,$00,$53,$32,$08,$00,$00,$52   ;80DC73|        |      ;
                       db $32,$18,$00,$08,$51,$32,$18,$00   ;80DC7B|        |000018;
                       db $00,$41,$32,$10,$00,$08,$51,$32   ;80DC83|        |      ;
                       db $10,$00,$00,$41,$32               ;80DC8B|        |80DC8D;
                       db $01,$00,$00,$80,$00,$4E,$30,$03   ;80DC90|        |      ;
                       db $00,$00,$00,$FB,$2F,$32,$18,$80   ;80DC98|        |      ;
                       db $F6,$22,$32,$08,$80,$F6,$20,$32   ;80DCA0|        |      ;
                       db $03,$00,$F4,$00,$EF,$2F,$32,$0C   ;80DCA8|        |      ;
                       db $81,$EA,$22,$32,$FC,$80,$EA,$20   ;80DCB0|        |      ;
                       db $32,$01,$00,$00,$00,$00,$4C,$30   ;80DCB8|        |      ;
                       db $01,$00,$F4,$00,$F4,$4C,$30,$0E   ;80DCC0|        |      ;
                       db $00,$40,$80,$10,$40,$30,$50,$00   ;80DCC8|        |      ;
                       db $10,$30,$F0,$50,$00,$18,$20,$F0   ;80DCD0|        |      ;
                       db $50,$00,$08,$30,$70,$50,$00,$00   ;80DCD8|        |      ;
                       db $20,$70,$30,$80,$10,$2E,$30,$20   ;80DCE0|        |      ;
                       db $80,$10,$2C,$30,$10,$80,$10,$2A   ;80DCE8|        |      ;
                       db $30,$00,$80,$10,$20,$B0,$40,$80   ;80DCF0|        |      ;
                       db $00,$28,$30,$30,$80,$00,$26,$30   ;80DCF8|        |      ;
                       db $20,$80,$00,$24,$30,$10,$80,$00   ;80DD00|        |      ;
                       db $22,$30,$00,$80,$00,$20,$30,$14   ;80DD08|        |      ;
                       db $00,$48,$80,$10,$42,$70,$40,$80   ;80DD10|        |      ;
                       db $10,$4A,$30,$30,$80,$10,$48,$30   ;80DD18|        |      ;
                       db $20,$80,$10,$46,$30,$10,$80,$10   ;80DD20|        |      ;
                       db $44,$30,$00,$80,$10,$42,$30,$40   ;80DD28|        |      ;
                       db $80,$20,$40,$30,$50,$00,$20,$30   ;80DD30|        |      ;
                       db $F0,$50,$00,$28,$20,$F0,$50,$00   ;80DD38|        |      ;
                       db $08,$30,$70,$50,$00,$00,$20,$70   ;80DD40|        |      ;
                       db $30,$80,$20,$2E,$30,$20,$80,$20   ;80DD48|        |      ;
                       db $2C,$30,$10,$80,$20,$2A,$30,$00   ;80DD50|        |      ;
                       db $80,$20,$20,$B0,$40,$80,$00,$28   ;80DD58|        |      ;
                       db $30,$30,$80,$00,$26,$30,$20,$80   ;80DD60|        |      ;
                       db $00,$24,$30,$10,$80,$00,$22,$30   ;80DD68|        |      ;
                       db $00,$80,$00,$20,$30,$A5,$DD,$AE   ;80DD70|        |      ;
                       db $DD,$B1,$DD,$A5,$DD,$AE,$DD,$F3   ;80DD78|        |      ;
                       db $DD,$A5,$DD,$AE,$DD,$35,$DE,$A5   ;80DD80|        |      ;
                       db $DD,$AE,$DD,$77,$DE,$A5,$DD,$AE   ;80DD88|        |      ;
                       db $DD,$B9,$DE,$A5,$DD,$AE,$DD,$FB   ;80DD90|        |      ;
                       db $DE,$A5,$DD,$AE,$DD,$3D,$DF,$A5   ;80DD98|        |      ;
                       db $DD,$AE,$DD,$7F,$DF               ;80DDA0|        |      ;
                       REP #$30                             ;80DDA5|C230    |      ;
                       LDA.W #$0008                         ;80DDA7|A90800  |      ;
                       STA.W $0C14,X                        ;80DDAA|9D140C  |800C14;
                       RTS                                  ;80DDAD|60      |      ;
                       REP #$30                             ;80DDAE|C230    |      ;
                       RTS                                  ;80DDB0|60      |      ;
                       db $01,$00,$D7,$DF,$01,$00,$ED,$DF   ;80DDB1|        |      ;
                       db $01,$00,$03,$E0,$01,$00,$19,$E0   ;80DDB9|        |      ;
                       db $01,$00,$2F,$E0,$01,$00,$45,$E0   ;80DDC1|        |      ;
                       db $01,$00,$5B,$E0,$01,$00,$71,$E0   ;80DDC9|        |      ;
                       db $01,$00,$87,$E0,$01,$00,$9D,$E0   ;80DDD1|        |      ;
                       db $01,$00,$B3,$E0,$02,$00,$C9,$E0   ;80DDD9|        |      ;
                       db $02,$00,$DF,$E0,$02,$00,$F5,$E0   ;80DDE1|        |      ;
                       db $03,$00,$0B,$E1,$04,$00,$21,$E1   ;80DDE9|        |      ;
                       db $1D,$CF,$01,$00,$3E,$E1,$01,$00   ;80DDF1|        |      ;
                       db $54,$E1,$01,$00,$6A,$E1,$01,$00   ;80DDF9|        |      ;
                       db $80,$E1,$01,$00,$96,$E1,$01,$00   ;80DE01|        |      ;
                       db $AC,$E1,$01,$00,$C2,$E1,$01,$00   ;80DE09|        |      ;
                       db $D8,$E1,$01,$00,$EE,$E1,$01,$00   ;80DE11|        |      ;
                       db $04,$E2,$01,$00,$1A,$E2,$02,$00   ;80DE19|        |      ;
                       db $30,$E2,$02,$00,$46,$E2,$02,$00   ;80DE21|        |      ;
                       db $5C,$E2,$03,$00,$72,$E2,$04,$00   ;80DE29|        |      ;
                       db $88,$E2,$1D,$CF,$01,$00,$A5,$E2   ;80DE31|        |      ;
                       db $01,$00,$BB,$E2,$01,$00,$DB,$E2   ;80DE39|        |      ;
                       db $01,$00,$FB,$E2,$01,$00,$1B,$E3   ;80DE41|        |      ;
                       db $01,$00,$3B,$E3,$01,$00,$5B,$E3   ;80DE49|        |      ;
                       db $01,$00,$7B,$E3,$01,$00,$9B,$E3   ;80DE51|        |      ;
                       db $01,$00,$BB,$E3,$01,$00,$DB,$E3   ;80DE59|        |      ;
                       db $02,$00,$FB,$E3,$02,$00,$1B,$E4   ;80DE61|        |      ;
                       db $02,$00,$3B,$E4,$03,$00,$5B,$E4   ;80DE69|        |      ;
                       db $04,$00,$7B,$E4,$1D,$CF,$01,$00   ;80DE71|        |      ;
                       db $98,$E4,$01,$00,$AE,$E4,$01,$00   ;80DE79|        |      ;
                       db $D8,$E4,$01,$00,$02,$E5,$01,$00   ;80DE81|        |      ;
                       db $2C,$E5,$01,$00,$56,$E5,$01,$00   ;80DE89|        |      ;
                       db $80,$E5,$01,$00,$AA,$E5,$01,$00   ;80DE91|        |      ;
                       db $D4,$E5,$01,$00,$FE,$E5,$01,$00   ;80DE99|        |      ;
                       db $28,$E6,$02,$00,$52,$E6,$02,$00   ;80DEA1|        |      ;
                       db $7C,$E6,$02,$00,$A6,$E6,$03,$00   ;80DEA9|        |      ;
                       db $D0,$E6,$04,$00,$FA,$E6,$1D,$CF   ;80DEB1|        |      ;
                       db $01,$00,$26,$E7,$01,$00,$3C,$E7   ;80DEB9|        |      ;
                       db $01,$00,$52,$E7,$01,$00,$68,$E7   ;80DEC1|        |      ;
                       db $01,$00,$7E,$E7,$01,$00,$94,$E7   ;80DEC9|        |      ;
                       db $01,$00,$AA,$E7,$01,$00,$C0,$E7   ;80DED1|        |      ;
                       db $01,$00,$D6,$E7,$01,$00,$EC,$E7   ;80DED9|        |      ;
                       db $01,$00,$02,$E8,$02,$00,$18,$E8   ;80DEE1|        |      ;
                       db $02,$00,$2E,$E8,$02,$00,$44,$E8   ;80DEE9|        |      ;
                       db $03,$00,$5A,$E8,$04,$00,$70,$E8   ;80DEF1|        |      ;
                       db $1D,$CF,$01,$00,$8D,$E8,$01,$00   ;80DEF9|        |      ;
                       db $A3,$E8,$01,$00,$B9,$E8,$01,$00   ;80DF01|        |      ;
                       db $CF,$E8,$01,$00,$E5,$E8,$01,$00   ;80DF09|        |      ;
                       db $FB,$E8,$01,$00,$11,$E9,$01,$00   ;80DF11|        |      ;
                       db $27,$E9,$01,$00,$3D,$E9,$01,$00   ;80DF19|        |      ;
                       db $53,$E9,$01,$00,$69,$E9,$02,$00   ;80DF21|        |      ;
                       db $7F,$E9,$02,$00,$95,$E9,$02,$00   ;80DF29|        |      ;
                       db $AB,$E9,$03,$00,$C1,$E9,$04,$00   ;80DF31|        |      ;
                       db $D7,$E9,$1D,$CF,$01,$00,$F4,$E9   ;80DF39|        |      ;
                       db $01,$00,$0A,$EA,$01,$00,$2A,$EA   ;80DF41|        |      ;
                       db $01,$00,$4A,$EA,$01,$00,$6A,$EA   ;80DF49|        |      ;
                       db $01,$00,$8A,$EA,$01,$00,$AA,$EA   ;80DF51|        |      ;
                       db $01,$00,$CA,$EA,$01,$00,$EA,$EA   ;80DF59|        |      ;
                       db $01,$00,$0A,$EB,$01,$00,$2A,$EB   ;80DF61|        |      ;
                       db $02,$00,$4A,$EB,$02,$00,$6A,$EB   ;80DF69|        |      ;
                       db $02,$00,$8A,$EB,$03,$00,$AA,$EB   ;80DF71|        |      ;
                       db $04,$00,$CA,$EB,$1D,$CF,$01,$00   ;80DF79|        |      ;
                       db $E7,$EB,$01,$00,$FD,$EB,$01,$00   ;80DF81|        |      ;
                       db $27,$EC,$01,$00,$51,$EC,$01,$00   ;80DF89|        |      ;
                       db $7B,$EC,$01,$00,$A5,$EC,$01,$00   ;80DF91|        |      ;
                       db $CF,$EC,$01,$00,$F9,$EC,$01,$00   ;80DF99|        |      ;
                       db $23,$ED,$01,$00,$4D,$ED,$01,$00   ;80DFA1|        |      ;
                       db $77,$ED,$02,$00,$A1,$ED,$02,$00   ;80DFA9|        |      ;
                       db $CB,$ED,$02,$00,$F5,$ED,$03,$00   ;80DFB1|        |      ;
                       db $1F,$EE,$04,$00,$49,$EE,$1D,$CF   ;80DFB9|        |      ;
                       db $04,$00,$F8,$01,$00,$04,$B0,$00   ;80DFC1|        |000000;
                       db $00,$00,$04,$F0,$00,$00,$F8,$04   ;80DFC9|        |      ;
                       db $70,$F8,$01,$F8,$04,$30           ;80DFD1|        |80DFCB;
                       db $04,$00,$F6,$01,$02,$05,$B0,$02   ;80DFD7|        |      ;
                       db $00,$02,$05,$F0,$02,$00,$F6,$05   ;80DFDF|        |      ;
                       db $70,$F6,$01,$F6,$05,$30,$04,$00   ;80DFE7|        |      ;
                       db $F4,$01,$04,$04,$B0,$04,$00,$04   ;80DFEF|        |      ;
                       db $04,$F0,$04,$00,$F4,$04,$70,$F4   ;80DFF7|        |      ;
                       db $01,$F4,$04,$30,$04,$00,$F2,$01   ;80DFFF|        |      ;
                       db $06,$05,$B0,$08,$00,$06,$05,$F0   ;80E007|        |      ;
                       db $08,$00,$F2,$05,$70,$F2,$01,$F2   ;80E00F|        |      ;
                       db $05,$30,$04,$00,$F1,$01,$07,$04   ;80E017|        |      ;
                       db $B0,$09,$00,$07,$04,$F0,$09,$00   ;80E01F|        |      ;
                       db $F1,$04,$70,$F1,$01,$F1,$04,$30   ;80E027|        |      ;
                       db $04,$00,$0A,$00,$08,$05,$F0,$F0   ;80E02F|        |      ;
                       db $01,$08,$05,$B0,$0A,$00,$F0,$05   ;80E037|        |      ;
                       db $70,$F0,$01,$F0,$05,$30,$04,$00   ;80E03F|        |      ;
                       db $EF,$01,$09,$05,$B0,$0B,$00,$09   ;80E047|        |      ;
                       db $05,$F0,$0B,$00,$EF,$05,$70,$EF   ;80E04F|        |      ;
                       db $01,$EF,$05,$30,$04,$00,$EE,$01   ;80E057|        |      ;
                       db $0A,$04,$B0,$0C,$00,$0A,$04,$F0   ;80E05F|        |      ;
                       db $0C,$00,$EE,$04,$70,$EE,$01,$EE   ;80E067|        |      ;
                       db $04,$30,$04,$00,$ED,$01,$0B,$05   ;80E06F|        |      ;
                       db $B0,$0D,$00,$0B,$05,$F0,$0D,$00   ;80E077|        |      ;
                       db $ED,$05,$70,$ED,$01,$ED,$05,$30   ;80E07F|        |      ;
                       db $04,$00,$ED,$01,$0B,$06,$B0,$0D   ;80E087|        |      ;
                       db $00,$0B,$06,$F0,$0D,$00,$ED,$06   ;80E08F|        |      ;
                       db $70,$ED,$01,$ED,$06,$30,$04,$00   ;80E097|        |      ;
                       db $EC,$01,$0C,$06,$B0,$0E,$00,$0C   ;80E09F|        |      ;
                       db $06,$F0,$0E,$00,$EC,$06,$70,$EC   ;80E0A7|        |      ;
                       db $01,$EC,$06,$30,$04,$00,$EC,$01   ;80E0AF|        |      ;
                       db $0C,$07,$B0,$0E,$00,$0C,$07,$F0   ;80E0B7|        |      ;
                       db $0E,$00,$EC,$07,$70,$EC,$01,$EC   ;80E0BF|        |      ;
                       db $07,$30,$04,$00,$EB,$01,$0D,$07   ;80E0C7|        |      ;
                       db $B0,$0F,$00,$0D,$07,$F0,$0F,$00   ;80E0CF|        |      ;
                       db $EB,$07,$70,$EB,$01,$EB,$07,$30   ;80E0D7|        |      ;
                       db $04,$00,$EB,$01,$0D,$14,$B0,$0F   ;80E0DF|        |      ;
                       db $00,$0D,$14,$F0,$0F,$00,$EB,$14   ;80E0E7|        |      ;
                       db $70,$EB,$01,$EB,$14,$30,$04,$00   ;80E0EF|        |      ;
                       db $EB,$01,$0D,$15,$B0,$0F,$00,$0D   ;80E0F7|        |      ;
                       db $15,$F0,$0F,$00,$EB,$15,$70,$EB   ;80E0FF|        |      ;
                       db $01,$EB,$15,$30,$04,$00,$EB,$01   ;80E107|        |      ;
                       db $0D,$16,$B0,$0F,$00,$0D,$16,$F0   ;80E10F|        |      ;
                       db $0F,$00,$EB,$16,$70,$EB,$01,$EB   ;80E117|        |      ;
                       db $16,$30,$04,$00,$EB,$01,$0D,$17   ;80E11F|        |      ;
                       db $B0,$0F,$00,$0D,$17,$F0,$0F,$00   ;80E127|        |      ;
                       db $EB,$17,$70,$EB,$01,$EB,$17,$30   ;80E12F|        |      ;
                       db $01,$00,$F8,$81,$F8,$02,$30       ;80E137|        |000000;
                       db $04,$00,$00,$80,$F0,$02,$30,$F4   ;80E13E|        |      ;
                       db $01,$04,$05,$B0,$04,$00,$04,$05   ;80E146|        |      ;
                       db $F0,$F4,$01,$F4,$05,$30,$04,$00   ;80E14E|        |      ;
                       db $04,$80,$04,$02,$30,$F0,$01,$08   ;80E156|        |      ;
                       db $04,$B0,$08,$00,$F0,$04,$70,$F0   ;80E15E|        |      ;
                       db $01,$F0,$04,$30,$04,$00,$E8,$81   ;80E166|        |      ;
                       db $08,$02,$30,$0E,$00,$0C,$05,$F0   ;80E16E|        |      ;
                       db $0E,$00,$EC,$05,$70,$EC,$01,$EC   ;80E176|        |      ;
                       db $05,$30,$04,$00,$E7,$81,$E7,$02   ;80E17E|        |      ;
                       db $30,$EB,$01,$0D,$04,$B0,$0F,$00   ;80E186|        |      ;
                       db $0D,$04,$F0,$0F,$00,$EB,$04,$70   ;80E18E|        |      ;
                       db $04,$00,$0C,$80,$E6,$02,$30,$10   ;80E196|        |      ;
                       db $00,$0E,$05,$F0,$EA,$01,$0E,$05   ;80E19E|        |      ;
                       db $B0,$EA,$01,$EA,$05,$30,$04,$00   ;80E1A6|        |      ;
                       db $0D,$80,$0B,$02,$30,$E9,$01,$0F   ;80E1AE|        |      ;
                       db $05,$B0,$11,$00,$E9,$05,$70,$E9   ;80E1B6|        |      ;
                       db $01,$E9,$05,$30,$04,$00,$E4,$81   ;80E1BE|        |      ;
                       db $0C,$02,$30,$12,$00,$10,$04,$F0   ;80E1C6|        |      ;
                       db $12,$00,$E8,$04,$70,$E8,$01,$E8   ;80E1CE|        |      ;
                       db $04,$30,$04,$00,$E3,$81,$E3,$02   ;80E1D6|        |      ;
                       db $30,$E7,$01,$11,$05,$B0,$13,$00   ;80E1DE|        |      ;
                       db $11,$05,$F0,$13,$00,$E7,$05,$70   ;80E1E6|        |      ;
                       db $04,$00,$E7,$01,$11,$06,$B0,$13   ;80E1EE|        |      ;
                       db $00,$11,$06,$F0,$13,$00,$E7,$06   ;80E1F6|        |      ;
                       db $70,$E7,$01,$E7,$06,$30,$04,$00   ;80E1FE|        |      ;
                       db $E6,$01,$12,$06,$B0,$14,$00,$12   ;80E206|        |      ;
                       db $06,$F0,$14,$00,$E6,$06,$70,$E6   ;80E20E|        |      ;
                       db $01,$E6,$06,$30,$04,$00,$E6,$01   ;80E216|        |      ;
                       db $12,$07,$B0,$14,$00,$12,$07,$F0   ;80E21E|        |      ;
                       db $14,$00,$E6,$07,$70,$E6,$01,$E6   ;80E226|        |      ;
                       db $07,$30,$04,$00,$E5,$01,$13,$07   ;80E22E|        |      ;
                       db $B0,$15,$00,$13,$07,$F0,$15,$00   ;80E236|        |      ;
                       db $E5,$07,$70,$E5,$01,$E5,$07,$30   ;80E23E|        |      ;
                       db $04,$00,$E5,$01,$13,$14,$B0,$15   ;80E246|        |      ;
                       db $00,$13,$14,$F0,$15,$00,$E5,$14   ;80E24E|        |      ;
                       db $70,$E5,$01,$E5,$14,$30,$04,$00   ;80E256|        |      ;
                       db $E5,$01,$13,$15,$B0,$15,$00,$13   ;80E25E|        |      ;
                       db $15,$F0,$15,$00,$E5,$15,$70,$E5   ;80E266|        |      ;
                       db $01,$E5,$15,$30,$04,$00,$E5,$01   ;80E26E|        |      ;
                       db $13,$16,$B0,$15,$00,$13,$16,$F0   ;80E276|        |      ;
                       db $15,$00,$E5,$16,$70,$E5,$01,$E5   ;80E27E|        |      ;
                       db $16,$30,$04,$00,$E5,$01,$13,$17   ;80E286|        |      ;
                       db $B0,$15,$00,$13,$17,$F0,$15,$00   ;80E28E|        |      ;
                       db $E5,$17,$70,$E5,$01,$E5,$17,$30   ;80E296|        |      ;
                       db $01,$00,$F8,$81,$F8,$02,$30       ;80E29E|        |000000;
                       db $04,$00,$F0,$81,$00,$02,$70,$04   ;80E2A5|        |      ;
                       db $00,$04,$04,$F0,$04,$00,$F4,$04   ;80E2AD|        |      ;
                       db $70,$F4,$01,$F4,$04,$30,$06,$00   ;80E2B5|        |      ;
                       db $FC,$01,$0F,$04,$70,$FC,$01,$E9   ;80E2BD|        |      ;
                       db $04,$70,$05,$80,$04,$02,$30,$EF   ;80E2C5|        |      ;
                       db $01,$08,$05,$B0,$09,$00,$F0,$05   ;80E2CD|        |      ;
                       db $70,$EF,$01,$F0,$05,$30,$06,$00   ;80E2D5|        |      ;
                       db $FC,$01,$E2,$04,$F0,$FC,$01,$15   ;80E2DD|        |      ;
                       db $04,$F0,$0D,$80,$E7,$02,$B0,$E9   ;80E2E5|        |      ;
                       db $01,$0D,$04,$B0,$11,$00,$0D,$04   ;80E2ED|        |      ;
                       db $F0,$E9,$01,$EB,$04,$30,$06,$00   ;80E2F5|        |      ;
                       db $FC,$01,$E1,$05,$F0,$FC,$01,$16   ;80E2FD|        |      ;
                       db $05,$F0,$E4,$81,$E6,$02,$F0,$E8   ;80E305|        |      ;
                       db $01,$0E,$05,$B0,$12,$00,$0E,$05   ;80E30D|        |      ;
                       db $F0,$12,$00,$EA,$05,$70,$06,$00   ;80E315|        |      ;
                       db $FC,$01,$18,$04,$F0,$FC,$01,$DF   ;80E31D|        |      ;
                       db $04,$F0,$E2,$81,$0C,$02,$70,$14   ;80E325|        |      ;
                       db $00,$10,$04,$F0,$14,$00,$E8,$04   ;80E32D|        |      ;
                       db $70,$E6,$01,$E8,$04,$30,$06,$00   ;80E335|        |      ;
                       db $FC,$01,$DE,$04,$30,$FC,$01,$19   ;80E33D|        |      ;
                       db $04,$30,$11,$80,$0D,$02,$30,$E5   ;80E345|        |      ;
                       db $01,$11,$04,$B0,$15,$00,$E7,$04   ;80E34D|        |      ;
                       db $70,$E5,$01,$E7,$04,$30,$06,$00   ;80E355|        |      ;
                       db $FC,$01,$DD,$05,$F0,$FC,$01,$1A   ;80E35D|        |      ;
                       db $05,$F0,$12,$80,$E2,$02,$B0,$E4   ;80E365|        |      ;
                       db $01,$12,$05,$B0,$16,$00,$12,$05   ;80E36D|        |      ;
                       db $F0,$E4,$01,$E6,$05,$30,$06,$00   ;80E375|        |      ;
                       db $FC,$01,$DC,$04,$F0,$FC,$01,$1B   ;80E37D|        |      ;
                       db $04,$F0,$DF,$81,$E1,$02,$F0,$E3   ;80E385|        |      ;
                       db $01,$13,$04,$B0,$17,$00,$13,$04   ;80E38D|        |      ;
                       db $F0,$17,$00,$E5,$04,$70,$06,$00   ;80E395|        |      ;
                       db $E0,$81,$0D,$02,$70,$FC,$01,$1B   ;80E39D|        |      ;
                       db $06,$F0,$FC,$01,$DD,$06,$F0,$17   ;80E3A5|        |      ;
                       db $00,$13,$06,$F0,$17,$00,$E5,$06   ;80E3AD|        |      ;
                       db $70,$E3,$01,$E5,$06,$30,$06,$00   ;80E3B5|        |      ;
                       db $14,$80,$0F,$02,$30,$FC,$01,$1C   ;80E3BD|        |      ;
                       db $06,$F0,$FC,$01,$DC,$06,$F0,$E2   ;80E3C5|        |      ;
                       db $01,$14,$06,$B0,$18,$00,$E4,$06   ;80E3CD|        |      ;
                       db $70,$E2,$01,$E4,$06,$30,$06,$00   ;80E3D5|        |      ;
                       db $13,$80,$E1,$02,$B0,$FC,$01,$1C   ;80E3DD|        |      ;
                       db $07,$F0,$FC,$01,$DC,$07,$F0,$E2   ;80E3E5|        |      ;
                       db $01,$14,$07,$B0,$18,$00,$14,$07   ;80E3ED|        |      ;
                       db $F0,$E2,$01,$E4,$07,$30,$06,$00   ;80E3F5|        |      ;
                       db $DE,$81,$E0,$02,$F0,$FC,$01,$DB   ;80E3FD|        |      ;
                       db $07,$F0,$FC,$01,$1D,$07,$F0,$E1   ;80E405|        |      ;
                       db $01,$15,$07,$B0,$19,$00,$15,$07   ;80E40D|        |      ;
                       db $F0,$19,$00,$E3,$07,$70,$06,$00   ;80E415|        |      ;
                       db $FC,$01,$1C,$14,$F0,$FC,$01,$DC   ;80E41D|        |      ;
                       db $14,$F0,$E1,$01,$15,$14,$B0,$19   ;80E425|        |      ;
                       db $00,$15,$14,$F0,$19,$00,$E3,$14   ;80E42D|        |      ;
                       db $70,$E1,$01,$E3,$14,$30,$06,$00   ;80E435|        |      ;
                       db $FC,$01,$DC,$15,$B0,$FC,$01,$1B   ;80E43D|        |      ;
                       db $15,$B0,$E1,$01,$15,$15,$B0,$19   ;80E445|        |      ;
                       db $00,$15,$15,$F0,$19,$00,$E3,$15   ;80E44D|        |      ;
                       db $70,$E1,$01,$E3,$15,$30,$06,$00   ;80E455|        |      ;
                       db $FC,$01,$1B,$16,$F0,$FC,$01,$DC   ;80E45D|        |      ;
                       db $16,$F0,$E1,$01,$15,$16,$B0,$19   ;80E465|        |      ;
                       db $00,$15,$16,$F0,$19,$00,$E3,$16   ;80E46D|        |      ;
                       db $70,$E1,$01,$E3,$16,$30,$04,$00   ;80E475|        |      ;
                       db $E1,$01,$15,$17,$B0,$19,$00,$15   ;80E47D|        |      ;
                       db $17,$F0,$19,$00,$E3,$17,$70,$E1   ;80E485|        |      ;
                       db $01,$E3,$17,$30                   ;80E48D|        |      ;
                       db $01,$00,$F8,$81,$F8,$02,$30       ;80E491|        |000000;
                       db $04,$00,$F0,$81,$00,$02,$70,$04   ;80E498|        |      ;
                       db $00,$04,$04,$F0,$04,$00,$F4,$04   ;80E4A0|        |      ;
                       db $70,$F4,$01,$F4,$04,$30,$08,$00   ;80E4A8|        |      ;
                       db $F8,$81,$E5,$02,$B0,$E9,$01,$FC   ;80E4B0|        |      ;
                       db $04,$70,$0F,$00,$FC,$04,$70,$FC   ;80E4B8|        |      ;
                       db $01,$0F,$04,$70,$05,$80,$04,$02   ;80E4C0|        |      ;
                       db $30,$EF,$01,$08,$05,$B0,$09,$00   ;80E4C8|        |      ;
                       db $F0,$05,$70,$EF,$01,$F0,$05,$30   ;80E4D0|        |      ;
                       db $08,$00,$DD,$81,$F8,$02,$70,$0D   ;80E4D8|        |      ;
                       db $80,$E7,$02,$B0,$17,$00,$FD,$04   ;80E4E0|        |      ;
                       db $F0,$FC,$01,$E2,$04,$F0,$FC,$01   ;80E4E8|        |      ;
                       db $15,$04,$F0,$E9,$01,$0D,$04,$B0   ;80E4F0|        |      ;
                       db $11,$00,$0D,$04,$F0,$E9,$01,$EB   ;80E4F8|        |      ;
                       db $04,$30,$08,$00,$F8,$81,$13,$02   ;80E500|        |      ;
                       db $30,$19,$00,$FC,$05,$F0,$DF,$01   ;80E508|        |      ;
                       db $FC,$05,$F0,$FC,$01,$E0,$05,$F0   ;80E510|        |      ;
                       db $E3,$81,$E5,$02,$F0,$E7,$01,$0F   ;80E518|        |      ;
                       db $05,$B0,$13,$00,$0F,$05,$F0,$13   ;80E520|        |      ;
                       db $00,$E9,$05,$70,$08,$00,$18,$80   ;80E528|        |      ;
                       db $F8,$02,$B0,$DD,$01,$FC,$04,$F0   ;80E530|        |      ;
                       db $FC,$01,$1A,$04,$F0,$FC,$01,$DD   ;80E538|        |      ;
                       db $04,$F0,$E0,$81,$0E,$02,$70,$16   ;80E540|        |      ;
                       db $00,$12,$04,$F0,$16,$00,$E6,$04   ;80E548|        |      ;
                       db $70,$E4,$01,$E6,$04,$30,$08,$00   ;80E550|        |      ;
                       db $F8,$81,$D7,$02,$F0,$1D,$00,$FC   ;80E558|        |      ;
                       db $04,$30,$DC,$01,$FC,$04,$30,$FC   ;80E560|        |      ;
                       db $01,$1C,$04,$30,$14,$80,$10,$02   ;80E568|        |      ;
                       db $30,$E2,$01,$14,$04,$B0,$18,$00   ;80E570|        |      ;
                       db $E4,$04,$70,$E2,$01,$E4,$04,$30   ;80E578|        |      ;
                       db $08,$00,$D6,$81,$F8,$02,$F0,$1E   ;80E580|        |      ;
                       db $00,$FC,$05,$F0,$FC,$01,$DA,$05   ;80E588|        |      ;
                       db $F0,$FC,$01,$1D,$05,$F0,$15,$80   ;80E590|        |      ;
                       db $DF,$02,$B0,$E1,$01,$15,$05,$B0   ;80E598|        |      ;
                       db $19,$00,$15,$05,$F0,$E1,$01,$E3   ;80E5A0|        |      ;
                       db $05,$30,$08,$00,$F8,$81,$1A,$02   ;80E5A8|        |      ;
                       db $30,$1F,$00,$FC,$04,$F0,$D9,$01   ;80E5B0|        |      ;
                       db $FC,$04,$F0,$FC,$01,$D9,$04,$F0   ;80E5B8|        |      ;
                       db $DC,$81,$DE,$02,$F0,$E0,$01,$16   ;80E5C0|        |      ;
                       db $04,$B0,$1A,$00,$16,$04,$F0,$1A   ;80E5C8|        |      ;
                       db $00,$E2,$04,$70,$08,$00,$1F,$00   ;80E5D0|        |      ;
                       db $FC,$06,$F0,$D9,$01,$FC,$06,$F0   ;80E5D8|        |      ;
                       db $FC,$01,$1E,$06,$F0,$FC,$01,$DA   ;80E5E0|        |      ;
                       db $06,$F0,$E0,$01,$16,$06,$B0,$1A   ;80E5E8|        |      ;
                       db $00,$16,$06,$F0,$1A,$00,$E2,$06   ;80E5F0|        |      ;
                       db $70,$E0,$01,$E2,$06,$30,$08,$00   ;80E5F8|        |      ;
                       db $20,$00,$FC,$06,$F0,$D8,$01,$FC   ;80E600|        |      ;
                       db $06,$F0,$FC,$01,$1F,$06,$F0,$FC   ;80E608|        |      ;
                       db $01,$D9,$06,$F0,$DF,$01,$17,$06   ;80E610|        |      ;
                       db $B0,$1B,$00,$17,$06,$F0,$1B,$00   ;80E618|        |      ;
                       db $E1,$06,$70,$DF,$01,$E1,$06,$30   ;80E620|        |      ;
                       db $08,$00,$20,$00,$FC,$07,$F0,$D8   ;80E628|        |      ;
                       db $01,$FC,$07,$F0,$FC,$01,$1F,$07   ;80E630|        |      ;
                       db $F0,$FC,$01,$D9,$07,$F0,$DF,$01   ;80E638|        |      ;
                       db $17,$07,$B0,$1B,$00,$17,$07,$F0   ;80E640|        |      ;
                       db $1B,$00,$E1,$07,$70,$DF,$01,$E1   ;80E648|        |      ;
                       db $07,$30,$08,$00,$21,$00,$FC,$07   ;80E650|        |      ;
                       db $F0,$D7,$01,$FC,$07,$F0,$FC,$01   ;80E658|        |      ;
                       db $D8,$07,$F0,$FC,$01,$20,$07,$F0   ;80E660|        |      ;
                       db $DE,$01,$18,$07,$B0,$1C,$00,$18   ;80E668|        |      ;
                       db $07,$F0,$1C,$00,$E0,$07,$70,$DE   ;80E670|        |      ;
                       db $01,$E0,$07,$30,$08,$00,$21,$00   ;80E678|        |      ;
                       db $FC,$14,$F0,$D7,$01,$FD,$14,$F0   ;80E680|        |      ;
                       db $FC,$01,$1F,$14,$F0,$FC,$01,$D9   ;80E688|        |      ;
                       db $14,$F0,$DE,$01,$18,$14,$B0,$1C   ;80E690|        |      ;
                       db $00,$18,$14,$F0,$1C,$00,$E0,$14   ;80E698|        |      ;
                       db $70,$DE,$01,$E0,$14,$30,$08,$00   ;80E6A0|        |      ;
                       db $22,$00,$FC,$15,$B0,$D7,$01,$FD   ;80E6A8|        |      ;
                       db $15,$B0,$FC,$01,$D9,$15,$B0,$FC   ;80E6B0|        |      ;
                       db $01,$1E,$15,$B0,$DE,$01,$18,$15   ;80E6B8|        |      ;
                       db $B0,$1C,$00,$18,$15,$F0,$1C,$00   ;80E6C0|        |      ;
                       db $E0,$15,$70,$DE,$01,$E0,$15,$30   ;80E6C8|        |      ;
                       db $08,$00,$21,$00,$FC,$16,$F0,$D6   ;80E6D0|        |      ;
                       db $01,$FD,$16,$F0,$FC,$01,$1E,$16   ;80E6D8|        |      ;
                       db $F0,$FC,$01,$D9,$16,$F0,$DE,$01   ;80E6E0|        |      ;
                       db $18,$16,$B0,$1C,$00,$18,$16,$F0   ;80E6E8|        |      ;
                       db $1C,$00,$E0,$16,$70,$DE,$01,$E0   ;80E6F0|        |      ;
                       db $16,$30,$04,$00,$DE,$01,$18,$17   ;80E6F8|        |      ;
                       db $B0,$1C,$00,$18,$17,$F0,$1C,$00   ;80E700|        |      ;
                       db $E0,$17,$70,$DE,$01,$E0,$17,$30   ;80E708|        |      ;
                       db $04,$00,$F8,$01,$00,$0A,$B2,$00   ;80E710|        |000000;
                       db $00,$00,$0A,$F2,$00,$00,$F8,$0A   ;80E718|        |      ;
                       db $72,$F8,$01,$F8,$0A,$32           ;80E720|        |0000F8;
                       db $04,$00,$F6,$01,$02,$0B,$B2,$02   ;80E726|        |      ;
                       db $00,$02,$0B,$F2,$02,$00,$F6,$0B   ;80E72E|        |      ;
                       db $72,$F6,$01,$F6,$0B,$32,$04,$00   ;80E736|        |      ;
                       db $F4,$01,$04,$0A,$B2,$04,$00,$04   ;80E73E|        |      ;
                       db $0A,$F2,$04,$00,$F4,$0A,$72,$F4   ;80E746|        |      ;
                       db $01,$F4,$0A,$32,$04,$00,$F2,$01   ;80E74E|        |      ;
                       db $06,$0B,$B2,$08,$00,$06,$0B,$F2   ;80E756|        |      ;
                       db $08,$00,$F2,$0B,$72,$F2,$01,$F2   ;80E75E|        |      ;
                       db $0B,$32,$04,$00,$F1,$01,$07,$0A   ;80E766|        |      ;
                       db $B2,$09,$00,$07,$0A,$F2,$09,$00   ;80E76E|        |      ;
                       db $F1,$0A,$72,$F1,$01,$F1,$0A,$32   ;80E776|        |      ;
                       db $04,$00,$0A,$00,$08,$0B,$F2,$F0   ;80E77E|        |      ;
                       db $01,$08,$0B,$B2,$0A,$00,$F0,$0B   ;80E786|        |      ;
                       db $72,$F0,$01,$F0,$0B,$32,$04,$00   ;80E78E|        |      ;
                       db $EF,$01,$09,$0B,$B2,$0B,$00,$09   ;80E796|        |      ;
                       db $0B,$F2,$0B,$00,$EF,$0B,$72,$EF   ;80E79E|        |      ;
                       db $01,$EF,$0B,$32,$04,$00,$EE,$01   ;80E7A6|        |      ;
                       db $0A,$0A,$B2,$0C,$00,$0A,$0A,$F2   ;80E7AE|        |      ;
                       db $0C,$00,$EE,$0A,$72,$EE,$01,$EE   ;80E7B6|        |      ;
                       db $0A,$32,$04,$00,$ED,$01,$0B,$0B   ;80E7BE|        |      ;
                       db $B2,$0D,$00,$0B,$0B,$F2,$0D,$00   ;80E7C6|        |      ;
                       db $ED,$0B,$72,$ED,$01,$ED,$0B,$32   ;80E7CE|        |      ;
                       db $04,$00,$ED,$01,$0B,$0C,$B2,$0D   ;80E7D6|        |      ;
                       db $00,$0B,$0C,$F2,$0D,$00,$ED,$0C   ;80E7DE|        |      ;
                       db $72,$ED,$01,$ED,$0C,$32,$04,$00   ;80E7E6|        |      ;
                       db $EC,$01,$0C,$0C,$B2,$0E,$00,$0C   ;80E7EE|        |      ;
                       db $0C,$F2,$0E,$00,$EC,$0C,$72,$EC   ;80E7F6|        |      ;
                       db $01,$EC,$0C,$32,$04,$00,$EC,$01   ;80E7FE|        |      ;
                       db $0C,$0D,$B2,$0E,$00,$0C,$0D,$F2   ;80E806|        |      ;
                       db $0E,$00,$EC,$0D,$72,$EC,$01,$EC   ;80E80E|        |      ;
                       db $0D,$32,$04,$00,$EB,$01,$0D,$0D   ;80E816|        |      ;
                       db $B2,$0F,$00,$0D,$0D,$F2,$0F,$00   ;80E81E|        |      ;
                       db $EB,$0D,$72,$EB,$01,$EB,$0D,$32   ;80E826|        |      ;
                       db $04,$00,$EB,$01,$0D,$1A,$B2,$0F   ;80E82E|        |      ;
                       db $00,$0D,$1A,$F2,$0F,$00,$EB,$1A   ;80E836|        |      ;
                       db $72,$EB,$01,$EB,$1A,$32,$04,$00   ;80E83E|        |      ;
                       db $EB,$01,$0D,$1B,$B2,$0F,$00,$0D   ;80E846|        |      ;
                       db $1B,$F2,$0F,$00,$EB,$1B,$72,$EB   ;80E84E|        |      ;
                       db $01,$EB,$1B,$32,$04,$00,$EB,$01   ;80E856|        |      ;
                       db $0D,$1C,$B2,$0F,$00,$0D,$1C,$F2   ;80E85E|        |      ;
                       db $0F,$00,$EB,$1C,$72,$EB,$01,$EB   ;80E866|        |      ;
                       db $1C,$32,$04,$00,$EB,$01,$0D,$1D   ;80E86E|        |      ;
                       db $B2,$0F,$00,$0D,$1D,$F2,$0F,$00   ;80E876|        |      ;
                       db $EB,$1D,$72,$EB,$01,$EB,$1D,$32   ;80E87E|        |      ;
                       db $01,$00,$F8,$81,$F8,$08,$32       ;80E886|        |000000;
                       db $04,$00,$00,$80,$F0,$08,$32,$F4   ;80E88D|        |      ;
                       db $01,$04,$0B,$B2,$04,$00,$04,$0B   ;80E895|        |      ;
                       db $F2,$F4,$01,$F4,$0B,$32,$04,$00   ;80E89D|        |      ;
                       db $04,$80,$04,$08,$32,$F0,$01,$08   ;80E8A5|        |      ;
                       db $0A,$B2,$08,$00,$F0,$0A,$72,$F0   ;80E8AD|        |      ;
                       db $01,$F0,$0A,$32,$04,$00,$E8,$81   ;80E8B5|        |      ;
                       db $08,$08,$32,$0E,$00,$0C,$0B,$F2   ;80E8BD|        |      ;
                       db $0E,$00,$EC,$0B,$72,$EC,$01,$EC   ;80E8C5|        |      ;
                       db $0B,$32,$04,$00,$E7,$81,$E7,$08   ;80E8CD|        |      ;
                       db $32,$EB,$01,$0D,$0A,$B2,$0F,$00   ;80E8D5|        |      ;
                       db $0D,$0A,$F2,$0F,$00,$EB,$0A,$72   ;80E8DD|        |      ;
                       db $04,$00,$0C,$80,$E6,$08,$32,$10   ;80E8E5|        |      ;
                       db $00,$0E,$0B,$F2,$EA,$01,$0E,$0B   ;80E8ED|        |      ;
                       db $B2,$EA,$01,$EA,$0B,$32,$04,$00   ;80E8F5|        |      ;
                       db $0D,$80,$0B,$08,$32,$E9,$01,$0F   ;80E8FD|        |      ;
                       db $0B,$B2,$11,$00,$E9,$0B,$72,$E9   ;80E905|        |      ;
                       db $01,$E9,$0B,$32,$04,$00,$E4,$81   ;80E90D|        |      ;
                       db $0C,$08,$32,$12,$00,$10,$0A,$F2   ;80E915|        |      ;
                       db $12,$00,$E8,$0A,$72,$E8,$01,$E8   ;80E91D|        |      ;
                       db $0A,$32,$04,$00,$E3,$81,$E3,$08   ;80E925|        |      ;
                       db $32,$E7,$01,$11,$0B,$B2,$13,$00   ;80E92D|        |      ;
                       db $11,$0B,$F2,$13,$00,$E7,$0B,$72   ;80E935|        |      ;
                       db $04,$00,$E7,$01,$11,$0C,$B2,$13   ;80E93D|        |      ;
                       db $00,$11,$0C,$F2,$13,$00,$E7,$0C   ;80E945|        |      ;
                       db $72,$E7,$01,$E7,$0C,$32,$04,$00   ;80E94D|        |      ;
                       db $E6,$01,$12,$0C,$B2,$14,$00,$12   ;80E955|        |      ;
                       db $0C,$F2,$14,$00,$E6,$0C,$72,$E6   ;80E95D|        |      ;
                       db $01,$E6,$0C,$32,$04,$00,$E6,$01   ;80E965|        |      ;
                       db $12,$0D,$B2,$14,$00,$12,$0D,$F2   ;80E96D|        |      ;
                       db $14,$00,$E6,$0D,$72,$E6,$01,$E6   ;80E975|        |      ;
                       db $0D,$32,$04,$00,$E5,$01,$13,$0D   ;80E97D|        |      ;
                       db $B2,$15,$00,$13,$0D,$F2,$15,$00   ;80E985|        |      ;
                       db $E5,$0D,$72,$E5,$01,$E5,$0D,$32   ;80E98D|        |      ;
                       db $04,$00,$E5,$01,$13,$1A,$B2,$15   ;80E995|        |      ;
                       db $00,$13,$1A,$F2,$15,$00,$E5,$1A   ;80E99D|        |      ;
                       db $72,$E5,$01,$E5,$1A,$32,$04,$00   ;80E9A5|        |      ;
                       db $E5,$01,$13,$1B,$B2,$15,$00,$13   ;80E9AD|        |      ;
                       db $1B,$F2,$15,$00,$E5,$1B,$72,$E5   ;80E9B5|        |      ;
                       db $01,$E5,$1B,$32,$04,$00,$E5,$01   ;80E9BD|        |      ;
                       db $13,$1C,$B2,$15,$00,$13,$1C,$F2   ;80E9C5|        |      ;
                       db $15,$00,$E5,$1C,$72,$E5,$01,$E5   ;80E9CD|        |      ;
                       db $1C,$32,$04,$00,$E5,$01,$13,$1D   ;80E9D5|        |      ;
                       db $B2,$15,$00,$13,$1D,$F2,$15,$00   ;80E9DD|        |      ;
                       db $E5,$1D,$72,$E5,$01,$E5,$1D,$32   ;80E9E5|        |      ;
                       db $01,$00,$F8,$81,$F8,$08,$32       ;80E9ED|        |000000;
                       db $04,$00,$F0,$81,$00,$08,$72,$04   ;80E9F4|        |      ;
                       db $00,$04,$0A,$F2,$04,$00,$F4,$0A   ;80E9FC|        |      ;
                       db $72,$F4,$01,$F4,$0A,$32,$06,$00   ;80EA04|        |      ;
                       db $FC,$01,$0F,$0A,$72,$FC,$01,$E9   ;80EA0C|        |      ;
                       db $0A,$72,$05,$80,$04,$08,$32,$EF   ;80EA14|        |      ;
                       db $01,$08,$0B,$B2,$09,$00,$F0,$0B   ;80EA1C|        |      ;
                       db $72,$EF,$01,$F0,$0B,$32,$06,$00   ;80EA24|        |      ;
                       db $FC,$01,$E2,$0A,$F2,$FC,$01,$15   ;80EA2C|        |      ;
                       db $0A,$F2,$0D,$80,$E7,$08,$B2,$E9   ;80EA34|        |      ;
                       db $01,$0D,$0A,$B2,$11,$00,$0D,$0A   ;80EA3C|        |      ;
                       db $F2,$E9,$01,$EB,$0A,$32,$06,$00   ;80EA44|        |      ;
                       db $FC,$01,$E1,$0B,$F2,$FC,$01,$16   ;80EA4C|        |      ;
                       db $0B,$F2,$E4,$81,$E6,$08,$F2,$E8   ;80EA54|        |      ;
                       db $01,$0E,$0B,$B2,$12,$00,$0E,$0B   ;80EA5C|        |      ;
                       db $F2,$12,$00,$EA,$0B,$72,$06,$00   ;80EA64|        |      ;
                       db $FC,$01,$18,$0A,$F2,$FC,$01,$DF   ;80EA6C|        |      ;
                       db $0A,$F2,$E2,$81,$0C,$08,$72,$14   ;80EA74|        |      ;
                       db $00,$10,$0A,$F2,$14,$00,$E8,$0A   ;80EA7C|        |      ;
                       db $72,$E6,$01,$E8,$0A,$32,$06,$00   ;80EA84|        |      ;
                       db $FC,$01,$DE,$0A,$32,$FC,$01,$19   ;80EA8C|        |      ;
                       db $0A,$32,$11,$80,$0D,$08,$32,$E5   ;80EA94|        |      ;
                       db $01,$11,$0A,$B2,$15,$00,$E7,$0A   ;80EA9C|        |      ;
                       db $72,$E5,$01,$E7,$0A,$32,$06,$00   ;80EAA4|        |      ;
                       db $FC,$01,$DD,$0B,$F2,$FC,$01,$1A   ;80EAAC|        |      ;
                       db $0B,$F2,$12,$80,$E2,$08,$B2,$E4   ;80EAB4|        |      ;
                       db $01,$12,$0B,$B2,$16,$00,$12,$0B   ;80EABC|        |      ;
                       db $F2,$E4,$01,$E6,$0B,$32,$06,$00   ;80EAC4|        |      ;
                       db $FC,$01,$DC,$0A,$F2,$FC,$01,$1B   ;80EACC|        |      ;
                       db $0A,$F2,$DF,$81,$E1,$08,$F2,$E3   ;80EAD4|        |      ;
                       db $01,$13,$0A,$B2,$17,$00,$13,$0A   ;80EADC|        |      ;
                       db $F2,$17,$00,$E5,$0A,$72,$06,$00   ;80EAE4|        |      ;
                       db $E0,$81,$0D,$08,$72,$FC,$01,$1B   ;80EAEC|        |      ;
                       db $0C,$F2,$FC,$01,$DD,$0C,$F2,$17   ;80EAF4|        |      ;
                       db $00,$13,$0C,$F2,$17,$00,$E5,$0C   ;80EAFC|        |      ;
                       db $72,$E3,$01,$E5,$0C,$32,$06,$00   ;80EB04|        |      ;
                       db $14,$80,$0F,$08,$32,$FC,$01,$1C   ;80EB0C|        |      ;
                       db $0C,$F2,$FC,$01,$DC,$0C,$F2,$E2   ;80EB14|        |      ;
                       db $01,$14,$0C,$B2,$18,$00,$E4,$0C   ;80EB1C|        |      ;
                       db $72,$E2,$01,$E4,$0C,$32,$06,$00   ;80EB24|        |      ;
                       db $13,$80,$E1,$08,$B2,$FC,$01,$1C   ;80EB2C|        |      ;
                       db $0D,$F2,$FC,$01,$DC,$0D,$F2,$E2   ;80EB34|        |      ;
                       db $01,$14,$0D,$B2,$18,$00,$14,$0D   ;80EB3C|        |      ;
                       db $F2,$E2,$01,$E4,$0D,$32,$06,$00   ;80EB44|        |      ;
                       db $DE,$81,$E0,$08,$F2,$FC,$01,$DB   ;80EB4C|        |      ;
                       db $0D,$F2,$FC,$01,$1D,$0D,$F2,$E1   ;80EB54|        |      ;
                       db $01,$15,$0D,$B2,$19,$00,$15,$0D   ;80EB5C|        |      ;
                       db $F2,$19,$00,$E3,$0D,$72,$06,$00   ;80EB64|        |      ;
                       db $FC,$01,$1C,$1A,$F2,$FC,$01,$DC   ;80EB6C|        |      ;
                       db $1A,$F2,$E1,$01,$15,$1A,$B2,$19   ;80EB74|        |      ;
                       db $00,$15,$1A,$F2,$19,$00,$E3,$1A   ;80EB7C|        |      ;
                       db $72,$E1,$01,$E3,$1A,$32,$06,$00   ;80EB84|        |      ;
                       db $FC,$01,$DC,$1B,$B2,$FC,$01,$1B   ;80EB8C|        |      ;
                       db $1B,$B2,$E1,$01,$15,$1B,$B2,$19   ;80EB94|        |      ;
                       db $00,$15,$1B,$F2,$19,$00,$E3,$1B   ;80EB9C|        |      ;
                       db $72,$E1,$01,$E3,$1B,$32,$06,$00   ;80EBA4|        |      ;
                       db $FC,$01,$1B,$1C,$F2,$FC,$01,$DC   ;80EBAC|        |      ;
                       db $1C,$F2,$E1,$01,$15,$1C,$B2,$19   ;80EBB4|        |      ;
                       db $00,$15,$1C,$F2,$19,$00,$E3,$1C   ;80EBBC|        |      ;
                       db $72,$E1,$01,$E3,$1C,$32,$04,$00   ;80EBC4|        |      ;
                       db $E1,$01,$15,$1D,$B2,$19,$00,$15   ;80EBCC|        |      ;
                       db $1D,$F2,$19,$00,$E3,$1D,$72,$E1   ;80EBD4|        |      ;
                       db $01,$E3,$1D,$32                   ;80EBDC|        |      ;
                       db $01,$00,$F8,$81,$F8,$08,$32       ;80EBE0|        |000000;
                       db $04,$00,$F0,$81,$00,$08,$72,$04   ;80EBE7|        |      ;
                       db $00,$04,$0A,$F2,$04,$00,$F4,$0A   ;80EBEF|        |      ;
                       db $72,$F4,$01,$F4,$0A,$32,$08,$00   ;80EBF7|        |      ;
                       db $F8,$81,$E5,$08,$B2,$E9,$01,$FC   ;80EBFF|        |      ;
                       db $0A,$72,$0F,$00,$FC,$0A,$72,$FC   ;80EC07|        |      ;
                       db $01,$0F,$0A,$72,$05,$80,$04,$08   ;80EC0F|        |      ;
                       db $32,$EF,$01,$08,$0B,$B2,$09,$00   ;80EC17|        |      ;
                       db $F0,$0B,$72,$EF,$01,$F0,$0B,$32   ;80EC1F|        |      ;
                       db $08,$00,$DD,$81,$F8,$08,$72,$0D   ;80EC27|        |      ;
                       db $80,$E7,$08,$B2,$17,$00,$FD,$0A   ;80EC2F|        |      ;
                       db $F2,$FC,$01,$E2,$0A,$F2,$FC,$01   ;80EC37|        |      ;
                       db $15,$0A,$F2,$E9,$01,$0D,$0A,$B2   ;80EC3F|        |      ;
                       db $11,$00,$0D,$0A,$F2,$E9,$01,$EB   ;80EC47|        |      ;
                       db $0A,$32,$08,$00,$F8,$81,$13,$08   ;80EC4F|        |      ;
                       db $32,$19,$00,$FC,$0B,$F2,$DF,$01   ;80EC57|        |      ;
                       db $FC,$0B,$F2,$FC,$01,$E0,$0B,$F2   ;80EC5F|        |      ;
                       db $E3,$81,$E5,$08,$F2,$E7,$01,$0F   ;80EC67|        |      ;
                       db $0B,$B2,$13,$00,$0F,$0B,$F2,$13   ;80EC6F|        |      ;
                       db $00,$E9,$0B,$72,$08,$00,$18,$80   ;80EC77|        |      ;
                       db $F8,$08,$B2,$DD,$01,$FC,$0A,$F2   ;80EC7F|        |      ;
                       db $FC,$01,$1A,$0A,$F2,$FC,$01,$DD   ;80EC87|        |      ;
                       db $0A,$F2,$E0,$81,$0E,$08,$72,$16   ;80EC8F|        |      ;
                       db $00,$12,$0A,$F2,$16,$00,$E6,$0A   ;80EC97|        |      ;
                       db $72,$E4,$01,$E6,$0A,$32,$08,$00   ;80EC9F|        |      ;
                       db $F8,$81,$D7,$08,$F2,$1D,$00,$FC   ;80ECA7|        |      ;
                       db $0A,$32,$DC,$01,$FC,$0A,$32,$FC   ;80ECAF|        |      ;
                       db $01,$1C,$0A,$32,$14,$80,$10,$08   ;80ECB7|        |      ;
                       db $32,$E2,$01,$14,$0A,$B2,$18,$00   ;80ECBF|        |      ;
                       db $E4,$0A,$72,$E2,$01,$E4,$0A,$32   ;80ECC7|        |      ;
                       db $08,$00,$D6,$81,$F8,$08,$F2,$1E   ;80ECCF|        |      ;
                       db $00,$FC,$0B,$F2,$FC,$01,$DA,$0B   ;80ECD7|        |      ;
                       db $F2,$FC,$01,$1D,$0B,$F2,$15,$80   ;80ECDF|        |      ;
                       db $DF,$08,$B2,$E1,$01,$15,$0B,$B2   ;80ECE7|        |      ;
                       db $19,$00,$15,$0B,$F2,$E1,$01,$E3   ;80ECEF|        |      ;
                       db $0B,$32,$08,$00,$F8,$81,$1A,$08   ;80ECF7|        |      ;
                       db $32,$1F,$00,$FC,$0A,$F2,$D9,$01   ;80ECFF|        |      ;
                       db $FC,$0A,$F2,$FC,$01,$D9,$0A,$F2   ;80ED07|        |      ;
                       db $DC,$81,$DE,$08,$F2,$E0,$01,$16   ;80ED0F|        |      ;
                       db $0A,$B2,$1A,$00,$16,$0A,$F2,$1A   ;80ED17|        |      ;
                       db $00,$E2,$0A,$72,$08,$00,$1F,$00   ;80ED1F|        |      ;
                       db $FC,$0C,$F2,$D9,$01,$FC,$0C,$F2   ;80ED27|        |      ;
                       db $FC,$01,$1E,$0C,$F2,$FC,$01,$DA   ;80ED2F|        |      ;
                       db $0C,$F2,$E0,$01,$16,$0C,$B2,$1A   ;80ED37|        |      ;
                       db $00,$16,$0C,$F2,$1A,$00,$E2,$0C   ;80ED3F|        |      ;
                       db $72,$E0,$01,$E2,$0C,$32,$08,$00   ;80ED47|        |      ;
                       db $20,$00,$FC,$0C,$F2,$D8,$01,$FC   ;80ED4F|        |      ;
                       db $0C,$F2,$FC,$01,$1F,$0C,$F2,$FC   ;80ED57|        |      ;
                       db $01,$D9,$0C,$F2,$DF,$01,$17,$0C   ;80ED5F|        |      ;
                       db $B2,$1B,$00,$17,$0C,$F2,$1B,$00   ;80ED67|        |      ;
                       db $E1,$0C,$72,$DF,$01,$E1,$0C,$32   ;80ED6F|        |      ;
                       db $08,$00,$20,$00,$FC,$0D,$F2,$D8   ;80ED77|        |      ;
                       db $01,$FC,$0D,$F2,$FC,$01,$1F,$0D   ;80ED7F|        |      ;
                       db $F2,$FC,$01,$D9,$0D,$F2,$DF,$01   ;80ED87|        |      ;
                       db $17,$0D,$B2,$1B,$00,$17,$0D,$F2   ;80ED8F|        |      ;
                       db $1B,$00,$E1,$0D,$72,$DF,$01,$E1   ;80ED97|        |      ;
                       db $0D,$32,$08,$00,$21,$00,$FC,$0D   ;80ED9F|        |      ;
                       db $F2,$D7,$01,$FC,$0D,$F2,$FC,$01   ;80EDA7|        |      ;
                       db $D8,$0D,$F2,$FC,$01,$20,$0D,$F2   ;80EDAF|        |      ;
                       db $DE,$01,$18,$0D,$B2,$1C,$00,$18   ;80EDB7|        |      ;
                       db $0D,$F2,$1C,$00,$E0,$0D,$72,$DE   ;80EDBF|        |      ;
                       db $01,$E0,$0D,$32,$08,$00,$21,$00   ;80EDC7|        |      ;
                       db $FC,$1A,$F2,$D7,$01,$FD,$1A,$F2   ;80EDCF|        |      ;
                       db $FC,$01,$1F,$1A,$F2,$FC,$01,$D9   ;80EDD7|        |      ;
                       db $1A,$F2,$DE,$01,$18,$1A,$B2,$1C   ;80EDDF|        |      ;
                       db $00,$18,$1A,$F2,$1C,$00,$E0,$1A   ;80EDE7|        |      ;
                       db $72,$DE,$01,$E0,$1A,$32,$08,$00   ;80EDEF|        |      ;
                       db $22,$00,$FC,$1B,$B2,$D7,$01,$FD   ;80EDF7|        |      ;
                       db $1B,$B2,$FC,$01,$D9,$1B,$B2,$FC   ;80EDFF|        |      ;
                       db $01,$1E,$1B,$B2,$DE,$01,$18,$1B   ;80EE07|        |      ;
                       db $B2,$1C,$00,$18,$1B,$F2,$1C,$00   ;80EE0F|        |      ;
                       db $E0,$1B,$72,$DE,$01,$E0,$1B,$32   ;80EE17|        |      ;
                       db $08,$00,$21,$00,$FC,$1C,$F2,$D6   ;80EE1F|        |      ;
                       db $01,$FD,$1C,$F2,$FC,$01,$1E,$1C   ;80EE27|        |      ;
                       db $F2,$FC,$01,$D9,$1C,$F2,$DE,$01   ;80EE2F|        |      ;
                       db $18,$1C,$B2,$1C,$00,$18,$1C,$F2   ;80EE37|        |      ;
                       db $1C,$00,$E0,$1C,$72,$DE,$01,$E0   ;80EE3F|        |      ;
                       db $1C,$32,$04,$00,$DE,$01,$18,$1D   ;80EE47|        |      ;
                       db $B2,$1C,$00,$18,$1D,$F2,$1C,$00   ;80EE4F|        |      ;
                       db $E0,$1D,$72,$DE,$01,$E0,$1D,$32   ;80EE57|        |      ;
                       db $98,$EE,$BA,$EE,$69,$EF,$98,$EE   ;80EE5F|        |      ;
                       db $BA,$EE,$AD,$EF,$98,$EE,$BA,$EE   ;80EE67|        |      ;
                       db $F1,$EF,$98,$EE,$BA,$EE,$35,$F0   ;80EE6F|        |      ;
                       db $98,$EE,$BA,$EE,$79,$F0,$98,$EE   ;80EE77|        |      ;
                       db $BA,$EE,$BD,$F0,$98,$EE,$BA,$EE   ;80EE7F|        |      ;
                       db $01,$F1,$98,$EE,$BA,$EE,$45,$F1   ;80EE87|        |      ;
                       db $C2,$30,$A9,$00,$00,$9D,$14,$0C   ;80EE8F|        |      ;
                       db $60                               ;80EE97|        |      ;
                       REP #$30                             ;80EE98|C230    |      ;
                       STX.W $0394                          ;80EE9A|8E9403  |800394;
 
                     - JSL.L CODE_FL_8481CD                 ;80EE9D|22CD8184|8481CD;
                       AND.W #$000F                         ;80EEA1|290F00  |      ;
                       CMP.W #$000A                         ;80EEA4|C90A00  |      ;
                       BCS -                                ;80EEA7|B0F4    |80EE9D;
                       LDX.W $0394                          ;80EEA9|AE9403  |800394;
                       STA.L $7E8E3E,X                      ;80EEAC|9F3E8E7E|7E8E3E;
                       LDA.W #$0008                         ;80EEB0|A90800  |      ;
                       STA.W $0C14,X                        ;80EEB3|9D140C  |800C14;
                       RTS                                  ;80EEB6|60      |      ;
                       db $C2,$30,$60                       ;80EEB7|        |      ;
                       REP #$30                             ;80EEBA|C230    |      ;
                       LDX.W $075E                          ;80EEBC|AE5E07  |80075E;
                       LDA.L $7E8E3E,X                      ;80EEBF|BF3E8E7E|7E8E3E;
                       ASL A                                ;80EEC3|0A      |      ;
                       TAX                                  ;80EEC4|AA      |      ;
                       JSR.W (DATA8_80EEC9,X)               ;80EEC5|FCC9EE  |80EEC9;
                       RTS                                  ;80EEC8|60      |      ;
 
         DATA8_80EEC9:
                       db $DD,$EE,$EB,$EE,$F9,$EE,$07,$EF   ;80EEC9|        |      ;
                       db $15,$EF,$23,$EF,$31,$EF,$3F,$EF   ;80EED1|        |      ;
                       db $4D,$EF,$5B,$EF                   ;80EED9|        |      ;
                       LDX.W $075E                          ;80EEDD|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EEE0|BD9C0B  |800B9C;
                       CLC                                  ;80EEE3|18      |      ;
                       ADC.W #$0003                         ;80EEE4|690300  |      ;
                       STA.W $0B9C,X                        ;80EEE7|9D9C0B  |800B9C;
                       RTS                                  ;80EEEA|60      |      ;
                       LDX.W $075E                          ;80EEEB|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EEEE|BD9C0B  |800B9C;
                       CLC                                  ;80EEF1|18      |      ;
                       ADC.W #$0006                         ;80EEF2|690600  |      ;
                       STA.W $0B9C,X                        ;80EEF5|9D9C0B  |800B9C;
                       RTS                                  ;80EEF8|60      |      ;
                       LDX.W $075E                          ;80EEF9|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EEFC|BD9C0B  |800B9C;
                       CLC                                  ;80EEFF|18      |      ;
                       ADC.W #$0003                         ;80EF00|690300  |      ;
                       STA.W $0B9C,X                        ;80EF03|9D9C0B  |800B9C;
                       RTS                                  ;80EF06|60      |      ;
                       LDX.W $075E                          ;80EF07|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF0A|BD9C0B  |800B9C;
                       CLC                                  ;80EF0D|18      |      ;
                       ADC.W #$0006                         ;80EF0E|690600  |      ;
                       STA.W $0B9C,X                        ;80EF11|9D9C0B  |800B9C;
                       RTS                                  ;80EF14|60      |      ;
                       LDX.W $075E                          ;80EF15|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF18|BD9C0B  |800B9C;
                       CLC                                  ;80EF1B|18      |      ;
                       ADC.W #$0005                         ;80EF1C|690500  |      ;
                       STA.W $0B9C,X                        ;80EF1F|9D9C0B  |800B9C;
                       RTS                                  ;80EF22|60      |      ;
                       LDX.W $075E                          ;80EF23|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF26|BD9C0B  |800B9C;
                       CLC                                  ;80EF29|18      |      ;
                       ADC.W #$0002                         ;80EF2A|690200  |      ;
                       STA.W $0B9C,X                        ;80EF2D|9D9C0B  |800B9C;
                       RTS                                  ;80EF30|60      |      ;
                       LDX.W $075E                          ;80EF31|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF34|BD9C0B  |800B9C;
                       CLC                                  ;80EF37|18      |      ;
                       ADC.W #$0003                         ;80EF38|690300  |      ;
                       STA.W $0B9C,X                        ;80EF3B|9D9C0B  |800B9C;
                       RTS                                  ;80EF3E|60      |      ;
                       LDX.W $075E                          ;80EF3F|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF42|BD9C0B  |800B9C;
                       CLC                                  ;80EF45|18      |      ;
                       ADC.W #$0002                         ;80EF46|690200  |      ;
                       STA.W $0B9C,X                        ;80EF49|9D9C0B  |800B9C;
                       RTS                                  ;80EF4C|60      |      ;
                       LDX.W $075E                          ;80EF4D|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF50|BD9C0B  |800B9C;
                       CLC                                  ;80EF53|18      |      ;
                       ADC.W #$0004                         ;80EF54|690400  |      ;
                       STA.W $0B9C,X                        ;80EF57|9D9C0B  |800B9C;
                       RTS                                  ;80EF5A|60      |      ;
                       LDX.W $075E                          ;80EF5B|AE5E07  |80075E;
                       LDA.W $0B9C,X                        ;80EF5E|BD9C0B  |800B9C;
                       CLC                                  ;80EF61|18      |      ;
                       ADC.W #$0001                         ;80EF62|690100  |      ;
                       STA.W $0B9C,X                        ;80EF65|9D9C0B  |800B9C;
                       RTS                                  ;80EF68|60      |      ;
                       db $01,$00,$89,$F1,$01,$00,$90,$F1   ;80EF69|        |      ;
                       db $01,$00,$97,$F1,$01,$00,$9E,$F1   ;80EF71|        |      ;
                       db $01,$00,$A5,$F1,$01,$00,$AC,$F1   ;80EF79|        |      ;
                       db $01,$00,$B3,$F1,$01,$00,$BA,$F1   ;80EF81|        |      ;
                       db $01,$00,$C1,$F1,$01,$00,$C8,$F1   ;80EF89|        |      ;
                       db $01,$00,$C8,$F1,$01,$00,$CF,$F1   ;80EF91|        |      ;
                       db $01,$00,$D6,$F1,$01,$00,$DD,$F1   ;80EF99|        |      ;
                       db $01,$00,$E4,$F1,$01,$00,$EB,$F1   ;80EFA1|        |      ;
                       db $45,$CF,$69,$EF,$01,$00,$F2,$F1   ;80EFA9|        |      ;
                       db $01,$00,$F9,$F1,$01,$00,$00,$F2   ;80EFB1|        |      ;
                       db $01,$00,$07,$F2,$01,$00,$0E,$F2   ;80EFB9|        |      ;
                       db $01,$00,$15,$F2,$01,$00,$1C,$F2   ;80EFC1|        |      ;
                       db $01,$00,$23,$F2,$01,$00,$2A,$F2   ;80EFC9|        |      ;
                       db $01,$00,$31,$F2,$01,$00,$31,$F2   ;80EFD1|        |      ;
                       db $01,$00,$38,$F2,$01,$00,$3F,$F2   ;80EFD9|        |      ;
                       db $01,$00,$46,$F2,$01,$00,$4D,$F2   ;80EFE1|        |      ;
                       db $01,$00,$54,$F2,$45,$CF,$AD,$EF   ;80EFE9|        |      ;
                       db $01,$00,$5B,$F2,$01,$00,$62,$F2   ;80EFF1|        |      ;
                       db $01,$00,$69,$F2,$01,$00,$70,$F2   ;80EFF9|        |      ;
                       db $01,$00,$77,$F2,$01,$00,$7E,$F2   ;80F001|        |      ;
                       db $01,$00,$85,$F2,$01,$00,$8C,$F2   ;80F009|        |      ;
                       db $01,$00,$93,$F2,$01,$00,$9A,$F2   ;80F011|        |      ;
                       db $01,$00,$9A,$F2,$01,$00,$A1,$F2   ;80F019|        |      ;
                       db $01,$00,$A8,$F2,$01,$00,$AF,$F2   ;80F021|        |      ;
                       db $01,$00,$B6,$F2,$01,$00,$BD,$F2   ;80F029|        |      ;
                       db $45,$CF,$F1,$EF,$01,$00,$C4,$F2   ;80F031|        |      ;
                       db $01,$00,$CB,$F2,$01,$00,$D2,$F2   ;80F039|        |      ;
                       db $01,$00,$D9,$F2,$01,$00,$E0,$F2   ;80F041|        |      ;
                       db $01,$00,$E7,$F2,$01,$00,$EE,$F2   ;80F049|        |      ;
                       db $01,$00,$F5,$F2,$01,$00,$FC,$F2   ;80F051|        |      ;
                       db $01,$00,$03,$F3,$01,$00,$03,$F3   ;80F059|        |      ;
                       db $01,$00,$0A,$F3,$01,$00,$11,$F3   ;80F061|        |      ;
                       db $01,$00,$18,$F3,$01,$00,$1F,$F3   ;80F069|        |      ;
                       db $01,$00,$26,$F3,$45,$CF,$35,$F0   ;80F071|        |      ;
                       db $01,$00,$2D,$F3,$01,$00,$34,$F3   ;80F079|        |      ;
                       db $01,$00,$3B,$F3,$01,$00,$42,$F3   ;80F081|        |      ;
                       db $01,$00,$49,$F3,$01,$00,$50,$F3   ;80F089|        |      ;
                       db $01,$00,$57,$F3,$01,$00,$5E,$F3   ;80F091|        |      ;
                       db $01,$00,$65,$F3,$01,$00,$6C,$F3   ;80F099|        |      ;
                       db $01,$00,$6C,$F3,$01,$00,$73,$F3   ;80F0A1|        |      ;
                       db $01,$00,$7A,$F3,$01,$00,$81,$F3   ;80F0A9|        |      ;
                       db $01,$00,$88,$F3,$01,$00,$8F,$F3   ;80F0B1|        |      ;
                       db $45,$CF,$79,$F0,$01,$00,$96,$F3   ;80F0B9|        |      ;
                       db $01,$00,$9D,$F3,$01,$00,$A4,$F3   ;80F0C1|        |      ;
                       db $01,$00,$AB,$F3,$01,$00,$B2,$F3   ;80F0C9|        |      ;
                       db $01,$00,$B9,$F3,$01,$00,$C0,$F3   ;80F0D1|        |      ;
                       db $01,$00,$C7,$F3,$01,$00,$CE,$F3   ;80F0D9|        |      ;
                       db $01,$00,$D5,$F3,$01,$00,$D5,$F3   ;80F0E1|        |      ;
                       db $01,$00,$DC,$F3,$01,$00,$E3,$F3   ;80F0E9|        |      ;
                       db $01,$00,$EA,$F3,$01,$00,$F1,$F3   ;80F0F1|        |      ;
                       db $01,$00,$F8,$F3,$45,$CF,$BD,$F0   ;80F0F9|        |      ;
                       db $01,$00,$FF,$F3,$01,$00,$06,$F4   ;80F101|        |      ;
                       db $01,$00,$0D,$F4,$01,$00,$14,$F4   ;80F109|        |      ;
                       db $01,$00,$1B,$F4,$01,$00,$22,$F4   ;80F111|        |      ;
                       db $01,$00,$29,$F4,$01,$00,$30,$F4   ;80F119|        |      ;
                       db $01,$00,$37,$F4,$01,$00,$3E,$F4   ;80F121|        |      ;
                       db $01,$00,$3E,$F4,$01,$00,$45,$F4   ;80F129|        |      ;
                       db $01,$00,$4C,$F4,$01,$00,$53,$F4   ;80F131|        |      ;
                       db $01,$00,$5A,$F4,$01,$00,$61,$F4   ;80F139|        |      ;
                       db $45,$CF,$01,$F1,$01,$00,$68,$F4   ;80F141|        |      ;
                       db $01,$00,$6F,$F4,$01,$00,$76,$F4   ;80F149|        |      ;
                       db $01,$00,$7D,$F4,$01,$00,$84,$F4   ;80F151|        |      ;
                       db $01,$00,$8B,$F4,$01,$00,$92,$F4   ;80F159|        |      ;
                       db $01,$00,$99,$F4,$01,$00,$A0,$F4   ;80F161|        |      ;
                       db $01,$00,$A7,$F4,$01,$00,$A7,$F4   ;80F169|        |      ;
                       db $01,$00,$AE,$F4,$01,$00,$B5,$F4   ;80F171|        |      ;
                       db $01,$00,$BC,$F4,$01,$00,$C3,$F4   ;80F179|        |      ;
                       db $01,$00,$CA,$F4,$45,$CF,$45,$F1   ;80F181|        |      ;
                       db $01,$00,$00,$00,$00,$20,$24,$01   ;80F189|        |      ;
                       db $00,$00,$00,$00,$21,$24,$01,$00   ;80F191|        |      ;
                       db $00,$00,$00,$22,$24,$01,$00,$00   ;80F199|        |      ;
                       db $00,$00,$23,$24,$01,$00,$00,$00   ;80F1A1|        |      ;
                       db $00,$24,$24,$01,$00,$00,$00,$00   ;80F1A9|        |      ;
                       db $25,$24,$01,$00,$00,$00,$00,$26   ;80F1B1|        |      ;
                       db $24,$01,$00,$00,$00,$00,$27,$24   ;80F1B9|        |      ;
                       db $01,$00,$00,$00,$00,$28,$24,$01   ;80F1C1|        |      ;
                       db $00,$00,$00,$00,$29,$24,$01,$00   ;80F1C9|        |      ;
                       db $00,$00,$00,$2A,$24,$01,$00,$00   ;80F1D1|        |      ;
                       db $00,$00,$2B,$24,$01,$00,$00,$00   ;80F1D9|        |      ;
                       db $00,$2C,$24,$01,$00,$00,$00,$00   ;80F1E1|        |      ;
                       db $2D,$24,$01,$00,$00,$00,$00,$2E   ;80F1E9|        |      ;
                       db $24,$01,$00,$00,$00,$00,$20,$34   ;80F1F1|        |      ;
                       db $01,$00,$00,$00,$00,$21,$34,$01   ;80F1F9|        |      ;
                       db $00,$00,$00,$00,$22,$34,$01,$00   ;80F201|        |      ;
                       db $00,$00,$00,$23,$34,$01,$00,$00   ;80F209|        |      ;
                       db $00,$00,$24,$34,$01,$00,$00,$00   ;80F211|        |      ;
                       db $00,$25,$34,$01,$00,$00,$00,$00   ;80F219|        |      ;
                       db $26,$34,$01,$00,$00,$00,$00,$27   ;80F221|        |      ;
                       db $34,$01,$00,$00,$00,$00,$28,$34   ;80F229|        |      ;
                       db $01,$00,$00,$00,$00,$29,$34,$01   ;80F231|        |      ;
                       db $00,$00,$00,$00,$2A,$34,$01,$00   ;80F239|        |      ;
                       db $00,$00,$00,$2B,$34,$01,$00,$00   ;80F241|        |      ;
                       db $00,$00,$2C,$34,$01,$00,$00,$00   ;80F249|        |      ;
                       db $00,$2D,$34,$01,$00,$00,$00,$00   ;80F251|        |      ;
                       db $2E,$34,$01,$00,$00,$00,$00,$20   ;80F259|        |      ;
                       db $26,$01,$00,$00,$00,$00,$21,$26   ;80F261|        |      ;
                       db $01,$00,$00,$00,$00,$22,$26,$01   ;80F269|        |      ;
                       db $00,$00,$00,$00,$23,$26,$01,$00   ;80F271|        |      ;
                       db $00,$00,$00,$24,$26,$01,$00,$00   ;80F279|        |      ;
                       db $00,$00,$25,$26,$01,$00,$00,$00   ;80F281|        |      ;
                       db $00,$26,$26,$01,$00,$00,$00,$00   ;80F289|        |      ;
                       db $27,$26,$01,$00,$00,$00,$00,$28   ;80F291|        |      ;
                       db $26,$01,$00,$00,$00,$00,$29,$26   ;80F299|        |      ;
                       db $01,$00,$00,$00,$00,$2A,$26,$01   ;80F2A1|        |      ;
                       db $00,$00,$00,$00,$2B,$26,$01,$00   ;80F2A9|        |      ;
                       db $00,$00,$00,$2C,$26,$01,$00,$00   ;80F2B1|        |      ;
                       db $00,$00,$2D,$26,$01,$00,$00,$00   ;80F2B9|        |      ;
                       db $00,$2E,$26,$01,$00,$00,$00,$00   ;80F2C1|        |      ;
                       db $20,$36,$01,$00,$00,$00,$00,$21   ;80F2C9|        |      ;
                       db $36,$01,$00,$00,$00,$00,$22,$36   ;80F2D1|        |      ;
                       db $01,$00,$00,$00,$00,$23,$36,$01   ;80F2D9|        |      ;
                       db $00,$00,$00,$00,$24,$36,$01,$00   ;80F2E1|        |      ;
                       db $00,$00,$00,$25,$36,$01,$00,$00   ;80F2E9|        |      ;
                       db $00,$00,$26,$36,$01,$00,$00,$00   ;80F2F1|        |      ;
                       db $00,$27,$36,$01,$00,$00,$00,$00   ;80F2F9|        |      ;
                       db $28,$36,$01,$00,$00,$00,$00,$29   ;80F301|        |      ;
                       db $36,$01,$00,$00,$00,$00,$2A,$36   ;80F309|        |      ;
                       db $01,$00,$00,$00,$00,$2B,$36,$01   ;80F311|        |      ;
                       db $00,$00,$00,$00,$2C,$36,$01,$00   ;80F319|        |      ;
                       db $00,$00,$00,$2D,$36,$01,$00,$00   ;80F321|        |      ;
                       db $00,$00,$2E,$36,$01,$00,$00,$00   ;80F329|        |      ;
                       db $00,$20,$28,$01,$00,$00,$00,$00   ;80F331|        |      ;
                       db $21,$28,$01,$00,$00,$00,$00,$22   ;80F339|        |      ;
                       db $28,$01,$00,$00,$00,$00,$23,$28   ;80F341|        |      ;
                       db $01,$00,$00,$00,$00,$24,$28,$01   ;80F349|        |      ;
                       db $00,$00,$00,$00,$25,$28,$01,$00   ;80F351|        |      ;
                       db $00,$00,$00,$26,$28,$01,$00,$00   ;80F359|        |      ;
                       db $00,$00,$27,$28,$01,$00,$00,$00   ;80F361|        |      ;
                       db $00,$28,$28,$01,$00,$00,$00,$00   ;80F369|        |      ;
                       db $29,$28,$01,$00,$00,$00,$00,$2A   ;80F371|        |      ;
                       db $28,$01,$00,$00,$00,$00,$2B,$28   ;80F379|        |      ;
                       db $01,$00,$00,$00,$00,$2C,$28,$01   ;80F381|        |      ;
                       db $00,$00,$00,$00,$2D,$28,$01,$00   ;80F389|        |      ;
                       db $00,$00,$00,$2E,$28,$01,$00,$00   ;80F391|        |      ;
                       db $00,$00,$20,$38,$01,$00,$00,$00   ;80F399|        |      ;
                       db $00,$21,$38,$01,$00,$00,$00,$00   ;80F3A1|        |      ;
                       db $22,$38,$01,$00,$00,$00,$00,$23   ;80F3A9|        |      ;
                       db $38,$01,$00,$00,$00,$00,$24,$38   ;80F3B1|        |      ;
                       db $01,$00,$00,$00,$00,$25,$38,$01   ;80F3B9|        |      ;
                       db $00,$00,$00,$00,$26,$38,$01,$00   ;80F3C1|        |      ;
                       db $00,$00,$00,$27,$38,$01,$00,$00   ;80F3C9|        |      ;
                       db $00,$00,$28,$38,$01,$00,$00,$00   ;80F3D1|        |      ;
                       db $00,$29,$38,$01,$00,$00,$00,$00   ;80F3D9|        |      ;
                       db $2A,$38,$01,$00,$00,$00,$00,$2B   ;80F3E1|        |      ;
                       db $38,$01,$00,$00,$00,$00,$2C,$38   ;80F3E9|        |      ;
                       db $01,$00,$00,$00,$00,$2D,$38,$01   ;80F3F1|        |      ;
                       db $00,$00,$00,$00,$2E,$38,$01,$00   ;80F3F9|        |      ;
                       db $00,$00,$00,$20,$2A,$01,$00,$00   ;80F401|        |      ;
                       db $00,$00,$21,$2A,$01,$00,$00,$00   ;80F409|        |      ;
                       db $00,$22,$2A,$01,$00,$00,$00,$00   ;80F411|        |      ;
                       db $23,$2A,$01,$00,$00,$00,$00,$24   ;80F419|        |      ;
                       db $2A,$01,$00,$00,$00,$00,$25,$2A   ;80F421|        |      ;
                       db $01,$00,$00,$00,$00,$26,$2A,$01   ;80F429|        |      ;
                       db $00,$00,$00,$00,$27,$2A,$01,$00   ;80F431|        |      ;
                       db $00,$00,$00,$28,$2A,$01,$00,$00   ;80F439|        |      ;
                       db $00,$00,$29,$2A,$01,$00,$00,$00   ;80F441|        |      ;
                       db $00,$2A,$2A,$01,$00,$00,$00,$00   ;80F449|        |      ;
                       db $2B,$2A,$01,$00,$00,$00,$00,$2C   ;80F451|        |      ;
                       db $2A,$01,$00,$00,$00,$00,$2D,$2A   ;80F459|        |      ;
                       db $01,$00,$00,$00,$00,$2E,$2A,$01   ;80F461|        |      ;
                       db $00,$00,$00,$00,$20,$3A,$01,$00   ;80F469|        |      ;
                       db $00,$00,$00,$21,$3A,$01,$00,$00   ;80F471|        |      ;
                       db $00,$00,$22,$3A,$01,$00,$00,$00   ;80F479|        |      ;
                       db $00,$23,$3A,$01,$00,$00,$00,$00   ;80F481|        |      ;
                       db $24,$3A,$01,$00,$00,$00,$00,$25   ;80F489|        |      ;
                       db $3A,$01,$00,$00,$00,$00,$26,$3A   ;80F491|        |      ;
                       db $01,$00,$00,$00,$00,$27,$3A,$01   ;80F499|        |      ;
                       db $00,$00,$00,$00,$28,$3A,$01,$00   ;80F4A1|        |      ;
                       db $00,$00,$00,$29,$3A,$01,$00,$00   ;80F4A9|        |      ;
                       db $00,$00,$2A,$3A,$01,$00,$00,$00   ;80F4B1|        |      ;
                       db $00,$2B,$3A,$01,$00,$00,$00,$00   ;80F4B9|        |      ;
                       db $2C,$3A,$01,$00,$00,$00,$00,$2D   ;80F4C1|        |      ;
                       db $3A,$01,$00,$00,$00,$00,$2E,$3A   ;80F4C9|        |      ;
 
         DATA8_80F4D1:
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F4D1|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F4D9|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F4E1|        |      ;
                       db $00,$00,$00,$00,$01,$00,$00,$00   ;80F4E9|        |      ;
                       db $00,$00,$00,$00,$00,$00,$01,$00   ;80F4F1|        |      ;
                       db $01,$00,$01,$00,$00,$00,$00,$00   ;80F4F9|        |      ;
                       db $00,$00,$00,$00,$01,$00,$00,$00   ;80F501|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F509|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F511|        |      ;
                       db $00,$00,$00,$00,$FF,$FF,$00,$00   ;80F519|        |      ;
                       db $00,$00,$00,$00,$FF,$FF,$FF,$FF   ;80F521|        |      ;
                       db $FF,$FF,$00,$00,$00,$00,$00,$00   ;80F529|        |      ;
                       db $00,$00,$00,$80                   ;80F531|        |      ;
 
         DATA8_80F535:
                       db $04,$00,$04,$00,$04,$00,$04,$00   ;80F535|        |      ;
                       db $04,$00,$06,$00,$06,$00,$06,$00   ;80F53D|        |      ;
                       db $07,$00,$07,$00,$07,$00,$07,$00   ;80F545|        |      ;
                       db $08,$00,$08,$00,$00,$80           ;80F54D|        |      ;
 
         DATA8_80F553:
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F553|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F55B|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F563|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F56B|        |      ;
                       db $00,$00,$FF,$FF,$FF,$FF,$FE,$FF   ;80F573|        |      ;
                       db $FE,$FF,$FD,$FF,$FC,$FF,$FA,$FF   ;80F57B|        |      ;
                       db $F9,$FF,$FA,$FF,$00,$00,$00,$00   ;80F583|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F58B|        |      ;
                       db $00,$00,$00,$80                   ;80F593|        |      ;
 
         DATA8_80F597:
                       db $00,$00,$04,$00,$04,$00,$04,$00   ;80F597|        |      ;
                       db $04,$00,$04,$00,$06,$00,$06,$00   ;80F59F|        |      ;
                       db $06,$00,$07,$00,$07,$00,$07,$00   ;80F5A7|        |      ;
                       db $07,$00,$08,$00,$08,$00,$08,$00   ;80F5AF|        |      ;
                       db $05,$00,$00,$00,$00,$00,$00,$00   ;80F5B7|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F5BF|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F5C7|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F5CF|        |      ;
                       db $00,$00                           ;80F5D7|        |      ;
                       db $00,$80                           ;80F5D9|        |      ;
 
         DATA8_80F5DB:
                       db $00,$00,$F2,$FF,$F2,$FF,$F6,$FF   ;80F5DB|        |      ;
                       db $F6,$FF,$F8,$FF,$FA,$FF,$FE,$FF   ;80F5E3|        |      ;
                       db $FC,$FF,$FC,$FF,$FF,$FF,$FE,$FF   ;80F5EB|        |      ;
                       db $FF,$FF,$FE,$FF,$FF,$FF,$FF,$FF   ;80F5F3|        |      ;
                       db $00,$80                           ;80F5FB|        |      ;
 
         DATA8_80F5FD:
                       db $00,$00,$F5,$FF,$F5,$FF,$F7,$FF   ;80F5FD|        |      ;
                       db $F8,$FF,$FA,$FF,$FB,$FF,$FE,$FF   ;80F605|        |      ;
                       db $FD,$FF,$FD,$FF,$FF,$FF,$FE,$FF   ;80F60D|        |      ;
                       db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;80F615|        |      ;
                       db $00,$80                           ;80F61D|        |      ;
 
       UNREACH_80F61F:
                       db $00,$00,$0C,$00,$0D,$00,$09,$00   ;80F61F|        |      ;
                       db $09,$00,$07,$00,$06,$00,$01,$00   ;80F627|        |      ;
                       db $04,$00,$03,$00,$02,$00,$01,$00   ;80F62F|        |000000;
                       db $02,$00,$01,$00,$01,$00,$01,$00   ;80F637|        |      ;
                       db $00,$80                           ;80F63F|        |      ;
 
       UNREACH_80F641:
                       db $00,$00,$0C,$00,$0C,$00,$0A,$00   ;80F641|        |      ;
                       db $08,$00,$07,$00,$06,$00,$01,$00   ;80F649|        |      ;
                       db $04,$00,$03,$00,$02,$00,$01,$00   ;80F651|        |000000;
                       db $02,$00,$01,$00,$01,$00,$01,$00   ;80F659|        |      ;
                       db $00,$80                           ;80F661|        |      ;
 
       UNREACH_80F663:
                       db $00,$00,$F4,$FF,$F3,$FF,$F7,$FF   ;80F663|        |      ;
                       db $F7,$FF,$F9,$FF,$FA,$FF,$FF,$FF   ;80F66B|        |0000FF;
                       db $FC,$FF,$FD,$FF,$FE,$FF,$FF,$FF   ;80F673|        |80FDFF;
                       db $FE,$FF,$FF,$FF,$FF,$FF,$FF,$FF   ;80F67B|        |00FFFF;
                       db $00,$80                           ;80F683|        |      ;
 
       UNREACH_80F685:
                       db $00,$00,$0C,$00,$0C,$00,$0A,$00   ;80F685|        |      ;
                       db $08,$00,$07,$00,$06,$00,$01,$00   ;80F68D|        |      ;
                       db $04,$00,$03,$00,$02,$00,$01,$00   ;80F695|        |000000;
                       db $02,$00,$01,$00,$01,$00,$01,$00   ;80F69D|        |      ;
                       db $00,$80,$00,$00,$00,$00,$00,$00   ;80F6A5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6AD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6B5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6BD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6C5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6CD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6D5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6DD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6E5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6ED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6F5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F6FD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F705|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F70D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F715|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F71D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F725|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F72D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F735|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F73D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F745|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F74D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F755|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F75D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F765|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F76D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F775|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F77D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F785|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F78D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F795|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F79D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7A5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7AD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7B5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7BD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7C5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7CD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7D5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7DD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7E5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7ED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7F5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F7FD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F805|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F80D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F815|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F81D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F825|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F82D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F835|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F83D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F845|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F84D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F855|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F85D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F865|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F86D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F875|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F87D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F885|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F88D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F895|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F89D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8A5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8AD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8B5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8BD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8C5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8CD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8D5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8DD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8E5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8ED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8F5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F8FD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F905|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F90D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F915|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F91D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F925|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F92D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F935|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F93D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F945|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F94D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F955|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F95D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F965|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F96D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F975|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F97D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F985|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F98D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F995|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F99D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9A5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9AD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9B5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9BD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9C5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9CD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9D5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9DD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9E5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9ED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9F5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80F9FD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FA9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FABD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FACD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FADD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FAFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FB9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FBFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FC9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FCFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FD9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDCD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDD5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FDFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FE9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEA5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEAD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEB5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEBD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEC5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FECD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FED5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEDD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEE5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEED|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEF5|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FEFD|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF05|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF0D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF15|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF1D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF25|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF2D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF35|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF3D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF45|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF4D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF55|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF5D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF65|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF6D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF75|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF7D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF85|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF8D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF95|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FF9D|        |      ;
                       db $00,$00,$00,$00,$00,$00,$00,$00   ;80FFA5|        |      ;
                       db $00,$00,$00                       ;80FFAD|        |      ;
 
      Header_GameCode:
                       db "01AYLE"                          ;80FFB0|        |      ;
 
      Header_Reserved:
                       db $00,$00,$00,$00,$00,$00           ;80FFB6|        |      ;
 
  Header_ExpFlashSize:
                       db $00                               ;80FFBC|        |      ;
 
    Header_ExpRAMSize:
                       db $00                               ;80FFBD|        |      ;
 
Header_SpecialVersion:
                       db $00                               ;80FFBE|        |      ;
 
Header_ChipsetSubtype:
                       db $00                               ;80FFBF|        |      ;
 
     Header_CartTitle:
                       db "TETRIS ATTACK        "           ;80FFC0|        |      ;
 
        Header_MemMap:
                       db $30                               ;80FFD5|        |      ;
 
       Header_Chipset:
                       db $00                               ;80FFD6|        |      ;
 
       Header_ROMSize:
                       db $0A                               ;80FFD7|        |      ;
 
       Header_RAMSize:
                       db $00                               ;80FFD8|        |      ;
 
        Header_Region:
                       db $01                               ;80FFD9|        |      ;
 
         Header_DevID:
                       db $33                               ;80FFDA|        |      ;
 
    Header_ROMVersion:
                       db $00                               ;80FFDB|        |      ;
 
Header_ChecksumComplement:
                       dw $D30C                             ;80FFDC|        |      ;
 
      Header_Checksum:
                       dw $2CF3                             ;80FFDE|        |      ;
Native_Reserved1__ignored:
                       dw CODE_808000                       ;80FFE0|        |808000;
Native_Reserved2__ignored:
                       dw CODE_808000                       ;80FFE2|        |808000;
           Native_COP:
                       dw CODE_808000                       ;80FFE4|        |808000;
           Native_BRK:
                       dw CODE_808000                       ;80FFE6|        |808000;
Native_ABORT__ignored:
                       dw CODE_808000                       ;80FFE8|        |808000;
           Native_NMI:
                       dw CODE_808E21                       ;80FFEA|        |808E21;
Native_RESET__ignored:
                       dw CODE_808000                       ;80FFEC|        |808000;
           Native_IRQ:
                       dw CODE_808EB9                       ;80FFEE|        |808EB9;
Emulation_Reserved1__ignored:
                       dw CODE_808000                       ;80FFF0|        |808000;
Emulation_Reserved2__ignored:
                       dw CODE_808000                       ;80FFF2|        |808000;
        Emulation_COP:
                       dw CODE_808000                       ;80FFF4|        |808000;
Emulation_Reserved3__ignored:
                       dw CODE_808000                       ;80FFF6|        |808000;
Emulation_ABORT__ignored:
                       dw CODE_808000                       ;80FFF8|        |808000;
        Emulation_NMI:
                       dw CODE_808000                       ;80FFFA|        |808000;
      Emulation_RESET:
                       dw Reset                             ;80FFFC|        |808002;
     Emulation_IRQBRK:
                       dw CODE_808000                       ;80FFFE|        |808000;
