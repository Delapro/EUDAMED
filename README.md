# EUDAMED
Hier werden die Abenteuer mit der EUDAMED also der **Eu**ropean **Da**tabase on **Me**dical **D**evices dokumentiert.
 
# Anwendung des Powershellskripts
```Powershell
Start-BitsTransfer https://raw.githubusercontent.com/Delapro/EUDAMED/master/PSEudamed.PS1
. .\PSEudamed.PS1
Get-EudamedVersion
```

# Die Homepage
Die Homepage der EUDAMED ist unter https://ec.europa.eu/tools/eudamed zu finden. Man kann mittels https://ec.europa.eu/tools/eudamed/#/screen/search-device nach UDI-DIs suchen.

Aktuelle Infos findet man auch auf der EUDAMED-Landing-Page: https://webgate.ec.europa.eu/eudamed/landing-page#/

# Support
Unterstützung gibt es unter der E-Mail-Adresse SANTE-EUDAMED-SUPPORT@ec.europa.eu.

Eine Bugtracker-Datenbank oder ähnliches gibt es nach Auskunft am 31.10.2022 nicht.

# Aktuelle Infos
Aktuelle Informationen die EUDAMED betreffend findet man hier: https://ec.europa.eu/tools/eudamed/#/screen/news. Verschiedene Dokumente zur Durchführung gibt es hier: https://health.ec.europa.eu/medical-devices-sector/new-regulations/guidance-mdcg-endorsed-documents-and-other-guidance_en#sec6. Auf der Seite des UDI-Helpdesks https://webgate.ec.europa.eu/udi-helpdesk/en/welcome-to-eu-udi-helpdesk.html lassen sich auch viele Informationen finden. Auch die EUDAMED-Landing-Page beachten: https://webgate.ec.europa.eu/eudamed/landing-page#/

# Timeline
Hier findet man die aktuelle Timeline bis wann welches Modul verfügbar sein soll: https://health.ec.europa.eu/latest-updates/updated-timeline-current-planning-gradual-roll-out-and-modules-functionality-view-2024-07-10_en. 2026 könnte es nach heutigem Stand dann mal was werden...

Hier eine Timeline (vom Okt. 2023) welche Q4 2027 als Pflicht-Starttermin ausgibt:
https://health.ec.europa.eu/document/download/04ce2012-97df-4dd0-8a39-d4f6993b9e16_en?filename=md_eudamed_roadmap_en.pdf

Zu beachten ist auch nach wie vor die lokale Gesetzgebung, siehe dazu ["AT 28.05.2021 B6" im Bundesanzeiger]( https://www.bundesanzeiger.de/pub/publication/IGrRaNuJBWgwK7Giz8Y/content/IGrRaNuJBWgwK7Giz8Y/BAnz%20AT%2028.05.2021%20B6.pdf?inline). Noch aktueller dazu: 
["BAnz AT 27.05.2022 B4" im Bundesanzeiger](https://www.bundesanzeiger.de/pub/publication/qOIieZMq3dnFbUZs734/content/qOIieZMq3dnFbUZs734/BAnz%20AT%2027.05.2022%20B4.pdf?inline).

Hier eine Bfarm-Info mit Stand Aug. 2023:
https://www.bfarm.de/DE/Medizinprodukte/Ueberblick/Europa-und-EUDAMED/_node.html#:~:text=Bescheinigungen%20(Modul%20Certificates)-,%C3%9Cbergangszeitraum%20bis%20zur%20vollen%20Funktionsf%C3%A4higkeit%20von%20EUDAMED,Buchstabe%20d%20der%20MDR%20bzw.


# Spielversion (Playground)
Eudamed kennt einen sogannten Eudamed-Playground (https://webgate.training.ec.europa.eu/eudamed-play/landing-page#/).
![image](https://user-images.githubusercontent.com/16536936/193817737-75b64348-5a0e-46ea-8d9e-0d0b8d912fdb.png)
Hier gibts aktuelle Infos zum Playground: https://webgate.training.ec.europa.eu/eudamed-play/secure#/release-notes. Unter Hilfe gibt es auch jede Menge tiefergehende Dokus und XML-Schemen.

# BfArM Zuständigkeit in Deutschland
Das Bundesinstitut für Arzneimittel und Medizinprodukte (BfArM) ist in Deutschland für das Hochladen der Daten in die EUDAMED zuständig, 
https://www.bfarm.de/EN/Medical-devices/Overview/Europe-and-EUDAMED/_node.html. 

> According to § 33 Medical Device Act, the team for the Medical Devices Information System of BfArM provides the required data from the national Medical Devices Information System for the European database. To accomplish this, the former German Institute of Medical Documentation and Information (DIMDI) has developed a software for the XML upload from the national databases. The current German data is transmitted to Eudamed on a weekly basis.

Welche Daten dies nun genau umfasst gilts noch rauszufinden...

Deutsche Fassung zu Eudamed: https://www.bfarm.de/DE/Medizinprodukte/Ueberblick/Europa-und-EUDAMED/_node.html. Die Fassung ist allerdings stark anders ausgeführt wie der obige Link zur englischen Fassung, sollte also mal konkret auf Unterschiede untersucht werden. Vor allem ist nichts mehr vom Hochladen der Datensätze und DIMDI die Rede!

# Ähnliche Entwicklungen im Ausland
Die Schweiz scheint die Eudamed für sich abzubilden und nennt sich einfach Swissdamed: https://www.swissmedic.ch/swissmedic/de/home/medizinprodukte/medizinprodukte-datenbank/swissdamed-ueberblick.html.

Hier die aktuelle schweizer Actor Liste: https://ogd.swissmedic.ch/mep/CHRNActors.xml, zu finden unter: https://opendata.swiss/de/dataset/mep401-chnr-actors.
Hier die Seite mit den verschiedenen Links: https://ogd.swissmedic.ch/mep. Eine Beschreibung der Felder findet man unter: https://ogd.swissmedic.ch/mep/Documentation_OGD_Dataset.pdf.

# Schwachpunkte der EUDAMED Datenhaltung

https://github.com/openregulatory/eudamed-audit

Vor allem der Punkt mit der fehlenden Performance wenn man nach einer UDI-DI sucht https://github.com/openregulatory/eudamed-audit#7-insufficient-performance kann voll bestätigt werden und ist nun mittlerweile seit zwei Jahren ein Thema das nicht gefixt wird!

# API
Es gibt auch eine (inoffizielle?) API, welche das direkte Abgreifen von Informationen per JSON-Objekten erlaubt. Nicht direkt aber indirekt findet man teilweise Informationen zur Architektur und Schnittstellen sowie Software hier: https://ec.europa.eu/digital-building-blocks/wikis/display/DIGITAL/2022/06/22/eDelivery+Roadmap+for+2022+and+beyond, bzw. https://ec.europa.eu/digital-building-blocks/wikis/display/DIGITAL/eDelivery+AS4.

Hier findet man eine komplette JAVA-Library die mit EUDAMED und AS4 umgehen kann: https://github.com/phax/phase4/.

> Die nachstehenden Daten wurden am 30.9.2022 und 10.10.2022 abgerufen, es kann also später Abweichungen geben.

Die ganzen API-Geschichten beruhen auf einer Infrastruktur die unter dem Begriff Domibus läuft. Hier findet man mehr Infos zu Releases (Roadmap) und welche Software dabei zum Einsatz kommt: https://ec.europa.eu/digital-building-blocks/sites/display/DIGITAL/Domibus+releases. Ende 2024 wurde auf Dombibus v5.0 FR (Final Release) umgestellt: https://ec.europa.eu/digital-building-blocks/sites/display/DIGITAL/Domibus+-+v5.0.

Es gibt auch eine alternative API: https://github.com/openregulatory/eudamed-api. Diese ist vor allem performanter, allerdings ist nicht ganz klar wie aktuell die enthaltenen Daten sind bzw. sein werden.

## Ausgabe der Version der EUDAMED

Mittels dieser Abfrage kann man den Versionsstand der EUDAMED abfragen: https://ec.europa.eu/tools/eudamed/api/applicationInfo?languageIso2Code=undefined.

```JSON
{
  "buildVersion" : "2.8.0",
  "lastBuildDate" : "2022-07-18 12:16",
  "activeProfile" : "[prod]"
}
```

> Hinweis: Es kann bereits eine neue Datenbank-Version in Verwendung sein, bevor überhaupt Informationen darüber, auch technischer Natur, verfügbar sind!

Hier gibt es dann technische Infos zu einem etwaigen Update (im Sommer 2022 ca. 2 Wochen nach neuer Version verfügbar): https://health.ec.europa.eu/medical-devices-eudamed_en.

Hier gibt es aktuellere, technische Informationen (Sommer 2023, zu Version 2.11.0): https://webgate.ec.europa.eu/eudamed-help/en/documentation/release-notes.html

## News zur EUDAMED

Direkt über diesen Link bekommt man die News zur Eudamed: https://ec.europa.eu/tools/eudamed/#/screen/news
API-Link: https://ec.europa.eu/tools/eudamed/api/newsItem/historic

Über diesen API-Link gibts detailliertere Versioninformationen: https://ec.europa.eu/tools/eudamed/api/newsItem

<details>
  <summary>Hier gehts zum JSON Ergebnis</summary>
  
```JSON
[ {
  "uuid" : "7d353623-cb01-47c2-bec6-be907ca3de6a",
  "visibleDateFrom" : "2022-07-19",
  "visibleDateTo" : "2022-10-31",
  "content" : {
    "texts" : [ {
      "language" : {
        "isoCode" : "en",
        "name" : "English"
      },
      "text" : "<h1>Release note v2.8</h1>\nThis document outlines a brief overview of the main new features in the EUDAMED public site compared to the previous release:<br>\n<li>Search for device types behaves dynamically based on the selected applicable legislation; </li>\n<li>Removed duplicates from the list of Notified Bodies; </li>\n<li>Search by Notified Bodies includes only Notified Bodies designated for MDR/IVDR; </li>\n<li>Fixed the search combination 'All applicable regulation' and 'All risk classes' when searching for devices; </li>\n<li>Fixed the search for 'Trade name' of a device; </li>\n<li>Fixed the view device details page on several fields not being displayed; </li>\n<li>Added the last update date when viewing an actor. </li>",
      "allLanguagesApplicable" : null
    } ]
  },
  "category" : {
    "code" : "refdata.news-item-release-note"
  },
  "creationDate" : "2022-07-19T14:01:08.809"
}, {
  "uuid" : "4bff1e05-03c2-486f-b781-e13d36f37141",
  "visibleDateFrom" : "2021-06-24",
  "visibleDateTo" : "2025-06-24",
  "content" : {
    "texts" : [ {
      "language" : {
        "isoCode" : "en",
        "name" : "English"
      },
      "text" : "If not in EUDAMED, the SSCP shall be made available to the public upon request without undue delay or the manufacturer shall specify where it is made available to the public.\n \nSee MDCG 2021-1 Rev. 1\nhttps://ec.europa.eu/health/sites/default/files/md_sector/docs/2021-1_guidance-administrative-practices_en.pdf\n",
      "allLanguagesApplicable" : null
    } ]
  },
  "category" : {
    "code" : "refdata.news-item-info"
  },
  "creationDate" : "2021-06-24T10:42:38.756"
} ]
```
</details>

## Actors
Eine Liste der hinterlegten Actors welche in Deutschland Devices in Umlauf bringen erhält man mit der API https://ec.europa.eu/tools/eudamed/api/eos?page=0&pageSize=25&size=25&rnd=1665398393978&sort=srn%2CASC&sort=versionNumber%2CDESC&countryIso2Code=DE&languageIso2Code=de, als Ergebnis erhält man:

<details>
  <summary>Hier gehts zum JSON Ergebnis</summary>
  
```JSON
{
  "content" : [ {
    "uuid" : "8189316a-b21c-44cc-8597-88bf110e8c64",
    "ulid" : "01EREAR7ZVHMWW9V69P6DJHTKH",
    "name" : "Shanghai International Holding Corp. GmbH(Europe)",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Shanghai International Holding Corp. GmbH(Europe)",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-01T08:20:01.569",
    "eudamedIdentifier" : "DE-AR-000000001",
    "electronicMail" : "shholding@hotmail.com",
    "telephone" : "+49 40 2513175",
    "geographicalAddress" : "Eiffestraße , 80 20537 Hamburg",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "20537",
    "cityName" : "Hamburg",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 3,
    "associatedToUser" : false,
    "registrationUlid" : "01EREAR80JW2KK81MPK5C80DT6",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000001"
  }, {
    "uuid" : "6ff06ef7-430a-49bb-ac0a-9965910f3092",
    "ulid" : "01EREMVRV3PACF09QZZE1A0XP2",
    "name" : "MedNet EC-REP GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "MedNet EC-REP GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-01T10:07:00.788",
    "eudamedIdentifier" : "DE-AR-000000002",
    "electronicMail" : "ecrep@medneteurope.com",
    "telephone" : "+49 251 322 66 64",
    "geographicalAddress" : "Borkstraße, 10 48163 Münster",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "48163",
    "cityName" : "Münster",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 2,
    "associatedToUser" : false,
    "registrationUlid" : "01EREMVRVX10VCKNVBAA1WPAV1",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000002"
  }, {
    "uuid" : "b5e689ec-15fb-453b-bdda-2784a8ab250c",
    "ulid" : "01EREJZ5WHGV7Q97RMQCBNE2HX",
    "name" : "Dr. Ebeling & Assoc. GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Dr. Ebeling & Assoc. GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-01T10:33:09.177",
    "eudamedIdentifier" : "DE-AR-000000003",
    "electronicMail" : "info@ebeling-assoc.com",
    "telephone" : null,
    "geographicalAddress" : "Isestraße, 5 20144 Hamburg",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "20144",
    "cityName" : "Hamburg",
    "abbreviatedName" : "E&A",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : null,
        "text" : "E&A",
        "allLanguagesApplicable" : true
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 2,
    "associatedToUser" : false,
    "registrationUlid" : "01EREJZ5X00GVA5B5E7ZTFTRBA",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000003"
  }, {
    "uuid" : "e1180fee-2997-4a3d-bce3-428489ffc9f5",
    "ulid" : "01EREZKNXNRDSBV2BXYYTTFZPM",
    "name" : "PENTAX Europe GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "PENTAX Europe GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-01T13:06:26.014",
    "eudamedIdentifier" : "DE-AR-000000006",
    "electronicMail" : "info@pentaxmedical.com",
    "telephone" : null,
    "geographicalAddress" : "Julius-Vosseler-Straße, 104 22527 Hamburg",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "22527",
    "cityName" : "Hamburg",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01EREZKNXZKPS7T70G58KNNYEY",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000006"
  }, {
    "uuid" : "44e6b0c8-0615-4a37-aa4c-1248fe721560",
    "ulid" : "01EREHYSJGGFGKB33N1HXHEXWV",
    "name" : "Sirona Dental Systems GmbH",
    "names" : {
      "texts" : [ {
        "language" : null,
        "text" : "Sirona Dental Systems GmbH",
        "allLanguagesApplicable" : true
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-02T11:48:57.667",
    "eudamedIdentifier" : "DE-AR-000000030",
    "electronicMail" : "contact@dentsplysirona.com",
    "telephone" : null,
    "geographicalAddress" : "Fabrikstraße, 31 64625 Bensheim",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "64625",
    "cityName" : "Bensheim",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 2,
    "associatedToUser" : false,
    "registrationUlid" : "01EREHYSK2HB45TT2MJGZ6H97A",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000030"
  }, {
    "uuid" : "594de33a-3aed-441a-9a2d-719c57d3820d",
    "ulid" : "01ERDCGX4B37TWSWJB8CJ5R17P",
    "name" : "Medical Technology Promedt Consulting GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Medical Technology Promedt Consulting GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-04T09:51:19.322",
    "eudamedIdentifier" : "DE-AR-000000085",
    "electronicMail" : "ear@mt-procons.com",
    "telephone" : "+49 6894 581020",
    "geographicalAddress" : "Altenhofstrasse , 80 66386 St. Ingbert",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "66386",
    "cityName" : "St. Ingbert",
    "abbreviatedName" : "MT Promedt Consulting GmbH",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "MT Promedt Consulting GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 4,
    "associatedToUser" : false,
    "registrationUlid" : "01ERDCGX52S2NVCRHMWDA2YZJY",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000085"
  }, {
    "uuid" : "f1ea63cb-0464-489a-82a8-336cc7cb29b2",
    "ulid" : "01ERG017SHWSPNG23GFQ7BRRWC",
    "name" : "MedPath GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "MedPath GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-04T11:01:27.764",
    "eudamedIdentifier" : "DE-AR-000000087",
    "electronicMail" : "info@medpath.pro",
    "telephone" : null,
    "geographicalAddress" : "Mies-van-der-Rohe-Strasse, 8 80807 Munich",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "80807",
    "cityName" : "Munich",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ERG017SV1QRB656Q8G51PRXZ",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000087"
  }, {
    "uuid" : "a999cd25-787d-4ccd-af66-1c790fd1efb7",
    "ulid" : "01ERF9YKK150EFB9HB9EN8ACKM",
    "name" : "Merz Pharmaceuticals GmbH",
    "names" : {
      "texts" : [ {
        "language" : null,
        "text" : "Merz Pharmaceuticals GmbH",
        "allLanguagesApplicable" : true
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-07T11:47:32.514",
    "eudamedIdentifier" : "DE-AR-000000104",
    "electronicMail" : "contact@merz.de",
    "telephone" : "+49 69 15 03 0",
    "geographicalAddress" : "Eckenheimer Landstrasse, 100 60318 Frankfurt",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "60318",
    "cityName" : "Frankfurt",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 2,
    "associatedToUser" : false,
    "registrationUlid" : "01ERF9YKKJ5ZXG6FH7J12M7WJB",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000104"
  }, {
    "uuid" : "eeddb96c-afae-4c3a-b22d-46f1c899a6c6",
    "ulid" : "01ERHYKVMJ4NCX1VWH28G81540",
    "name" : "B. Braun Melsungen AG",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "B. Braun Melsungen AG",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2020-12-11T06:53:32.073",
    "eudamedIdentifier" : "DE-AR-000000202",
    "electronicMail" : "eudamed@bbraun.com",
    "telephone" : "+49 5661 71 0",
    "geographicalAddress" : "Carl-Braun-Straße , 1 34212 Melsungen",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "34212",
    "cityName" : "Melsungen",
    "abbreviatedName" : "BBMAG",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "BBMAG",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ERHYKVMX3Q4QY9ZN03GB1158",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000000202"
  }, {
    "uuid" : "2fd53c5b-b41e-4ad3-b0ea-3f202a60908d",
    "ulid" : "01ES6SV3KK5QK6VQV0H69TV348",
    "name" : "Europecert",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Europecert",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:18:28.28",
    "eudamedIdentifier" : "DE-AR-000004942",
    "electronicMail" : "support@europecert.eu",
    "telephone" : "+49 2161 990 883 1",
    "geographicalAddress" : "Alsstr., 97 41063 Mönchengladbach",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "41063",
    "cityName" : "Mönchengladbach",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ES6SV3M85E277YARBCAXA6MY",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004942"
  }, {
    "uuid" : "f0a28616-6733-43f9-8ec5-3ee14cba3466",
    "ulid" : "01EXHCCPM8KME1CE9J306RCJBF",
    "name" : "SHOFU DENTAL GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "SHOFU DENTAL GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:29:45.569",
    "eudamedIdentifier" : "DE-AR-000004951",
    "electronicMail" : "info@shofu.de",
    "telephone" : "+4920102 86640",
    "geographicalAddress" : "An der Pönt, 70 40885 Ratingen",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "40885",
    "cityName" : "Ratingen",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01EXHCCPMYKGYB4XRQ1YNYAS1Y",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004951"
  }, {
    "uuid" : "72b2b45e-a263-4fd9-80d0-4cf875bc4648",
    "ulid" : "01EXJGF22AM1EAW3C2GSAQY6J8",
    "name" : "Meta Biomed Europe GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "Meta Biomed Europe GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:30:48.678",
    "eudamedIdentifier" : "DE-AR-000004953",
    "electronicMail" : "europe@metabiomed-inc.com",
    "telephone" : "+49 208 309 91910",
    "geographicalAddress" : "Wiesenstr., 35 45473 Mülheim an der Ruhr",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "45473",
    "cityName" : "Mülheim an der Ruhr",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01EXJGF230NVPAFPD25C0PABF7",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004953"
  }, {
    "uuid" : "6235025c-44aa-44e2-ab95-5042c49e34f0",
    "ulid" : "01F0BPTXRT4YNQ1N1WDA85MBQH",
    "name" : "SCILO Vertriebs GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "SCILO Vertriebs GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:34:41.476",
    "eudamedIdentifier" : "DE-AR-000004960",
    "electronicMail" : "info@scilo.de",
    "telephone" : "+49 2173 1094783",
    "geographicalAddress" : "Raiffeisenstraße 25, Raiffeisenstraße 25 40764 Langenfeld",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "40764",
    "cityName" : "Langenfeld",
    "abbreviatedName" : "SCILO Vertriebs GmbH",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "SCILO Vertriebs GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F0BPTXS4WS3XB5EABRH57B8W",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004960"
  }, {
    "uuid" : "0469fba9-a807-4fb7-a1e0-f5a73066556b",
    "ulid" : "01ESRTKEJT0C9XC1S9ZZJ1PCST",
    "name" : "Energizer Deutschland GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Energizer Deutschland GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:40:43.904",
    "eudamedIdentifier" : "DE-AR-000004962",
    "electronicMail" : "Agnieszka.bizan@energizer.com",
    "telephone" : "+48 22 430 02 58",
    "geographicalAddress" : "Mettmanner Strasse, 25 40699 Erkrath",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "40699",
    "cityName" : "Erkrath",
    "abbreviatedName" : "ENR DE",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "ENR DE",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ESRTKEK4E57911HZMCY4AHAZ",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004962"
  }, {
    "uuid" : "b3daa4d9-83b0-4796-98e5-a932220f3401",
    "ulid" : "01F48QC67KVRJ3Y2CS88FR1T2C",
    "name" : "Top Glove Europe GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Top Glove Europe GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:48:47.105",
    "eudamedIdentifier" : "DE-AR-000004968",
    "electronicMail" : "info@topglove.de",
    "telephone" : null,
    "geographicalAddress" : "Bliersheimer Str., 80 a 47229 Duisburg",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "47229",
    "cityName" : "Duisburg",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F48QC68004XPT9N1AD56ZXE5",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004968"
  }, {
    "uuid" : "caebd771-d8f7-4f5c-ae54-9b9085214ce1",
    "ulid" : "01F4W11HCCRSFW4Y9D9Q10Y91R",
    "name" : "QIAGEN GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "QIAGEN GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:50:19.144",
    "eudamedIdentifier" : "DE-AR-000004971",
    "electronicMail" : "info@qiagen.com",
    "telephone" : "+492103290",
    "geographicalAddress" : "QIAGEN Strasse, 1 40724 Hilden",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "40724",
    "cityName" : "Hilden",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F4W11HCZP0MPMSFH76K98PYR",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004971"
  }, {
    "uuid" : "5eb9b280-12d1-4f00-b757-b1ead53b4439",
    "ulid" : "01F5D6G380SR3H27RGJF5TKPM4",
    "name" : "Daniels Medizintechnik GmbH&Co.KG",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Daniels Medizintechnik GmbH&Co.KG",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:52:00.187",
    "eudamedIdentifier" : "DE-AR-000004973",
    "electronicMail" : "info@daniels.de",
    "telephone" : null,
    "geographicalAddress" : "Pfaffenberger Weg, 38 42659 Solingen",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "42659",
    "cityName" : "Solingen",
    "abbreviatedName" : "Daniels",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Daniels",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F5D6G38K1G2TE67759S3A33R",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004973"
  }, {
    "uuid" : "166d62c0-bb1b-4d0f-84ba-702c82a7cf93",
    "ulid" : "01F5GG7HC9BB5B4KYC9NCXQC7G",
    "name" : "Europecert UG (haftungsbeschränkt)",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Europecert UG (haftungsbeschränkt)",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T08:52:30.017",
    "eudamedIdentifier" : "DE-AR-000004974",
    "electronicMail" : "joe@europecert.eu",
    "telephone" : "+49 2161 990 88 31",
    "geographicalAddress" : "Alsstr., 97 41063 Mönchengladbach",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "41063",
    "cityName" : "Mönchengladbach",
    "abbreviatedName" : "Europecert",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Europecert",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F5GG7HCM390S9KQ58FJFYJK4",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004974"
  }, {
    "uuid" : "6f5b746c-77c0-4db0-8533-37455670854c",
    "ulid" : "01ERF9VRW38YSE5PC7184PFMDV",
    "name" : "medical ECONET GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "medical ECONET GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T09:03:46.039",
    "eudamedIdentifier" : "DE-AR-000004983",
    "electronicMail" : "p.nachtigal@medical-econet.com",
    "telephone" : "+49(0) 208 377 890 23",
    "geographicalAddress" : "Im Erlengrund, 20 46149 Oberhausen",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "46149",
    "cityName" : "Oberhausen",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ERF9VRWDQAJV5DDZSVH18099",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004983"
  }, {
    "uuid" : "bce99dcd-e909-4c87-b894-cf9c22a74374",
    "ulid" : "01ERF8R09SEA555S4SWEJHD0DR",
    "name" : "Penumbra Europe GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Penumbra Europe GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T09:25:50.678",
    "eudamedIdentifier" : "DE-AR-000004997",
    "electronicMail" : "EC-Rep@penumbrainc.com",
    "telephone" : null,
    "geographicalAddress" : "Am Borsigturm, 44 13507 Berlin",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "13507",
    "cityName" : "Berlin",
    "abbreviatedName" : "PEN EU GmbH",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "PEN EU GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ERF8R0ABZCYPP74FMR2J5CPB",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004997"
  }, {
    "uuid" : "4a3bcf0e-c2f7-467d-819c-5ae504b96492",
    "ulid" : "01ERGF4QJ6884M2R5RWHD7CWDV",
    "name" : "AJW Technology Consulting GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "AJW Technology Consulting GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T09:26:45.864",
    "eudamedIdentifier" : "DE-AR-000004999",
    "electronicMail" : "ecrep@ajwtech.com",
    "telephone" : null,
    "geographicalAddress" : "Breite Straße , 3 40213  Düsseldorf ",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "40213 ",
    "cityName" : "Düsseldorf ",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 2,
    "associatedToUser" : false,
    "registrationUlid" : "01ERGF4QJH31GC76GH1EJR28AD",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000004999"
  }, {
    "uuid" : "90d55499-399f-4cc8-a7a4-67bdeeae3d30",
    "ulid" : "01ERPKV9TVW10M3X02DJ0XQ0S6",
    "name" : " MPS Medical Product Service GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : " MPS Medical Product Service GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T09:33:45.024",
    "eudamedIdentifier" : "DE-AR-000005009",
    "electronicMail" : "g.froemel@mps-gmbh.eu",
    "telephone" : "+49 6442962073",
    "geographicalAddress" : "Borngasse, 20 35619 Braunfels",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "35619",
    "cityName" : "Braunfels",
    "abbreviatedName" : "MPS GmbH",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "MPS GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01ERPKV9V5GJMCCXDWV6NHGMK2",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000005009"
  }, {
    "uuid" : "7027387e-7c74-4e68-b2a0-c8d47e7c2292",
    "ulid" : "01F64J46XM8WXJMVNNRK3BWCQP",
    "name" : "BABGENCEL GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "BABGENCEL GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T10:00:40.962",
    "eudamedIdentifier" : "DE-AR-000005030",
    "electronicMail" : "info@babgencel.de",
    "telephone" : "+49 211 90981888",
    "geographicalAddress" : "Vogelsanger Weg, 91 40470 Düsseldorf",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "40470",
    "cityName" : "Düsseldorf",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F64J46XZQBHXZ1E1EDGZSTY0",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000005030"
  }, {
    "uuid" : "596cf2eb-cf1a-4d0c-ad8d-7bc1e8aa3d3c",
    "ulid" : "01ERP8S7A1P853M115J8FH03S8",
    "name" : "BIOTRONIK SE & Co. KG",
    "names" : {
      "texts" : [ {
        "language" : null,
        "text" : "BIOTRONIK SE & Co. KG",
        "allLanguagesApplicable" : true
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T10:36:27.497",
    "eudamedIdentifier" : "DE-AR-000005051",
    "electronicMail" : "info@biotronik.com",
    "telephone" : "+49 30 68905 0",
    "geographicalAddress" : "Woermannkehre, 1 12359 Berlin",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "12359",
    "cityName" : "Berlin",
    "abbreviatedName" : "BIOTRONIK",
    "abbreviatedNames" : {
      "texts" : [ {
        "language" : null,
        "text" : "BIOTRONIK",
        "allLanguagesApplicable" : true
      } ]
    },
    "latestVersion" : true,
    "versionNumber" : 2,
    "associatedToUser" : false,
    "registrationUlid" : "01ERP8S7ANP2BKNZEEBGS2TKNA",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000005051"
  }, {
    "uuid" : "33c9a71a-b7e6-4341-9a19-8d46fb298485",
    "ulid" : "01F0XPK42919BEYS4BAYJQRPCD",
    "name" : "Invacare GmbH",
    "names" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "Invacare GmbH",
        "allLanguagesApplicable" : null
      } ]
    },
    "actorType" : {
      "code" : "refdata.actor-type.authorised-representative",
      "srnCode" : "AR",
      "category" : "ECONOMIC_ENTITY"
    },
    "roleName" : "Bevollmächtigter",
    "countryIso2Code" : "DE",
    "countryName" : "Deutschland",
    "countryType" : "EU_MEMBER_STATE",
    "dateOfRegistration" : "2021-05-26T10:42:43.514",
    "eudamedIdentifier" : "DE-AR-000005056",
    "electronicMail" : "mgloy@invacare.com",
    "telephone" : null,
    "geographicalAddress" : "Am Achener Hof, 8 88316 Isny",
    "buildingNumber" : null,
    "streetName" : null,
    "postbox" : null,
    "addressComplement" : null,
    "postalZone" : "88316",
    "cityName" : "Isny",
    "abbreviatedName" : null,
    "abbreviatedNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "associatedToUser" : false,
    "registrationUlid" : "01F0XPK42NA62DV09KCGAWSTWY",
    "legislationLinks" : null,
    "selectable" : true,
    "srn" : "DE-AR-000005056"
  } ],
  "totalPages" : 177,
  "totalElements" : 4406,
  "last" : false,
  "size" : 25,
  "number" : 0,
  "sort" : [ {
    "direction" : "ASC",
    "property" : "srn",
    "ignoreCase" : false,
    "nullHandling" : "NATIVE",
    "ascending" : true,
    "descending" : false
  }, {
    "direction" : "DESC",
    "property" : "versionNumber",
    "ignoreCase" : false,
    "nullHandling" : "NATIVE",
    "ascending" : false,
    "descending" : true
  } ],
  "first" : true,
  "numberOfElements" : 25
}
```
</details>

### Ein einzelner Actor, hier Hersteller Amann Girrbach
Die Hersteller werden als Economic Operators bezeichnet. Die hinterlegten Daten eines solchen Economic Operators, hier im Fall Amann Girrbach, findet man unter https://ec.europa.eu/tools/eudamed/#/screen/search-eo/6bb2017f-b4df-452f-9799-798f063f535d.

Die API-Variante geht so https://ec.europa.eu/tools/eudamed/api/actors/6bb2017f-b4df-452f-9799-798f063f535d/publicInformation?languageIso2Code=en und ergibt:

<details>
  <summary>Hier gehts zum JSON Ergebnis</summary>
  
```JSON
{
  "importers" : null,
  "nonEuManufacturers" : null,
  "actorDataPublicView" : {
    "ulid" : "01EREQS76M5772JQP3ZP5ZXGAV",
    "uuid" : "6bb2017f-b4df-452f-9799-798f063f535d",
    "type" : {
      "code" : "refdata.actor-type.manufacturer",
      "srnCode" : "MF",
      "category" : "ECONOMIC_ENTITY"
    },
    "country" : {
      "name" : "Austria",
      "type" : "EU_MEMBER_STATE",
      "iso2Code" : "AT",
      "nonEUMemberState" : false
    },
    "name" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "de",
          "name" : "German"
        },
        "text" : "Amann Girrbach AG",
        "allLanguagesApplicable" : null
      } ]
    },
    "abbreviatedName" : null,
    "europeanVatNumberApplicable" : true,
    "europeanVatNumber" : "ATU56880888",
    "eudamedIdentifier" : "AT-MF-000000252",
    "tradeRegister" : null,
    "eori" : null,
    "organizationIdentificationDocuments" : [ ],
    "authorisedRepresentatives" : null,
    "competentAuthorityResponsibility" : null,
    "telephone" : "+43 552362333200",
    "electronicMail" : "austria@amanngirrbach.com",
    "website" : "https://www.amanngirrbach.com/en/home/",
    "actorAddress" : {
      "streetName" : "Herrschaftswiesen ",
      "streetInfoApplicable" : true,
      "buildingNumber" : "1",
      "complement" : null,
      "postbox" : null,
      "gps" : null,
      "cityName" : "Koblach",
      "postalZone" : "6842",
      "country" : {
        "name" : "Austria",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "AT",
        "nonEUMemberState" : false
      }
    },
    "validatorName" : "Gesundheit Österreich GmbH",
    "validatorUuid" : "eef6d5a7-0906-438f-8050-4661ca1bbe4f",
    "validatorType" : {
      "code" : "refdata.actor-type.competent-authority",
      "srnCode" : "CA",
      "category" : "SUPERVISING_ENTITY"
    },
    "validatorSrn" : "AT-CA-067",
    "validatorAddress" : {
      "streetName" : "Stubenring",
      "streetInfoApplicable" : true,
      "buildingNumber" : "6",
      "complement" : null,
      "postbox" : null,
      "gps" : null,
      "cityName" : "Vienna",
      "postalZone" : "1010",
      "country" : {
        "name" : "Austria",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "AT",
        "nonEUMemberState" : false
      }
    },
    "validatorEmail" : "eudamed@goeg.at",
    "validatorTelephone" : "+43 1 515 61-0",
    "regulatoryComplianceResponsibles" : [ {
      "firstName" : "Mario ",
      "familyName" : "Fröhle",
      "electronicMail" : "mario.froehle@amanngirrbach.com",
      "telephone" : "+43 5523 62333456",
      "position" : "MDR Article 15 a)",
      "geographicalAddress" : {
        "streetName" : "Herrschaftswiesen ",
        "streetInfoApplicable" : true,
        "buildingNumber" : "1",
        "complement" : null,
        "postbox" : null,
        "gps" : null,
        "cityName" : "Koblach",
        "postalZone" : "6842",
        "country" : {
          "name" : "Austria",
          "type" : "EU_MEMBER_STATE",
          "iso2Code" : "AT",
          "nonEUMemberState" : false
        }
      }
    }, {
      "firstName" : "Falko ",
      "familyName" : "Noack",
      "electronicMail" : "falko.noack@amanngirrbach.com",
      "telephone" : "+43 5523 62333320",
      "position" : "MDR Article 15 c) & e)",
      "geographicalAddress" : {
        "streetName" : "Herrschaftswiesen ",
        "streetInfoApplicable" : true,
        "buildingNumber" : "1",
        "complement" : null,
        "postbox" : null,
        "gps" : null,
        "cityName" : "Koblach",
        "postalZone" : "6842",
        "country" : {
          "name" : "Austria",
          "type" : "EU_MEMBER_STATE",
          "iso2Code" : "AT",
          "nonEUMemberState" : false
        }
      }
    }, {
      "firstName" : "Debora",
      "familyName" : "Engel",
      "electronicMail" : "debora.engel@amanngirrbach.com",
      "telephone" : "+49 7231 957260",
      "position" : "MDR Article 15 b) & d)",
      "geographicalAddress" : {
        "streetName" : "Herrschaftswiesen ",
        "streetInfoApplicable" : true,
        "buildingNumber" : "1",
        "complement" : null,
        "postbox" : null,
        "gps" : null,
        "cityName" : "Koblach",
        "postalZone" : "6842",
        "country" : {
          "name" : "Austria",
          "type" : "EU_MEMBER_STATE",
          "iso2Code" : "AT",
          "nonEUMemberState" : false
        }
      }
    } ],
    "legislationLinks" : null,
    "latestSubsidiary" : null,
    "certificates" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "versionState" : {
      "code" : "refdata.eudamed-entity-version-status.registered"
    },
    "lastUpdateDate" : "2020-12-15T10:31:03.233",
    "lastUpdatedByUser" : "nwindifr"
  }
}
```
</details>

### Auflistung aller Devices von Amann Girrbach
Auflistung aller Devices von Amann Girrbach, welche in der EUDAMED hinterlegt sind: https://ec.europa.eu/tools/eudamed/#/screen/search-device?srn=AT-MF-000000252&uuid=6bb2017f-b4df-452f-9799-798f063f535d.

Oder per API https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?page=0&pageSize=25&size=25&sort=primaryDi%2CASC&sort=versionNumber%2CDESC&iso2Code=en&srn=AT-MF-000000252&deviceStatusCode=refdata.device-model-status.on-the-market&languageIso2Code=de' ergibt:

<details>
  <summary>Hier gehts zum JSON Ergebnis</summary>
  
```JSON
{
  "content" : [ {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942176111",
    "uuid" : "469929c4-9cf3-4ef2-a8ac-adefcf22fe7f",
    "ulid" : "01FHAG7NNT8JXTWN449JTYPSN6",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Bissgabel partiell (2 Stück)",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942176501",
    "uuid" : "89ba9f45-e1f3-4a0a-8718-034993c1c91f",
    "ulid" : "01FHAJY9RZDP0X4RTEN7FB4W1N",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Artex-Quickbite, 10er",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 2,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942176611",
    "uuid" : "ebf6ad09-8039-45c6-85e9-207ef0eb24bf",
    "ulid" : "01FHAKD0FAFJTBTHCF6J74A5QZ",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Bissgabel total (2 Stück)",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942179281",
    "uuid" : "14420c28-aff3-4a5b-b7bd-087da84a2f12",
    "ulid" : "01FHAKMGMGGNEN3PS8276CEHEW",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Löffelgriff (5 Stück)",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942186001",
    "uuid" : "0bfe7202-accd-43ad-b5c7-581824e123ae",
    "ulid" : "01FHAA8YZK699YPBANKNTD30SG",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Artex-Gesichtsbogen ",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942186091",
    "uuid" : "044047ae-2b71-47e5-915b-a37b601eede0",
    "ulid" : "01FHAKQZNK46FTSVGERBS36R20",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Porusknöpfe lang (1 Paar)",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942186101",
    "uuid" : "3cf39517-77b8-49dd-9a0d-11798508b7ba",
    "ulid" : "01FHAKW746XWWY38T7FG13QHM7",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Achsebene-Zeiger mit Fixierschraube",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942186201",
    "uuid" : "fcf77004-8c8b-4c04-b269-7faf2aa00d03",
    "ulid" : "01FHAM09NCQJMJEJYD7J9P7CKV",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Gelenksupport",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 2,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942186801",
    "uuid" : "2bfcbae9-c8d4-4f73-b9d6-af846b63c625",
    "ulid" : "01FHAM929SBBMST47SFMSWRNDE",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Leipziger Glabellastütze",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942186901",
    "uuid" : "2fc83d3e-32d3-47a6-9f51-a2bb1ac7826d",
    "ulid" : "01FHAMHTM11MP3R93PFJTAVT1K",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Nasensteg höhenverstellbar",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942199501",
    "uuid" : "49a07c93-918e-4c62-aeb6-b32728b3b97c",
    "ulid" : "01FHAMY3Z3F0P3KXRVYZH350DX",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Clinometer ZA",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427001",
    "uuid" : "248c8a89-50ff-4860-b03e-6d8f77b848e4",
    "ulid" : "01FHAQ70J5S7P788ZRS8PTS129",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Centrofix",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427101",
    "uuid" : "6823a291-8d36-4b98-9ea5-2bceeab187b9",
    "ulid" : "01FHAQDCFFJ71TDHDCEDBJBKTK",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Schreibplatte breit",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427111",
    "uuid" : "3fd907d4-a9b2-4b66-bb97-ad5c992bf36e",
    "ulid" : "01FHAQMC42G467P1VHCW93Z8QY",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Madenschraube/Schreibpl.",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427201",
    "uuid" : "f201d532-20a0-4cf6-ab74-fc820a525970",
    "ulid" : "01FHAQQFRS7AMYM8AMZEHF016B",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Schreibplatte schmal",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427401",
    "uuid" : "ba3549a6-1dd6-4a87-9747-1463ead12ee4",
    "ulid" : "01FHAQTVTH50JTNW2859QED7G4",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Stiftträger",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427411",
    "uuid" : "3b31590d-cc5d-40ec-9b79-fea87d788ba0",
    "ulid" : "01FHAQXB48BSBVV68KGHZHGY4V",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Schraube/Stiftträger",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427501",
    "uuid" : "2d619599-f81e-44d3-a58e-494c7ede8bea",
    "ulid" : "01FHAR00BNYKNMCBDD3MS7C7P3",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Schreibkugel lang",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427511",
    "uuid" : "5685ea05-82ed-47c9-b480-93b79b8376bf",
    "ulid" : "01FHAR6X31D94XGS8MVBG6A6DR",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Schreibkugel kurz",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427601",
    "uuid" : "ce32989c-d954-43c0-b411-d5e4cd4b7ff0",
    "ulid" : "01FHARJA42KBCCQEQEC9WVZBFR",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Ausrichtklemme",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427801",
    "uuid" : "4790c644-6deb-4c31-b7ca-51f35ac00b38",
    "ulid" : "01FHARY9J0KXFJGB6PFRD16F4N",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Visierkreuz",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942427901",
    "uuid" : "f736ea11-4c5a-4e58-af61-7dfa457d5a4d",
    "ulid" : "01FHAS3H942640G1ZTSCR9K7NT",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Kombischlüssel",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942428101",
    "uuid" : "72424f34-4486-4b67-a5ac-bb79d869002f",
    "ulid" : "01FHAS7X4MZTJHDZKCX456JKHE",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Kupfer-Schreibplättchen",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942428201",
    "uuid" : "3d5324d9-b65d-43cd-a1f8-cab7cc15daae",
    "ulid" : "01FHASF66MGT19GF22HHF2947H",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Libelle",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  }, {
    "basicUdi" : "++E494ARTEX7L",
    "primaryDi" : "E4942428301",
    "uuid" : "771fbcdc-6a42-4495-95c3-8c10e018d596",
    "ulid" : "01FHASJ2M4VMH5VBSBM41TF76P",
    "basicUdiDiDataUlid" : "01FHA7ZSD9AH1PCMJ0QJVM05V9",
    "riskClass" : {
      "code" : "refdata.risk-class.class-i"
    },
    "tradeName" : "Platzhalter (Plastikschlauch)",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  } ],
  "totalPages" : 26,
  "totalElements" : 638,
  "last" : false,
  "size" : 25,
  "number" : 0,
  "sort" : [ {
    "direction" : "ASC",
    "property" : "primaryDi",
    "ignoreCase" : false,
    "nullHandling" : "NATIVE",
    "ascending" : true,
    "descending" : false
  } ],
  "first" : true,
  "numberOfElements" : 25
}
```
</details>

## Devices
So erhält man z. B. mittels https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de die Daten zur UDI-DI E4947660611.

Die Antwort zur obigen Anfrage sieht dann so aus:

<details>
  <summary>Hier gehts zum JSON Ergebnis</summary>
  
```JSON
{
  "uuid" : "c7418f9f-3f31-4329-b2c1-956377dbe23b",
  "ulid" : "01FHFQWYDFE38DRFBWZXAPAGSC",
  "primaryDi" : {
    "uuid" : "4415d307-082b-4c43-b744-b62c5f848029",
    "code" : "E4947660611",
    "issuingAgency" : {
      "code" : "refdata.issuing-agency.hibcc"
    },
    "type" : "PRIMARY_DI",
    "new" : false
  },
  "containedItem" : null,
  "marketInfoLink" : {
    "uuid" : "ff3544ef-8340-4813-9d2d-f0c2c29d30fb",
    "ulid" : "01FHFQYD8ZV45KTKT8ZBACD9RA",
    "msWhereAvailable" : [ {
      "uuid" : "c74815dc-c1b1-484b-812b-93f225907b77",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Austria",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "AT",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "a58a71cc-823d-4b7f-abda-178303fd0e06",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Belgium",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "BE",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "3ff0711d-1922-43b0-bb9b-0a8c30b1442a",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Bulgaria",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "BG",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "5b6bef38-2301-4874-8b21-872e6cc6db89",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Croatia",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "HR",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "4f1a8e0e-0fbe-4bd3-9998-20c19e4ffd7d",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Cyprus",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "CY",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "ac97a1e6-8206-4d1a-af52-4dc73afa62b0",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Czech Republic",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "CZ",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "c62b008e-daa1-4faa-8822-7d5dd44628e5",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Denmark",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "DK",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "8b1c0cd7-2f8f-478a-bbe8-fea58da49bec",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Estonia",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "EE",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "608e6f55-2c0a-47cb-a474-4b8840480e07",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Finland",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "FI",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "3b7bd48f-d0bc-43c4-8b06-e5d6b691bf98",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "France",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "FR",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "ee938015-4783-401a-a53f-45826b101129",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Germany",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "DE",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "e589fe3d-44c3-4c0d-aa21-0a3380e79e98",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Greece",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "GR",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "ecd77da3-f9b5-4092-b0bc-3be58743e45c",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Hungary",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "HU",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "06ed7e0c-01f1-40cb-bf6a-909d93a91cb5",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Iceland",
        "type" : "EU_EXTENDED",
        "iso2Code" : "IS",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "cdb2598b-8452-4c5d-b965-97df5d520737",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Ireland",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "IE",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "202fbd3a-65ea-44c9-a620-5bc1d91abd3c",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Italy",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "IT",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "b2b0b0ca-458b-403a-b54a-4cbc591f7bd2",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Latvia",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "LV",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "ed3c7776-2a20-42dc-bf0e-9482d041787c",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Liechtenstein",
        "type" : "EU_EXTENDED",
        "iso2Code" : "LI",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "448329f5-ab49-4d01-b0da-5dbad85969a5",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Lithuania",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "LT",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "4890cde3-dd01-434b-bf4c-b24ce4c01506",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Luxembourg",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "LU",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "740d937e-ddf9-4eaf-94d1-b6596c3f1655",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Malta",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "MT",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "d9457a96-8452-4b76-9c44-19b4110a54b6",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Netherlands",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "NL",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "17a20a3d-3b25-468e-900e-e1280f29ef4d",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Norway",
        "type" : "EU_EXTENDED",
        "iso2Code" : "NO",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "5b316385-4c72-453e-a8b6-d7131707c152",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Poland",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "PL",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "99775b91-f151-47fe-b5d9-ea3299334b19",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Portugal",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "PT",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "c272ebdb-1f98-457b-8956-c0e0b7bb5cef",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Romania",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "RO",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "69eb3173-5cf1-4127-9d89-1249e47d2ec8",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Slovakia",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "SK",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "7e65e737-ccaf-414a-899e-2742b9f577b6",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Slovenia",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "SI",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "23581e6f-ae1d-4b13-a846-c1affd943331",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Spain",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "ES",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "853e6035-f41f-4b50-b5f7-90c6498cb1a3",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Sweden",
        "type" : "EU_MEMBER_STATE",
        "iso2Code" : "SE",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "bb224279-98fb-4fbf-b6c1-86ce61944851",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "Turkey",
        "type" : "EU_EXTENDED",
        "iso2Code" : "TR",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    }, {
      "uuid" : "812a3a70-5397-4db1-b72b-2766f693aedf",
      "marketInfoLinkId" : 158,
      "country" : {
        "name" : "United Kingdom (Northern Ireland only)",
        "type" : "EU_SPECIAL",
        "iso2Code" : "XI",
        "nonEUMemberState" : false
      },
      "startDate" : null,
      "endDate" : null,
      "new" : false
    } ],
    "versionState" : {
      "code" : "refdata.eudamed-entity-version-status.registered"
    },
    "latestVersion" : true,
    "versionNumber" : 1,
    "discardedDate" : null,
    "versionDate" : "2021-10-08T12:42:27.649",
    "new" : false
  },
  "secondaryDi" : null,
  "secondaryDiApplicable" : null,
  "additionalDescription" : null,
  "tradeName" : {
    "texts" : [ {
      "language" : null,
      "text" : "Ceramill Zolid HT+ PS A3,5 71x16",
      "allLanguagesApplicable" : true
    } ]
  },
  "tradeNameApplicable" : true,
  "annexXVIApplicable" : false,
  "brainElectroStimulation" : null,
  "cmrSubstance" : false,
  "cmrSubstances" : [ ],
  "componentDis" : [ ],
  "contactLenses" : null,
  "directMarking" : false,
  "directMarkingSameAsUdiDi" : null,
  "directMarkingDi" : null,
  "emr" : null,
  "endocrineDisruptingSubstances" : null,
  "endocrineDisruptor" : false,
  "equipmentForAdiposeTissue" : null,
  "fillingByInjection" : null,
  "humanProductSubstances" : null,
  "latex" : false,
  "udiPiType" : {
    "batchNumber" : true,
    "serializationNumber" : true,
    "manufacturingDate" : true,
    "expirationDate" : true,
    "softwareIdentification" : null
  },
  "medicinalProductSubstances" : null,
  "cndNomenclatures" : [ {
    "uuid" : "CD48A569F3438334E05343E4A79E78D8",
    "code" : "Q010699",
    "description" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "MATERIALS FOR THE PREPARATION OF CUSTOM-MADE DENTAL DEVICES - OTHER",
        "allLanguagesApplicable" : null
      } ]
    },
    "gmdnNomenclatures" : [ ]
  } ],
  "oemApplicable" : false,
  "productDesigner" : null,
  "placedOnTheMarket" : {
    "name" : "Austria",
    "type" : "EU_MEMBER_STATE",
    "iso2Code" : "AT",
    "nonEUMemberState" : false
  },
  "productsToBeIntroduced" : null,
  "reference" : "766061",
  "reprocessed" : false,
  "maxNumberOfReuses" : null,
  "maxNumberOfReusesApplicable" : false,
  "singleUse" : false,
  "clinicalSizeApplicable" : false,
  "clinicalSizes" : [ ],
  "deviceStatus" : {
    "uuid" : "71033cf6-8349-43da-a60f-80f9ad847b32",
    "type" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "deviceSubStatuses" : [ ],
    "statusDate" : "2021-10-08",
    "new" : false
  },
  "sterile" : false,
  "sterilization" : false,
  "storageApplicable" : true,
  "storageHandlingConditions" : [ {
    "uuid" : "ddd91b06-4a45-4e54-98de-4411cb1ea226",
    "typeCode" : "refdata.storage-handling-conditions-type.SHC005",
    "mandatory" : false,
    "description" : null,
    "udiDiDataId" : 293,
    "new" : false
  }, {
    "uuid" : "ace6b7f4-2cbd-45c8-b05c-2599c22000d8",
    "typeCode" : "refdata.storage-handling-conditions-type.SHC099",
    "mandatory" : false,
    "description" : {
      "texts" : [ {
        "language" : {
          "isoCode" : "en",
          "name" : "English"
        },
        "text" : "Store the blanks in the original packaging",
        "allLanguagesApplicable" : null
      } ]
    },
    "udiDiDataId" : 293,
    "new" : false
  } ],
  "unitOfUse" : null,
  "criticalWarningsApplicable" : true,
  "criticalWarnings" : [ {
    "uuid" : "9e50f95e-4467-4cce-b051-071e3cafea6f",
    "typeCode" : "refdata.critical-warnings-type.CW018",
    "mandatory" : false,
    "description" : null,
    "udiDiDataId" : 293,
    "new" : false
  } ],
  "additionalInformationUrl" : "https://www.amanngirrbach.com/en/services/downloads/instructions/",
  "storageSymbol" : null,
  "baseQuantity" : 1,
  "versionState" : {
    "code" : "refdata.eudamed-entity-version-status.registered"
  },
  "latestVersion" : true,
  "versionNumber" : 1,
  "newDevice" : null,
  "discardedDate" : null,
  "linkedUdiDiView" : null,
  "versionDate" : "2021-10-08T12:42:27.657",
  "new" : false
}
```
> Ein kleiner Ausflug in die Welt der Daten (hat mit der eigentlichen Sache nichts zu tun!): 
> Die Daten liefern vielfältige Informationen, z. B. welche Länder in der EU sind! Ein tolles Informationsangebot. Sogar, dass die Türkei kein EU Mitglied ist wird da ausgedrückt. Zu jedem Land wird auch der zweistellige ISO-Ländercode verfügbar gemacht. Was man doch mit Datenbanken alles für tolle Dinge machen kann! Übrigens die Türkei wird quasi schon als zur EU gehörig geführt denn sie wird mit "type" : "EU_EXTENDED" aufgelistet. Man beachte auch das Feld "nonEUMemberState" welches bei der Türkei als false geführt wird. Also sehen wir nun die Türkei als EU-Mitgliedsland an. Aber es gibt ja noch einen zweiten interessanten Kandidaten, das Vereinigte Königreich, welches mit dem "type" : "EU_SPECIAL" geführt wird und laut "nonEUMemberState" mit false wahrscheinlich auch immer noch zum Verein gehört.
</details>

Um obige JSON-Daten zu bekommen muss man eine UUID übergeben, allerdings wird die UUID von der EUDAMED vergeben, also wie kommt man an diese UUID? Üblicherweise erhält man von den Barcodes bzw. 2D-Codes auf den Geräten und Materialien eine UDI-DI. Schön wäre es nun also wenn man mittels dieser UDI-DI eine Suche in der EUDAMED starten könnte. Und tatsächlich geht dies über diese URL: https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947660611.

Als Ergebnis bekommt man, mit etwas Glück (denn es klappt momentan nicht immer!), diese Daten:

<details>
  <summary>Hier gehts zum JSON Ergebnis</summary>
  
```JSON
{
  "content" : [ {
    "basicUdi" : "++E494ZIRKON5F5",
    "primaryDi" : "E4947660611",
    "uuid" : "c7418f9f-3f31-4329-b2c1-956377dbe23b",
    "ulid" : "01FHFQWYDFE38DRFBWZXAPAGSC",
    "basicUdiDiDataUlid" : "01FHACHSBH7HV3TA9MF89GS9FM",
    "riskClass" : {
      "code" : "refdata.risk-class.class-iia"
    },
    "tradeName" : "Ceramill Zolid HT+ PS A3,5 71x16",
    "manufacturerName" : "Amann Girrbach AG",
    "manufacturerSrn" : "AT-MF-000000252",
    "deviceStatusType" : {
      "code" : "refdata.device-model-status.on-the-market"
    },
    "manufacturerNames" : null,
    "latestVersion" : true,
    "versionNumber" : 1,
    "basicUdiDataUuid" : null,
    "basicUdiDataUlid" : null,
    "basicUdiDataVersionState" : null,
    "versionState" : null,
    "deviceName" : null,
    "deviceModel" : null,
    "lastUpdateDate" : null,
    "reference" : null,
    "basicUdiDataVersionNumber" : 0,
    "issuingAgency" : null,
    "containerPackageCount" : 0,
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  } ],
  "totalPages" : 1,
  "totalElements" : 1,
  "last" : true,
  "size" : 20,
  "number" : 0,
  "sort" : null,
  "first" : true,
  "numberOfElements" : 1
}
```
</details>

Im obigen JSON-Objekt findet man dann unter Content diesen Eintrag: "uuid" : "c7418f9f-3f31-4329-b2c1-956377dbe23b". Hier ist also die UUID welche wir für die Abfrage aller Details brauchen. Damit kann man also die Anfrage mittels dieser URL https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de wie oben bereits gezeigt starten.

Übrigens kann man durch diesen einfachen Aufruf auch herausfinden, wieviel Devices in der EUDAMED momentan hinterlegt sind: https://ec.europa.eu/tools/eudamed/api/devices/udiDiData

```
    ...
    "mfOrPrSrn" : null,
    "applicableLegislation" : null,
    "sterile" : null,
    "multiComponent" : null,
    "deviceCriterion" : null
  } ],
  "totalPages" : 6313,
  "totalElements" : 126250,
  "last" : false,
  "size" : 20,
  "number" : 0,
  "sort" : null,
  "first" : true,
  "numberOfElements" : 20
}
```

Es sind also am 11.10.2022 als diese Abfrage durchgeführt wurde 126250 Devices. Etwas wenig wenn man die Anzahl mit der GUDID vergleicht. Aber wir sind ja seit Jahren erst am Anfang :-).

# Sonstiges
## Videos zur Eudamed
Vereinzelt findet man hier Videos mit Infos:
https://www.youtube.com/c/EasyMedicalDevice (hat öfters Richard Houlihan einen mit der EUDAMED näher befassten in den Interviews).
https://www.youtube.com/user/JohnerInstitut.

## CND, EMDN, GMDN und UMDNS
Es tauchen in den Daten z.B. cndNomenclatures auf. Hier die offizielle Seite zu der Nomenklatur: https://webgate.ec.europa.eu/dyna2/emdn/, weitere Infos mit einem Überblick über die Zusammenhänge findet man hier: https://www.johner-institut.de/blog/regulatory-affairs/gmdn-und-umdns-codes/. Der grundsätzliche Aufbau der EMDN wird hier beschrieben: https://health.ec.europa.eu/system/files/2021-06/md_q-a_emdn_en_0.pdf.

## Arbeit über EUDAMED
Hier hat jemand eine Arbeit über EUDAMED geschrieben, der auch die REST-API nutzt und für seine Auswertungen nutzt. Könnte vielleicht für den einen oder anderen Fall interessant sein: https://openaccess.uoc.edu/bitstream/10609/148250/1/jlopezledTFG0623memoria.pdf, Beschreibung ab Seite 55.

## Beispiele für Zertifikate

### Erkodent mit TÜV Rheinland
Beispiel für ein Zertifikat vom TÜV Rheinland für eine Produktreihe von Erkodent

SRN: DE-MF-000006243
Enthält: Q010699 - DENTISTRY DEVICES, FABRICATION MATERIALS - OTHERS

https://www.erkodent.de/wp-content/documents/products/ERKOD_HZ1073124-1_inclProdListApplicMDR.pdf

Eines der Erkodentprodukte von dem Zertifikat:
```Powershell
Get-EudamedDeviceDetail -Uuid 4236a036-cd15-4a08-ab6a-bb3beb28df09
```

### Amann mit TÜV Süd

SRN: AT-MF-000000252

Enthält: 
Q010699 - DENTISTRY DEVICES, FABRICATION MATERIALS - OTHERS
Q010601 - DENTAL ALLOYS

https://www.amanngirrbach.com/fileadmin/_agweb_2013/media/mediathek/Print/Add_documentation/Certificates/EN/ISO_Certificate_MDR.pdf

## SOAP-API mit Beschreibung der Eudamed-Struktur
https://health.ec.europa.eu/system/files/2020-09/md_eudamed_dtx_eo_introduction_en_0.pdf
Unbedingt auch die technischen Beschreibungen anschauen, wenn diese bei neuen Versionen rauskommen.

## verschiedene Dental-Material-Hersteller
SNR|Hersteller|MDR-Informationen
---|----------|-
DE-MF-000007705|KULZER GmbH|
DE-IM-000006314|Ivoclar Vivadent GmbH
DE-MF-000007706|Dentsply Implants Manufacturing GmbH
DE-MF-000023384|Heimerle + Meule GmbH
DE-MF-000006299|Dentaurum GmbH & Co. KG
DE-MF-000006300|Dentaurum Implants GmbH
DE-MF-000012859|3M Deutschland GmbH (Dental)
DE-MF-000009117|Medentika GmbH
DE-MF-000006243|Erkodent Erich Kopp GmbH
DE-MF-000008124|bredent GmbH & Co. KG
DE-MF-000006304|C.HAFNER GmbH + Co. KG
DE-MF-000005026|Argen Dental GmbH
DE-MF-000012324|Wegold Edelmetalle GmbH
DE-MF-000007937|DeguDent GmbH
DE-MF-000025211|KOOS Edelmetalle GmbH
DE-MF-000005906|VITA Zahnfabrik H.Rauter GmbH & Co.KG|https://www.vita-zahnfabrik.com/de/MDR-103200,223111.html
DE-IM-000004952|SHOFU DENTAL GmbH
DE-MF-000005410|BEGO Implant Systems GmbH & Co. KG| https://www.bego.com/de/aktuelles/bego-news/konformitaetserklaerung-fuer-sonderanfertigungen-nach-medical-device-regulation-mdr/
DE-MF-000005414|BEGO Bremer Goldschlägerei Wilh. Herbst GmbH & Co.KG|https://www.bego.com/de/aktuelles/bego-news/konformitaetserklaerung-fuer-sonderanfertigungen-nach-medical-device-regulation-mdr/
DE-MF-000006997|WIELAND Edelmetalle GmbH
DE-MF-000006241|pritidenta GmbH|https://pritidenta.com/mdr/
DE-MF-000006592|Dental Direkt GmbH|https://www.dentaldirekt.de/de/mdr-info
AT-MF-000000252|Amann Girrbach AG
CH-MF-000009933|Institut Straumann AG
CH-MF-000015795|Candulor AG
SE-MF-000000009|Nobel Biocare AB
IT-MF-000028795|Zirkonzahn

## Ausprägung von Konzernen:

### International
SNR|Typ|Hersteller|Ort
---|---|----------|---
DE-IM-000006314|Importer|Ivoclar Vivadent GmbH [DE]|Ellwangen Jagst	Germany	
LI-AR-000000523|Authorised|Representative	Ivoclar Vivadent AG [DE]|Schaan	Liechtenstein	
LI-IM-000000524|Importer|Ivoclar Vivadent AG [DE]|Schaan	Liechtenstein	
LI-MF-000000522|Manufacturer|Ivoclar Vivadent AG [DE]|Schaan	Liechtenstein	
US-MF-000000688|Manufacturer|Ivoclar Vivadent, Inc. [EN]|Amherst, NY	United States

### National
SNR|Typ|Hersteller|Ort
---|---|----------|---
DE-IM-000008126|Importer|bredent medical GmbH & Co. KG [DE]|Senden	Germany	
DE-MF-000008124|Manufacturer|bredent GmbH & Co. KG [DE]|Senden	Germany	
DE-MF-000008125|Manufacturer|bredent medical GmbH & Co. KG [DE]|Senden	Germany	
DE-PR-000014118|System/Procedure Pack Producer|bredent medical GmbH & Co. KG [DE]|Senden	Germany	
DE-PR-000014120|System/Procedure Pack Producer|bredent GmbH & Co. KG [DE]|Senden	Germany
