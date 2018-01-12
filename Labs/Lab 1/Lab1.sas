TITLE 'Martens';
/* Enter the data manually */
DATA MARTEN;
INPUT STRUCTURE TEMP SNOW_DEPTH $;
DATALINES;
1 -1.6 S
1 -1.1 S
1 -0.7 S
1 -0.4 S
1 -0.3 S
1 -0.2 S
1 -0.1 S
1 0 S
1 0 S
1 0.1 S
1 0.1 S
1 0.5 S
1 1 S
1 1.3 S
1 1.4 S
2 -2.8 S
2 -1.7 S
2 -1.5 S
2 -1.1 S
2 -1.1 S
2 -1 S
2 -1 S
2 -0.9 S
2 -0.5 S
2 -0.1 S
2 0.4 S
2 0.5 S
2 1 S
2 1.2 S
2 1.4 S
3 -1.1 S
3 -0.9 S
3 -0.7 S
3 -0.7 S
3 -0.6 S
3 -0.4 S
3 -0.3 S
3 -0.2 S
3 -0.1 S
3 -0.1 S
3 0 S
3 0.3 S
3 0.5 S
3 0.7 S
3 0.7 S
1 3.4 D
1 3.4 D
1 3.7 D
1 4.1 D
1 4.5 D
1 4.6 D
1 5 D
1 5 D
1 5.2 D
1 5.2 D
1 5.4 D
1 5.8 D
1 6.5 D
1 7.6 D
1 9.9 D
2 -1.8 S
2 -1.5 S
2 -0.9 D
2 -0.4 S
2 0.2 D
2 0.2 S
2 0.3 D
2 0.7 D
2 1.8 S
2 1.8 D
2 2 D
2 2 D
2 2.2 D
2 2.6 D
2 5.6 D
3 -2.1 D
3 -1.6 D
3 -0.8 D
3 -0.6 D
3 -0.2 D
3 -0.1 D
3 -0.1 D
3 0.1 D
3 0.5 D
3 0.5 D
3 0.7 D
3 0.8 D
3 0.9 D
3 1.2 D
3 1.8 D
;

/* Create a new categorical variable */
DATA MARTEN;
SET work.MARTEN;
IF TEMP > 0 THEN INSIDE_TEMP='Warmer';
ELSE INSIDE_TEMP='Colder';

/* Print the data */
PROC PRINT DATA=MARTEN;
RUN;

/* Sort the data by a variable */
PROC SORT DATA=MARTEN OUT=sorted;
BY STRUCTURE;
RUN;

/* Generate descriptive statistics for temp differences by structure type */
PROC MEANS DATA=sorted;
TITLE 'Descriptive Statistics';
BY STRUCTURE;
RUN;

/* Generate frequency tables */
PROC FREQ DATA=MARTEN;
TABLES INSIDE_TEMP*STRUCTURE*SNOW_DEPTH/NOCOL NOPERCENT;
RUN;
