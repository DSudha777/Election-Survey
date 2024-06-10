with cte1 as(
select state,sum(total_votes) as State_Vote,
sum(distinct total_electors) as State_Electors from constituency_wise_results_2014
group by state)
select *,State_Vote/State_Electors*100 as State_turnout from cte1 
order by State_turnout desc limit 5;

with cte2 as(
select state,sum(total_votes) as State_Vote,
sum(distinct total_electors) as State_Electors from constituency_wise_results_2019
group by state)
select *,State_Vote/State_Electors*100 as State_turnout from cte2
order by State_turnout desc limit 5




