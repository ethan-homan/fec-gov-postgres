
-- https://www.fec.gov/campaign-finance-data/current-campaigns-house-and-senate-file-description/

CREATE TABLE IF NOT EXISTS house_senate_current_campaigns (
    cand_id VARCHAR(9), -- CAND_ID,Candidate identification,1,N,VARCHAR2 (9),H8VA01233
    cand_name VARCHAR(200), -- CAND_NAME,Candidate name,2,Y,VARCHAR2(200),Martha Washington
    cand_ici VARCHAR(1), -- CAND_ICI,Incumbent challenger status,3,Y,VARCHAR2(1),I
    pty_cd VARCHAR(1), -- PTY_CD,Party code,4,Y,VARCHAR2(1),NON
    cand_pty_affiliation VARCHAR(3), -- CAND_PTY_AFFILIATION,Party affiliation,5,Y,VARCHAR2(3),NON
    ttl_receipts NUMERIC, -- TTL_RECEIPTS,Total receipts,6,Y,Number(14,2),345,456.34
    trans_from_auth NUMERIC, -- TRANS_FROM_AUTH,Transfers from authorized committees,7,Y,Number(14,2),4000.00
    ttl_disb NUMERIC, -- TTL_DISB,Total disbursements,8,Y,Number(14,2),175645.21
    trans_to_auth NUMERIC, -- TRANS_TO_AUTH,Transfers to authorized committees,9,Y,Number(14,2),0.00
    coh_bop NUMERIC, -- COH_BOP,Beginning cash,10,Y,Number(14,2),845901.23
    coh_cop NUMERIC, -- COH_COP,Ending cash,11,Y,Number(14,2),915671.43
    cand_contrib NUMERIC, -- CAND_CONTRIB,Contributions from candidate,12,Y,Number(14,2),500.00
    cand_loans NUMERIC, -- CAND_LOANS,Loans from candidate,13,Y,Number(14,2),250000.00
    other_loans NUMERIC, -- OTHER_LOANS,Other loans,14,Y,Number(14,2),0.00
    cand_loan_repay NUMERIC, -- CAND_LOAN_REPAY,Candidate loan repayments,15,Y,Number(14,2),100000.00
    other_loan_repay NUMERIC, -- OTHER_LOAN_REPAY,Other loan repayments,16,Y,Number(14,2),0.00
    debts_owed_by NUMERIC, -- DEBTS_OWED_BY,Debts owed by,17,Y,Number(14,2),250.00
    ttl_indiv_contrib NUMERIC, -- TTL_INDIV_CONTRIB,Total individual contributions,18,Y,Number(14,2),450000.00
    cand_office_st VARCHAR(2), -- CAND_OFFICE_ST,Candidate state,19,Y,VARCHAR2(2),VA
    cand_office_district VARCHAR(2), -- CAND_OFFICE_DISTRICT,Candidate district,20,Y,VARCHAR2(2),01
    spec_election VARCHAR(1), -- SPEC_ELECTION,Special election status,21,Y,VARCHAR2(1),Election result data included in 1996-2006 files only.,W
    prim_election VARCHAR(1), -- PRIM_ELECTION,Primary election status,22,Y,VARCHAR2(1),Election result data included in 1996-2006 files only.,L
    run_election VARCHAR(1), -- RUN_ELECTION,Runoff election status,23,Y,VARCHAR2(1),Election result data included in 1996-2006 files only.,W
    gen_election VARCHAR(1), -- GEN_ELECTION,General election status,24,Y,VARCHAR2(1),Election result data included in 1996-2006 files only.,L
    gen_election_precent NUMERIC, -- GEN_ELECTION_PRECENT,General election percentage,25,Y,Number(7,4),Election result data included in 1996-2006 files only.,63.2
    other_pol_cmte_contrib NUMERIC, -- OTHER_POL_CMTE_CONTRIB,Contributions from other political committees,26,Y,Number(14,2),200000.00
    pol_pty_contrib NUMERIC, -- POL_PTY_CONTRIB,Contributions from party committees,27,Y,Number(14,2),200000.00
    cvg_end_dt VARCHAR(12), -- CVG_END_DT,Coverage end date,28,Y,DATE(MM/DD/YYYY),Through date,10/19/2018
    indiv_refunds NUMERIC, -- INDIV_REFUNDS,Refunds to individuals,29,Y,Number(14,2),4000.00
    cmte_refunds NUMERIC, -- CMTE_REFUNDS,Refunds to committees,30,Y,Number(14,2),100
    file_year INTEGER
)
