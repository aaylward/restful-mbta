routes = (routesResponse) ->
  routeList = []
  for routeType in routesResponse.mode
    fatRoutes = routeType.route.map (route) ->
      route.route_type = routeType.route_type
      route.mode_name = routeType.mode_name
      route
    routeList = routeList.concat(fatRoutes)

  routeList

servertime = (timeResponse) ->
  time: timeResponse.server_dt
  # Good for a value response, but might be better to leave as an object (with better naming?)

routesbystop = (routesResponse) ->
  routeObj =
    stop_id: routesResponse.stop_id
    stop_name: routesResponse.stop_name
  routes = @routes(routesResponse)
  routesResponse.mode.delete
  routeObj.routes = routes

  routeObj

stopsbyroute = (stopsResponse) ->
  stopsObj = stopsResponse.direction

  stopsObj

stopsbylocation = (stopsResponse) ->
  stopsObj = stopsResponse.stop

  stopsObj

schedulebystop = (scheduleRes) ->
  schedule =
    stop_id: scheduleRes.stop_id
    stop_name: scheduleRes.stop_name
    routes: scheduleRes.mode

schedulebyroute = (scheduleRes) ->
  schedules = scheduleRes.direction.map (sched) ->
    sched.route_id = scheduleRes.route_id
    sched.route_name = scheduleRes.route_name
    sched

  schedules

schedulebytrip = (scheduleRes) ->
  #potentially doesn't need parsing?

alerts = (alertsRes) ->
  alertsRes.alerts

alertbyid = (alertRes) ->
  # Seems well-organized.

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
