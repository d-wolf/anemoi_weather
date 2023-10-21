import 'package:anemoi_weather/src/presentation/core/icons/weather_icons.dart';
import 'package:anemoi_weather/src/core/res/app_colors.dart';
import 'package:anemoi_weather/src/core/res/app_style.dart';
import 'package:anemoi_weather/src/core/res/app_weather_codes.dart';
import 'package:anemoi_weather/src/domain/forecast/entities/forecast.dart';
import 'package:anemoi_weather/src/domain/manage_locations/entities/user_location.dart';
import 'package:anemoi_weather/src/presentation/forecast/widgets/hourly_bar_chart.dart';
import 'package:anemoi_weather/src/presentation/forecast/widgets/hourly_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class TodayAndWeekWidget extends StatefulWidget {
  const TodayAndWeekWidget({
    required this.lastUpdated,
    required this.userLocation,
    required this.forecast,
    super.key,
  });
  final DateTime lastUpdated;
  final UserLocation userLocation;
  final Forecast forecast;

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
                  '${widget.userLocation.name}, ${widget.userLocation.tag}',
                ),
                subtitle: Text(
                  '${AppLocalizations.of(context)!.forecastTitle} '
                  '${DateFormat.Hms().format(widget.lastUpdated.toLocal())}',
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: AppStyle.insetsSmall,
                      child: Icon(
                        AppWeatherCodes
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
                            title: Text(
                              AppLocalizations.of(context)!
                                  .forecastTemperatureLabel,
                            ),
                            subtitle: Text(
                              '${widget.forecast.current!.temperature2M} '
                              '${widget.forecast.currentUnits!.temperature2M}',
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Weather.wi_rain_mix),
                            title: Text(
                              AppLocalizations.of(context)!
                                  .forecastPrecipitationLabel,
                            ),
                            subtitle: Text(
                              '${widget.forecast.current!.precipitation} '
                              '${widget.forecast.currentUnits!.precipitation}',
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Weather.wi_humidity),
                            title: Text(
                              AppLocalizations.of(context)!
                                  .forecastRelativeHumidityLabel,
                            ),
                            subtitle: Builder(
                              builder: (context) {
                                final t1 =
                                    widget.forecast.current!.relativehumidity2M;
                                final t2 = widget
                                    .forecast.currentUnits!.relativehumidity2M;
                                return Text('$t1 $t2');
                              },
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Weather.wi_windy),
                            title: Text(
                              AppLocalizations.of(context)!
                                  .forecastWindspeedLabel,
                            ),
                            subtitle: Builder(
                              builder: (context) {
                                final t1 =
                                    widget.forecast.current!.windspeed10M;
                                final t2 =
                                    widget.forecast.currentUnits!.windspeed10M;
                                return Text('$t1 $t2');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      curve: Curves.linear,
                    );
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat.Hm().format(
                                    widget.forecast.hourly!.time[index]
                                        .toLocal(),
                                  ),
                                ),
                                Icon(
                                  AppWeatherCodes.wmoIconMap[widget
                                      .forecast.hourly!.weathercode[index]],
                                  size: 34,
                                ),
                                Builder(
                                  builder: (context) {
                                    final t1 = widget
                                        .forecast.hourly!.temperature2M[index];
                                    final t2 = widget
                                        .forecast.hourlyUnits!.temperature2M;
                                    return Text('$t1 $t2');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                  padding: AppStyle.insetsZero,
                  onPressed: () {
                    _smallTileScrollController.animateTo(
                      _smallTileScrollController.position.pixels +
                          smallCardSize,
                      duration: smallTileAnimateNextDuration,
                      curve: Curves.linear,
                    );
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
                title: Text(
                  AppLocalizations.of(context)!.forecastTemperatureLabel,
                ),
                subtitle: Text(widget.forecast.hourlyUnits!.temperature2M!),
              ),
              SizedBox(
                height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppStyle.spaceSmall,
                    top: AppStyle.spaceMedium,
                    right: AppStyle.spaceXLarge,
                    bottom: AppStyle.spaceMedium,
                  ),
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
                title: Text(
                  AppLocalizations.of(context)!
                      .forecastPrecipitationProbabilityLabel,
                ),
                subtitle: Builder(
                  builder: (context) {
                    final t1 =
                        widget.forecast.hourlyUnits!.precipitationProbability!;
                    return Text(t1);
                  },
                ),
              ),
              SizedBox(
                height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppStyle.spaceSmall,
                    top: AppStyle.spaceMedium,
                    right: AppStyle.spaceXLarge,
                    bottom: AppStyle.spaceMedium,
                  ),
                  child: HourlyBarChart(
                    values: widget.forecast.hourly!.precipitationProbability
                        .map((e) => e.toDouble())
                        .take(24)
                        .toList(),
                    time: widget.forecast.hourly!.time.take(24).toList(),
                    unit:
                        widget.forecast.hourlyUnits!.precipitationProbability!,
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
                title: Text(
                  AppLocalizations.of(context)!.forecastPrecipitationLabel,
                ),
                subtitle: Text(widget.forecast.hourlyUnits!.precipitation!),
              ),
              SizedBox(
                height: cardHeight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppStyle.spaceSmall,
                    top: AppStyle.spaceMedium,
                    right: AppStyle.spaceXLarge,
                    bottom: AppStyle.spaceMedium,
                  ),
                  child: HourlyBarChart(
                    values: widget.forecast.hourly!.precipitation
                        .map((e) => e)
                        .take(24)
                        .toList(),
                    time: widget.forecast.hourly!.time.take(24).toList(),
                    unit: widget.forecast.hourlyUnits!.precipitation!,
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
