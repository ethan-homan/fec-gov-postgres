
-- https://www.fec.gov/campaign-finance-data/candidate-master-file-description/

CREATE TABLE IF NOT EXISTS candidate_master (
    cand_id varchar (9) NOT NULL, -- CAND_ID,Candidate identification,1,N,VARCHAR2(9),A 9-character alpha-numeric code assigned to a candidate by the Federal Election Commission. The candidate ID for a specific candidate remains the same across election cycles as long as the candidate is running for the same office.,H8VA01233
    cand_name varchar (200), -- CAND_NAME,Candidate name,2,Y,VARCHAR2(200),Martha Washington
    cand_pty_affiliation varchar (3), -- CAND_PTY_AFFILIATION,Party affiliation,3,Y,VARCHAR2(3),The political party affiliation reported by the candidate,NON
    cand_election_yr numeric, -- CAND_ELECTION_YR,Year of election,4,Y,Number(4),Candidate's election year from a Statement of Candidacy or state ballot list,2018
    cand_office_st varchar (2), -- CAND_OFFICE_ST,Candidate state,5,Y,VARCHAR2(2),House = state of race President = US Senate = state of race,VA
    cand_office varchar (1), -- CAND_OFFICE,Candidate office,6,Y,VARCHAR2(1),H = House P = President S = Senate,H
    cand_office_district varchar (2), -- CAND_OFFICE_DISTRICT,Candidate district,7,Y,VARCHAR2(2),Congressional district number Congressional at-large 00 Senate 00 Presidential 00,01
    cand_ici varchar (1), -- CAND_ICI,Incumbent challenger status,8,Y,VARCHAR2(1),C = Challenger I = Incumbent O = Open Seat is used to indicate an open seat; Open seats are defined as seats where the incumbent never sought re-election.,I
    cand_status varchar (1), -- CAND_STATUS,Candidate status,9,Y,VARCHAR2(1),C = Statutory candidate F = Statutory candidate for future election N = Not yet a statutory candidate P = Statutory candidate in prior cycle,C
    cand_pcc varchar (9), -- CAND_PCC,Principal campaign committee,10,Y,VARCHAR2(9),The ID assigned by the Federal Election Commission to the candidate's principal campaign committee for a given election cycle.,C00100005
    cand_st1 varchar (34), -- CAND_ST1,Mailing address - street,11,Y,VARCHAR2(34),Mailing address - street,1001 George Washington Hwy
    cand_st2 varchar (34), -- CAND_ST2,Mailing address - street2,12,Y,VARCHAR2(34),Mailing address - street2,Suite 100
    cand_city varchar (30), -- CAND_CITY,Mailing address - city,13,Y,VARCHAR2(30),Mailing address - city,Alexandria
    cand_st varchar (2), -- CAND_ST,Mailing address - state,14,Y,VARCHAR2(2),Mailing address - state,VA
    cand_zip varchar (9), -- CAND_ZIP,Mailing address - ZIP code,15,Y,VARCHAR2(9),Mailing address - ZIP code,22201
    file_year INTEGER,
    PRIMARY KEY (cand_id, file_year)
);
