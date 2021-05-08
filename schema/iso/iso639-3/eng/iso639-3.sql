--- This SQL schema was extracted excatly as is documented on
--- https://iso639-3.sil.org/code_tables/download_tables (date: 2021-05-08)
--- so was not inferred.

--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_table_definition.txt

CREATE TABLE [ISO_639-3] (
         Id      char(3) NOT NULL,  -- The three-letter 639-3 identifier
         Part2B  char(3) NULL,      -- Equivalent 639-2 identifier of the bibliographic applications
                                    -- code set, if there is one
         Part2T  char(3) NULL,      -- Equivalent 639-2 identifier of the terminology applications code
                                    -- set, if there is one
         Part1   char(2) NULL,      -- Equivalent 639-1 identifier, if there is one
         Scope   char(1) NOT NULL,  -- I(ndividual), M(acrolanguage), S(pecial)
         Type    char(1) NOT NULL,  -- A(ncient), C(onstructed),
                                    -- E(xtinct), H(istorical), L(iving), S(pecial)
         Ref_Name   varchar(150) NOT NULL,   -- Reference language name
         Comment    varchar(150) NULL)       -- Comment relating to one or more of the columns


--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_names_table_definition.txt
CREATE TABLE [ISO_639-3_Names] (
         Id             char(3)     NOT NULL,  -- The three-letter 639-3 identifier
         Print_Name     varchar(75) NOT NULL,  -- One of the names associated with this identifier 
         Inverted_Name  varchar(75) NOT NULL)  -- The inverted form of this Print_Name form

--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_macrolanguages_table_definition.txt
CREATE TABLE [ISO_639-3_Macrolanguages] (
         M_Id      char(3) NOT NULL,   -- The identifier for a macrolanguage
         I_Id      char(3) NOT NULL,   -- The identifier for an individual language
                                       -- that is a member of the macrolanguage
         I_Status  char(1) NOT NULL)   -- A (active) or R (retired) indicating the
                                       -- status of the individual code element


--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_retirements_table_definition.txt
CREATE TABLE [ISO_639-3_Retirements] (
         Id          char(3)      NOT NULL,     -- The three-letter 639-3 identifier
         Ref_Name    varchar(150) NOT NULL,     -- reference name of language
         Ret_Reason  char(1)      NOT NULL,     -- code for retirement: C (change), D (duplicate),
                                                -- N (non-existent), S (split), M (merge)
         Change_To   char(3)      NULL,         -- in the cases of C, D, and M, the identifier 
                                                -- to which all instances of this Id should be changed
         Ret_Remedy  varchar(300) NULL,         -- The instructions for updating an instance
                                                -- of the retired (split) identifier
         Effective   date         NOT NULL)     -- The date the retirement became effective