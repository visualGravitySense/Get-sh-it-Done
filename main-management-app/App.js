import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import { Button, Text, View, StyleSheet } from 'react-native';
import { Provider as PaperProvider } from 'react-native-paper';

const Stack = createStackNavigator();

// Экран главных целей
function MainScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Мои цели</Text>
      <Button
        title="Перейти к задачам на год"
        onPress={() => navigation.navigate('Year')}
      />
      <Button
        title="Перейти к анализу продуктивности"
        onPress={() => navigation.navigate('Analysis')}
      />
    </View>
  );
}

// Экран выбора периода (год / месяц / неделя)
function PeriodScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Выберите период</Text>
      <Button
        title="Задачи на год"
        onPress={() => navigation.navigate('Tasks', { period: 'Год' })}
      />
      <Button
        title="Задачи на месяц"
        onPress={() => navigation.navigate('Tasks', { period: 'Месяц' })}
      />
      <Button
        title="Задачи на неделю"
        onPress={() => navigation.navigate('Tasks', { period: 'Неделя' })}
      />
    </View>
  );
}

// Экран задач
function TasksScreen({ route }) {
  const { period } = route.params;
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Задачи на {period}</Text>
      <Text>Здесь будут отображаться задачи на {period}</Text>
    </View>
  );
}

// Экран анализа продуктивности
function AnalysisScreen() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Анализ продуктивности</Text>
      <Text>Здесь будет отображаться анализ продуктивности за неделю</Text>
    </View>
  );
}

export default function App() {
  return (
    <PaperProvider>
      <NavigationContainer>
        <Stack.Navigator initialRouteName="Main">
          <Stack.Screen name="Main" component={MainScreen} />
          <Stack.Screen name="Year" component={PeriodScreen} />
          <Stack.Screen name="Tasks" component={TasksScreen} />
          <Stack.Screen name="Analysis" component={AnalysisScreen} />
        </Stack.Navigator>
      </NavigationContainer>
    </PaperProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    padding: 20,
  },
  title: {
    fontSize: 24,
    marginBottom: 20,
  },
});
