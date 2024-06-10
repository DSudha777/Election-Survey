with cte1 as (
Select * from constituency_wise_results_2019 where total_votes in (
select max(total_votes) as win_Votes
from constituency_wise_results_2019 AS A
group by pc_name)),

cte2 as(
select * from constituency_wise_results_2014 AS B where total_votes in (
select max(total_votes) as win_Votes
from constituency_wise_results_2014 B
group by pc_name))

SELECT c.state,c.pc_name,c.party,d.party,c.total_votes,d.total_votes FROM cte1 as c
join cte2 as d 
on c.state=d.state and c.pc_name = d.pc_name and c.party=d.party;
order by c.pc_name;





