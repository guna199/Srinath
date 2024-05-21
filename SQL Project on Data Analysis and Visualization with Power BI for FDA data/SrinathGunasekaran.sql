/*Task 1: Identifying Approval Trends

1. Determine the number of drugs approved each year and provide insights into the yearly
trends*/

SELECT YEAR(DocDate) AS ApprovalYear, COUNT(*) AS NumberofDrugs FROM appdoc where ActionType = "AP" GROUP BY YEAR(DocDate) ORDER BY ApprovalYear;

SELECT YEAR(DocDate) AS ApprovalYear, COUNT(*) AS NumberofDrugs FROM appdoc where ActionType = "TA" GROUP BY YEAR(DocDate) ORDER BY ApprovalYear;

/*2.Identify the top three years that got the highest and lowest approvals, in descending and
ascending order, respectively.*/

SELECT YEAR(DocDate) AS ApprovalYear, COUNT(*) AS NumberofApprovedDrugs FROM appdoc GROUP BY YEAR(DocDate) ORDER BY NumberofApprovedDrugs DESC LIMIT 3;


SELECT YEAR(DocDate) AS ApprovalYear, COUNT(*) AS NumberofApprovedDrugs FROM appdoc GROUP BY YEAR(DocDate) ORDER BY NumberofApprovedDrugs ASC LIMIT 3;




 /*Task 2: Segmentation Analysis Based on Drug MarketingStatus

1. Group products based on MarketingStatus. Provide meaningful insights into the
segmentation patterns. */

SELECT ProductMktStatus, COUNT(*) AS products FROM product GROUP BY ProductMktStatus ORDER BY products DESC;

 /* 2. Calculate the total number of applications for each MarketingStatus year-wise after the year
2010. */

SELECT p.ProductMktStatus, YEAR(a.DocDate) AS Applicationyear, COUNT(*) AS TotalApplications FROM 
appdoc a JOIN product p ON a.ApplNo = p.ApplNo WHERE YEAR(a.DocDate) > 2010 GROUP BY YEAR(a.DocDate), p.ProductMktStatus ORDER BY Applicationyear, p.ProductMktStatus;





/* Task 3: Analyzing Products
1. Categorize Products by dosage form and analyze their distribution. */

SELECT Form as Dosage_Form, COUNT(*) AS productnumber, MIN(ProductMktStatus) AS Minimum_ProductMktStatus,MAX(ProductMktStatus) AS Maximum_ProductMktStatus
FROM product GROUP BY Form ORDER BY productnumber DESC;

/* 2. Calculate the total number of approvals for each dosage form and identify the most
successful forms.*/

SELECT Form as Dosage_Form, COUNT(*) AS TotalApprovals FROM product GROUP BY Dosage_Form ORDER BY TotalApprovals DESC;





/* Task 4: Exploring Therapeutic Classes and Approval Trends 

2. Determine the therapeutic evaluation code (TE_Code) with the highest number of Approvals in
each year */

SELECT YEAR(b.ActionDate) AS Approvalyear, MAX(a.TECode) AS max_TECode, COUNT(*) AS Numberofapprovals FROM product_tecode a,regactiondate b where a.ApplNo = b.ApplNo 
GROUP BY a.TECode, b.ActionDate ORDER BY Numberofapprovals DESC;


  
  
  

