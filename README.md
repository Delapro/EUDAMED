# EUDAMED
Hier werden die Abenteuer mit der EUDAMED also der European Database on Medical Devices dokumentiert.

# Die Homepage
Die Homepage der EUDAMED ist unter https://ec.europa.eu/tools/eudamed zu finden. Man kann mittels https://ec.europa.eu/tools/eudamed/#/screen/search-device nach UDI-DIs suchen.

# Support
Unterstützung gibt es unter der E-Mail-Adresse SANTE-EUDAMED-SUPPORT@ec.europa.eu.

# Aktuelle Infos
Aktuelle Informationen die EUDAMED betreffend findet man hier: https://ec.europa.eu/tools/eudamed/#/screen/news.

# API
Es gibt auch eine (inoffizielle?) API, welche das direkte Abgreifen von Informationen per JSON-Objekten erlaubt. So erhält man z. B. mittels https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de die Daten zur UDI-DI E4947660611.

> Die nachstehenden Daten wurden am 30.9.2022 abgerufen, es kann also später Abweichungen geben.

Die Antwort zur obigen Anfrage sieht dann so aus:
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


Um obige JSON-Daten zu bekommen muss man eine UUID übergeben, allerdings wird die UUID von der EUDAMED vergeben, also wie kommt man an diese UUID? Üblicherweise erhält man von den Barcodes bzw. 2D-Codes auf den Geräten und Materialien eine UDI-DI. Schön wäre es nun also wenn man mittels dieser UDI-DI eine Suche in der EUDAMED starten könnte. Und tatsächlich geht dies über diese URL: https://ec.europa.eu/tools/eudamed/api/devices/udiDiData?primaryDi=E4947660611.

Als Ergebnis bekommt man, mit etwas Glück (denn es klappt momentan nicht immer!), diese Daten:
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

Im obigen JSON-Objekt findet man dann unter Content diesen Eintrag: "uuid" : "c7418f9f-3f31-4329-b2c1-956377dbe23b". Hier ist also die UUID welche wir für die Abfrage aller Details brauchen. Damit kann man also die Anfrage mittels dieser URL https://ec.europa.eu/tools/eudamed/api/devices/udiDiData/c7418f9f-3f31-4329-b2c1-956377dbe23b?languageIso2Code=de wie oben bereits gezeigt starten.

# Spielversion (Playground)
Eudamed kennt einen sogannten Eudamed-Playground (https://webgate.training.ec.europa.eu/eudamed-play/landing-page#/).
![image](https://user-images.githubusercontent.com/16536936/193817737-75b64348-5a0e-46ea-8d9e-0d0b8d912fdb.png)
Hier gibts aktuelle Infos zum Playground: https://webgate.training.ec.europa.eu/eudamed-play/secure#/release-notes. Unter Hilfe gibt es auch jede Menge tiefergehende Dokus und XML-Schemen.

# Sonstiges
## Videos zur Eudamed
Vereinzelt findet man hier Videos mit Infos:
https://www.youtube.com/c/EasyMedicalDevice (hat öfters Richard Houlihan einen mit der EUDAMED näher befassten in den Interviews).
https://www.youtube.com/user/JohnerInstitut

## Die Hersteller 
Die Hersteller werden als Economic Operators bezeichnet. Die hinterlegten Daten eines solchen Economic Operators, hier im Fall Ammann Girrbach, findet man unter https://ec.europa.eu/tools/eudamed/#/screen/search-eo/6bb2017f-b4df-452f-9799-798f063f535d.

## Auflistung aller Devices von Ammann Girrbach
Auflistung aller Devices von Ammann Girrbach, welche in der EUDAMED hinterlegt sind: https://ec.europa.eu/tools/eudamed/#/screen/search-device?srn=AT-MF-000000252&uuid=6bb2017f-b4df-452f-9799-798f063f535d.
