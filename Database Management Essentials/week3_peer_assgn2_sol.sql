-- 1st ques
select eventrequest.eventno , eventrequest.dateheld , count(eventrequest.eventno) as no_of_plans from eventrequest left join eventplan on eventrequest.eventno = eventplan.eventno and eventplan.workdate between '2018-12-01' and '2018-12-31' group by eventrequest.eventno having count(eventplan.planno) >1;

-- 2nd ques
select eventplan.planno , eventplan.eventno , eventplan.workdate , eventplan.activity from eventplan,eventrequest,facility where eventplan.eventno = eventrequest.eventno and eventrequest.facno = facility.FacNo and eventplan.workdate between '2018-12-01' and '2018-12-31' and facility.FacName = 'Basketball arena';

-- 3rd ques
select eventrequest.eventno , eventrequest.dateheld , eventrequest.status , eventrequest.estcost from eventrequest,eventplan,employee,facility where eventplan.eventno = eventrequest.eventno and eventplan.empno = employee.empno and employee.empname = 'Mary Manager' and eventrequest.facno = facility.FacNo and facility.FacName = 'Basketball arena' and eventplan.workdate between '2018-12-01' and '2018-12-31';

-- 4th ques
select eventplanline.planno , eventplanline.lineno , resourcetbl.resname , eventplanline.numberfld , location.LocNo,  eventplanline.timestart , eventplanline.timeend from eventplanline,location,resourcetbl,facility,eventplan where eventplanline.resno = resourcetbl.resno and eventplanline.locno = location.LocNo and location.FacNo = facility.FacNo and facility.FacName = 'Basketball arena' and eventplanline.planno = eventplan.planno and eventplan.activity = 'Operation' and eventplan.workdate between '2018-12-01' and '2018-12-31'; 