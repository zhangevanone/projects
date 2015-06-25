--��
DECLARE
  v_amt NUMBER(9,2);
  v_profit number(9,2);
  v_amt_new number(9,2);
  v_profit_new number(9,2);
  
  v_kll integer;
  v_kdj number(5,1);
  v_hyk number(5);
  v_lc number(9,2);
  v_zt_amt number(9,2);
  v_at_amt number(9,2);
  v_date date;
  v_aj integer;
  v_xst integer;
  v_cqkfy integer; --���οڷ�Һ
  v_ej_500 integer;
begin
  v_date := TO_DATE('2015-06-24','YYYY-MM-DD');
  select SUM(QUANTITY*PRICE),SUM(QUANTITY*(PRICE-STOCK_COST_PRICE)) into v_amt,v_profit
  from DC_RET_TRADE_D d,b_branch b where d.branch_id=b.branch_id and b.CREATE_DATE < to_date('2015-01-01','yyyy-mm-dd') and trunc(BILL_DATE,'FMDD')=v_date;
  
  select SUM(QUANTITY*PRICE),SUM(QUANTITY*(PRICE-STOCK_COST_PRICE)) into v_amt_new,v_profit_new
  from DC_RET_TRADE_D d,b_branch b where d.branch_id=b.branch_id and b.CREATE_DATE > to_date('2014-12-31','yyyy-mm-dd') and trunc(BILL_DATE,'FMDD')=v_date;
  
  select count(*) into v_kll from DC_RET_TRADE_M where trunc(BILL_DATE,'FMDD')=v_date;
  --��Ա��
  select SUM(QUANTITY) into v_hyk from DC_RET_TRADE_D where trunc(BILL_DATE,'FMDD')=v_date AND PROD_ID=16544;
  --����250g
  select SUM(QUANTITY) into v_aj from DC_RET_TRADE_D where trunc(BILL_DATE,'FMDD')=v_date AND PROD_ID=23013;
  --����500g
  select SUM(QUANTITY) into v_ej_500 from DC_RET_TRADE_D where trunc(BILL_DATE,'FMDD')=v_date AND PROD_ID=27752;
  --Ѫ��ͨ
  select SUM(QUANTITY) into v_xst from DC_RET_TRADE_D where trunc(BILL_DATE,'FMDD')=v_date AND PROD_ID=26176;
  --���οڷ�Һ
  select SUM(QUANTITY) into v_cqkfy from DC_RET_TRADE_D where trunc(BILL_DATE,'FMDD')=v_date AND PROD_ID=27424;
    
  select SUM(QUANTITY*price) into v_lc from DC_RET_TRADE_D where trunc(BILL_DATE,'FMDD')=v_date AND PROD_ID IN (12395,12396,12397,12401,12402,12403,12404,12405,12406,12407,26075);
  
  select SUM(QUANTITY*price) into v_zt_amt from DC_RET_TRADE_D d,B_PRODUCT p where d.PROD_ID=p.PROD_ID and p.ABC IN ('A','B','C') and trunc(BILL_DATE,'FMDD')=v_date;
  
  select SUM(QUANTITY*price) into v_at_amt from DC_RET_TRADE_D d,B_PRODUCT p where d.PROD_ID=p.PROD_ID and p.ABC='A' and trunc(BILL_DATE,'FMDD')=v_date;
  
  dbms_output.put_line(to_char(v_date,'MM.DD') || '���۶�:' || to_char(v_amt,'9999999'));
  dbms_output.put_line(to_char(v_date,'MM.DD') || '�µ����۶�:' || to_char(v_amt_new,'9999999'));
  dbms_output.put_line('ë����:' || to_char(v_profit,'99999999'));
  dbms_output.put_line('�µ�ë����:' || to_char(v_profit_new,'99999999'));
  dbms_output.put_line('ë����:' || round(v_profit/v_amt,4)*100 || '%');
  dbms_output.put_line('�µ�ë����:' || round(v_profit_new/v_amt_new,4)*100 || '%');  
  dbms_output.put_line('������:' || v_kll);
  dbms_output.put_line('�͵���:' || to_char(v_amt/v_kll,'9999.9'));
  dbms_output.put_line('��Ա��:' || v_hyk);
  --dbms_output.put_line('����250g:' || v_aj);
  --dbms_output.put_line('����500g:' || v_ej_500);
  dbms_output.put_line('���οڷ�Һ:' || v_cqkfy);
  dbms_output.put_line('Ѫ��ͨ:' || v_xst);
  dbms_output.put_line('����ռ��:' || to_char(round(v_lc/v_amt*100,2),'0.9') || '%');
  dbms_output.put_line('����ռ��:' || round(v_zt_amt/v_amt*100,2) || '%');
  dbms_output.put_line('A��ռ��:' || round(v_at_amt/v_amt*100,2) || '%');
END;


--��
DECLARE
  v_amt NUMBER(13,2);
  v_profit number(13,2);
  v_kll integer;
  v_kdj number(6,1);
  v_hyk number(6);
  v_lc number(13,2);
  v_zt_amt number(13,2);
  v_at_amt number(13,2);
  v_aj integer;
  v_period integer;
  v_xst integer;
  v_ej_500 integer;
begin
  v_period := 5;
  select SUM(QUANTITY*PRICE),SUM(QUANTITY*(PRICE-STOCK_COST_PRICE)) into v_amt,v_profit
  from DC_RET_TRADE_D where FYEAR=2015 and PERIOD=v_period;
  
  select count(*) into v_kll from DC_RET_TRADE_M where FYEAR=2015 and PERIOD=v_period;
  
  select SUM(QUANTITY) into v_hyk from DC_RET_TRADE_D where PROD_ID=16544 and FYEAR=2015 and PERIOD=v_period;
  select SUM(QUANTITY) into v_aj from DC_RET_TRADE_D where PROD_ID=23013 and FYEAR=2015 and PERIOD=v_period;
    --����500g
  select SUM(QUANTITY) into v_ej_500 from DC_RET_TRADE_D where PROD_ID=27752 and FYEAR=2015 and PERIOD=v_period;
  select SUM(QUANTITY*price) into v_lc from DC_RET_TRADE_D where FYEAR=2015 and PERIOD=v_period AND PROD_ID IN (12395,12396,12397,12401,12402,12403,12404,12405,12406,12407,26075);
  --Ѫ��ͨ
  select SUM(QUANTITY) into v_xst from DC_RET_TRADE_D where FYEAR=2015 AND PERIOD=v_period AND PROD_ID=26176;
  
  select SUM(QUANTITY*price) into v_zt_amt from DC_RET_TRADE_D d,B_PRODUCT p where d.PROD_ID=p.PROD_ID and p.ABC IN ('A','B','C') and FYEAR=2015 and PERIOD=v_period;
  select SUM(QUANTITY*price) into v_at_amt from DC_RET_TRADE_D d,B_PRODUCT p where d.PROD_ID=p.PROD_ID and p.ABC='A' and FYEAR=2015 and PERIOD=v_period;
  
  dbms_output.put_line(v_period || '�·����۶�:' || to_char(v_amt,'999999999'));
  dbms_output.put_line('ë����:' || round(v_profit,0));
  dbms_output.put_line('ë����:' || round(v_profit/v_amt,4)*100 || '%');
  dbms_output.put_line('������:' || v_kll);
  dbms_output.put_line('�͵���:' || to_char(v_amt/v_kll,'9999.9'));
  dbms_output.put_line('��Ա��:' || v_hyk);
  dbms_output.put_line('����250g:' || v_aj);
  dbms_output.put_line('����500g:' || v_ej_500);
  dbms_output.put_line('Ѫ��ͨ:' || v_xst);
  dbms_output.put_line('����ռ��:' || to_char(round(v_lc/v_amt*100,2),'0.9') || '%');
  dbms_output.put_line('����ռ��:' || round(v_zt_amt/v_amt*100,2) || '%');
  dbms_output.put_line('A��ռ��:' || round(v_at_amt/v_amt*100,2) || '%');
END;


--��
DECLARE
  v_amt NUMBER(13,2);
  v_profit number(13,2);
  v_kll integer;
  v_kdj number(6,1);
  v_hyk number(6);
  v_lc number(13,2);
  v_zt_amt number(13,2);
  v_at_amt number(13,2);
  v_aj integer;
  v_year integer;
begin
  v_year := 2014;
  select SUM(QUANTITY*PRICE),SUM(QUANTITY*(PRICE-STOCK_COST_PRICE)) into v_amt,v_profit
  from DC_RET_TRADE_D where FYEAR=v_year;
  
  select count(*) into v_kll from DC_RET_TRADE_M where FYEAR=v_year;
  
  select SUM(QUANTITY) into v_hyk from DC_RET_TRADE_D where PROD_ID=16544 and FYEAR=v_year;
  select SUM(QUANTITY) into v_aj from DC_RET_TRADE_D where PROD_ID=23013 and FYEAR=v_year;
  select SUM(QUANTITY*price) into v_lc from DC_RET_TRADE_D where FYEAR=v_year AND PROD_ID IN (12395,12396,12397,12401,12402,12403,12404,12405,12406,12407,26075);
  
  select SUM(QUANTITY*price) into v_zt_amt from DC_RET_TRADE_D d,B_PRODUCT p where d.PROD_ID=p.PROD_ID and p.ABC IN ('A','B','C') and FYEAR=v_year;
  select SUM(QUANTITY*price) into v_at_amt from DC_RET_TRADE_D d,B_PRODUCT p where d.PROD_ID=p.PROD_ID and p.ABC='A' and FYEAR=v_year;
  
  dbms_output.put_line(v_year || '�����۶�:' || to_char(v_amt,'999999999.99'));
  dbms_output.put_line('ë����:' || round(v_profit,0));
  dbms_output.put_line('ë����:' || round(v_profit/v_amt,4)*100 || '%');
  dbms_output.put_line('������:' || v_kll);
  dbms_output.put_line('�͵���:' || to_char(v_amt/v_kll,'9999.9'));
  dbms_output.put_line('��Ա��:' || v_hyk);
  dbms_output.put_line('����:' || v_aj);
  dbms_output.put_line('����ռ��:' || to_char(round(v_lc/v_amt*100,2),'0.9') || '%');
  dbms_output.put_line('����ռ��:' || round(v_zt_amt/v_amt*100,2) || '%');
  dbms_output.put_line('A��ռ��:' || round(v_at_amt/v_amt*100,2) || '%');
END;
