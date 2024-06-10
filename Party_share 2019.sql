with cte1 as(
select party,sum(total_votes) as party_total
from constituency_wise_results_2019
group by party),
cte2 as(
 
 select sum(total_votes) as total from constituency_wise_results_2019 )
 
 select a.party,a.party_total/b.total*100 as party_share
 from cte1 a,cte2 b order by party_share desc
 
 
 