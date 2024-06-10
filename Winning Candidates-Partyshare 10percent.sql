with cte1 as(
select * from state_party_share 
where state_party_voteShare_19 <10),
cte2 as(
select state,party,candidate,pc_name from constituency_wise_results_2019 where total_votes in (
select max(total_votes) as win_Votes
from constituency_wise_results_2019 
group by state,pc_name))
select b.state,b.party,b.pc_name,b.candidate,a.state_party_voteShare_19
from cte1 a 
join cte2 b
on a.state = b.state and a.party=b.party