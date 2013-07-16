routes = (routesResponse) ->
  routeList = []
  for routeType in routesResponse.mode
    fatRoutes = routeType.route.map (route) ->
      route.route_type = routeType.route_type
      route.mode_name = routeType.mode_name
      route
    routeList = routeList.concat(fatRoutes)

  routeList

exports = {
  routes
}

module.exports = exports
