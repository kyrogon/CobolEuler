      * FIND THE SUM OF ALL MULTIPLES OF 3 OR 5 BELOW 1000
       IDENTIFICATION DIVISION.
       PROGRAM-ID. EULER1.
      * 
       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 WS-VALUE-INDEX INDEX.
           01 WS-X PIC 9(10) VALUE 0.
      *     
           01 WS-START PIC 9(2).
           01 WS-CURRENT PIC 9(4).
           01 WS-TABLE.
           05 WS-VALUE PIC 9(4) VALUE 0 OCCURS 1000 TIMES INDEXED BY I.
      * 
       PROCEDURE DIVISION.
           PERFORM A-PARA
               VARYING WS-START FROM 3 BY 2 UNTIL WS-START>5.
           PERFORM C-PARA VARYING WS-VALUE-INDEX FROM 1 BY 1 
               UNTIL WS-VALUE-INDEX >= 1000.
           DISPLAY "SOLUTION: "WS-X.
           STOP RUN.
      *
           A-PARA.
           MOVE WS-START TO WS-CURRENT.
           PERFORM B-PARA UNTIL WS-CURRENT >= 1000.
      *    
           B-PARA.
           SET I TO 1.
           SEARCH WS-VALUE
      *        APPEND WS-CURRENT TO TABLE IF NOT FOUND IN TABLE
               AT END 
                   MOVE WS-CURRENT TO WS-VALUE(WS-VALUE-INDEX)
      *        OTHERWISE JUST CONTINUE
               WHEN WS-VALUE(I) = WS-CURRENT
                   CONTINUE
           END-SEARCH.
           SET WS-VALUE-INDEX UP BY 1.
           ADD WS-START TO WS-CURRENT.
      *
           C-PARA.
           COMPUTE WS-X = WS-X + WS-VALUE(WS-VALUE-INDEX).
      *