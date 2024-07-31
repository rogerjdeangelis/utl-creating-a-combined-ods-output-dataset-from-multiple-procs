%let pgm=utl-creating-a-combined-ods-output-dataset-from-multiple-procs;

 Run mutiple proc regs and combine all parameter estimates into one dataset

      TRREE PARTS

          1 without match_all
          2 with match all;
          3 relate repos

github
https://tinyurl.com/5n8vka6h
https://github.com/rogerjdeangelis/utl-creating-a-combined-ods-output-dataset-from-multiple-procs


/**************************************************************************************************************************/
/*               |                                                    |                                                   */
/*    INPUT      |               PROCESS                              |                OUTPUT (WORK.PARMS)                */
/*    =====      |               =======                              |                ===================                */
/*               |                                                    |                                                   */
/* 1 WITHOUT     |                                                    |                                                   */
/*   MATCH_ALL   |                                                    |                                                   */
/*               |                                                    |                                                   */
/* sashelp.class | ods output clear; * reset the dataset counter;     |   Model     Dependent   Variable    Estimate      */
/*               |                                                    |                                                   */
/*               | ods output parameterestimates(persist=proc)=parms; | age_weight   Age        Intercept    8.45853      */
/*               |                                                    |              Age        Weight       0.04856      */
/*               | proc reg data=sashelp.class;                       |                                                   */
/*               |    age_weight: model age=weight;                   |                                                   */
/*               | run;quit;                                          | weight_age   Weight     Intercept  -50.49278      */
/*               |                                                    |              Weight     Age         11.30381      */
/*               | proc reg data=sashelp.class;                       |                                                   */
/*               |    weight_age: Model weight=age;                   |                                                   */
/*               | run;quit;                                          |  WORK.PARMS                                       */
/*               |                                                    |                                                   */
/*               | ods output close;                                  |     Model       Dependent    Variable    Estimate */
/*               |                                                    |                                                   */
/*               | proc print data=parms                              |   age_weight     Age         Intercept     8.4585 */
/*               |    (keep=model dependent variable estimate);       |   age_weight     Age         Weight        0.0486 */
/*               | by model;                                          |   weight_age     Weight      Intercept   -50.4928 */
/*               | id model;                                          |   weight_age     Weight      Age          11.3038 */
/*               | run;quit;                                          |                                                   */
/*               |                                                    |                                                   */
/*               |                                                    |                                                   */
/*               |                                                    |                                                   */
/*---------------|----------------------------------------------------|---------------------------------------------------*/
/*               |                                                    |                                                   */
/* 2 WITH        | ods output clear;                                  |                                                   */
/*   MATCH_ALL   |                                                    |           OUTPUT (WORK.PAR and WORK.PAR1)         */
/*               | ods output parameterestimates                      |                                                   */
/*               |   (persist=proc MATCH_ALL=par)=par;                |   Model     Dependent   Variable    Estimate      */
/*               |                                                    |                                                   */
/*               | proc reg data=sashelp.class;                       | age_weight   Age        Intercept    8.45853      */
/*               |    age_weight: model age=weight;                   |              Age        Weight       0.04856      */
/*               | run;quit;                                          |                                                   */
/*               |                                                    |                                                   */
/*               | proc reg data=sashelp.class;                       | weight_age   Weight     Intercept  -50.49278      */
/*               |    weight_age: Model weight=age;                   |              Weight     Age         11.30381      */
/*               | run;quit;                                          |                                                   */
/*               | ods output close;                                  |                                                   */
/*               |                                                    | WORK.PAR                                          */
/*               | data pars;                                         |                                                   */
/*               |  set &par;                                         |    Model       Dependent    Variable    Estimate  */
/*               | run;quit;                                          |                                                   */
/*               |                                                    |  age_weight     Age         Intercept     8.4585  */
/*               | proc print data=pars                               |  age_weight     Age         Weight        0.0486  */
/*               |    (keep=model dependent variable estimate);       |                                                   */
/*               | by model;                                          | WORK.PAR1                                         */
/*               | id model;                                          |                                                   */
/*               | run;quit;                                          |    Model       Dependent    Variable    Estimate  */
/*               |                                                    |                                                   */
/*               |                                                    |  weight_age     Weight      Intercept   -50.4928  */
/*               |                                                    |  weight_age     Weight      Age          11.3038  */
/*               |                                                    |                                                   */
/*               |                                                    |                                                   */
/**************************************************************************************************************************/

/*____            _       _           _
|___ /   _ __ ___| | __ _| |_ ___  __| |  _ __ ___ _ __   ___  ___
  |_ \  | `__/ _ \ |/ _` | __/ _ \/ _` | | `__/ _ \ `_ \ / _ \/ __|
 ___) | | | |  __/ | (_| | ||  __/ (_| | | | |  __/ |_) | (_) \__ \
|____/  |_|  \___|_|\__,_|\__\___|\__,_| |_|  \___| .__/ \___/|___/
                                                  |_|
*/
https://github.com/rogerjdeangelis/ods_rtf_mutiple_justifications_within_one_compute_block
https://github.com/rogerjdeangelis/utl-adding-a-second-ods-excel-created-sheet-to-a-closed-ods-excel-workbook
https://github.com/rogerjdeangelis/utl-conformal-ods-table-output-for-proc-tabulate-and-proc-freq
https://github.com/rogerjdeangelis/utl-creating-big-N-headers-in-your-reports-corresp-clinical-ods
https://github.com/rogerjdeangelis/utl-creating-ods-output-table-from-proc-report-experimental
https://github.com/rogerjdeangelis/utl-detail-proc-freq-crosstab-ods-output-table-instead-of-static-reports
https://github.com/rogerjdeangelis/utl-example-of-ods-crosstab-output-table-with-mean-and-std-using_proc-report
https://github.com/rogerjdeangelis/utl-fixing-ods-output-bug-in-proc-freq-crosstab-creating-ods-crosstab-table
https://github.com/rogerjdeangelis/utl-keeping-leading-and-trailing-zeros-in-character-fields-with-ods-excel-output
https://github.com/rogerjdeangelis/utl-layout-ods-excel-reports-in-a-grid
https://github.com/rogerjdeangelis/utl-more-flexible-proc-freq-ods-output-tables
https://github.com/rogerjdeangelis/utl-ods-excel-color-code-every-other-column-in-a-specified-row
https://github.com/rogerjdeangelis/utl-ods-excel-hilite-diagonal-cells
https://github.com/rogerjdeangelis/utl-ods-excel-update-excel-sheet-in-place-python
https://github.com/rogerjdeangelis/utl-ods-export-sas-table-to-excel-with-rotated-column-headers
https://github.com/rogerjdeangelis/utl-putting-a-frame-around-text-in-doc-rtf-and-pdf-ods-destinations-with-and-without-layout
https://github.com/rogerjdeangelis/utl-reshape-table-use-utl_odsrpt-macro-and-proc-tabulate
https://github.com/rogerjdeangelis/utl-retaining-header-row-across-pages-on-ods-rtf-proc-report
https://github.com/rogerjdeangelis/utl-sas-ods-bidirectional-hyperlinked-table-of-contents-in-ods-pdf-html-and-excel
https://github.com/rogerjdeangelis/utl-sas-ods-excel-to-create-excel-report-and-separate-png-graph-finally-r-for-layout-in-excel
https://github.com/rogerjdeangelis/utl-sas-ods-underlining-text-in-html-pdf-and-rtf
https://github.com/rogerjdeangelis/utl-select-high-payment-periods-and-generating-code-with-do_over-and-dosubl
https://github.com/rogerjdeangelis/utl-using-proc-means-stackodsoutput-to-simplifiy-crosstab-percentages
https://github.com/rogerjdeangelis/utl-using-proc-odstext-to-add-documentation-tabs-to-your-excel-workbook
https://github.com/rogerjdeangelis/utl_creating_www_hyperlinks_in_ods_excel
https://github.com/rogerjdeangelis/utl_ods-output-datasets-for-a-very-complex-proc-tabulate
https://github.com/rogerjdeangelis/utl_ods_excel_conditionaly_higlight_individua1_cells
https://github.com/rogerjdeangelis/utl_ods_excel_create_a_table_of_contents_with_links_to_and_from_each_sheet
https://github.com/rogerjdeangelis/utl_ods_excel_font_size_and_justification_proc_report_titles_formatting
https://github.com/rogerjdeangelis/utl_ods_excel_merging_cells_after_column_header_and_before_column_names
https://github.com/rogerjdeangelis/utl_ods_pdf_and_rtf_two_different_page_titles_on_the_same_page
https://github.com/rogerjdeangelis/utl_pdf_graphics_top_40_a_sas_ods_graphics_look_at_chicago_public_schools_salaries_by_job
https://github.com/rogerjdeangelis/utl_proc_means_stackodsoutput_count_of_the_number_of_ones_in_column
https://github.com/rogerjdeangelis/utl_proc_odstext_and_ods_tagsets_text
https://github.com/rogerjdeangelis/utl_stacking-strings-in-one-excel-cell-using-ods-excel-newline-carriage-return-line-feed-tags

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
