
-- https://www.fec.gov/campaign-finance-data/candidate-committee-linkage-file-description/

CREATE TABLE IF NOT EXISTS candidate_committee_linkages (
    cand_id VARCHAR(9), -- CAND_ID|Candidate identification|1|N|VARCHAR2 (9)|A 9-character alpha-numeric code assigned to a candidate by the Federal Election Commission. The candidate ID for a specific candidate remains the same across election cycles as long as the candidate is running for the same office.|H8VA01233
    cand_election_yr NUMERIC, -- CAND_ELECTION_YR|Candidate election year|2|N|NUMBER (4)|Candidate's election year|2018
    fec_election_yr NUMERIC, -- FEC_ELECTION_YR|FEC election year|3|N|NUMBER (4)|Active 2-year period|2018
    cmte_id VARCHAR(9), -- CMTE_ID|Committee identification|4|Y|VARCHAR2 (9)|A 9-character alpha-numeric code assigned to a committee by the Federal Election Commission. The committee ID for a specific committee always remains the same.|C00100005
    cmte_tp VARCHAR(1), -- CMTE_TP|Committee type|5|Y|VARCHAR2 (1)|List of committee type codes|H
    cmte_dsgn VARCHAR(1), -- CMTE_DSGN|Committee designation|6|Y|VARCHAR2 (1)|A = Authorized by a candidate B = Lobbyist/Registrant PAC D = Leadership PAC J = Joint fundraiser P = Principal campaign committee of a candidate U = Unauthorized|A
    linkage_id NUMERIC, -- LINKAGE_ID|Linkage ID|7|N|NUMBER (12)|Unique link ID|123456789012
    file_year INTEGER
)
