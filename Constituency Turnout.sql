with cte1 as(
select state,pc_name,sum(total_votes) as State_Vote,
sum(distinct total_electors) as State_Electors from constituency_wise_results_2014
group by pc_name)
select *,State_Vote/State_Electors*100 as State_turnout from cte1 
order by State_turnout desc limit 5;

with cte1 as(
select state,pc_name,sum(total_votes) as State_Vote,
sum(distinct total_electors) as State_Electors from constituency_wise_results_2019
group by pc_name)
select *,State_Vote/State_Electors*100 as State_turnout from cte1 
order by State_turnout desc limit 5;