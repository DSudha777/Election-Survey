with cte1 as(
select party,sum(total_votes) as party_total
from constituency_wise_results_2014 
group by party),
cte2 as(
 
 select sum(total_votes) as total from constituency_wise_results_2014 )
 
 select a.party,a.party_total/b.total*100 from cte1 a,cte2 b
 
 