# _data/etc/publicgoods-candidates/README.md

> - <https://github.com/HXL-CPLP/Auxilium-Humanitarium-API/issues/18>
> - Avaliações de candidatos passados
>   - https://github.com/unicef/publicgoods-candidates/tree/main/reviews

### template

```json
{
    "name": "REQUIRED",
    "aliases": "[OPTIONAL: Array of strings - Abbreviations, initialisms, or alternate names, where relevant]",
    "description": "REQUIRED",
    "website": "REQUIRED",
    "license": [REQUIRED, Array of objects (at least one object is required):
            {
                    "spdx": "SDPX identifier for this license",
                    "licenseURL": "Link to the license under which this nominee is released"
            }
    ],
    "SDGs": [REQUIRED, Array of objects (at least one object is required, and either evidenceText or evidenceURL is REQUIRED for each SDG entry):
            {
                    "SDGNumber": "Number of the Sustainable Development Goal",
                    "evidenceText": "provide information to support this relevance",
                    "evidenceURL": "provide links to support this relevance"
            }
    ],
    "sectors": [OPTIONAL: Array of strings - List of sectors that this nominee addresses.],
    "type": [REQUIRED, Array of strings, multiple choice from "software", "data", "standards"],
    "repositoryURL": "OPTIONAL: Link to main repository",
    "organizations": [REQUIRED, Array of objects (at least one object is required):
            {
                    "name": "REQUIRED - Name of the organization",
                    "website": "REQUIRED - Website of the organization",
                    "org_type": "REQUIRED - One of 'owner, 'maintainer', 'funder' or 'implementer',
                    "contact_name": "OPTIONAL - Name of contact individual in the organization",
                    "contact_email": "OPTIONAL - Email for contact individual in the organization"
            }
    ],
    "stage": "REQUIRED: Screening stage of Digital Public Good"
}
```
