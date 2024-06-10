with cte1 as(
select state,pc_name ,sum(total_votes) as NOTA_Votes 
from constituency_wise_results_2019 where party="NOTA"
group by state,pc_name),
cte2 as(
select state, pc_name,sum(total_votes) as total_votes
 from constituency_wise_results_2019
 group by state,pc_name)
 select a.state,a.pc_name,a.NOTA_votes,b.total_votes,
 a.NOTA_votes/b.total_votes*100 as NOTA_share
  from cte1 a
  join cte2 b 
  on a.state =b.state and a.pc_name=b.pc_name
  order by NOTA_share desc limit 5