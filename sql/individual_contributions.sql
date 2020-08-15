
-- https://www.fec.gov/campaign-finance-data/contributions-individuals-file-description/

-- Recommended: Play with the data and build indices based on your planned access patterns.

CREATE TABLE IF NOT EXISTS individual_contributions (
    cmte_id varchar(9) NOT NULL,  --CMTE_ID,Filer identification number,1,N,VARCHAR2 (9),A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission,C00100005
    amndt_ind varchar(1),  --AMNDT_IND,Amendment indicator,2,Y,VARCHAR2 (1),"Indicates if the report being filed is new (N), an amendment (A) to a previous report or a termination (T) report."
    rpt_tp varchar(3),  --NRPT_TP,Report type,3,Y,VARCHAR2 (3),Indicates the type of report filed List of report type codes,12G
    transaction_pgi varchar(5),  --TRANSACTION_PGI,Primary-general indicator,4,Y,VARCHAR2 (5),"This code indicates the election for which the contribution was made. EYYYY (election plus election year) P = Primary G = General O = Other C = Convention R = Runoff S = Special E = Recount",P2018
    image_num varchar(20),  --IMAGE_NUM,Image number,5,Y,VARCHAR2 (11) or VARCHAR2(18),"11-digit Image Number Format YYOORRRFFFFYY - scanning year OO - office (01 - House, 02 - Senate, 03 - FEC Paper, 90-99- FEC Electronic) RRR - reel number FFFF- frame number 18-digit Image Number Format (June 29, 2015) YYYYMMDDSSPPPPPPPP YYYY - scanning year  MM - scanning month  DD - scanning day SS - source (02 - Senate, 03 - FEC Paper, 90-99 - FEC Electronic) PPPPPPPP - page (reset to zero every year on January 1)",201810170912345678
    transaction_tp varchar(3),  --TRANSACTION_TP,Transaction type,6,Y,VARCHAR2 (3),"Transaction types 10, 11, 15, 15C, 15E, 15I, 15T, 19, 22Y, 24I, 24T, 20Y and 21Y are included in the INDIV file. Beginning with 2016 transaction types 30, 30T, 31, 31T, 32, 32T, 40T, 40Y, 41T, 41Y, 42T and 42Y are also included in the INDIV file. For more information about transaction type codes see this list of transaction type codes",30T
    entity_tp varchar(3),  --ENTITY_TP,Entity type,7,Y,VARCHAR2 (3),"ONLY VALID FOR ELECTRONIC FILINGS received after April 2002. CAN = Candidate CCM = Candidate Committee COM = Committee IND = Individual (a person) ORG = Organization (not a committee and not a person) PAC = Political Action Committee PTY = Party Organization",IND
    name varchar (200),  --NAME,Contributor/Lender/Transfer Name,8,Y,VARCHAR2 (200),,Abigail Adams
    city varchar (30),  --CITY,City,9,Y,VARCHAR2 (30),,Braintree
    state varchar (2),  --STATE,State,10,Y,VARCHAR2 (2),,MA
    zip_code varchar (9),  --ZIP_CODE,ZIP code,11,Y,VARCHAR2 (9),,02184
    employer varchar (38),  --EMPLOYER,Employer,12,Y,VARCHAR2 (38),,Self employed
    occupation varchar (200),  --OCCUPATION,Occupation,13,Y,VARCHAR2 (38),,Homemaker
    transaction_dt varchar(100),  --TRANSACTION_DT,Transaction date (MMDDYYYY),14,Y,DATE,,10132018
    transaction_amt numeric,  --TRANSACTION_AMT,Transaction amount,15,Y,"NUMBER (14,2)",,1000.00
    other_id varchar(9),  --OTHER_ID,Other identification number,16,Y,VARCHAR2 (9),For contributions from individuals this column is null. For contributions from candidates or other committees this column will contain that contributor's FEC ID.,C00100309
    tran_id varchar(32),  --TRAN_ID,Transaction ID,17,Y,VARCHAR2 (32),"ONLY VALID FOR ELECTRONIC FILINGS. A unique identifier associated with each itemization or transaction appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report. In other words, if committee, C1, files a Q3 New with transaction SA123 and then files 3 amendments to the Q3 transaction SA123 will be identified by transaction ID SA123 in all 4 filings.",SA11A1A.8317
    file_num integer,  --FILE_NUM,File number / Report ID,18,Y,NUMBER (22),Unique report id,1197695
    memo_cd varchar(1),  --MEMO_CD,Memo code,19,Y,VARCHAR2 (1),'X' indicates that the amount is NOT to be included in the itemization total.,X
    memo_text varchar(100),  --MEMO_TEXT,Memo text,20,Y,VARCHAR2 (100),A description of the activity. Memo Text is available on itemized amounts on Schedules A and B. These transactions are included in the itemization total.,Reattributed from John Adams 10/5/18
    sub_id varchar(100),  --SUB_ID,FEC record number,21,N,NUMBER (19),Unique row ID,1234567891234567891
    file_year INTEGER,
    PRIMARY KEY (sub_id, file_year)
);