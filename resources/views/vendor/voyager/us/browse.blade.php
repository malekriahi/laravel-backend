@extends('voyager::master')


@section('content')

i am {{ Auth::user()->role->name }}
@endsection