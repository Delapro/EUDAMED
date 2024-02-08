# sicherstellen, dass die Datumsausgaben im bekannten Format stattfinden
Set-Culture('de-DE')

# Willkürliche Sammlung von meistens falschen, zumindest nicht immer nachvollziehbaren, UDIs.
# Bei den vom üblichen UDI-DI Standard abweichenden Devices scheint es sich eher um übergeordnete "Anzeigen" zu handeln. Meist ist die auf der Webseite angegebene IssuingAgency die EUDAMED selber!
#
# Die Frage ist, ob das Flag bzw. der Systemidentifier ('+' bei HIBC) mit angegeben werden muss oder nicht.
# Bei GS1 ist es quasi nicht nachvollziehbar, außer man würde die Länge auf 14 Zeichen nach GTIN14 als Kriterium hernehmen
# Momentan wird leider die IssuingAgency nicht zurückgegeben (obwohl das Webinterface die Information liefert), wodurch nochmal eine gewisse Unschärfe entsteht
#
# https://ec.europa.eu/tools/eudamed/#/screen/search-device
#
$komischeUDIs = @(
      ,[PSCustomObject]@{primaryID="E269734430010"; uuid="2094af05-b044-4485-8340-6f248a796082"; manufacturerSrn="DE-MF-000023384"; manufacturerName="Heimerle + Meule GmbH"}
      ,[PSCustomObject]@{primaryID="+ERKO5295081"; uuid="6a45a7e8-a8dc-4359-8484-339f01a9bedf"; manufacturerSrn="DE-MF-000006243"; manufacturerName="Erkodent Erich Kopp GmbH"}
      ,[PSCustomObject]@{primaryID="04251936500959"; uuid="969768a8-2ec6-4744-a62b-f00cffa8f196"; manufacturerSrn="DE-MF-000006304"; manufacturerName="C.HAFNER GmbH + Co. KG"}
      ,[PSCustomObject]@{primaryID="J017EC4CW4020"; uuid="f48f9a75-5b31-493e-ad47-8a7e6d31d9a8"; manufacturerSrn="DE-MF-000005906"; manufacturerName="VITA Zahnfabrik"}
      ,[PSCustomObject]@{primaryID="04260649890387"; uuid="58066ccd-1ecb-43a6-8a74-b04b149c4b0a"; manufacturerSrn="DE-MF-000006997"; manufacturerName="WIELAND Edelmetalle GmbH"}
      ,[PSCustomObject]@{primaryID="D-DEMF000019995F2184Z9"; uuid="8f886229-2d28-4527-a493-bbcb8349e228"; manufacturerSrn="DE-MF-000019995"; manufacturerName="Feguramed GmbH"}
      ,[PSCustomObject]@{primaryID="D-DEMF000019995F2183-2YW"; uuid="78d75d22-1c6a-469b-b143-afa5fca365fe"; manufacturerSrn="DE-MF-000019995"; manufacturerName="Feguramed GmbH"}
      ,[PSCustomObject]@{primaryID="D-DEMF000019995F2183Z7"; uuid="6e0b5a25-8718-4634-8bdc-e696523fa111"; manufacturerSrn="DE-MF-000019995"; manufacturerName="Feguramed GmbH"}
      ,[PSCustomObject]@{primaryID="D-++D964FMVBCX00X15AUSW"; uuid="13511aa7-0642-4e06-9f8a-a592caeea1cb"; manufacturerSrn="DE-MF-000009125"; manufacturerName="Zahnmanufaktur Riedenburg | Inh.: Alexander Heinrich"}
      ,[PSCustomObject]@{primaryID="+E219TESTXC530243101"; uuid="145ee9cf-892c-4112-84d1-1d72563aacf9"; manufacturerSrn="DE-MF-000006230"; manufacturerName="ALTATEC GmbH"}
      ,[PSCustomObject]@{primaryID="EDDIDDDFXPF38S1"; uuid="b520f083-e5c7-4566-a52f-e1ed5216531e"; manufacturerSrn="DE-MF-000006592"; manufacturerName="Dental Direkt GmbH"}
      ,[PSCustomObject]@{primaryID="++EMTS70000001"; uuid="fb8bf1c6-7f34-434a-86ea-4cfaee5538c9"; manufacturerSrn="DE-MF-000005874"; manufacturerName="model-tray GmbH für rationellen Dental-Bedarf"}
      ,[PSCustomObject]@{primaryID="+J00925620000000"; uuid="24149cfe-73b9-4a52-8674-cc26e09026c2"; manufacturerSrn="DE-MF-000005448"; manufacturerName="Renfert GmbH"}
      ,[PSCustomObject]@{primaryID="+J00922221000"; uuid="5f53d82e-b27e-417a-8d9d-ca1681b32ee1"; manufacturerSrn="DE-MF-000005448"; manufacturerName="Renfert GmbH"}
      ,[PSCustomObject]@{primaryID="J009670010000"; uuid="0228257e-3ed5-4fa9-81a3-9ee84db3a09e"; manufacturerSrn="DE-MF-000005448"; manufacturerName="Renfert GmbH"}
      ,[PSCustomObject]@{primaryID="+EDET029701"; uuid="106007cf-fae8-472c-bf86-b9f89ebfd107"; manufacturerSrn="DE-MF-000005995"; manufacturerName="DETAX GmbH & Co. KG"}
      ,[PSCustomObject]@{primaryID="*EDET028511"; uuid="e0b6b9b2-618f-420e-a39b-86413bbf1a20"; manufacturerSrn="DE-MF-000005995"; manufacturerName="DETAX GmbH & Co. KG"}
      ,[PSCustomObject]@{primaryID="*EDET028911"; uuid="023956a2-5620-47ee-852d-f6a9f113a17e"; manufacturerSrn="DE-MF-000005995"; manufacturerName="DETAX GmbH & Co. KG"}
      ,[PSCustomObject]@{primaryID="04260525162089"; uuid="79575518-274e-4962-9552-9ff31449578b"; manufacturerSrn="DE-MF-000009412"; manufacturerName="MEDIGMA BIOMEDICAL GMBH"}
      ,[PSCustomObject]@{primaryID="D-DEMF000009412MWD0015AN"; uuid="6a89bb3a-2fb5-4088-8395-57090d4ae5c0"; manufacturerSrn="DE-MF-000009412"; manufacturerName="MEDIGMA BIOMEDICAL GMBH"}
      ,[PSCustomObject]@{primaryID="D-DEMF0000094121820L15SVZ"; uuid="80aaa10a-d599-4abe-a05e-f8aab7b9a16a"; manufacturerSrn="DE-MF-000009412"; manufacturerName="MEDIGMA BIOMEDICAL GMBH"}
      ,[PSCustomObject]@{primaryID="42605251656608"; uuid="bd03df52-ccb7-4a82-9393-3e6b3501248f"; manufacturerSrn="DE-MF-000009412"; manufacturerName="MEDIGMA BIOMEDICAL GMBH"}
      ,[PSCustomObject]@{primaryID="+EYET6800000"; uuid="998c3e47-010b-4224-850c-1bb3303dcd9c"; manufacturerSrn="DE-MF-000005557"; manufacturerName="Yeti Dentalprodukte GmbH"}
      ,[PSCustomObject]@{primaryID="+EYET3201502"; uuid="b2f7ee46-174a-4154-a160-ea25abb3edff"; manufacturerSrn="DE-MF-000005557"; manufacturerName="Yeti Dentalprodukte GmbH"}
      ,[PSCustomObject]@{primaryID="+EYET6840000"; uuid="fa980022-20cd-4abf-9081-e6a8ec759b8c"; manufacturerSrn="DE-MF-000005557"; manufacturerName="Yeti Dentalprodukte GmbH"}
      ,[PSCustomObject]@{primaryID="+EYET6602500"; uuid="6bc66503-2ac0-4507-92b2-484587d71b16"; manufacturerSrn="DE-MF-000005557"; manufacturerName="Yeti Dentalprodukte GmbH"}
)

# die Suche erfolgt über UUID, da schneller, es geht eher darum eine Änderung der primaryID später nachvollziehen zu können.
# Die zurückgegebenen Datensätze unterscheiden sich, es gilt noch das passende Kriterium zur Unterscheidung herauszufinden!
$komischeUDIs | % {Get-EudamedDeviceDetail -Uuid $_.uuid}
