
-- https://www.fec.gov/campaign-finance-data/any-transaction-one-committee-another-file-description/

CREATE TABLE IF NOT EXISTS committee_transactions (
    cmte_id varchar(9), -- CMTE_ID|Filer identification number|1|N|VARCHAR2 (9)|A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission|C00100005
    amndt_ind varchar(1), -- AMNDT_IND|Amendment indicator|2|Y|VARCHAR2 (1)|Indicates if the report being filed is new (N), an amendment (A) to a previous report or a termination (T) report.|A
    rpt_tp varchar(3), -- RPT_TP|Report type|3|Y|VARCHAR2 (3)|Indicates the type of report filed. List of report type codes|Q2
    transaction_pgi varchar(5), -- TRANSACTION_PGI|Primary-general indicator|4|Y|VARCHAR2 (5)|This code indicates the election for which the contribution was made. EYYYY (election Primary, General, Other plus election year)|P2018
    image_num varchar(18), -- IMAGE_NUM|Image number|5|Y|VARCHAR2 (11) or VARCHAR2(18)|11-digit image number format YYOORRRFFFFYY - scanning year OO - office (01 - House, 02 - Senate, 03 - FEC Paper, 90-99 - FEC Electronic) RRR - reel number FFFF- frame number 18-digit image number normat (June 29, 2015) YYYYMMDDSSPPPPPPPPYYYY - scanning year MM - scanning month DD - scanning day SS - source (02 - Senate, 03 - FEC Paper, 90-99 - FEC Electronic) PPPPPPPP - page (reset to zero every year on January 1) 201810170912341234
    transaction_tp varchar(3), -- TRANSACTION_TP|Transaction type|6|Y|VARCHAR2 (3)|Transaction types 10J, 11J, 13, 15J, 15Z, 16C, 16F, 16G, 16R, 17R, 17Z, 18G, 18J, 18K, 18U, 19J, 20, 20C, 20F, 20G, 20R, 22H, 22Z, 23Y, 24A, 24C, 24E, 24F, 24G, 24H, 24K, 24N, 24P, 24R, 24U, 24Z and 29 are included in the OTH file. Beginning with 2016 transaction types 30F, 30G, 30J, 30K, 31F, 31G, 31J, 31K, 32F, 32G, 32J, 32K, 40, 40Z, 41, 41Z, 42 and 42Z are also included in the OTH file. For more information about transaction type codes see this list of transaction type codes|30F
    entity_tp varchar(3), -- ENTITY_TP|Entity type|7|Y|VARCHAR2 (3)|ONLY VALID FOR ELECTRONIC FILINGS received after April 2002. CAN = Candidate CCM = Candidate Committee COM = Committee IND = Individual (a person) ORG = Organization (not a committee and not a person) PAC = Political Action Committee PTY = Party Organization|COM
    name varchar(200), -- NAME|Contributor/lender/transfer Name|8|Y|VARCHAR2 (200)|Martha Washington for Congress
    city varchar(30), -- CITY|City|9|Y|VARCHAR2 (30)|Alexandria
    state varchar(2), -- STATE|State|10|Y|VARCHAR2 (2)|VA
    zip_code varchar(9), -- ZIP_CODE|ZIP code|11|Y|VARCHAR2 (9)|22201
    employer varchar(38), -- EMPLOYER|Employer|12|Y|VARCHAR2 (38)|
    occupation varchar(38), -- OCCUPATION|Occupation|13|Y|VARCHAR2 (38)|
    transaction_dt varchar(38), -- TRANSACTION_DT|Transaction date (MMDDYYYY)|14|Y|DATE|05112018
    transaction_amt numeric, -- TRANSACTION_AMT|Transaction amount|15|Y|NUMBER (14,2)|5000.00
    other_id varchar(9), -- OTHER_ID|Other identification number|16|Y|VARCHAR2 (9)|For contributions from individuals this column is null. For contributions from candidates or other committees this column will contain that contributor's FEC ID.|C00100502
    tran_id varchar(32), -- TRAN_ID|Transaction ID|18|Y|VARCHAR2 (32)|ONLY VALID FOR ELECTRONIC FILINGS. A unique identifier associated with each itemization or transaction appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report. In other words, if committee, C1, files a Q3 New with transaction SA123 and then files 3 amendments to the Q3 transaction SA123 will be identified by transaction ID SA123 in all 4 filings.|SA11AI.8317
    file_num integer, -- FILE_NUM|File number / Report ID|19|Y|NUMBER (22)|Unique report id|1197695
    memo_cd varchar(1), -- MEMO_CD|Memo code|20|Y|VARCHAR2 (1)|'X' indicates that the amount is NOT to be included in the itemization total.|X
    memo_text varchar (100), -- MEMO_TEXT|Memo text|21|Y|VARCHAR2 (100)|A description of the activity. Memo text is available on itemized amounts on Schedules A and B. These transactions are included in the itemization total.|Contribution to federal committee
    sub_id VARCHAR(100), -- SUB_ID|FEC record number|22|N|NUMBER (19)|Unique row ID|1234567891234567891
    file_year INTEGER
)
