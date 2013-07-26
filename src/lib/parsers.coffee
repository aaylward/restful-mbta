_addTypeAndName = (route, routeType) ->
  route.route_type = routeType.route_type
  route.mode_name = routeType.mode_name
  route

routes = (routesResponse) ->
  routeList = []
  for routeType in routesResponse.mode
    fatRoutes = routeType.route.map (route) ->
      _addTypeAndName route, routeType
    routeList = routeList.concat(fatRoutes)

  routeList

servertime = (timeResponse) ->
  time: timeResponse.server_dt

routesbystop = (routesResponse) ->
  routeObj =
    stop_id: routesResponse.stop_id
    stop_name: routesResponse.stop_name
  routes = @routes(routesResponse)
  routesResponse.mode.delete
  routeObj.routes = routes

  routeObj

stopsbyroute = (stopsResponse) ->
  stopsResponse.direction

stopsbylocation = (stopsResponse) ->
  stopsResponse.stop

schedulebystop = (scheduleRes) ->
  {
    stop_id: scheduleRes.stop_id
    stop_name: scheduleRes.stop_name
    routes: scheduleRes.mode
  }

schedulebyroute = (scheduleRes) ->
  scheduleRes.direction.map (sched) ->
    sched.route_id = scheduleRes.route_id
    sched.route_name = scheduleRes.route_name
    sched

schedulebytrip = (scheduleRes) ->
  #potentially doesn't need parsing?
  scheduleRes

alerts = (alertsRes) ->
  alertsRes.alerts

alertbyid = (alertRes) ->
  # Seems well-organized.
  alertRes

alertheadersbyroute = (headersRes) ->
  headersRes.alert_headers

alertheadersbystop = (headersRes) ->
  headersRes.alert_headers

exports = {
  routes
  servertime
  routesbystop
  stopsbyroute
  stopsbylocation
  schedulebyroute
  schedulebystop
  alerts
  alertheadersbyroute
  alertheadersbystop
}

module.exports = exports
