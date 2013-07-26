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

exports = {
  routes
}

module.exports = exports
