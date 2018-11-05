#https://blog.jooq.org/2013/11/19/how-to-create-a-range-from-1-to-10-in-sql/

SELECT LEVEL AS V
FROM DUAL CONNECT BY LEVEL<100
/

SELECT V
FROM (
  SELECT 1 V FROM DUAL
) T
MODEL DIMENSION BY (ROWNUM R)
      MEASURES (V)
      RULES ITERATE (100) (
        V[ITERATION_NUMBER] = CV(R) + 1
      )
ORDER BY 1
/

SELECT ROWNUM 
FROM ALL_OBJECTS, ALL_OBJECTS,
     ALL_OBJECTS, ALL_OBJECTS
WHERE ROWNUM <= 100
/
