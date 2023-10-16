import 'package:anemoi_weather/api/open_meteo/forecast/forecast.dart';
import 'package:anemoi_weather/constants/app_colors.dart';
import 'package:anemoi_weather/constants/app_style.dart';
import 'package:anemoi_weather/constants/constants.dart';
import 'package:anemoi_weather/icons/weather_icons.dart';
import 'package:anemoi_weather/widgets/today/hourly_bar_chart.dart';
import 'package:anemoi_weather/widgets/today/hourly_line_chart.dart';
import 'package:flutter/material.dart';

class TodayTabWidget extends StatefulWidget {
  final Forecast forecast;

  const TodayTabWidget({required this.forecast, super.key});

  @override
  State<TodayTabWidget> createState() => _TodayTabWidgetState();
}

class _TodayTabWidgetState extends State<TodayTabWidget> {
  final cardHeight = 350.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: AppStyle.insetsMedium,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Aktuell'),
                  subtitle: Text('${DateTime.now()}'),
                ),
                const Divider(
                  height: 0,
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
                              title: Text(
                                '${widget.forecast.current!.temperature2M}${widget.forecast.currentUnits!.temperature2M}',
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Weather.wi_rain_mix),
                              title: Text(
                                '${widget.forecast.current!.precipitation}${widget.forecast.currentUnits!.precipitation}',
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Weather.wi_humidity),
                              title: Text(
                                '${widget.forecast.current!.relativehumidity2M}${widget.forecast.currentUnits!.relativehumidity2M}',
                              ),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Weather.wi_windy),
                              title: Text(
                                '${widget.forecast.current!.windspeed10M}${widget.forecast.currentUnits!.windspeed10M}',
                              ),
                              onTap: () {},
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
          Card(
            margin: AppStyle.insetsMedium,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Temperature'),
                  subtitle:
                      Text('in ${widget.forecast.hourlyUnits!.temperature2M!}'),
                ),
                const Divider(
                  height: 0,
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
                      values: widget.forecast.hourly!.temperature2M
                          .take(24)
                          .toList(),
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
                  title: const Text('Precepitation'),
                  subtitle: Text(
                      'in ${widget.forecast.hourlyUnits!.precipitationProbability!}'),
                ),
                const Divider(
                  height: 0,
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
                      unit: widget
                          .forecast.hourlyUnits!.precipitationProbability!,
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
                  title: const Text('Humidity'),
                  subtitle: Text(
                      'in ${widget.forecast.hourlyUnits!.relativehumidity2M!}'),
                ),
                const Divider(
                  height: 0,
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
                      values: widget.forecast.hourly!.relativehumidity2M
                          .map((e) => e.toDouble())
                          .take(24)
                          .toList(),
                      time: widget.forecast.hourly!.time.take(24).toList(),
                      unit: widget.forecast.hourlyUnits!.relativehumidity2M!,
                      color: AppColors.humidityColor,
                      intervalY: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
