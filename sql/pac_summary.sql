
-- https://www.fec.gov/campaign-finance-data/pac-and-party-summary-file-description/

CREATE TABLE IF NOT EXISTS pac_summary (
    cmte_id varchar(9), -- CMTE_ID,Committee identification,1,N,VARCHAR2 (9),,C00100005
    cmte_nm varchar(200), -- CMTE_NM,Committee name,2,Y,VARCHAR2 (200),,National Finance Political Action Committee
    cmte_tp varchar(1), -- CMTE_TP,Committee type,3,Y,VARCHAR2 (1),,Q
    cmte_dsgn varchar(1), -- CMTE_DSGN,Committee designation,4,Y,VARCHAR2 (1),,U
    cmte_filing_freq varchar(1), -- CMTE_FILING_FREQ,Committee filing frequency,5,Y,VARCHAR2 (1),,M
    ttl_receipts numeric, -- TTL_RECEIPTS,Total receipts,6,Y,Number(14,2),,150000.00
    trans_from_aff numeric, -- TRANS_FROM_AFF,Transfers from affiliates,7,Y,Number(14,2),,0.00
    indv_contrib numeric, -- INDV_CONTRIB,Contributions from individuals,8,Y,Number(14,2),,100000.00
    other_pol_cmte_contrib numeric, -- OTHER_POL_CMTE_CONTRIB,Contributions from other political committees,9,Y,Number(14,2),,50000.00
    cand_contrib numeric, -- CAND_CONTRIB,Contributions from candidate,10,Y,Number(14,2),Not applicable,
    cand_loans numeric, -- CAND_LOANS,Candidate loans,11,Y,Number(14,2),Not applicable,
    ttl_loans_received numeric, -- TTL_LOANS_RECEIVED,Total loans received,12,Y,Number(14,2),,0.00
    ttl_disb numeric, -- TTL_DISB,Total disbursements,13,Y,Number(14,2),,145000.00
    tranf_to_aff numeric, -- TRANF_TO_AFF,Transfers to affiliates,14,Y,Number(14,2),,0.00
    indv_refunds numeric, -- INDV_REFUNDS,Refunds to individuals,15,Y,Number(14,2),,0.00
    other_pol_cmte_refunds numeric, -- OTHER_POL_CMTE_REFUNDS,Refunds to other political committees,16,Y,Number(14,2),,0.00
    cand_loan_repay numeric, -- CAND_LOAN_REPAY,Candidate loan repayments,17,Y,Number(14,2),Not applicable,
    loan_repay numeric, -- LOAN_REPAY,Loan repayments,18,Y,Number(14,2),,0.00
    coh_bop numeric, -- COH_BOP,Cash beginning of period,19,Y,Number(14,2),,304000.00
    coh_cop numeric, -- COH_COP,Cash close Of period,20,Y,Number(14,2),,315000.00
    debts_owed_by numeric, -- DEBTS_OWED_BY,Debts owed by,21,Y,Number(14,2),,0.00
    nonfed_trans_received numeric, -- NONFED_TRANS_RECEIVED,Nonfederal transfers received,22,Y,Number(14,2),,0.00
    contrib_to_other_cmte numeric, -- CONTRIB_TO_OTHER_CMTE,Contributions to other committees,23,Y,Number(14,2),,75000.00
    ind_exp numeric, -- IND_EXP,Independent expenditures,24,Y,Number(14,2),,10000.00
    pty_coord_exp numeric, -- PTY_COORD_EXP,Party coordinated expenditures,25,Y,Number(14,2),,0.00
    nonfed_share_exp numeric, -- NONFED_SHARE_EXP,Nonfederal share expenditures,26,Y,Number(14,2),,0.00
    cvg_end_dt varchar(100), -- CVG_END_DT,Coverage end date,27,Y,DATE(MM/DD/YYYY),Through date,04/30/2018
    file_year INTEGER,
    PRIMARY KEY (cmte_id, file_year)
);
