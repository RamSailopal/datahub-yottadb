<!--HOSTED_DOCS_ONLY
import useBaseUrl from '@docusaurus/useBaseUrl';

export const Logo = (props) => {
  return (
    <div style={{ display: "flex", justifyContent: "center", padding: "20px" }}>
      <img
        height="150"
        alt="DataHub Logo"
        src={useBaseUrl("/img/datahub-logo-color-mark.svg")}
        {...props}
      />
    </div>
  );
};

<Logo />

<!--
HOSTED_DOCS_ONLY-->
<p align="center">
<img alt="DataHub" src="docs/imgs/datahub-logo-color-mark.svg" height="150" />
</p>
<!-- -->

# DataHub: The Metadata Platform for the Modern Data Stack
## Built with ❤️ by <img src="https://datahubproject.io/img/acryl-logo-light-mark.png" width="25"/> [Acryl Data](https://acryldata.io) and <img src="https://datahubproject.io/img/LI-In-Bug.png" width="25"/> [LinkedIn](https://engineering.linkedin.com)
[![Version](https://img.shields.io/github/v/release/datahub-project/datahub?include_prereleases)](https://github.com/datahub-project/datahub/releases/latest)
[![PyPI version](https://badge.fury.io/py/acryl-datahub.svg)](https://badge.fury.io/py/acryl-datahub)
[![build & test](https://github.com/datahub-project/datahub/workflows/build%20&%20test/badge.svg?branch=master&event=push)](https://github.com/datahub-project/datahub/actions?query=workflow%3A%22build+%26+test%22+branch%3Amaster+event%3Apush)
[![Docker Pulls](https://img.shields.io/docker/pulls/linkedin/datahub-gms.svg)](https://hub.docker.com/r/linkedin/datahub-gms)
[![Slack](https://img.shields.io/badge/slack-join_chat-white.svg?logo=slack&style=social)](https://slack.datahubproject.io)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/datahub-project/datahub/blob/master/docs/CONTRIBUTING.md)
[![GitHub commit activity](https://img.shields.io/github/commit-activity/m/datahub-project/datahub)](https://github.com/datahub-project/datahub/pulls?q=is%3Apr)
[![License](https://img.shields.io/github/license/datahub-project/datahub)](https://github.com/datahub-project/datahub/blob/master/LICENSE)
[![YouTube](https://img.shields.io/youtube/channel/subscribers/UC3qFQC5IiwR5fvWEqi_tJ5w?style=social)](https://www.youtube.com/channel/UC3qFQC5IiwR5fvWEqi_tJ5w)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/datahub-project)
[![Follow](https://img.shields.io/twitter/follow/datahubproject?label=Follow&style=social)](https://twitter.com/datahubproject)
### 🏠 Project Homepage: [datahubproject.io](https://datahubproject.io/)

---

[Quickstart](https://datahubproject.io/docs/quickstart) |
[Documentation](https://datahubproject.io/docs/) |
[Features](https://datahubproject.io/docs/features) |
[Roadmap](https://datahubproject.io/docs/roadmap) |
[Adoption](#adoption) |
[Demo](https://datahubproject.io/docs/demo) |
[Town Hall](https://datahubproject.io/docs/townhalls)

# This repo has been forked to demo integration with YottaDB

![Alt text](datahub.JPG?raw=true "Datahub")

To provision:

    git clone https://github.com/RamSailopal/datahub-yottadb.git
    cd datahub-yottadb/docker
    ./quickstart.sh
    
 To destroy:
 
    ./nukestack_yotta.sh

 
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/RamSailopal/datahub-yottadb)

This will provision YottaDB/Datahub stack and utilise the following global:

    ^META("yottadb.text_data.test","Address")="*1*Address of patient*StringType*String()*0***"
    ^META("yottadb.text_data.test","Age")="*1*Age of patient*NumberType*Integer()*0***"
    ^META("yottadb.text_data.test","ID")="*1*ID of patient*StringType*String()*0***"
    ^META("yottadb.text_data.test","Name")="*1*Name of patient*StringType*String()*0***"
    ^META("yottadb.text_data.test","Sex")="*1*Sex of patient*StringType*String()*0***"
    
The function call **D PROC^meta("yottadb.text_data.test")** will process the META global into a JSON format and then send it to the datahub gms. **yottadb.text_data.test** is the name of the data set as shown in data hub.

**Address, Age, ID, Name and Sex** reference the datahub fields.

The values for each field are then split into further data using * as a delimiter

The pieces of the values have the following meaning:

**1st - JSON Path**

**2nd  - nullable (1 = true, 0 = false)**

**3rd - Description**

**4th - Field Type**

**5th - Field Type**

**6th - recursive (1 = true, 0 = false)**

**7th - globalTags**

**8th - glossaryTerms**

# Datahub access


To navigate to the Datahub front end, navigate to:

https://9002-gitpodaddress

Login with:

username: **datahub**

password: **datahub**

Once the docker environment has been provisioned completely and after a further 3 minutes, a new dataset should appear, exported from YottaDB

All relevant code/files for YottaDB are stored in the **docker/yottadb** directory of the repo.
 
    
  
