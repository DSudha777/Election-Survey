with cte1 as (
Select * from constituency_wise_results_2019 where total_votes in (
select max(total_votes) as win_Votes
from constituency_wise_results_2019 
group by state,pc_name)),

cte2 as(
select * from constituency_wise_results_2014 where total_votes in (
select max(total_votes) as win_Votes
from constituency_wise_results_2014 B
group by state, pc_name)),

cte3 as(
 select *,sum(total_votes) as total_votes_pc_14
 from constituency_wise_results_2014 
 group by state,pc_name) ,

cte4 as(
select *,sum(total_votes) as total_votes_pc_19
 from constituency_wise_results_2019
 group by state,pc_name)
 

SELECT c.state,c.pc_name,c.party as Party_19,d.party as Party_14,
c.total_votes as votes_2019,d.total_votes 
as votes_2014,
c.total_votes/b.total_votes_pc_19*100 as Vote_p19,
d.total_votes/a.total_votes_pc_14*100 as Vote_P14,
(c.total_votes-d.total_votes) as vote_change
 FROM cte1 as c
join cte2 as d 
on c.state=d.state and c.pc_name = d.pc_name and c.party=d.party	
join cte3 as a
on a.state=d.state and a.pc_name=d.pc_name
join cte4 as b
on b.state=c.state and b.pc_name=c.pc_name
order by state asc ;





