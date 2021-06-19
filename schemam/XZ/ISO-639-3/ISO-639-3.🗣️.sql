--- This SQL schema was extracted excatly as is documented on
--- https://iso639-3.sil.org/code_tables/download_tables (date: 2021-05-08)
--- so was not inferred.

--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_table_definition.txt

CREATE TABLE [ISO_639-3] (
         Id      char(3) NOT NULL,  -- {% _🗣️ ISO_639-3_optionem_Id_summarius 🗣️_ %}
         Part2B  char(3) NULL,      -- {% _🗣️ ISO_639-3_optionem_Part2B_summarius 🗣️_ %}
         Part2T  char(3) NULL,      -- {% _🗣️ ISO_639-3_optionem_Part2T_summarius 🗣️_ %}
         Part1   char(2) NULL,      -- {% _🗣️ ISO_639-3_optionem_Part1_summarius 🗣️_ %}
         Scope   char(1) NOT NULL,  -- {% _🗣️ ISO_639-3_optionem_Scope_summarius 🗣️_ %}
         Type    char(1) NOT NULL,  -- {% _🗣️ ISO_639-3_optionem_Type_summarius 🗣️_ %}
         Ref_Name   varchar(150) NOT NULL,   -- {% _🗣️ ISO_639-3_optionem_Ref_Name_summarius 🗣️_ %}
         Comment    varchar(150) NULL)       -- {% _🗣️ ISO_639-3_optionem_Comment_summarius 🗣️_ %}


--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_names_table_definition.txt
CREATE TABLE [ISO_639-3_Names] (
         Id             char(3)     NOT NULL,  -- {% _🗣️ ISO_639-3_optionem_Id_summarius 🗣️_ %}
         Print_Name     varchar(75) NOT NULL,  -- One of the names associated with this identifier 
         Inverted_Name  varchar(75) NOT NULL)  -- The inverted form of this Print_Name form

--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_macrolanguages_table_definition.txt
CREATE TABLE [ISO_639-3_Macrolanguages] (
         M_Id      char(3) NOT NULL,   -- {% _🗣️ ISO_639-3_optionem_M_Id_summarius 🗣️_ %}
         I_Id      char(3) NOT NULL,   -- {% _🗣️ ISO_639-3_optionem_I_Id_summarius 🗣️_ %}
         I_Status  char(1) NOT NULL)   -- {% _🗣️ ISO_639-3_optionem_I_Status_summarius 🗣️_ %}


--- https://iso639-3.sil.org/sites/iso639-3/files/downloads/iso639-3_retirements_table_definition.txt
CREATE TABLE [ISO_639-3_Retirements] (
         Id          char(3)      NOT NULL,     -- {% _🗣️ ISO_639-3_optionem_Id_summarius 🗣️_ %}
         Ref_Name    varchar(150) NOT NULL,     -- reference name of language
         Ret_Reason  char(1)      NOT NULL,     -- code for retirement: C (change), D (duplicate),
                                                -- N (non-existent), S (split), M (merge)
         Change_To   char(3)      NULL,         -- in the cases of C, D, and M, the identifier 
                                                -- to which all instances of this Id should be changed
         Ret_Remedy  varchar(300) NULL,         -- The instructions for updating an instance
                                                -- of the retired (split) identifier
         Effective   date         NOT NULL)     -- The date the retirement became effective
