with cte1 as(
select state,pc_name,total_votes as INC_14
 from constituency_wise_results_2014 where party ="INC"
 group by state,pc_name),
 cte2 as( 
 select state,pc_name,sum(total_votes) as total_pc
 from constituency_wise_results_2014 
 group by state,pc_name),
 cte3 as(
select state,pc_name,total_votes as INC_19
 from constituency_wise_results_2019 where party ="INC"
 group by state,pc_name),
 cte4 as( 
 select state,pc_name,sum(total_votes) as total_pc
 from constituency_wise_results_2019 
 group by state,pc_name)
 select a.state,a.pc_name,a.INC_14,c.INC_19,(c.INC_19-a.INC_14) as Diff_Vote,
 (a.INC_14/b.total_pc*100) as INC_VoteShare_14,
 (c.INC_19/d.total_pc*100) as INC_VoteShare_19
  from cte1 a
 join cte2 b
 on a.state=b.state and a.pc_name=b.pc_name
 join cte3 c
 on b.state=c.state and b.pc_name=c.pc_name
 join cte4 d
 on c.state=d.state and c.pc_name=d.pc_name
 order by Diff_Vote asc limit 5;
 
