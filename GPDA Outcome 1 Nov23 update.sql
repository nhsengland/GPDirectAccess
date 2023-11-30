/*

GPDA Outcome 1
07 Nov 23

Code to extract aggregated GPDA data from DID by month and CCG

*/

SELECT 
[DID_Date3_Month]
,[DID_Date3_Year]
,[IC_CCGCode]
,[IC_CCGName]
,[DID_PatSource_Code]
,[IC_PatSource_Desc]
,[IC_Modality_Desc]
,COUNT([SubmissionDataId]) as 'Tests'
FROM [HESDIDS].[vw_HESDIDS_DiagnosticImagingTest_Current]

WHERE 
[DID_PatSource_Code] = '04'  --GPDA referral source
AND [DID_Date3] BETWEEN '2017-04-01' AND '2023-06-30'
AND [DID_SnomedCT_Code] IN ('418891003','418023006','169069000','315941000000105','419394006','32962002','241553009','339901000000104','432370003'
,'429864007','433761009','448766000','912331000000104','912341000000108','912371000000102','700505008','721041002','721042009','726553009','764729002'
,'45036003','418394000','826601000000101','429915000','429807002','241603006','440450002','448306001','431999000','698354004','698355003','720705001'
,'399208008')

GROUP BY
[DID_Date3_Month]
,[DID_Date3_Year]
,[IC_CCGCode]
,[IC_CCGName]
,[DID_PatSource_Code]
,[IC_PatSource_Desc]
,[IC_Modality_Desc]
