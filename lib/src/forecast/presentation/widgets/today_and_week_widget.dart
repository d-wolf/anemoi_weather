import 'package:anemoi_weather/src/core/res/app_colors.dart';
import 'package:anemoi_weather/src/core/res/app_style.dart';
import 'package:anemoi_weather/src/core/res/constants.dart';
import 'package:anemoi_weather/icons/weather_icons.dart';
import 'package:anemoi_weather/src/forecast/domain/entities/forecast.dart';
import 'package:anemoi_weather/src/forecast/presentation/widgets/hourly_bar_chart.dart';
import 'package:anemoi_weather/src/forecast/presentation/widgets/hourly_line_chart.dart';
import 'package:anemoi_weather/src/location/domain/entities/user_location.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodayAndWeekWidget extends StatefulWidget {
  final DateTime lastUpdated;
  final UserLocation userLocation;
  final Forecast forecast;

  const TodayAndWeekWidget(
      {required this.lastUpdated,
      required this.userLocation,
      required this.forecast,
      super.key});

  @override
  State<TodayAndWeekWidget> createState() => _TodayAndWeekWidgetState();
}

class _TodayAndWeekWidgetState extends State<TodayAndWeekWidget> {
  final cardHeight = 350.0;
  final smallCardSize = 120.0;
  final smallTileAnimateNextDuration = const Duration(milliseconds: 100);

  final _smallTileScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Card(
          margin: AppStyle.insetsMedium,
          child: Column(
            children: [
              ListTile(
                title: Text(
                    '${widget.userLocation.name}, ${widget.userLocation.tag}'),
                subtitle: Text(
                    'Last Updated: ${DateFormat.Hms().format(widget.lastUpdated.toLocal())}'),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: AppStyle.insetsSmall,
                      child: Icon(
                        Constants
                            .wmoIconMap[widget.forecast.current!.weathercode],
                        size: 140,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: AppStyle.insetsSmall,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Weather.wi_thermometer),
                            title: const Text('Current Temperature'),
                            subtitle: Text(
                              '${widget.forecast.current!.temperature2M} ${widget.forecast.currentUnits!.temperature2M}',
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Weather.wi_rain_mix),
                            title: const Text('Precipitation'),
                            subtitle: Text(
                              '${widget.forecast.current!.precipitation} ${widget.forecast.currentUnits!.precipitation}',
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Weather.wi_humidity),
                            title: const Text('Rrelative Humidity'),
                            subtitle: Text(
                              '${widget.forecast.current!.relativehumidity2M} ${widget.forecast.currentUnits!.relativehumidity2M}',
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Weather.wi_windy),
                            title: const Text('Windspeed'),
                            subtitle: Text(
                              '${widget.forecast.current!.windspeed10M} ${widget.forecast.currentUnits!.windspeed10M}',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppStyle.spaceMedium),
          child: SizedBox(
            height: smallCardSize,
            child: Row(
              children: [
                IconButton(
                  padding: AppStyle.insetsZero,
                  onPressed: () {
                    _smallTileScrollController.animateTo(
                        _smallTileScrollController.position.pixels -
                            smallCardSize,
                        duration: smallTileAnimateNextDuration,
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.chevron_left),
                ),
                Expanded(
                  child: ListView.builder(
                      controller: _smallTileScrollController,
                      shrinkWrap: true,
                      itemCount: 24,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: smallCardSize,
                          height: smallCardSize,
                          child: Card(
                            child: Padding(
                              padding: AppStyle.insetsMedium,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(DateFormat.Hm().format(widget
                                      .forecast.hourly!.time[index]
                                      .toLocal())),
                                  Icon(
                                    Constants.wmoIconMap[widget
                                        .forecast.hourly!.weathercode[index]],
                                    size: 34,
                                  ),
                                  Text(
                                      '${widget.forecast.hourly!.temperature2M[index]} ${widget.forecast.hourlyUnits!.temperature2M}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                IconButton(
                  padding: AppStyle.insetsZero,
                  onPressed: () {
                    _smallTileScrollController.animateTo(
                        _smallTileScrollController.position.pixels +
                            smallCardSize,
                        duration: smallTileAnimateNextDuration,
                        curve: Curves.linear);
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: AppStyle.insetsMedium,
          child: Column(
            children: [
              ListTile(
                title: const Text('Temperature'),
                subtitle:
                    Text('in ${widget.forecast.hourlyUnits!.temperature2M!}'),
              ),
              SizedBox(
                height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppStyle.spaceSmall,
                      top: AppStyle.spaceMedium,
                      right: AppStyle.spaceXLarge,
                      bottom: AppStyle.spaceMedium),
                  child: HourlyLineChart(
                    values:
                        widget.forecast.hourly!.temperature2M.take(24).toList(),
                    time: widget.forecast.hourly!.time.take(24).toList(),
                    unit: widget.forecast.hourlyUnits!.temperature2M!,
                    color: AppColors.temperatureColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: AppStyle.insetsMedium,
          child: Column(
            children: [
              ListTile(
                title: const Text('Precepitation Probability'),
                subtitle: Text(
                    'in ${widget.forecast.hourlyUnits!.precipitationProbability!}'),
              ),
              SizedBox(
                height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppStyle.spaceSmall,
                      top: AppStyle.spaceMedium,
                      right: AppStyle.spaceXLarge,
                      bottom: AppStyle.spaceMedium),
                  child: HourlyBarChart(
                    values: widget.forecast.hourly!.precipitationProbability
                        .map((e) => e.toDouble())
                        .take(24)
                        .toList(),
                    time: widget.forecast.hourly!.time.take(24).toList(),
                    unit:
                        widget.forecast.hourlyUnits!.precipitationProbability!,
                    color: AppColors.precipitationColor,
                    intervalY: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: AppStyle.insetsMedium,
          child: Column(
            children: [
              ListTile(
                title: const Text('Precepitation'),
                subtitle:
                    Text('in ${widget.forecast.hourlyUnits!.precipitation!}'),
              ),
              SizedBox(
                height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppStyle.spaceSmall,
                      top: AppStyle.spaceMedium,
                      right: AppStyle.spaceXLarge,
                      bottom: AppStyle.spaceMedium),
                  child: HourlyBarChart(
                    values: widget.forecast.hourly!.precipitation
                        .map((e) => e.toDouble())
                        .take(24)
                        .toList(),
                    time: widget.forecast.hourly!.time.take(24).toList(),
                    unit: widget.forecast.hourlyUnits!.precipitation!,
                    color: AppColors.precipitationColor,
                    intervalY: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
