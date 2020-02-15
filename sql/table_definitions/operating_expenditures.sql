
-- https://www.fec.gov/campaign-finance-data/operating-expenditures-file-description/

CREATE TABLE IF NOT EXISTS operating_expenditures (
    cmte_id VARCHAR(9), -- CMTE_ID|Filer identification number|1|N|VARCHAR2 (9)|Identification number of committee filing report. A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission|C00100005
    amndt_ind VARCHAR(1), -- AMNDT_IND|Amendment indicator|2|Y|VARCHAR2 (1)|Indicates if the report being filed is new (N), an amendment (A) to a previous report, or a termination (T) report.|A
    rpt_yr NUMERIC, -- RPT_YR|Report year|3|Y|Number(4)|2018
    rpt_tp VARCHAR(3), -- RPT_TP|Report type|4|Y|VARCHAR2 (3)|Indicates the type of report filed. List of report type codes|12G
    image_num VARCHAR(18), -- IMAGE_NUM|Image number|5|Y|VARCHAR2 (11) or VARCHAR2(18)|11-digit Image Number Format YYOORRRFFFF YY - scanning year OO - office (01 - House, 02 - Senate, 03 - FEC Paper, 90-99 - FEC Electronic) RRR - reel number FFFF- frame number 18-digit Image Number Format (June 29, 2015) YYYYMMDDSSPPPPPPPP YYYY - scanning year MM - scanning month DD - scanning day SS - source (02 - Senate, 03 - FEC Paper, 90-99 - FEC Electronic) PPPPPPPP - page (reset to zero every year on January 1)|201810170912341234
    line_num VARCHAR(10), -- LINE_NUM|Line number|6|Y||Indicates FEC form line number|17
    form_tp_cd VARCHAR(8), -- FORM_TP_CD|Form type|7|Y|VARCHAR2 (8)|Indicates FEC Form|3
    sched_tp_cd VARCHAR(8), -- SCHED_TP_CD|Schedule type|8|Y|VARCHAR2 (8)|Schedule B - Itemized disbursements|SB
    name VARCHAR(200), -- NAME|Contributor/Lender/Transfer Name|9|Y|VARCHAR2 (200)| |XYZ Printing
    city VARCHAR(30), -- CITY|City|10|Y|VARCHAR2 (30)| |Alexandria
    state VARCHAR(2), -- STATE|State|11|Y|VARCHAR2 (2)| |VA
    zip_code VARCHAR(9), -- ZIP_CODE|ZIP code|12|Y|VARCHAR2 (9)| |22201
    transaction_dt VARCHAR(12), -- TRANSACTION_DT|Transaction date (MMDDYYYY)|13|Y|DATE| |05112018
    transaction_amt NUMERIC, -- TRANSACTION_AMT|Transaction amount|14|Y|NUMBER (14,2)| |512.34
    transaction_pgi VARCHAR(5), -- TRANSACTION_PGI|Primary general indicator|15|Y|VARCHAR2 (5)| |P2018
    purpose VARCHAR(100), -- PURPOSE|Purpose|16|Y|VARCHAR2 (100)| |Printing yard signs
    category VARCHAR(3), -- CATEGORY|Disbursement category code|17|Y|VARCHAR2 (3)|001-012 and 101-107|006
    category_desc VARCHAR(40), -- CATEGORY_DESC|Disbursement Category Code Description|18|Y|VARCHAR2 (40)|List of Disbursement Category Codes and their meaning|Campaign materials
    memo_cd VARCHAR(1), -- MEMO_CD|Memo code|19|Y|VARCHAR2 (1)|'X' indicates that the amount is NOT to be included in the itemization total.|X
    memo_text VARCHAR(100), -- MEMO_TEXT|Memo text|20|Y|VARCHAR2 (100)|A description of the activity. Memo Text is available on itemized amounts on Schedule B. These transactions are included in the itemization total.|Credit card payment – AmEx 5/1/18
    entity_tp VARCHAR(3), -- ENTITY_TP|Entity type|21|Y|VARCHAR2 (3)|ONLY VALID FOR ELECTRONIC FILINGS received after April 2002. CAN = Candidate CCM = Candidate committee COM = Committee IND = Individual (a person) ORG = Organization (not a committee and not a person) PAC = Political action committee PTY = Party organization|ORG
    sub_id NUMERIC, -- SUB_ID|FEC record number|22|N|NUMBER (19)|Unique row ID|1234567891234567891
    file_num NUMERIC, -- FILE_NUM|File number/report ID|23|Y|NUMBER (7)|Unique report id|1197685
    tran_id VARCHAR(32), -- TRAN_ID|Transaction ID||24|VARCHAR2 (32)|ONLY VALID FOR ELECTRONIC FILINGS. A unique identifier associated with each itemization or transaction appearing in an FEC electronic file. A transaction ID is unique for a specific committee for a specific report. In other words, if committee, C1, files a Q3 New with transaction SA123 and then files 3 amendments to the Q3 transaction SA123 will be identified by transaction ID SA123 in all 4 filings.|SB17.4326
    back_ref_tran_id VARCHAR(32), -- BACK_REF_TRAN_ID|Back reference transaction ID|25|Y|VARCHAR2 (32)|ONLY VALID FOR ELECTRONIC FILINGS. Used to associate one transaction with another transaction in the same report (using file number, transaction ID and back reference transaction ID). For example, a credit card payment and the subitemization of specific purchases. The back reference transaction ID of the specific purchases will equal the transaction ID of the payment to the credit card company.|SB17.8690
    _unspecified_extra_col VARCHAR(1), -- extra column that the exports had -- appears to be empty for all records
    file_year INTEGER
)
