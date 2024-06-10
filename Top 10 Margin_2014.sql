with cte1 as(
select *,
row_number() over(partition by state,pc_name order by total_votes desc) as sort
 from constituency_wise_results_2014),
  cte2 as(
Select * from constituency_wise_results_2014 where total_votes in (
select max(total_votes) as win_Votes
from constituency_wise_results_2014
group by state, pc_name))

select a.state,a.pc_name,b.candidate ,b.total_votes as winner,a.total_votes as runner,
(b.total_votes-a.total_votes) as Margin
from cte1 as a
join cte2 as b
on a.state=b.state and a.pc_name=b.pc_name
where a.sort=2
group by state,pc_name
order by Margin desc limit 10;


