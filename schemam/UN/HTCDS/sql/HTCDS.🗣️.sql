--- TEMP @see http://sqlfiddle.com/
CREATE TABLE htcds(
  id PRIMARY KEY,
  cas_CaseOwner VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_CaseOwner_nomen 🗣️_ %}
  prs_Salutation VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_Salutation_nomen 🗣️_ %}
  prs_FirstName VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_FirstName_nomen 🗣️_ %}
  prs_SecondName VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_SecondName_nomen 🗣️_ %}
  prs_Birthdate VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_Birthdate_nomen 🗣️_ %}
  prs_Gender VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_Gender_nomen 🗣️_ %}
  prs_Nationality VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_Nationality_nomen 🗣️_ %}
  prs_Title VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_Title_nomen 🗣️_ %}
  prs_Email VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_Email_nomen 🗣️_ %}
  prs_HomePhone VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_HomePhone_nomen 🗣️_ %}
  prs_MobilePhone VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_MobilePhone_nomen 🗣️_ %}
  prs_MailingCity VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_MailingCity_nomen 🗣️_ %}
  prs_MailingCountry VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_MailingCountry_nomen 🗣️_ %}
  prs_MailingState VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_MailingState_nomen 🗣️_ %}
  prs_MailingStreet VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_MailingStreet_nomen 🗣️_ %}
  prs_MailingPostalCode VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_prs_MailingPostalCode_nomen 🗣️_ %}
  vic_MethodOfRecruitment VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_MethodOfRecruitment_nomen 🗣️_ %}
  vic_LocationOfRecruitment VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_LocationOfRecruitment_nomen 🗣️_ %}
  vic_MethodsOfControl VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_MethodsOfControl_nomen 🗣️_ %}
  vic_TypeOfExploitation VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_TypeOfExploitation_nomen 🗣️_ %}
  vic_ForcedLabourIndustry VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_ForcedLabourIndustry_nomen 🗣️_ %}
  vic_TypeOfSexExploitation VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_TypeOfSexExploitation_nomen 🗣️_ %}
  vic_LocationOfExploitation VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_LocationOfExploitation_nomen 🗣️_ %}
  vic_Vulnerabilities VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_Vulnerabilities_nomen 🗣️_ %}
  vic_DetailsOfVulnerabilities VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_vic_DetailsOfVulnerabilities_nomen 🗣️_ %}
  cas_Status VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_Status_nomen 🗣️_ %}
  cas_ReferringOrganisation VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReferringOrganisation_nomen 🗣️_ %}
  cas_IncomingReferralDate VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_IncomingReferralDate_nomen 🗣️_ %}
  cas_ReferringPrimaryCaseWorker VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReferringPrimaryCaseWorker_nomen 🗣️_ %}
  cas_ReasonForIncomingReferral VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReasonForIncomingReferral_nomen 🗣️_ %}
  cas_IncomingReferralDetails VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_IncomingReferralDetails_nomen 🗣️_ %}
  cas_ReferredOrganisation VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReferredOrganisation_nomen 🗣️_ %}
  cas_ReferredPrimaryCaseWorker VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReferredPrimaryCaseWorker_nomen 🗣️_ %}
  cas_ReasonForOutgoingReferral VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReasonForOutgoingReferral_nomen 🗣️_ %}
  cas_OutgoingReferralDate VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_OutgoingReferralDate_nomen 🗣️_ %}
  cas_OutgoingReferralDetails VARCHAR(255), --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_OutgoingReferralDetails_nomen 🗣️_ %}
  cas_ReasonForCaseClosure VARCHAR(255) --- {% _🗣️ UN_codicem_anglicum_IOM_HTCDS_cas_ReasonForCaseClosure_nomen 🗣️_ %}
);
